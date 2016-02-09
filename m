Return-Path: <anandb@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 15E5A529E4
	for <meta-arago@arago-project.org>;
	Tue,  9 Feb 2016 05:49:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u195nbbT006847
	for <meta-arago@arago-project.org>; Mon, 8 Feb 2016 23:49:37 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u195nbp9030667
	for <meta-arago@arago-project.org>; Mon, 8 Feb 2016 23:49:37 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Feb 2016 23:49:36 -0600
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u195nZG5003436;	Mon, 8 Feb 2016 23:49:36 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Feb 2016 11:19:26 +0530
Message-ID: <1454996966-10391-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Tue, 09 Feb 2016 05:49:38 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 ...v-seat-restrict-udev-enumeration-to-card0.patch |   37 ++++++++++++++++++++
 .../recipes-graphics/wayland/weston_1.9.0.bb       |    1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
new file mode 100644
index 0000000..515f06c
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
@@ -0,0 +1,37 @@
+From e8e7a9f7dfa164a75fdbdca87622a2e13334478a Mon Sep 17 00:00:00 2001
+From: Anand Balagopalakrishnan <anandb@ti.com>
+Date: Sat, 23 Jan 2016 22:48:07 +0530
+Subject: [PATCH 1/1] udev-seat: restrict udev enumeration to card0
+
+In case of separate GPU and Display devices as found in embedded systems, we
+could have modeset node and render node controlled by different drivers.
+There is a distinct possibility that udev enumeration returns the DRM device
+corresponding to render node as the primary DRM device.
+
+Obviously, modeset operations cannot be done on the GPU DRM device.
+
+Restrict the udev enumeration to card0 and ensure that DRM device corresponding
+to display is returned as the primary DRM device.
+
+Upstream-Status: Pending
+
+Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
+---
+ src/compositor-drm.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/compositor-drm.c b/src/compositor-drm.c
+index 6777bf8..59c2cc5 100644
+--- a/src/compositor-drm.c
++++ b/src/compositor-drm.c
+@@ -2827,7 +2827,7 @@ find_primary_gpu(struct drm_backend *b, const char *seat)
+
+	e = udev_enumerate_new(b->udev);
+	udev_enumerate_add_match_subsystem(e, "drm");
+-	udev_enumerate_add_match_sysname(e, "card[0-9]*");
++	udev_enumerate_add_match_sysname(e, "card0");
+
+	udev_enumerate_scan_devices(e);
+	drm_device = NULL;
+--
+1.7.9.5
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
index 439b279..a444590 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-make-error-portable.patch \
            file://libsystemd.patch \
            file://explicit-enable-disable-systemd.patch \
+	   file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
 "
 SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
 SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
-- 
1.7.9.5


