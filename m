Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 341D8520E3
	for <meta-arago@arago-project.org>;
	Thu, 20 Apr 2017 16:14:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3KGEYJt031590
	for <meta-arago@arago-project.org>; Thu, 20 Apr 2017 11:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492704874;
	bh=A1Nzc4InNLvfL/mmZA6HsTpf+JeJ39ZQBWPsa8X1weg=;
	h=From:To:CC:Subject:Date;
	b=jtUY30BZPHGuNYp/v6iW1V+NsxXws4JbjNNmKQMQVUEtGnabeCdzYeYNgV1N9fjCz
	toueoO1ES49qYrgvCnP/Js/+6n0QCyXlPgyO5tR4uqVpCOMsTrRwIqviO7lvex9jM1
	sOoZ3Mn16pKrtR8k1XrXqtGZY1RhmViJRCV9ytQY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3KGETjM011355
	for <meta-arago@arago-project.org>; Thu, 20 Apr 2017 11:14:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Apr 2017 11:14:28 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3KGERKI000659;
	Thu, 20 Apr 2017 11:14:28 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Apr 2017 21:44:22 +0530
Message-ID: <1492704863-125562-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty 1/2] wayland-ivi-extension: add recipe
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
X-List-Received-Date: Thu, 20 Apr 2017 16:14:44 -0000
Content-Type: text/plain

This recipe is primarily adapted from the meta-agl.
URL reference: https://goo.gl/m0LLmT

The recipe brings in the capability to use the ivi-shell
feature of the Weston and provides utilities to manage
the screens, layers and surfaces.

force-type-conversion.patch overlayed in the recipe is required
to address a compilation issue seen only with TI graphics
stack.

The other patches are required on top of the 1.11.0 version to
fully use the multiple screen features on TI platforms.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...-add-surfaces-Add-screenId-as-an-argument.patch | 101 +++++++++++++++++++++
 ...yer-add-surfaces-surface-layer-management.patch |  69 ++++++++++++++
 .../force-type-conversion.patch                    |  13 +++
 .../wayland/wayland-ivi-extension_1.11.0.bb        |  33 +++++++
 4 files changed, 216 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
new file mode 100644
index 0000000..b8afc0d
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
@@ -0,0 +1,101 @@
+From 0a368e3d65f3f3cbe193e9e4c6b7b7ddf4ec7b54 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 20 Apr 2017 13:24:20 +0530
+Subject: [PATCH 1/2] layer-add-surfaces: Add screenId as an argument
+
+Add Screen_ID as a argument to handle multiple screens.
+Removed choose_screen function as it is redundant
+after this change
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+Reviewed-by: Karthik Ramanan <a0393906@ti.com>
+---
+ .../layer-add-surfaces/src/layer-add-surfaces.c    | 47 +++++-----------------
+ 1 file changed, 11 insertions(+), 36 deletions(-)
+
+diff --git a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
+index aaff7de..46d7d15 100644
+--- a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
++++ b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
+@@ -32,6 +32,7 @@
+ 
+ t_ilm_uint screenWidth;
+ t_ilm_uint screenHeight;
++t_ilm_uint screen_ID;
+ t_ilm_uint layer;
+ pthread_mutex_t mutex;
+ static pthread_cond_t  waiterVariable = PTHREAD_COND_INITIALIZER;
+@@ -91,48 +92,20 @@ static void callbackFunction(ilmObjectType object, t_ilm_uint id, t_ilm_bool cre
+     }
+ }
+ 
+-/* Choose the display with the largest resolution.*/
+-static t_ilm_uint choose_screen(void)
++int main (int argc, const char * argv[])
+ {
+     struct ilmScreenProperties screenProperties;
+-    t_ilm_uint* screen_IDs = NULL;
+-    t_ilm_uint screen_ID = 0;
+-    t_ilm_uint screen_count = NULL;
+-    t_ilm_uint choosen_width = 0;
+-    t_ilm_uint choosen_height = 0;
+-    int i;
+-
+-    ilm_getScreenIDs(&screen_count, &screen_IDs);
+-
+-    for (i = 0; i<screen_count; i++)
+-    {
+-        ilm_getPropertiesOfScreen(screen_IDs[i], &screenProperties);
+-        if (screenProperties.screenWidth > choosen_width) {
+-            choosen_width = screenProperties.screenWidth;
+-            choosen_height = screenProperties.screenHeight;
+-            screen_ID = screen_IDs[i];
+-        }
+-    }
+ 
+-    screenWidth = choosen_width;
+-    screenHeight = choosen_height;
+-
+-    free(screen_IDs);
+-
+-    return screen_ID;
+-}
+-
+-int main (int argc, const char * argv[])
+-{
+     // Get command-line options
+-    if ( argc != 3) {
+-        printf("Call layer-add-surface <layerID> <number_of_surfaces>\n");
++    if ( argc != 4) {
++        printf("Call layer-add-surface <screenID> <layerID> <number_of_surfaces>\n");
+         return -1;
+     }
+ 
+-    layer = strtol(argv[1], NULL, 0);
++    screen_ID = strtol(argv[1], NULL, 0);
++    layer = strtol(argv[2], NULL, 0);
+ 
+-    number_of_surfaces = strtol(argv[2], NULL, 0);
++    number_of_surfaces = strtol(argv[3], NULL, 0);
+ 
+     pthread_mutexattr_t a;
+     if (pthread_mutexattr_init(&a) != 0)
+@@ -156,11 +129,13 @@ int main (int argc, const char * argv[])
+     pthread_mutexattr_destroy(&a);
+ 
+     t_ilm_layer renderOrder[1];
+-    t_ilm_uint screen_ID;
+     renderOrder[0] = layer;
+     ilm_init();
+ 
+-    screen_ID = choose_screen();
++    ilm_getPropertiesOfScreen(screen_ID, &screenProperties);
++    screenWidth = screenProperties.screenWidth;
++    screenHeight = screenProperties.screenHeight;
++    printf("GetPropertiesOfScreen: screen ID (%d), Width (%u), Height (%u)\n", screen_ID, screenWidth, screenHeight);
+     ilm_layerCreateWithDimension(&layer, screenWidth, screenHeight);
+     printf("CreateWithDimension: layer ID (%d), Width (%u), Height (%u)\n", layer, screenWidth, screenHeight);
+     ilm_layerSetVisibility(layer,ILM_TRUE);
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
new file mode 100644
index 0000000..eff4a79
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
@@ -0,0 +1,69 @@
+From 0d164d686147d2d3b08cd79ef9930f62ff8d528b Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 20 Apr 2017 13:30:31 +0530
+Subject: [PATCH 2/2] layer-add-surfaces: surface-layer management
+
+This patch prevents surfaces from getting added to a new layer
+if they are already registered to an existing layer.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+Reviewed-by: Karthik Ramanan <a0393906@ti.com>
+---
+ .../layer-add-surfaces/src/layer-add-surfaces.c    | 35 ++++++++++++++++++++--
+ 1 file changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
+index 46d7d15..cc76117 100644
+--- a/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
++++ b/ivi-layermanagement-examples/layer-add-surfaces/src/layer-add-surfaces.c
+@@ -59,14 +59,45 @@ static void surfaceCallbackFunction(t_ilm_uint id, struct ilmSurfaceProperties*
+         configure_ilm_surface(id, sp->origSourceWidth, sp->origSourceHeight);
+     }
+ }
+-
+ static void callbackFunction(ilmObjectType object, t_ilm_uint id, t_ilm_bool created, void *user_data)
+ {
+     (void)user_data;
+     struct ilmSurfaceProperties sp;
++    t_ilm_int llength, slength, i, j;
++    t_ilm_uint* layerIDs = NULL;
++    t_ilm_uint* surfaceIDs = NULL;
++    t_ilm_bool addRequired = ILM_TRUE;
+ 
+     if (object == ILM_SURFACE) {
+-        if (created) {
++        ilm_getLayerIDs(&llength, &layerIDs);
++
++        if(llength > 1) {
++            for(i=0; i < llength; i++) {
++                if(layerIDs[i] != layer) {
++                    ilm_getSurfaceIDsOnLayer(layerIDs[i], &slength, &surfaceIDs);
++                    for(j=0; j < slength; j++){
++                        if(surfaceIDs[j] == id){
++                            addRequired = ILM_FALSE;
++                            printf("surface %d is already attached to layer %d\n", id, layerIDs[i]);
++                        }
++
++                    }
++
++                    if(surfaceIDs) {
++                        free(surfaceIDs);
++                    }
++
++                }
++
++            }
++
++        }
++
++        if(layerIDs) {
++            free(layerIDs);
++        }
++
++        if (created && addRequired) {
+             if (number_of_surfaces > 0) {
+                 number_of_surfaces--;
+                 printf("surface                : %d created\n",id);
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
new file mode 100644
index 0000000..a72aeed
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
@@ -0,0 +1,13 @@
+diff --git a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
+index 2e65864..e14dbc0 100644
+--- a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
++++ b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
+@@ -244,7 +247,7 @@ bool OpenGLES2App::createEGLContext()
+     m_eglContextStruct.eglSurface = NULL;
+     m_eglContextStruct.eglContext = NULL;
+ 
+-    m_eglContextStruct.eglDisplay = eglGetDisplay(m_wlContextStruct.wlDisplay);
++    m_eglContextStruct.eglDisplay = eglGetDisplay((EGLNativeDisplayType)m_wlContextStruct.wlDisplay);
+     eglstatus = eglGetError();
+     if (!m_eglContextStruct.eglDisplay)
+     {
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
new file mode 100644
index 0000000..157e1ee
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Wayland IVI Extension"
+DESCRIPTION = "GENIVI Layer Management API based on Wayland IVI Extension"
+HOMEPAGE = "http://projects.genivi.org/wayland-ivi-extension"
+BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Extension"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
+
+SRCREV = "c9001582b10ce209c37b42dd560947c5aa8928b3"
+
+SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
+           file://force-type-conversion.patch \
+           file://0001-layer-add-surfaces-Add-screenId-as-an-argument.patch \
+           file://0002-layer-add-surfaces-surface-layer-management.patch \
+    "
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "weston virtual/libgles2 pixman"
+
+inherit cmake
+
+EXTRA_OECMAKE := "-DWITH_ILM_INPUT=1"
+
+FILES_${PN} += "${libdir}/weston/*"
+FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
+
+EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+
+PR = "r3"
+
+# Need these temporarily to prevent a non-fatal do_package_qa issue
+INSANE_SKIP_${PN} += "dev-deps"
+INSANE_SKIP_${PN}-dev += "dev-elf dev-so"
-- 
1.9.1


