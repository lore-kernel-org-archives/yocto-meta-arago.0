Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3FAF952ABA
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINZK7007533
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709415;
	bh=MwQOXy3YgoNa0UH+YHaohaWPIKrDXQKCGDNHL2YqWog=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wxDCa4dzQnJWeIu+eOSEVzEo1Myv0ON1yONGNZzkRhvFhQnVgLFe7aEypuWRCVQKv
	bHN+LKvjjRXfk2mXZoETMDhqVRLsL5JjLuvtLVVIdpmQU9rZbchOfhDPSKNzZmLiBy
	hgMVTLz8bfelFTrn0EATl4JHG/dwZVtanSDO0jnY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINYFB010234
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:34 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8X006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:12 -0400
Message-ID: <1506709407-16448-9-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 08/qtbase: add x11 build support for (x)sgx ddk
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:39 -0000
Content-Type: text/plain

This is a hack to allow  qt5 X11 build with the SGX DDK where all the
X11 dependent components are provided by the SGX DDK X11 package under
/usr/local/XSGX/lib and /usr/local/XSGX/include.
- add additional include and lib search paths
- replace the dependency of the X11 related components to libgles2 which
  is equivalent to the SGX DDK UM

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bbappend        |  2 ++
 recipes-qt/qt5/qt3d_git.bbappend                    |  2 ++
 recipes-qt/qt5/qt5-creator_3.5.1.bbappend           |  2 ++
 recipes-qt/qt5/qt5-path-hack.inc                    |  2 ++
 .../qt5/qt5-plugin-generic-vboxtouch_git.bbappend   |  2 ++
 recipes-qt/qt5/qtbase_%.bbappend                    | 21 ++++++++++++++++++---
 recipes-qt/qt5/qtcanvas3d_git.bbappend              |  2 ++
 recipes-qt/qt5/qtcharts_git.bbappend                |  2 ++
 recipes-qt/qt5/qtconnectivity_git.bbappend          |  2 ++
 recipes-qt/qt5/qtdatavis3d_git.bbappend             |  2 ++
 recipes-qt/qt5/qtdeclarative-render2d_git.bbappend  |  2 ++
 recipes-qt/qt5/qtdeclarative_git.bbappend           |  2 ++
 recipes-qt/qt5/qtenginio_git.bbappend               |  2 ++
 recipes-qt/qt5/qtgraphicaleffects_git.bbappend      |  2 ++
 recipes-qt/qt5/qtimageformats_git.bbappend          |  2 ++
 recipes-qt/qt5/qtlocation_git.bbappend              |  2 ++
 recipes-qt/qt5/qtmultimedia_git.bbappend            |  2 ++
 recipes-qt/qt5/qtquick1_git.bbappend                |  2 ++
 recipes-qt/qt5/qtquickcontrols2_git.bbappend        |  2 ++
 recipes-qt/qt5/qtquickcontrols_git.bbappend         |  2 ++
 recipes-qt/qt5/qtscript_git.bbappend                |  2 ++
 recipes-qt/qt5/qtsensors_git.bbappend               |  2 ++
 recipes-qt/qt5/qtserialbus_git.bbappend             |  2 ++
 recipes-qt/qt5/qtserialport_git.bbappend            |  2 ++
 recipes-qt/qt5/qtsvg_git.bbappend                   |  2 ++
 recipes-qt/qt5/qtsystems_git.bbappend               |  2 ++
 recipes-qt/qt5/qttools_git.bbappend                 |  2 ++
 recipes-qt/qt5/qttranslations_git.bbappend          |  2 ++
 recipes-qt/qt5/qtvirtualkeyboard_git.bbappend       |  2 ++
 recipes-qt/qt5/qtwayland-native_git.bbappend        |  2 ++
 recipes-qt/qt5/qtwayland_git.bbappend               |  2 ++
 recipes-qt/qt5/qtwebchannel_git.bbappend            |  2 ++
 recipes-qt/qt5/qtwebengine_git.bbappend             |  2 ++
 recipes-qt/qt5/qtwebkit-examples_git.bbappend       |  2 ++
 recipes-qt/qt5/qtwebkit_git.bbappend                |  2 ++
 recipes-qt/qt5/qtwebsockets_git.bbappend            |  2 ++
 recipes-qt/qt5/qtx11extras_git.bbappend             |  2 ++
 recipes-qt/qt5/qtxmlpatterns_git.bbappend           |  2 ++
 38 files changed, 92 insertions(+), 3 deletions(-)
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase_git.bbappend
 create mode 100644 recipes-qt/qt5/qt3d_git.bbappend
 create mode 100644 recipes-qt/qt5/qt5-creator_3.5.1.bbappend
 create mode 100644 recipes-qt/qt5/qt5-path-hack.inc
 create mode 100644 recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bbappend
 mode change 100644 => 100755 recipes-qt/qt5/qtbase_%.bbappend
 create mode 100644 recipes-qt/qt5/qtcanvas3d_git.bbappend
 create mode 100644 recipes-qt/qt5/qtcharts_git.bbappend
 create mode 100644 recipes-qt/qt5/qtconnectivity_git.bbappend
 create mode 100644 recipes-qt/qt5/qtdatavis3d_git.bbappend
 create mode 100644 recipes-qt/qt5/qtdeclarative-render2d_git.bbappend
 create mode 100644 recipes-qt/qt5/qtdeclarative_git.bbappend
 create mode 100644 recipes-qt/qt5/qtenginio_git.bbappend
 create mode 100644 recipes-qt/qt5/qtgraphicaleffects_git.bbappend
 create mode 100644 recipes-qt/qt5/qtimageformats_git.bbappend
 create mode 100644 recipes-qt/qt5/qtlocation_git.bbappend
 create mode 100644 recipes-qt/qt5/qtmultimedia_git.bbappend
 create mode 100644 recipes-qt/qt5/qtquick1_git.bbappend
 create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bbappend
 create mode 100644 recipes-qt/qt5/qtquickcontrols_git.bbappend
 create mode 100644 recipes-qt/qt5/qtscript_git.bbappend
 create mode 100644 recipes-qt/qt5/qtsensors_git.bbappend
 create mode 100644 recipes-qt/qt5/qtserialbus_git.bbappend
 create mode 100644 recipes-qt/qt5/qtserialport_git.bbappend
 create mode 100644 recipes-qt/qt5/qtsvg_git.bbappend
 create mode 100644 recipes-qt/qt5/qtsystems_git.bbappend
 create mode 100644 recipes-qt/qt5/qttools_git.bbappend
 create mode 100644 recipes-qt/qt5/qttranslations_git.bbappend
 create mode 100644 recipes-qt/qt5/qtvirtualkeyboard_git.bbappend
 create mode 100644 recipes-qt/qt5/qtwayland-native_git.bbappend
 create mode 100644 recipes-qt/qt5/qtwayland_git.bbappend
 create mode 100644 recipes-qt/qt5/qtwebchannel_git.bbappend
 create mode 100644 recipes-qt/qt5/qtwebengine_git.bbappend
 create mode 100644 recipes-qt/qt5/qtwebkit-examples_git.bbappend
 create mode 100644 recipes-qt/qt5/qtwebkit_git.bbappend
 create mode 100644 recipes-qt/qt5/qtwebsockets_git.bbappend
 create mode 100644 recipes-qt/qt5/qtx11extras_git.bbappend
 create mode 100644 recipes-qt/qt5/qtxmlpatterns_git.bbappend

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bbappend b/recipes-qt/qt5/nativesdk-qtbase_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qt3d_git.bbappend b/recipes-qt/qt5/qt3d_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qt3d_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qt5-creator_3.5.1.bbappend b/recipes-qt/qt5/qt5-creator_3.5.1.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qt5-creator_3.5.1.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qt5-path-hack.inc b/recipes-qt/qt5/qt5-path-hack.inc
new file mode 100644
index 0000000..f9b0aef
--- /dev/null
+++ b/recipes-qt/qt5/qt5-path-hack.inc
@@ -0,0 +1,2 @@
+CXXFLAGS_append = " -I${STAGING_DIR_HOST}/usr/local/XSGX/include -L${STAGING_DIR_HOST}/usr/local/XSGX/lib"
+LDFLAGS_append = " -L${STAGING_DIR_HOST}/usr/local/XSGX/lib -Wl,-rpath-link,${STAGING_DIR_HOST}/usr/local/XSGX/lib"
diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bbappend b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
old mode 100644
new mode 100755
index 98710f3..df013b2
--- a/recipes-qt/qt5/qtbase_%.bbappend
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,8 +1,9 @@
-PR_append = ".tisdk4"
+PR_append = ".tisdk5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+include qt5-path-hack.inc
 
-GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"
+GLES_EXTRA_DEPS = "libdrm libgbm ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"
 
 # kms packageconfig requires virtual/mesa
 #
@@ -13,6 +14,20 @@ GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'wayla
 PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
 PACKAGECONFIG += "kms"
 
+PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,virtual/libgles2"
+PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,virtual/libgles2"
+PACKAGECONFIG[xfixes] = "-xfixes,-no-xfixes,virtual/libgles2"
+PACKAGECONFIG[xrandr] = "-xrandr,-no-xrandr,virtual/libgles2"
+PACKAGECONFIG[xrender] = "-xrender,-no-xrender,virtual/libgles2"
+PACKAGECONFIG[xshape] = "-xshape,-no-xshape"
+PACKAGECONFIG[xsync] = "-xsync,-no-xsync"
+PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,virtual/libgles2"
+PACKAGECONFIG[glib] = "-glib,-no-glib,virtual/libgles2"
+
+PACKAGECONFIG_X11_FORCE = " xsync xshape xrender xrandr xfixes xinput2 xcursor glib xkb "
+
+PACKAGECONFIG_append = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', "${PACKAGECONFIG_X11_FORCE}", '', d)}"
+
 QT_NOSGX_PATCHES = "\
     file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
     file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
@@ -20,7 +35,7 @@ QT_NOSGX_PATCHES = "\
 "
 
 SRC_URI += "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_NOSGX_PATCHES}", d)}\
+    ${@['',"${QT_NOSGX_PATCHES}"][bb.utils.contains('MACHINE_FEATURES','sgx',False,True,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
     file://0001-qtbase-enhance-eglfs_kms-to-handle-DRM-plane-set-req.patch        \
 "
 
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bbappend b/recipes-qt/qt5/qtcanvas3d_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtcanvas3d_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtcharts_git.bbappend b/recipes-qt/qt5/qtcharts_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtcharts_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtconnectivity_git.bbappend b/recipes-qt/qt5/qtconnectivity_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bbappend b/recipes-qt/qt5/qtdatavis3d_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtdatavis3d_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtdeclarative-render2d_git.bbappend b/recipes-qt/qt5/qtdeclarative-render2d_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative-render2d_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtdeclarative_git.bbappend b/recipes-qt/qt5/qtdeclarative_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtenginio_git.bbappend b/recipes-qt/qt5/qtenginio_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bbappend b/recipes-qt/qt5/qtgraphicaleffects_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtimageformats_git.bbappend b/recipes-qt/qt5/qtimageformats_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtimageformats_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtlocation_git.bbappend b/recipes-qt/qt5/qtlocation_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtlocation_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtmultimedia_git.bbappend b/recipes-qt/qt5/qtmultimedia_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtquick1_git.bbappend b/recipes-qt/qt5/qtquick1_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bbappend b/recipes-qt/qt5/qtquickcontrols2_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bbappend b/recipes-qt/qt5/qtquickcontrols_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtscript_git.bbappend b/recipes-qt/qt5/qtscript_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtscript_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtsensors_git.bbappend b/recipes-qt/qt5/qtsensors_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtsensors_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtserialbus_git.bbappend b/recipes-qt/qt5/qtserialbus_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtserialbus_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtserialport_git.bbappend b/recipes-qt/qt5/qtserialport_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtsvg_git.bbappend b/recipes-qt/qt5/qtsvg_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtsvg_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtsystems_git.bbappend b/recipes-qt/qt5/qtsystems_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtsystems_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qttools_git.bbappend b/recipes-qt/qt5/qttools_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qttools_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qttranslations_git.bbappend b/recipes-qt/qt5/qttranslations_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bbappend b/recipes-qt/qt5/qtvirtualkeyboard_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtwayland-native_git.bbappend b/recipes-qt/qt5/qtwayland-native_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland-native_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtwayland_git.bbappend b/recipes-qt/qt5/qtwayland_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtwebchannel_git.bbappend b/recipes-qt/qt5/qtwebchannel_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtwebchannel_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtwebengine_git.bbappend b/recipes-qt/qt5/qtwebengine_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bbappend b/recipes-qt/qt5/qtwebkit-examples_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtwebkit_git.bbappend b/recipes-qt/qt5/qtwebkit_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtwebsockets_git.bbappend b/recipes-qt/qt5/qtwebsockets_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtx11extras_git.bbappend b/recipes-qt/qt5/qtx11extras_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtx11extras_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bbappend b/recipes-qt/qt5/qtxmlpatterns_git.bbappend
new file mode 100644
index 0000000..b07c280
--- /dev/null
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bbappend
@@ -0,0 +1,2 @@
+PR_append = ".tisdk0"
+include qt5-path-hack.inc
-- 
1.9.1


