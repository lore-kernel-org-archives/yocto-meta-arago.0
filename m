Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C10C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 18:25:09 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.88903.1753727105175671460
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 11:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=h2rBAlWq;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SIP2vh2786041;
	Mon, 28 Jul 2025 13:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753727102;
	bh=r4iPoFvlIEkjbeM+RuYnIxepY3rPPEdwV92S6zzncXI=;
	h=From:To:CC:Subject:Date;
	b=h2rBAlWqtGsj6zR/b5xz94i6IuMc6slWw1xqYbAQwu2KMEaVGSt97DrTRrc2QWTvQ
	 zg6YCb4Ff68c6dNuF3Nv1Yq7qAPbVbQ/sUejOKGUH1NWmq4O4H7O0b1RYUebDTfhIl
	 aW+bMdkP6GgAZXkAfCRRq4AAgfDKzPGpUOt731KE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SIP2eR1872983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 13:25:02 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 13:25:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 13:25:02 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SIP2Nn2483839;
	Mon, 28 Jul 2025 13:25:02 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] wayland-ivi-extension: Remove this recipe
Date: Mon, 28 Jul 2025 13:25:01 -0500
Message-ID: <20250728182501.579669-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Jul 2025 18:25:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16332

The wayland-ivi-extensions are no longer maintained nor do they work with
any recent weston version. Remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...surfaces-Add-screenId-as-an-argument.patch | 103 ------------------
 ...dd-surfaces-surface-layer-management.patch |  71 ------------
 ...-input-controller-update-to-weston-7.patch |  28 -----
 ...i-id-agent-update-to-weston-7-header.patch |  30 -----
 ...te-dependencies-to-build-on-weston-8.patch |  28 -----
 .../force-type-conversion.patch               |  16 ---
 .../wayland/wayland-ivi-extension_2.2.0.bb    |  34 ------
 7 files changed, 310 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/01-ivi-input-controller-update-to-weston-7.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-to-weston-7-header.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
deleted file mode 100644
index b8601e36..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 0a368e3d65f3f3cbe193e9e4c6b7b7ddf4ec7b54 Mon Sep 17 00:00:00 2001
-From: Ramprasad N <x0038811@ti.com>
-Date: Thu, 20 Apr 2017 13:24:20 +0530
-Subject: [PATCH 1/2] layer-add-surfaces: Add screenId as an argument
-
-Add Screen_ID as a argument to handle multiple screens.
-Removed choose_screen function as it is redundant
-after this change
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Ramprasad N <x0038811@ti.com>
-Reviewed-by: Karthik Ramanan <a0393906@ti.com>
----
- .../layer-add-surfaces/src/layer-add-surfaces.c    | 47 +++++-----------------
- 1 file changed, 11 insertions(+), 36 deletions(-)
-
-diff --git a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
-index aaff7de..46d7d15 100644
---- a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
-+++ b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
-@@ -32,6 +32,7 @@
- 
- t_ilm_uint screenWidth;
- t_ilm_uint screenHeight;
-+t_ilm_uint screen_ID;
- t_ilm_uint layer;
- pthread_mutex_t mutex;
- static pthread_cond_t  waiterVariable = PTHREAD_COND_INITIALIZER;
-@@ -91,48 +92,20 @@ static void callbackFunction(ilmObjectType object, t_ilm_uint id, t_ilm_bool cre
-     }
- }
- 
--/* Choose the display with the largest resolution.*/
--static t_ilm_uint choose_screen(void)
-+int main (int argc, const char * argv[])
- {
-     struct ilmScreenProperties screenProperties;
--    t_ilm_uint* screen_IDs = NULL;
--    t_ilm_uint screen_ID = 0;
--    t_ilm_uint screen_count = NULL;
--    t_ilm_uint choosen_width = 0;
--    t_ilm_uint choosen_height = 0;
--    int i;
--
--    ilm_getScreenIDs(&screen_count, &screen_IDs);
--
--    for (i = 0; i<screen_count; i++)
--    {
--        ilm_getPropertiesOfScreen(screen_IDs[i], &screenProperties);
--        if (screenProperties.screenWidth > choosen_width) {
--            choosen_width = screenProperties.screenWidth;
--            choosen_height = screenProperties.screenHeight;
--            screen_ID = screen_IDs[i];
--        }
--    }
- 
--    screenWidth = choosen_width;
--    screenHeight = choosen_height;
--
--    free(screen_IDs);
--
--    return screen_ID;
--}
--
--int main (int argc, const char * argv[])
--{
-     // Get command-line options
--    if ( argc != 3) {
--        printf("Call layer-add-surface <layerID> <number_of_surfaces>\n");
-+    if ( argc != 4) {
-+        printf("Call layer-add-surface <screenID> <layerID> <number_of_surfaces>\n");
-         return -1;
-     }
- 
--    layer = strtol(argv[1], NULL, 0);
-+    screen_ID = strtol(argv[1], NULL, 0);
-+    layer = strtol(argv[2], NULL, 0);
- 
--    number_of_surfaces = strtol(argv[2], NULL, 0);
-+    number_of_surfaces = strtol(argv[3], NULL, 0);
- 
-     pthread_mutexattr_t a;
-     if (pthread_mutexattr_init(&a) != 0)
-@@ -156,11 +129,13 @@ int main (int argc, const char * argv[])
-     pthread_mutexattr_destroy(&a);
- 
-     t_ilm_layer renderOrder[1];
--    t_ilm_uint screen_ID;
-     renderOrder[0] = layer;
-     ilm_init();
- 
--    screen_ID = choose_screen();
-+    ilm_getPropertiesOfScreen(screen_ID, &screenProperties);
-+    screenWidth = screenProperties.screenWidth;
-+    screenHeight = screenProperties.screenHeight;
-+    printf("GetPropertiesOfScreen: screen ID (%d), Width (%u), Height (%u)\n", screen_ID, screenWidth, screenHeight);
-     ilm_layerCreateWithDimension(&layer, screenWidth, screenHeight);
-     printf("CreateWithDimension: layer ID (%d), Width (%u), Height (%u)\n", layer, screenWidth, screenHeight);
-     ilm_layerSetVisibility(layer,ILM_TRUE);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
deleted file mode 100644
index adf6711f..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 0d164d686147d2d3b08cd79ef9930f62ff8d528b Mon Sep 17 00:00:00 2001
-From: Ramprasad N <x0038811@ti.com>
-Date: Thu, 20 Apr 2017 13:30:31 +0530
-Subject: [PATCH 2/2] layer-add-surfaces: surface-layer management
-
-This patch prevents surfaces from getting added to a new layer
-if they are already registered to an existing layer.
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Ramprasad N <x0038811@ti.com>
-Reviewed-by: Karthik Ramanan <a0393906@ti.com>
----
- .../layer-add-surfaces/src/layer-add-surfaces.c    | 35 ++++++++++++++++++++--
- 1 file changed, 33 insertions(+), 2 deletions(-)
-
-diff --git a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
-index 46d7d15..cc76117 100644
---- a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
-+++ b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
-@@ -59,14 +59,45 @@ static void surfaceCallbackFunction(t_ilm_uint id, struct ilmSurfaceProperties*
-         configure_ilm_surface(id, sp->origSourceWidth, sp->origSourceHeight);
-     }
- }
--
- static void callbackFunction(ilmObjectType object, t_ilm_uint id, t_ilm_bool created, void *user_data)
- {
-     (void)user_data;
-     struct ilmSurfaceProperties sp;
-+    t_ilm_int llength, slength, i, j;
-+    t_ilm_uint* layerIDs = NULL;
-+    t_ilm_uint* surfaceIDs = NULL;
-+    t_ilm_bool addRequired = ILM_TRUE;
- 
-     if (object == ILM_SURFACE) {
--        if (created) {
-+        ilm_getLayerIDs(&llength, &layerIDs);
-+
-+        if(llength > 1) {
-+            for(i=0; i < llength; i++) {
-+                if(layerIDs[i] != layer) {
-+                    ilm_getSurfaceIDsOnLayer(layerIDs[i], &slength, &surfaceIDs);
-+                    for(j=0; j < slength; j++){
-+                        if(surfaceIDs[j] == id){
-+                            addRequired = ILM_FALSE;
-+                            printf("surface %d is already attached to layer %d\n", id, layerIDs[i]);
-+                        }
-+
-+                    }
-+
-+                    if(surfaceIDs) {
-+                        free(surfaceIDs);
-+                    }
-+
-+                }
-+
-+            }
-+
-+        }
-+
-+        if(layerIDs) {
-+            free(layerIDs);
-+        }
-+
-+        if (created && addRequired) {
-             if (number_of_surfaces > 0) {
-                 number_of_surfaces--;
-                 printf("surface                : %d created\n",id);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/01-ivi-input-controller-update-to-weston-7.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/01-ivi-input-controller-update-to-weston-7.patch
deleted file mode 100644
index 70756e53..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/01-ivi-input-controller-update-to-weston-7.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From efdd2a85519d4990596194af5bf50636d2610f09 Mon Sep 17 00:00:00 2001
-From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
-Date: Mon, 6 Jan 2020 06:41:57 -0500
-Subject: [PATCH] ivi-input-controller: update to weston 7 header files
-
-update the header file path.
-
-Upstream-Status: Submitted [https://github.com/GENIVI/wayland-ivi-extension/pull/110]
-
-Signed-off-by: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
-Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
----
- .../ivi-input-controller/src/ivi-input-controller.c             | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c b/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c
-index a0bfc48..257a1dc 100644
---- a/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c
-+++ b/ivi-input-modules/ivi-input-controller/src/ivi-input-controller.c
-@@ -31,7 +31,7 @@
- #include <fcntl.h>
- #include <unistd.h>
- 
--#include "plugin-registry.h"
-+#include <libweston/plugin-registry.h>
- #include "ilm_types.h"
- 
- #include "ivi-input-server-protocol.h"
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-to-weston-7-header.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-to-weston-7-header.patch
deleted file mode 100644
index 8c7189e2..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/02-ivi-id-agent-update-to-weston-7-header.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5abb2b497e0153210d41ec3685dc0152587625fa Mon Sep 17 00:00:00 2001
-From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
-Date: Mon, 6 Jan 2020 06:45:11 -0500
-Subject: [PATCH] ivi-id-agent: update to weston 7 header files
-
-update the header file path.
-
-Upstream-Status: Submitted [https://github.com/GENIVI/wayland-ivi-extension/pull/110]
-
-Signed-off-by: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
-Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
----
- ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c b/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c
-index 8f0c199..b80e2a4 100644
---- a/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c
-+++ b/ivi-id-agent-modules/ivi-id-agent/src/ivi-id-agent.c
-@@ -26,8 +26,8 @@
- #include <limits.h>
- 
- #include <weston.h>
--#include <libweston-6/libweston-desktop.h>
--#include "config-parser.h"
-+#include <libweston-desktop/libweston-desktop.h>
-+#include <libweston/config-parser.h>
- #include <weston/ivi-layout-export.h>
- 
- #ifndef INVALID_ID
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
deleted file mode 100644
index 1b18d9bf..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b99082adfaf250b15f03345cdf1b433fb1575581 Mon Sep 17 00:00:00 2001
-From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
-Date: Mon, 6 Jan 2020 06:45:54 -0500
-Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 8
-
-upgrade libweston-desktop version.
-
-Upstream-Status: Submitted [https://github.com/GENIVI/wayland-ivi-extension/pull/110]
-
-Signed-off-by: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
-Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
----
- ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt b/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt
-index 3e604a5..ff47808 100644
---- a/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt
-+++ b/ivi-id-agent-modules/ivi-id-agent/CMakeLists.txt
-@@ -25,7 +25,7 @@ find_package(PkgConfig REQUIRED)
- pkg_check_modules(WAYLAND_SERVER wayland-server REQUIRED)
- pkg_check_modules(WESTON weston>=6.0.0 REQUIRED)
- pkg_check_modules(PIXMAN pixman-1 REQUIRED)
--pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-6 REQUIRED)
-+pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-8 REQUIRED)
- 
- find_package(Threads REQUIRED)
- 
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
deleted file mode 100644
index acebcfe4..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
-diff --git a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
-index 2e65864..e14dbc0 100644
---- a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
-+++ b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
-@@ -244,7 +247,7 @@ bool OpenGLES2App::createEGLContext()
-     m_eglContextStruct.eglSurface = NULL;
-     m_eglContextStruct.eglContext = NULL;
- 
--    m_eglContextStruct.eglDisplay = eglGetDisplay(m_wlContextStruct.wlDisplay);
-+    m_eglContextStruct.eglDisplay = eglGetDisplay((EGLNativeDisplayType)m_wlContextStruct.wlDisplay);
-     eglstatus = eglGetError();
-     if (!m_eglContextStruct.eglDisplay)
-     {
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
deleted file mode 100644
index 4626345e..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Wayland IVI Extension"
-DESCRIPTION = "GENIVI Layer Management API based on Wayland IVI Extension"
-HOMEPAGE = "http://projects.genivi.org/wayland-ivi-extension"
-BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Extension"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
-
-SRCREV = "e9c2fe4c5034a06b159cfd45dbd485755cbaf4c8"
-
-SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
-           file://01-ivi-input-controller-update-to-weston-7.patch \
-           file://02-ivi-id-agent-update-to-weston-7-header.patch \
-           file://03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch \
-    "
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "weston virtual/libgles2 pixman wayland-native"
-
-inherit cmake
-
-EXTRA_OECMAKE := "-DWITH_ILM_INPUT=1"
-
-FILES:${PN} += "${datadir}/wayland-protocols/stable/ivi-application/ivi-application.xml"
-FILES:${PN} += "${libdir}/weston/*"
-FILES:${PN}-dbg += "${libdir}/weston/.debug/*"
-
-EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-
-PR = "r1"
-
-# Need these temporarily to prevent a non-fatal do_package_qa issue
-INSANE_SKIP:${PN} += "dev-deps"
-INSANE_SKIP:${PN}-dev += "dev-elf dev-so"
-- 
2.39.2


