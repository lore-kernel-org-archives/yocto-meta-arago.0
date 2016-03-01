Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C017B52004
	for <meta-arago@arago-project.org>;
	Tue,  1 Mar 2016 22:48:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u21MmR9T013861
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 16:48:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u21MmQHr019556
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 16:48:26 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Mar 2016 16:48:26 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u21MmQYG028594	for <meta-arago@arago-project.org>;
	Tue, 1 Mar 2016 16:48:26 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Mar 2016 17:48:22 -0500
Message-ID: <1456872502-5739-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kmscube: Enhance and enable this demo for AM3
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
X-List-Received-Date: Tue, 01 Mar 2016 22:48:28 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...001-kmscube.c-init_drm-enable-AM3-support.patch | 28 ++++++++++++++++++++++
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  9 +++----
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
new file mode 100644
index 0000000..64b7b04
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init_drm-enable-AM3-support.patch
@@ -0,0 +1,28 @@
+From 82a3cc3ddec96fba7204f5ecab0890801a0b54b4 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Thu, 25 Feb 2016 09:49:24 -0500
+Subject: [PATCH] kmscube.c: init_drm(): enable AM3 support
+
+Enable AM3 support by adding "tilcdc" to the modules list.
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ kmscube.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kmscube.c b/kmscube.c
+index 5a18c32..919b3e7 100644
+--- a/kmscube.c
++++ b/kmscube.c
+@@ -84,7 +84,7 @@ struct drm_fb {
+ static int init_drm(void)
+ {
+ 	static const char *modules[] = {
+-			"omapdrm", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
++			"omapdrm", "tilcdc", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
+ 	};
+ 	drmModeRes *resources;
+ 	drmModeConnector *connector = NULL;
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 484a46b..138a55b 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -5,18 +5,19 @@ LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8
 
 DEPENDS = "libdrm libgbm omap5-sgx-ddk-um-linux"
 
-COMPATIBLE_MACHINE = "ti43x|omap-a15"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit autotools pkgconfig
 
-PR = "r4"
+PR = "r5"
 SRCREV = "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
 
-SRC_URI_append_ti43x = " \
-    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
+SRC_URI_append = " \
+    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
+    file://0001-kmscube.c-init_drm-enable-AM3-support.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


