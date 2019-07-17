Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 32F91520C0
	for <meta-arago@arago-project.org>;
	Wed, 17 Jul 2019 14:56:09 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HEtJuc057303
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2019 09:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563375319;
	bh=2zFBKgwxsSbT0NliF2SnHOtDnvIkCPB8FeId7K89MnM=;
	h=From:To:CC:Subject:Date;
	b=NbRpYskVG8lHtmi2LE70C0PWEFwbAUwJr4AEsNgk1jcYaf3Smn1s5bSiJzoDG9ZUp
	qJ7M25c1CP2yyvVvpfwLnz8Q/W9hxP5HpYrUoOHXDRfqjCO8MVID/fXANFLkW9FZiW
	ftv+c/GTmp7o3Is8ciWx5OHmVIDPAWlrexa6GgfA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HEtJBb044925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2019 09:55:19 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 17 Jul 2019 09:55:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 17 Jul 2019 09:55:19 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HEtIU0096387;
	Wed, 17 Jul 2019 09:55:18 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 17 Jul 2019 10:38:38 -0400
Message-ID: <1563374318-24540-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] recipes: replace old sgx machine feature with gpu
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
X-List-Received-Date: Wed, 17 Jul 2019 14:56:09 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/distro/include/branding-processor-sdk.inc                    | 2 +-
 recipes-core/images/arago-core-tisdk-image.bbappend               | 2 +-
 recipes-core/matrix/matrix-gui-browser_2.0.bbappend               | 6 +++---
 .../packagegroup-arago-qte-toolchain-target.bbappend              | 4 ++--
 recipes-core/packagegroups/packagegroup-arago-qte.bbappend        | 4 ++--
 .../packagegroups/packagegroup-arago-tisdk-graphics.bbappend      | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bbappend    | 8 ++++----
 recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend  | 4 ++--
 recipes-qt/qt5/qtbase_%.bbappend                                  | 6 +++---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend    | 4 ++--
 10 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index 53ae51b..e40fd93 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -71,7 +71,7 @@ KERNEL_MODULE_AUTOLOAD_EXTRAS_keystone += "rpmsg_proto"
 KERNEL_MODULE_AUTOLOAD += "${KERNEL_MODULE_AUTOLOAD_EXTRAS}"
 
 PACKAGECONFIG_pn-weston = "kms launch clients"
-PACKAGECONFIG_append_pn-weston = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', ' egl', ' fbdev', d)}"
+PACKAGECONFIG_append_pn-weston = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', ' egl', ' fbdev', d)}"
 
 # Override MKUBIFS_ARGS when our image size exceeds upstream limits
 MKUBIFS_ARGS_am335x-evm     = "-F -m 2048 -e 126976 -c 12000"
diff --git a/recipes-core/images/arago-core-tisdk-image.bbappend b/recipes-core/images/arago-core-tisdk-image.bbappend
index 83863d7..4a966f8 100644
--- a/recipes-core/images/arago-core-tisdk-image.bbappend
+++ b/recipes-core/images/arago-core-tisdk-image.bbappend
@@ -4,7 +4,7 @@ IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
     packagegroup-arago-tisdk-crypto-sdk-host \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
     packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
     packagegroup-arago-tisdk-hmi-sdk-host \
diff --git a/recipes-core/matrix/matrix-gui-browser_2.0.bbappend b/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
index e45f38e..4e64dc3 100644
--- a/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
+++ b/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
@@ -1,14 +1,14 @@
 PR_append = ".tisdk1"
 
 DEPENDS_remove = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_DEPENDS_WEBENGINE}", d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', "${QT_DEPENDS_WEBENGINE}", d)} \
 "
 
 DEPENDS_append = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', " ${QT_DEPENDS_WEBKIT}", d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', " ${QT_DEPENDS_WEBKIT}", d)} \
 "
 
 #QT5_WEBENGINE_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
 #QT5_WEBKIT_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
 
-#QT5_SRCREV = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', "${QT5_SRCREV}", "${QT5_WEBKIT_SRCREV}", d)}"
+#QT5_SRCREV = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', "${QT5_SRCREV}", "${QT5_WEBKIT_SRCREV}", d)}"
diff --git a/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
index 691916d..020194c 100644
--- a/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bbappend
@@ -1,9 +1,9 @@
 PR_append = ".tisdk0"
 
 QT5_DEV_remove = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-mkspecs qtwebengine-dev', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-mkspecs qtwebengine-dev', d)} \
 "
 
 QT5_DEV_append = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', ' qtwebkit-mkspecs qtwebkit-dev qtquick1-dev', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', ' qtwebkit-mkspecs qtwebkit-dev qtquick1-dev', d)} \
 "
diff --git a/recipes-core/packagegroups/packagegroup-arago-qte.bbappend b/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
index 0acf47d..08066b1 100644
--- a/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-qte.bbappend
@@ -1,9 +1,9 @@
 PR_append = ".tisdk1"
 
 QT5_ESSENTIALS_remove = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-qmlplugins', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-qmlplugins', d)} \
 "
 
 QT5_ESSENTIALS_append = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebkit-qmlplugins', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebkit-qmlplugins', d)} \
 "
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
index 412e94c..ac1f1f5 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bbappend
@@ -6,14 +6,14 @@ GRAPHICS_DEMO_omap-a15 = "\
 "
 
 GRAPHICS_RDEPENDS_remove = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)} \
 "
 GRAPHICS_RDEPENDS_remove = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'glmark2', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'glmark2', d)} \
 "
 
 GRAPHICS_WAYLAND_remove = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'wayland-ivi-extension', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'wayland-ivi-extension', d)} \
 "
 
 RDEPENDS_${PN} += "${GRAPHICS_DEMO}"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
index c187a0d..c48ba85 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
@@ -1,14 +1,14 @@
 PR_append = ".tisdk3"
 
 MULTIMEDIA_append_omap-a15 = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'video-graphics-test', '', d)} \
+    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'video-graphics-test', '', d)} \
 "
 
 MULTIMEDIA_append_ti43x = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
+    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
 "
 
 MULTIMEDIA_append_ti33x = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
+    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
 "
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
index 85954fc..46d6429 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bbappend
@@ -1,9 +1,9 @@
 PR_append = ".tisdk1"
 
 QT5_DEMOS_remove = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebengine-examples', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebengine-examples', d)} \
 "
 
 QT5_DEMOS_append = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'qtwebkit-examples-examples', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'qtwebkit-examples-examples', d)} \
 "
diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
index 7fe1fa2..e8add23 100644
--- a/recipes-qt/qt5/qtbase_%.bbappend
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -2,7 +2,7 @@ PR_append = ".tisdk5.7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"
+GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'wayland', '', d)}"
 
 QT_NOSGX_PATCHES = "\
     file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
@@ -11,7 +11,7 @@ QT_NOSGX_PATCHES = "\
 "
 
 SRC_URI += "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_NOSGX_PATCHES}", d)}\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', "${QT_NOSGX_PATCHES}", d)}\
     file://0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch \
 "
 
@@ -21,7 +21,7 @@ python do_patch_append() {
     work_dir = d.getVar("WORKDIR", True)
     s = d.getVar("S", True)
 
-    if not bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d):
+    if not bb.utils.contains('MACHINE_FEATURES','gpu',True,False,d):
         shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
 }
 
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 910ceb9..caec915 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -64,8 +64,8 @@ MAKEFILES_append_k2g = " pru-icss"
 
 MAKEFILES_append_dra7xx = " tiovx-app-host"
 
-MAKEFILES_remove_ti33x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
-MAKEFILES_remove_ti43x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
+MAKEFILES_remove_ti33x = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)}"
+MAKEFILES_remove_ti43x = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)}"
 
 MAKEFILES_remove_keystone = "hplib-mod ipsecmgr-mod"
 
-- 
2.7.4


