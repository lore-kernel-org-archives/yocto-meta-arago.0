Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id CEE1452007
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 15:41:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCI00C4OM8BGW80@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Sep 2014 10:41:04 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8F859206BC; Fri,
	26 Sep 2014 11:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Sep 2014 11:40:37 -0400
Message-id: <1411746038-21612-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1411746038-21612-1-git-send-email-denis@denix.org>
References: <1411746038-21612-1-git-send-email-denis@denix.org>
Subject: [PATCH 6/7] weston: update bbappend for the new 1.6.0 version
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
X-List-Received-Date: Fri, 26 Sep 2014 15:41:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/weston/normalize-WL_CALIBRATION.patch  | 139 ---------------------
 ...weston_1.5.0.bbappend => weston_1.6.0.bbappend} |   9 +-
 2 files changed, 1 insertion(+), 147 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/normalize-WL_CALIBRATION.patch
 rename meta-arago-distro/recipes-graphics/wayland/{weston_1.5.0.bbappend => weston_1.6.0.bbappend} (78%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/normalize-WL_CALIBRATION.patch b/meta-arago-distro/recipes-graphics/wayland/weston/normalize-WL_CALIBRATION.patch
deleted file mode 100644
index 054d4de..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/normalize-WL_CALIBRATION.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-Subject: [PATCH weston] libinput: normalize WL_CALIBRATION before passing it
- to libinput
-In-Reply-To: <1409113902-4180-1-git-send-email-peter.hutterer@who-t.net>
-References: <1409113902-4180-1-git-send-email-peter.hutterer@who-t.net>
-Message-ID: <1409113902-4180-2-git-send-email-peter.hutterer@who-t.net>
-
-WL_CALIBRATION, introduced in weston-1.1, requires the translation component
-of the calibration matrix to be in screen coordinates. libinput does not have
-access to this and it's not a very generic way to do this anyway. So with
-the libinput backend, WL_CALIBRATION support is currently broken (#82742).
-This cannot be fixed in libinput without changing its API for this specific
-use-case.
-
-This patch lets weston take care of WL_CALIBRATION. It takes the original
-format and normalizes it before passing it to libinput. This way libinput
-still does the coordinate transformation, weston just needs to provide the
-initial configuration.
-
-Note that this needs an updated libinput, otherwise libinput will try to
-transform coordinates as well.
----
- src/libinput-device.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 87 insertions(+)
-
-diff --git a/src/libinput-device.c b/src/libinput-device.c
-index 6e50eeb..96fe2f2 100644
---- a/src/libinput-device.c
-+++ b/src/libinput-device.c
-@@ -282,6 +282,90 @@ notify_output_destroy(struct wl_listener *listener, void *data)
- 	}
- }
- 
-+/**
-+ * The WL_CALIBRATION property requires a pixel-specific matrix to be
-+ * applied after scaling device coordinates to screen coordinates. libinput
-+ * can't do that, so we need to convert the calibration to the normalized
-+ * format libinput expects.
-+ */
-+static void
-+evdev_device_set_calibration(struct evdev_device *device)
-+{
-+	struct udev *udev;
-+	struct udev_device *udev_device = NULL;
-+	const char *sysname = libinput_device_get_sysname(device->device);
-+	const char *calibration_values;
-+	uint32_t width, height;
-+	float calibration[6];
-+	enum libinput_config_status status;
-+
-+	if (!device->output)
-+		return;
-+
-+	width = device->output->width;
-+	height = device->output->height;
-+	if (width == 0 || height == 0)
-+		return;
-+
-+	/* If libinput has a pre-set calibration matrix, don't override it */
-+	if (!libinput_device_config_calibration_has_matrix(device->device) ||
-+	    libinput_device_config_calibration_get_default_matrix(
-+							  device->device,
-+							  calibration) != 0)
-+		return;
-+
-+	udev = udev_new();
-+	if (!udev)
-+		return;
-+
-+	udev_device = udev_device_new_from_subsystem_sysname(udev,
-+							     "input",
-+							     sysname);
-+	if (!udev_device)
-+		goto out;
-+
-+	calibration_values =
-+	udev_device_get_property_value(udev_device,
-+				       "WL_CALIBRATION");
-+
-+	if (!calibration_values || sscanf(calibration_values,
-+					  "%f %f %f %f %f %f",
-+					  &calibration[0],
-+					  &calibration[1],
-+					  &calibration[2],
-+					  &calibration[3],
-+					  &calibration[4],
-+					  &calibration[5]) != 6)
-+		goto out;
-+
-+	weston_log("Applying calibration: %f %f %f %f %f %f "
-+		   "(normalized %f %f)\n",
-+		    calibration[0],
-+		    calibration[1],
-+		    calibration[2],
-+		    calibration[3],
-+		    calibration[4],
-+		    calibration[5],
-+		    calibration[2]/width,
-+		    calibration[5]/height);
-+
-+	/* normalize to a format libinput can use. There is a chance of
-+	   this being wrong if the width/height don't match the device
-+	   width/height but I'm not sure how to fix that */
-+	calibration[2] /= width;
-+	calibration[5] /= height;
-+
-+	status = libinput_device_config_calibration_set_matrix(device->device,
-+							       calibration);
-+	if (status != LIBINPUT_CONFIG_STATUS_SUCCESS)
-+		weston_log("Failed to apply calibration.\n");
-+
-+out:
-+	if (udev_device)
-+		udev_device_unref(udev_device);
-+	udev_unref(udev);
-+}
-+
- void
- evdev_device_set_output(struct evdev_device *device,
- 			struct weston_output *output)
-@@ -295,6 +379,7 @@ evdev_device_set_output(struct evdev_device *device,
- 	device->output_destroy_listener.notify = notify_output_destroy;
- 	wl_signal_add(&output->destroy_signal,
- 		      &device->output_destroy_listener);
-+	evdev_device_set_calibration(device);
- }
- 
- static void
-@@ -318,6 +403,8 @@ configure_device(struct evdev_device *device)
- 		libinput_device_config_tap_set_enabled(device->device,
- 						       enable_tap);
- 	}
-+
-+	evdev_device_set_calibration(device);
- }
- 
- struct evdev_device *
--- 
-1.9.3
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
similarity index 78%
rename from meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index dfbda15..5d39575 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -1,21 +1,14 @@
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 
-PR_append = "-arago1"
+PR_append = "-arago0"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-DEPENDS += "libinput"
-
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
-            file://normalize-WL_CALIBRATION.patch \
 "
 
-SRCREV = "e67118c80ad411ac46b7096aae2635510c80ea6d"
-
-EXTRA_OECONF += "--enable-libinput-backend"
-
 # Add custom Arago Wayland Environment script file
 do_install_append () {
     install -d ${D}${sysconfdir}/profile.d
-- 
2.0.4


