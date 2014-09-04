Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CF1D952A9B
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:35:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HZkh3011626
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:35:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HZkoL021930
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:35:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:35:46 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s84HZj8p023146;	Thu, 4 Sep 2014 12:35:46 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s84HZgk1032659;	Thu, 4 Sep 2014 23:05:44 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 12:35:39 -0500
Message-ID: <1409852140-13616-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409852140-13616-1-git-send-email-fcooper@ti.com>
References: <1409852140-13616-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] weston: Fix touch calibration issue
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Sep 2014 17:35:49 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Libinput and Weston have a calibration problem when using resistive touch
  screens.
* Bug report and additional information can be found here:
    https://bugs.freedesktop.org/show_bug.cgi?id=82742
* This patch is part of the fix to resolve the calibration issue.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wayland/weston/normalize-WL_CALIBRATION.patch  |  139 ++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.5.0.bbappend |    3 +-
 2 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/normalize-WL_CALIBRATION.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/normalize-WL_CALIBRATION.patch b/meta-arago-distro/recipes-graphics/wayland/weston/normalize-WL_CALIBRATION.patch
new file mode 100644
index 0000000..054d4de
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/normalize-WL_CALIBRATION.patch
@@ -0,0 +1,139 @@
+Subject: [PATCH weston] libinput: normalize WL_CALIBRATION before passing it
+ to libinput
+In-Reply-To: <1409113902-4180-1-git-send-email-peter.hutterer@who-t.net>
+References: <1409113902-4180-1-git-send-email-peter.hutterer@who-t.net>
+Message-ID: <1409113902-4180-2-git-send-email-peter.hutterer@who-t.net>
+
+WL_CALIBRATION, introduced in weston-1.1, requires the translation component
+of the calibration matrix to be in screen coordinates. libinput does not have
+access to this and it's not a very generic way to do this anyway. So with
+the libinput backend, WL_CALIBRATION support is currently broken (#82742).
+This cannot be fixed in libinput without changing its API for this specific
+use-case.
+
+This patch lets weston take care of WL_CALIBRATION. It takes the original
+format and normalizes it before passing it to libinput. This way libinput
+still does the coordinate transformation, weston just needs to provide the
+initial configuration.
+
+Note that this needs an updated libinput, otherwise libinput will try to
+transform coordinates as well.
+---
+ src/libinput-device.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 87 insertions(+)
+
+diff --git a/src/libinput-device.c b/src/libinput-device.c
+index 6e50eeb..96fe2f2 100644
+--- a/src/libinput-device.c
++++ b/src/libinput-device.c
+@@ -282,6 +282,90 @@ notify_output_destroy(struct wl_listener *listener, void *data)
+ 	}
+ }
+ 
++/**
++ * The WL_CALIBRATION property requires a pixel-specific matrix to be
++ * applied after scaling device coordinates to screen coordinates. libinput
++ * can't do that, so we need to convert the calibration to the normalized
++ * format libinput expects.
++ */
++static void
++evdev_device_set_calibration(struct evdev_device *device)
++{
++	struct udev *udev;
++	struct udev_device *udev_device = NULL;
++	const char *sysname = libinput_device_get_sysname(device->device);
++	const char *calibration_values;
++	uint32_t width, height;
++	float calibration[6];
++	enum libinput_config_status status;
++
++	if (!device->output)
++		return;
++
++	width = device->output->width;
++	height = device->output->height;
++	if (width == 0 || height == 0)
++		return;
++
++	/* If libinput has a pre-set calibration matrix, don't override it */
++	if (!libinput_device_config_calibration_has_matrix(device->device) ||
++	    libinput_device_config_calibration_get_default_matrix(
++							  device->device,
++							  calibration) != 0)
++		return;
++
++	udev = udev_new();
++	if (!udev)
++		return;
++
++	udev_device = udev_device_new_from_subsystem_sysname(udev,
++							     "input",
++							     sysname);
++	if (!udev_device)
++		goto out;
++
++	calibration_values =
++	udev_device_get_property_value(udev_device,
++				       "WL_CALIBRATION");
++
++	if (!calibration_values || sscanf(calibration_values,
++					  "%f %f %f %f %f %f",
++					  &calibration[0],
++					  &calibration[1],
++					  &calibration[2],
++					  &calibration[3],
++					  &calibration[4],
++					  &calibration[5]) != 6)
++		goto out;
++
++	weston_log("Applying calibration: %f %f %f %f %f %f "
++		   "(normalized %f %f)\n",
++		    calibration[0],
++		    calibration[1],
++		    calibration[2],
++		    calibration[3],
++		    calibration[4],
++		    calibration[5],
++		    calibration[2]/width,
++		    calibration[5]/height);
++
++	/* normalize to a format libinput can use. There is a chance of
++	   this being wrong if the width/height don't match the device
++	   width/height but I'm not sure how to fix that */
++	calibration[2] /= width;
++	calibration[5] /= height;
++
++	status = libinput_device_config_calibration_set_matrix(device->device,
++							       calibration);
++	if (status != LIBINPUT_CONFIG_STATUS_SUCCESS)
++		weston_log("Failed to apply calibration.\n");
++
++out:
++	if (udev_device)
++		udev_device_unref(udev_device);
++	udev_unref(udev);
++}
++
+ void
+ evdev_device_set_output(struct evdev_device *device,
+ 			struct weston_output *output)
+@@ -295,6 +379,7 @@ evdev_device_set_output(struct evdev_device *device,
+ 	device->output_destroy_listener.notify = notify_output_destroy;
+ 	wl_signal_add(&output->destroy_signal,
+ 		      &device->output_destroy_listener);
++	evdev_device_set_calibration(device);
+ }
+ 
+ static void
+@@ -318,6 +403,8 @@ configure_device(struct evdev_device *device)
+ 		libinput_device_config_tap_set_enabled(device->device,
+ 						       enable_tap);
+ 	}
++
++	evdev_device_set_calibration(device);
+ }
+ 
+ struct evdev_device *
+-- 
+1.9.3
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend
index 4a1e313..dfbda15 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend
@@ -1,7 +1,7 @@
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -9,6 +9,7 @@ DEPENDS += "libinput"
 
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
+            file://normalize-WL_CALIBRATION.patch \
 "
 
 SRCREV = "e67118c80ad411ac46b7096aae2635510c80ea6d"
-- 
1.7.9.5


