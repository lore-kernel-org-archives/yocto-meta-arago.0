Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E839C0219A
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:13:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.22694.1738786391897499601
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=s0cIFWBG;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515KDAlk2665485
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 14:13:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738786390;
	bh=eifJl2H7dhXhmVRmVVV5xBhzxZAj5pwfl/hAiNlcZ6A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=s0cIFWBGZHcQxhNGcLh4pzQ/30HP9zoVGPy9d6eut4rxVMChbX2a/e2z8YmTKv5Za
	 TRSgW3Tgf19VME4xdo+7R79BmzuDEOF1UONfNdek6I9w9y22oG79v/r6j/eMFu/bRM
	 566P4wrYva4A1RW2whI/iAr4iC+SJw18JveAha2c=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515KDAAH024467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 14:13:10 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 14:13:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 14:13:10 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515KD7PI077560;
	Wed, 5 Feb 2025 14:13:09 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCHv2 1/2] meta-arago-*: remove all qt5 configs
Date: Wed, 5 Feb 2025 14:13:01 -0600
Message-ID: <20250205201302.1323478-2-rs@ti.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205201302.1323478-1-rs@ti.com>
References: <20250205201302.1323478-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15821

From: Randolph Sapp <rs@ti.com>

Remove all the Qt5 specific configs, recipes, and package groups to
prepare for Qt6. Some of these package configs will still work, but they
are unecessary.

All of the conditional logic in meta-qt6 toggles the important flags
automatically for us right now. This behavior will only change if X11 is
enabled, which we currently disable.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/README                      |   4 -
 meta-arago-distro/conf/distro/arago.conf      |  24 --
 meta-arago-distro/conf/layer.conf             |   2 -
 .../images/tisdk-default-image.bb             |   1 -
 .../meta/meta-toolchain-arago-qte.bb          |  54 ----
 .../meta/meta-toolchain-arago-tisdk.bb        |   3 +-
 .../packagegroups/packagegroup-arago-qte.bb   |  26 --
 .../packagegroup-arago-tisdk-qte.bb           |  21 --
 ...ckagegroup-arago-toolchain-tisdk-target.bb |   1 -
 .../recipes-core/packagegroups/ti-world.bb    |   1 -
 .../qt5/qtbase-conf/eglfs_kms_cfg.json        |   5 -
 .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  16 -
 .../qt5/qtbase-conf/ti33x/qt_env.sh           |  14 -
 .../recipes-qt/qt5/qtbase-conf_1.0.bb         |  23 --
 ...xit-button-for-non-window-environmen.patch |  62 ----
 ...01-deform-Fix-how-controls-are-shown.patch |  35 ---
 ...fs-Force-888-format-only-on-env-flag.patch |  44 ---
 ...latforms-eglfs_kms-fix-compiler-erro.patch |  29 --
 ...d-exit-button-for-non-window-environ.patch |  83 ------
 .../0002-deform-disable-opengl-button.patch   |  73 -----
 .../recipes-qt/qt5/qtbase/quit.png            | Bin 645 -> 0 bytes
 .../recipes-qt/qt5/qtbase_%.bbappend          |  46 ---
 ...touchinteraction.qml-Add-exit-button.patch |  62 ----
 .../recipes-qt/qt5/qtdeclarative_git.bbappend |  10 -
 ...atform.h-add-define-MESA_EGL_NO_X11_.patch |  30 --
 ...e-to-use-GL_NoX-version-of-GraphicsS.patch |  31 --
 .../qtwebkit/GraphicsContext3DQt.cpp.patch    |  29 --
 .../qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch  | 273 ------------------
 .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch |  36 ---
 .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch |  20 --
 .../qt5/qtwebkit/qttestbrowser.cpp.patch      |  27 --
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |  18 --
 meta-arago-extras/README                      |   4 -
 ...k-packagegroup-arago-qte-toolchain-host.bb |  12 -
 ...packagegroup-arago-qte-toolchain-target.bb |  35 ---
 .../cmake/extra-cmake-modules.bb              |   1 -
 ..._QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch |  28 --
 37 files changed, 2 insertions(+), 1181 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-qte.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch
 delete mode 100755 meta-arago-distro/recipes-qt/qt5/qtbase/quit.png
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
 delete mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 50fa7ede..d4ff2dd2 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -23,10 +23,6 @@ branch: master
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
-URI: https://github.com/meta-qt5/meta-qt5
-branch: master
-revision: HEAD
-
 URI: git://git.yoctoproject.org/meta-arago
 branch: master
 revision: HEAD
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 178b43d3..fb0f898f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -63,26 +63,6 @@ INIT_MANAGER ?= "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'))]}"
 # Distro-specific package configuration
 PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
 
-# Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
-PACKAGECONFIG_GL:pn-qtbase = "gles2 linuxfb"
-PACKAGECONFIG_DISTRO:pn-qtbase = "icu examples accessibility gif gbm kms libinput xkbcommon"
-PACKAGECONFIG_FONTS:pn-qtbase = "fontconfig"
-PACKAGECONFIG:remove:pn-qtwayland = "xcomposite-egl xcomposite-glx"
-
-# Add gstreamer in package configuration to enable video
-PACKAGECONFIG:append:pn-qtmultimedia = " gstreamer"
-
-# Add examples in Qt5 package configurations
-PACKAGECONFIG:append:pn-qtcharts = " examples"
-#PACKAGECONFIG:append:pn-qtdeclarative = " examples"
-PACKAGECONFIG:append:pn-qtlocation = " examples"
-PACKAGECONFIG:append:pn-qtmultimedia = " examples"
-PACKAGECONFIG:append:pn-qtscript = " examples"
-PACKAGECONFIG:append:pn-qtserialport = " examples"
-PACKAGECONFIG:append:pn-qtsvg = " examples"
-PACKAGECONFIG:append:pn-qtwayland = " examples"
-PACKAGECONFIG:append:pn-qtwebengine = " examples"
-
 # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
 PACKAGECONFIG:pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} proxy openssl verbose zlib"
 
@@ -168,7 +148,3 @@ ASSUME_PROVIDED += "nativesdk-perl"
 
 # https://bugzilla.yoctoproject.org/show_bug.cgi?id=15552
 INSANE_SKIP:nativesdk-openssl-misc += "build-deps"
-
-# https://github.com/meta-qt5/meta-qt5/issues/575
-ERROR_QA:remove:layer-qt5-layer = "buildpaths"
-WARN_QA:append:layer-qt5-layer = " buildpaths"
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index e8ef3b41..0bbf9a4e 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -18,7 +18,6 @@ LAYERDEPENDS_meta-arago-distro = " \
     networking-layer \
     multimedia-layer \
     meta-python \
-    qt5-layer \
     clang-layer \
     virtualization-layer \
     meta-arago-extras \
@@ -44,7 +43,6 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     udev \
     eudev \
     weston-conf \
-    qtbase-conf \
     cryptodev-module \
 "
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 3ae0212c..aace490b 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -17,7 +17,6 @@ IMAGE_INSTALL += "\
     ti-test-extras \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-qte','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-multimedia \
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-qte.bb
deleted file mode 100644
index 41dff492..00000000
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-# Qt Embedded toolchain
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-qte-toolchain-host"
-TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-qte-toolchain-target"
-TOOLCHAIN_SUFFIX ?= "-qte-sdk"
-
-require meta-toolchain-arago.bb
-
-PR = "r20"
-
-QT_MKSPECS_LOCATION = "${libdir}"
-QT_MKSPECS_DIR = "linux-oe-g++"
-
-toolchain_create_sdk_env_script:append() {
-	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:$PATH' >> $script
-	echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
-	echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
-	echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
-	echo 'export OE_QMAKE_CC="$CC"' >> $script
-	echo 'export OE_QMAKE_CXX="$CXX"' >> $script
-	echo 'export OE_QMAKE_LINK="$CXX"' >> $script
-	echo 'export OE_QMAKE_AR="$AR"' >> $script
-	echo 'export OE_QMAKE_PREFIX_QT=${prefix}' >> $script
-	echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
-	echo 'export OE_QMAKE_INCDIR_QT=${includedir}/${QT_DIR_NAME}' >> $script
-	echo 'export OE_QMAKE_HOST_BINDIR_QT=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}' >> $script
-	echo 'export OE_QMAKE_MOC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}moc${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_UIC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_UIC3=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic3${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_RCC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}rcc${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_QDBUSCPP2XML=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}qdbuscpp2xml${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_QDBUSXML2CPP=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}qdbusxml2cpp${QT_BIN_SUFFIX}' >> $script
-	echo 'export OE_QMAKE_QT_CONFIG=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
-	echo 'export OE_QMAKE_STRIP="echo"' >> $script
-	echo 'export QMAKESPEC=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/${QT_MKSPECS_DIR}' >> $script
-	echo 'export QMAKE_DEFAULT_LIBDIRS=${QT_QMAKE_LIBDIR_QT}' >> $script
-	echo 'export QMAKE_DEFAULT_INCDIRS=${QT_QMAKE_INCDIR_QT}' >> $script
-
-	#Adds qt.conf file that points qmake to properly locate Qt library and header files.
-	#This enables Qt Creator to work properly
-
-	qt_conf="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}qt.conf"
-	touch $qt_conf
-	echo '[Paths]' >> $qt_conf
-	echo 'Prefix = $(OE_QMAKE_PREFIX_QT)' >> $qt_conf
-	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
-	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
-	echo 'HostPrefix = $(SDK_PATH_NATIVE)' >> $qt_conf
-	echo 'HostBinaries = $(OE_QMAKE_HOST_BINDIR_QT)' >> $qt_conf
-	echo 'Sysroot = $(SDK_PATH_TARGET)' >> $qt_conf
-
-	# make a symbolic link to mkspecs for compatibility with Qt SDK and QTCreator
-	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
-	(cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; ln -sf ../${REAL_MULTIMACH_TARGET_SYS}${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
-}
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
index 4f272a52..c3807746 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -1,6 +1,7 @@
 TOOLCHAIN_SUFFIX ?= "-tisdk"
+LICENSE = "MIT"
 
 require meta-toolchain-arago-tisdk.inc
-require recipes-core/meta/meta-toolchain-arago-qte.bb
+require meta-toolchain-arago.bb
 
 PR = "${INC_PR}.0"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
deleted file mode 100644
index 8ea830fd..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Task to add Qt embedded related packages"
-LICENSE = "MIT"
-PR = "r16"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-RDEPENDS:${PN} = "\
-    qtbase-plugins \
-    qtdeclarative-qmlplugins \
-    qtlocation-plugins \
-    qtlocation-qmlplugins \
-    qtmultimedia-plugins \
-    qtmultimedia-qmlplugins \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-plugins', '', d)} \
-    qt3d-qmlplugins \
-    qtquickcontrols-qmlplugins \
-    qtquickcontrols2-qmlplugins \
-    qtgraphicaleffects-qmlplugins \
-    qtvirtualkeyboard-plugins \
-    qtvirtualkeyboard-qmlplugins \
-    liberation-fonts \
-    qtconnectivity \
-    qtconnectivity-qmlplugins \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
deleted file mode 100644
index be851944..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Task to add Qt embedded related packages"
-LICENSE = "MIT"
-PR = "r22"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-#    qtdeclarative-examples
-RDEPENDS:${PN} = "\
-    packagegroup-arago-qte \
-    qtbase-examples \
-    qtdeclarative-tools \
-    qtlocation-examples \
-    qtmultimedia-examples \
-    qtscript-examples \
-    qtsvg-examples \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
-    qtserialport-examples \
-    qtcharts-examples \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 43cd9c59..fc0a0241 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -18,7 +18,6 @@ TISDK_TOOLCHAIN_EXTRA_TARGET = "\
 TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 = ""
 
 RDEPENDS:${PN} = "\
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-qte-toolchain-target','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index fc3eac74..64af6d93 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -32,7 +32,6 @@ RDEPENDS:${PN} = "\
     ti-test \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-qte qt3d-examples','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-multimedia \
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
deleted file mode 100644
index 5667d11f..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  "device": "/dev/dri/card0",
-  "hwcursor": false,
-  "pbuffers": true
-}
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
deleted file mode 100644
index 5180c8e4..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-### QT Environment Variables ###
-export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
-export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
-export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
-export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
-export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell
-
-# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
-# from the pthread implementation. Disable this feature temporarily until
-# those issues are resolved.
-export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
-
-export QTWEBENGINE_DISABLE_SANDBOX=1
-#export QT_QPA_PLATFORM=eglfs
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
deleted file mode 100644
index ef49b124..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-### QT Environment Variables ###
-export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
-export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
-export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
-export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
-export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
-export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell
-
-# SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
-# from the pthread implementation. Disable this feature temporarily until
-# those issues are resolved.
-export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
deleted file mode 100644
index bed03208..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "qtbase configuration files"
-HOMEPAGE = "http://www.qt.io/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "file://qt_env.sh \
-           file://eglfs_kms_cfg.json \
-          "
-
-S = "${WORKDIR}/sources"
-UNPACKDIR = "${S}"
-
-# Add custom Arago qtbase Environment script and eglfs_kms configuration file
-do_install () {
-    install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${S}/qt_env.sh ${D}${sysconfdir}/profile.d/
-    install -d ${D}${sysconfdir}/qt5
-    install -m 0644 ${S}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
-}
-
-FILES:${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch
deleted file mode 100644
index 11112878..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From b0cb70d35131643dce61fa5a8ce9f652dc63e963 Mon Sep 17 00:00:00 2001
-From: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
-Date: Thu, 19 Mar 2015 15:21:08 -0400
-Subject: [PATCH 1/2] calculator: Add exit button for non-window environment.
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
----
- examples/widgets/widgets/calculator/calculator.cpp |    9 ++++++++-
- examples/widgets/widgets/calculator/calculator.h   |    1 +
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/examples/widgets/widgets/calculator/calculator.cpp b/examples/widgets/widgets/calculator/calculator.cpp
-index bb3836b..afe0bba 100644
---- a/examples/widgets/widgets/calculator/calculator.cpp
-+++ b/examples/widgets/widgets/calculator/calculator.cpp
-@@ -78,6 +78,7 @@ Calculator::Calculator(QWidget *parent)
-     Button *backspaceButton = createButton(tr("Backspace"), SLOT(backspaceClicked()));
-     Button *clearButton = createButton(tr("Clear"), SLOT(clear()));
-     Button *clearAllButton = createButton(tr("Clear All"), SLOT(clearAll()));
-+    Button *quitButton = createButton(tr("Quit"), SLOT(quitClicked()));
- 
-     Button *clearMemoryButton = createButton(tr("MC"), SLOT(clearMemory()));
-     Button *readMemoryButton = createButton(tr("MR"), SLOT(readMemory()));
-@@ -100,7 +101,8 @@ Calculator::Calculator(QWidget *parent)
- //! [5] //! [6]
-     mainLayout->setSizeConstraint(QLayout::SetFixedSize);
-     mainLayout->addWidget(display, 0, 0, 1, 6);
--    mainLayout->addWidget(backspaceButton, 1, 0, 1, 2);
-+    mainLayout->addWidget(quitButton, 1, 0, 1, 1);
-+    mainLayout->addWidget(backspaceButton, 1, 1, 1, 1);
-     mainLayout->addWidget(clearButton, 1, 2, 1, 2);
-     mainLayout->addWidget(clearAllButton, 1, 4, 1, 2);
- 
-@@ -297,6 +299,11 @@ void Calculator::changeSignClicked()
- }
- //! [24]
- 
-+void Calculator::quitClicked()
-+{
-+    qApp->quit();
-+}
-+
- //! [26]
- void Calculator::backspaceClicked()
- {
-diff --git a/examples/widgets/widgets/calculator/calculator.h b/examples/widgets/widgets/calculator/calculator.h
-index 76cf048..5e5c52e 100644
---- a/examples/widgets/widgets/calculator/calculator.h
-+++ b/examples/widgets/widgets/calculator/calculator.h
-@@ -64,6 +64,7 @@ private slots:
-     void equalClicked();
-     void pointClicked();
-     void changeSignClicked();
-+    void quitClicked();
-     void backspaceClicked();
-     void clear();
-     void clearAll();
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch
deleted file mode 100644
index 7f1e0570..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From adad036a785f6b3910e6305181e7711c2bac0df6 Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Fri, 12 Jun 2015 08:34:17 -0400
-Subject: [PATCH 1/2] deform: Fix how controls are shown.
-
-* Workaround for issue when controls are full screen, and user clicks
-  OK, black surface remains covering the entire screen.
-* If controls are not full screen, then they must retain focus while
-  opened.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
----
- examples/widgets/painting/deform/pathdeform.cpp |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/examples/widgets/painting/deform/pathdeform.cpp b/examples/widgets/painting/deform/pathdeform.cpp
-index 287f700..f8ecc3b 100644
---- a/examples/widgets/painting/deform/pathdeform.cpp
-+++ b/examples/widgets/painting/deform/pathdeform.cpp
-@@ -266,7 +266,9 @@ PathDeformWidget::PathDeformWidget(QWidget *parent, bool smallScreen)
- 
- void PathDeformWidget::showControls()
- {
--    m_controls->showFullScreen();
-+    // Hide first to keep controls in foreground.
-+    m_controls->hide();
-+    m_controls->show();
- }
- 
- void PathDeformWidget::hideControls()
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch
deleted file mode 100644
index b6f0eec8..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7288496d08108b8b6514f9fb20c575fd42f8027e Mon Sep 17 00:00:00 2001
-From: Gowtham Tammana <g-tammana@ti.com>
-Date: Mon, 6 Jul 2020 12:47:23 -0500
-Subject: [PATCH] eglfs: Force 888 format only on env flag
-
-[ChangeLog][Platform Specific Changes][eglfs] In the case of elgfs
-platform the surface format is being forced to RGB888 format which
-conflicts if a different default format is specified in the json config
-file. Force the surface format to be of RGB888 only when the environment
-flag QT_QPA_EGLFS_FORCE888 is set.
-set.
-
-Upstream-Status: Pending
-
-Change-Id: Id63f11eed2f41b322a95e103860888694ccd44db
----
- .../eglfs_kms_support/qeglfskmsintegration.cpp        | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsintegration.cpp
-index 06bc272050..41f2265208 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsintegration.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsintegration.cpp
-@@ -102,9 +102,14 @@ QSurfaceFormat QEglFSKmsIntegration::surfaceFormatFor(const QSurfaceFormat &inpu
-     QSurfaceFormat format(inputFormat);
-     format.setRenderableType(QSurfaceFormat::OpenGLES);
-     format.setSwapBehavior(QSurfaceFormat::DoubleBuffer);
--    format.setRedBufferSize(8);
--    format.setGreenBufferSize(8);
--    format.setBlueBufferSize(8);
-+
-+    static const bool force888 = qEnvironmentVariableIntValue("QT_QPA_EGLFS_FORCE888");
-+    if (force888) {
-+        format.setRedBufferSize(8);
-+        format.setGreenBufferSize(8);
-+        format.setBlueBufferSize(8);
-+    }
-+
-     return format;
- }
-
---
-2.17.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
deleted file mode 100644
index 7015325a..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7e1d01d4dc022f4da117f87a993d03b084134018 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Fri, 8 Mar 2019 17:02:38 -0500
-Subject: [PATCH] qtbase: plugins: platforms: eglfs_kms: fix compiler error
-
-Upstream-Status: Pending
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- .../eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp  | 7 +------
- .../eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h    | 5 +++++
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-index 4023381..eb24175 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-@@ -83,7 +78,7 @@ EGLDisplay QEglFSKmsGbmIntegration::createDisplay(EGLNativeDisplayType nativeDis
-     }
- 
-     if (getPlatformDisplay) {
--        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
-+        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, (void *)nativeDisplay, nullptr);
-     } else {
-         qCDebug(qLcEglfsKmsDebug, "No eglGetPlatformDisplay for GBM, falling back to eglGetDisplay");
-         display = eglGetDisplay(nativeDisplay);
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
deleted file mode 100644
index c1452eda..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 98476756ed6313c13adadf9d86bb921008c61eff Mon Sep 17 00:00:00 2001
-From: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
-Date: Fri, 20 Mar 2015 15:00:51 -0400
-Subject: [PATCH 2/2] animatedtiles: Add exit button for non-window
- environment.
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
----
- .../animation/animatedtiles/animatedtiles.qrc      |    1 +
- examples/widgets/animation/animatedtiles/main.cpp  |   13 ++++++++++++-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/examples/widgets/animation/animatedtiles/animatedtiles.qrc b/examples/widgets/animation/animatedtiles/animatedtiles.qrc
-index c43a979..3675345 100644
---- a/examples/widgets/animation/animatedtiles/animatedtiles.qrc
-+++ b/examples/widgets/animation/animatedtiles/animatedtiles.qrc
-@@ -6,6 +6,7 @@
-     <file>images/figure8.png</file>
-     <file>images/kinetic.png</file>
-     <file>images/random.png</file>
-+    <file>images/quit.png</file>
-     <file>images/tile.png</file>
- </qresource>
- </RCC>
-diff --git a/examples/widgets/animation/animatedtiles/main.cpp b/examples/widgets/animation/animatedtiles/main.cpp
-index 09e9790..d8491d7 100644
---- a/examples/widgets/animation/animatedtiles/main.cpp
-+++ b/examples/widgets/animation/animatedtiles/main.cpp
-@@ -97,6 +97,12 @@ public:
-         painter->drawPixmap(-_pix.width()/2, -_pix.height()/2, _pix);
-     }
- 
-+public slots:
-+    void quitClicked()
-+    {
-+        qApp->quit();
-+    }
-+
- signals:
-     void pressed();
- 
-@@ -121,6 +127,7 @@ class View : public QGraphicsView
- public:
-     View(QGraphicsScene *scene) : QGraphicsView(scene) { }
- 
-+
- protected:
-     void resizeEvent(QResizeEvent *event) Q_DECL_OVERRIDE
-     {
-@@ -156,16 +163,18 @@ int main(int argc, char **argv)
-     Button *randomButton = new Button(QPixmap(":/images/random.png"), buttonParent);
-     Button *tiledButton = new Button(QPixmap(":/images/tile.png"), buttonParent);
-     Button *centeredButton = new Button(QPixmap(":/images/centered.png"), buttonParent);
-+    Button *quitButton = new Button(QPixmap(":/images/quit.png"), buttonParent);
- 
-     ellipseButton->setPos(-100, -100);
-     figure8Button->setPos(100, -100);
-     randomButton->setPos(0, 0);
-     tiledButton->setPos(-100, 100);
-     centeredButton->setPos(100, 100);
-+    quitButton->setPos(100, -600);
- 
-     scene.addItem(buttonParent);
-     buttonParent->setTransform(QTransform::fromScale(0.75, 0.75), true);
--    buttonParent->setPos(200, 200);
-+    buttonParent->setPos(400, 200);
-     buttonParent->setZValue(65);
- 
-     // States
-@@ -239,6 +248,8 @@ int main(int argc, char **argv)
-     trans = rootState->addTransition(centeredButton, SIGNAL(pressed()), centeredState);
-     trans->addAnimation(group);
- 
-+    QObject::connect(quitButton, SIGNAL(pressed()), quitButton, SLOT(quitClicked()));
-+
-     QTimer timer;
-     timer.start(125);
-     timer.setSingleShot(true);
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch
deleted file mode 100644
index 31e573d5..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 066333592c77ef831286482c7d3636265777a774 Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Fri, 12 Jun 2015 10:24:33 -0400
-Subject: [PATCH 2/2] deform: disable opengl button.
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
----
- examples/widgets/painting/deform/pathdeform.cpp |   12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/examples/widgets/painting/deform/pathdeform.cpp b/examples/widgets/painting/deform/pathdeform.cpp
-index f8ecc3b..9da6bf3 100644
---- a/examples/widgets/painting/deform/pathdeform.cpp
-+++ b/examples/widgets/painting/deform/pathdeform.cpp
-@@ -91,7 +91,7 @@ void PathDeformControls::layoutForDesktop()
-     QPushButton *showSourceButton = new QPushButton(mainGroup);
-     showSourceButton->setText(tr("Show Source"));
- 
--#ifdef QT_OPENGL_SUPPORT
-+#if 0
-     QPushButton *enableOpenGLButton = new QPushButton(mainGroup);
-     enableOpenGLButton->setText(tr("Use OpenGL"));
-     enableOpenGLButton->setCheckable(true);
-@@ -114,7 +114,7 @@ void PathDeformControls::layoutForDesktop()
-     mainGroupLayout->addWidget(textGroup);
-     mainGroupLayout->addWidget(animateButton);
-     mainGroupLayout->addStretch(1);
--#ifdef QT_OPENGL_SUPPORT
-+#if 0
-     mainGroupLayout->addWidget(enableOpenGLButton);
- #endif
-     mainGroupLayout->addWidget(showSourceButton);
-@@ -140,7 +140,7 @@ void PathDeformControls::layoutForDesktop()
-     connect(deformSlider, SIGNAL(valueChanged(int)), m_renderer, SLOT(setIntensity(int)));
-     connect(fontSizeSlider, SIGNAL(valueChanged(int)), m_renderer, SLOT(setFontSize(int)));
-     connect(animateButton, SIGNAL(clicked(bool)), m_renderer, SLOT(setAnimated(bool)));
--#ifdef QT_OPENGL_SUPPORT
-+#if 0
-     connect(enableOpenGLButton, SIGNAL(clicked(bool)), m_renderer, SLOT(enableOpenGL(bool)));
- #endif
- 
-@@ -183,7 +183,7 @@ void PathDeformControls::layoutForSmallScreen()
-     QPushButton *animateButton = new QPushButton(tr("Animated"), mainGroup);
-     animateButton->setCheckable(true);
- 
--#ifdef QT_OPENGL_SUPPORT
-+#if 0
-     QPushButton *enableOpenGLButton = new QPushButton(mainGroup);
-     enableOpenGLButton->setText(tr("Use OpenGL"));
-     enableOpenGLButton->setCheckable(mainGroup);
-@@ -205,7 +205,7 @@ void PathDeformControls::layoutForSmallScreen()
-     mainGroupLayout->addWidget(fontSizeLabel, 2, 0, Qt::AlignRight);
-     mainGroupLayout->addWidget(fontSizeSlider, 2, 1);
-     mainGroupLayout->addWidget(animateButton, 3,0, 1,2);
--#ifdef QT_OPENGL_SUPPORT
-+#if 0
-     mainGroupLayout->addWidget(enableOpenGLButton, 4,0, 1,2);
- #endif
- 
-@@ -221,7 +221,7 @@ void PathDeformControls::layoutForSmallScreen()
-     connect(deformSlider, SIGNAL(valueChanged(int)), m_renderer, SLOT(setIntensity(int)));
-     connect(fontSizeSlider, SIGNAL(valueChanged(int)), m_renderer, SLOT(setFontSize(int)));
-     connect(animateButton, SIGNAL(clicked(bool)), m_renderer, SLOT(setAnimated(bool)));
--#ifdef QT_OPENGL_SUPPORT
-+#if 0
-     connect(enableOpenGLButton, SIGNAL(clicked(bool)), m_renderer, SLOT(enableOpenGL(bool)));
- #endif
- 
--- 
-1.7.9.5
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/quit.png b/meta-arago-distro/recipes-qt/qt5/qtbase/quit.png
deleted file mode 100755
index b9eb270c97306679f991669992d18a5f37e4ce22..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 645
zcmeAS@N?(olHy`uVBq!ia0vp^DIm<j0wiy}j=c}0SkfJR9T^xl_H+M9WCijSl0AZa
z85pY67#JE_7#My5g&JNkFq9fFFuY1&V6d9Oz#v{QXIG#NP=YDR+ueoXe|!I#{XiaP
zfk$L90|Vb-5N14{zXE6%W4EV^V@SoVx3i+xF)Q*ox4)}DU&4IYN6u`^wDaMiFVzZ<
zwk8zC9+OD!F$57Jk4qT6)7BlEGa;p*qbFgTzu^y`Ke6F%9X%7uHWfW_Shq`H+LYZZ
z9xUDJ>}8qc&k=R1*5uW?(0<3RdAd#NOC>GincTgsvz9XK5pg&YRkcRMW6R=`6DPjn
zW(sC_!*02IQ=|8m?YF;hHU3*Z_qN%=>iGW}t3_GvA38thWQ()tW%Z|Ai@&h_mbMGp
z-nP5?IM))>xgNp~_j)`sWq93YBkr~L?1J36r5o>fOCFqmDyFXSrlebR2$zZZal;-D
z#`Ltv`T0Q)Dl6sQO%`zqTPC@8lGDkXrZ4K)^w+lWc*W)K_m%u`CoeF_=-;|bk<7=g
zdSOc8v4Wo+kMIc@zHreA78H(t66yG4q5G4UzE2E8o>WGqBsiqBIH#;|OF7e7bNqE`
zhjdAeWOUV9S)*$+PaK{p<DbK_uaWEF%(Y8Tgeu;d_-W%09t{oK)qDv>d`D`T|4BdS
z`z8$yS<92+A6>FNSfU-gfN`Z-;u=wsl30>zm0Xkxq!^403{7<njCBnyLktbA49%>J
pjI|96tqctMnb}UEXvob^$xN%nt>ItXzA~T&22WQ%mvv4FO#o;X_JaTb

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
deleted file mode 100644
index b1205b5a..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ /dev/null
@@ -1,46 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-GLES_EXTRA_DEPS = "libdrm wayland"
-
-PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
-
-PR:append = ".arago17"
-
-QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
-
-QT_EGLFS_PATCHES = "\
-    file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
-    file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
-    file://quit.png \
-"
-
-#    file://0002-deform-disable-opengl-button.patch
-
-SRC_URI += "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
-    file://0001-deform-Fix-how-controls-are-shown.patch \
-    file://0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch \
-    file://0001-eglfs-Force-888-format-only-on-env-flag.patch \
-"
-
-python do_patch:append() {
-    import shutil
-
-    work_dir = d.getVar("UNPACKDIR")
-    s = d.getVar("S")
-
-    if not bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d):
-        shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
-}
-
-# Add symbolic link qt5/examples for backward compatibility
-do_install:append () {
-
-    install -d ${D}${datadir}/qt5
-    ln -sf ../examples ${D}${datadir}/qt5/examples
-}
-
-FILES:${PN}-examples +=  "${datadir}/qt5/*"
-
-
-RDEPENDS:${PN} += "${PN}-conf"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch b/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch
deleted file mode 100644
index 8ff24601..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 9048b28bde9bf4375f539885eeaa1f92dd2eb258 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Tue, 16 Aug 2016 15:09:04 -0400
-Subject: [PATCH] touchinteraction.qml: Add "exit" button
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- .../quick/touchinteraction/touchinteraction.qml    | 38 ++++++++++++++++++++++
- 1 file changed, 38 insertions(+)
-
-diff --git a/examples/quick/touchinteraction/touchinteraction.qml b/examples/quick/touchinteraction/touchinteraction.qml
-index 2ffb513..2c6934c 100644
---- a/examples/quick/touchinteraction/touchinteraction.qml
-+++ b/examples/quick/touchinteraction/touchinteraction.qml
-@@ -55,4 +55,42 @@ Item {
-             addExample("Corkboards", "Uses touch input on items inside a Flickable", Qt.resolvedUrl("flickable/corkboards.qml"));
-         }
-     }
-+
-+    Item {
-+        id: exit
-+
-+        width: parent.width / 10
-+        height: parent.height /10
-+
-+        anchors {
-+            bottom: parent.bottom
-+            left: parent.left
-+            bottomMargin: 40
-+        }
-+
-+        Rectangle {
-+            id: bgr
-+            anchors.fill: parent
-+            color: mouseArea.pressed ? "#757575" : "#212121"
-+            radius: height / 15
-+
-+            Text {
-+                id: text
-+                anchors.centerIn: parent
-+                text: "Exit"
-+                font.pixelSize: 0.4 * parent.height
-+                color: mouseArea.pressed ? "black" : "white"
-+                horizontalAlignment: Text.AlignHCenter
-+                verticalAlignment: Text.AlignVCenter
-+            }
-+
-+            MouseArea {
-+                id: mouseArea
-+                anchors.fill: parent
-+                onClicked: {
-+                    Qt.quit()
-+                }
-+            }
-+        }
-+    }
- }
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
deleted file mode 100644
index 4167ac43..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-PR:append = ".tisdk1"
-
-CXXFLAGS:append:omap-a15 = " -DQ_OS_BLACKBERRY"
-
-
-SRC_URI += " \
-    file://0001-touchinteraction.qml-Add-exit-button.patch \
-"
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
deleted file mode 100644
index 29521a8e..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4a21fcedd886772b7e1bd40861835f1b4f33c7ff Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Fri, 30 Aug 2019 17:41:13 -0400
-Subject: [PATCH] HACK: ANGLE/khrplatform.h: add #define
- MESA_EGL_NO_X11_HEADERS
-
-Note: Only the KHR/khrplatform.h at sysroot/usr/include should be used.
-      This patch is a tentative workaround to make both files compatible
-
-Upstream-Status: Inappropriate [tentative workaround only]
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- Source/ThirdParty/ANGLE/include/KHR/khrplatform.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
-index c9e6f17d3..4e3ff69a8 100644
---- a/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
-+++ b/Source/ThirdParty/ANGLE/include/KHR/khrplatform.h
-@@ -279,4 +279,6 @@ typedef enum {
-     KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
- } khronos_boolean_enum_t;
- 
-+#define MESA_EGL_NO_X11_HEADERS
-+
- #endif /* __khrplatform_h_ */
--- 
-2.17.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
deleted file mode 100644
index 5ccf6df3..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 90de2ab42bdd51b92dd00f700d6766ca1ffd23c0 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 17 Jul 2014 16:11:46 -0400
-Subject: [PATCH] Target.pri: update to use GL_NoX version of GraphicsSurface
- sources
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- Source/WebCore/Target.pri | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
-index e2044bc..cc9bdd4 100644
---- a/Source/WebCore/Target.pri
-+++ b/Source/WebCore/Target.pri
-@@ -4283,6 +4283,10 @@ use?(GRAPHICS_SURFACE) {
-             platform/graphics/surfaces/glx/X11Helper.cpp \
-             platform/graphics/surfaces/glx/GraphicsSurfaceGLX.cpp
-     }
-+    contains(QT_CONFIG, opengles2) {
-+        SOURCES -= platform/graphics/surfaces/qt/GraphicsSurfaceGLX.cpp
-+        SOURCES += platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
-+    }
- }
- 
- build?(qttestsupport) {
--- 
-2.0.0
-
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
deleted file mode 100644
index 7a7cf752..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
---- qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.cpp.orig	2013-09-07 13:41:19.946858466 +0530
-+++ qtwebkit/Source/WebCore/platform/graphics/qt/GraphicsContext3DQt.cpp	2013-09-07 17:48:13.958979770 +0530
-@@ -383,21 +383,23 @@ GraphicsContext3D::GraphicsContext3D(Gra
-     , m_boundTexture0(0)
-     , m_multisampleFBO(0)
-     , m_multisampleDepthStencilBuffer(0)
-     , m_multisampleColorBuffer(0)
-     , m_private(adoptPtr(new GraphicsContext3DPrivate(this, hostWindow, renderStyle)))
- {
-     validateAttributes();
- 
-+#if USE(GLX)
-     if (!m_private->m_surface || !m_private->m_platformContext) {
-         LOG_ERROR("GraphicsContext3D: GL context creation failed.");
-         m_private = nullptr;
-         return;
-     }
-+#endif
- 
-     static bool initialized = false;
-     static bool success = true;
-     if (!initialized) {
-         success = initializeOpenGLShims();
-         initialized = true;
-     }
-     if (!success) {
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
deleted file mode 100644
index 033fa893..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
-diff -Nurp8 Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp Source-new/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
---- qtwebkit/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp	1970-01-01 05:30:00.000000000 +0530
-+++ qtwebkit-new/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp	2013-09-07 13:43:55.186851650 +0530
-@@ -0,0 +1,266 @@
-+/*
-+ Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies)
-+
-+ This library is free software; you can redistribute it and/or
-+ modify it under the terms of the GNU Library General Public
-+ License as published by the Free Software Foundation; either
-+ version 2 of the License, or (at your option) any later version.
-+
-+ This library is distributed in the hope that it will be useful,
-+ but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ Library General Public License for more details.
-+
-+ You should have received a copy of the GNU Library General Public License
-+ along with this library; see the file COPYING.LIB.  If not, write to
-+ the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
-+ Boston, MA 02110-1301, USA.
-+ */
-+
-+#include "config.h"
-+#include "GraphicsSurface.h"
-+
-+#if USE(GRAPHICS_SURFACE)
-+
-+#include "NotImplemented.h"
-+#include "TextureMapperGL.h"
-+
-+#if PLATFORM(QT)
-+// Qt headers must be included before gl headers.
-+#include <QGuiApplication>
-+#include <QOpenGLContext>
-+#include <qpa/qplatformnativeinterface.h>
-+#elif PLATFORM(EFL)
-+#include <GL/gl.h>
-+#endif
-+
-+ #include <GLES2/gl2.h>
-+
-+namespace WebCore {
-+
-+class OffScreenRootWindow {
-+public:
-+    OffScreenRootWindow()
-+    {
-+        ++m_refCount;
-+    }
-+
-+    ~OffScreenRootWindow()
-+    {
-+        if (--m_refCount)
-+            return;
-+    }
-+
-+private:
-+    static int m_refCount;
-+};
-+
-+int OffScreenRootWindow::m_refCount = 0;
-+
-+
-+struct GraphicsSurfacePrivate {
-+    GraphicsSurfacePrivate(const PlatformGraphicsContext3D shareContext = 0)
-+        : m_textureIsYInverted(false)
-+        , m_hasAlpha(false)
-+        , m_isReceiver(false)
-+    {
-+
-+#if PLATFORM(QT)
-+        if (shareContext) {
-+#if 0
-+            // This code path requires QXcbNativeInterface::nativeResourceForContext() which is not availble in Qt5 on the build bots yet.
-+            QPlatformNativeInterface* nativeInterface = QGuiApplication::platformNativeInterface();
-+            shareContextObject = static_cast<GLXContext>(nativeInterface->nativeResourceForContext(QByteArrayLiteral("glxcontext"), shareContext));
-+            if (!shareContextObject)
-+                return;
-+#else
-+            // This code path should be removed as soon as QXcbNativeInterface::nativeResourceForContext() can provide the GLXContext.
-+            QOpenGLContext* previousContext = QOpenGLContext::currentContext();
-+            QSurface* previousSurface = previousContext->surface();
-+            QSurface* currentSurface = shareContext->surface();
-+            shareContext->makeCurrent(currentSurface);
-+
-+
-+            previousContext->makeCurrent(previousSurface);
-+#endif
-+        }
-+#else
-+        UNUSED_PARAM(shareContext);
-+#endif
-+
-+
-+    }
-+
-+    GraphicsSurfacePrivate(uint32_t winId)
-+        : m_textureIsYInverted(false)
-+        , m_hasAlpha(false)
-+        , m_isReceiver(true)
-+    { }
-+
-+    ~GraphicsSurfacePrivate()
-+    {
-+    }
-+
-+    uint32_t createSurface(const IntSize& size)
-+    {
-+        return 0;
-+    }
-+
-+    void createPixmap(uint32_t winId)
-+    {
-+    }
-+
-+    bool textureIsYInverted()
-+    {
-+        return m_textureIsYInverted;
-+    }
-+
-+    void makeCurrent()
-+    {
-+    }
-+
-+    void doneCurrent()
-+    {
-+    }
-+
-+    void swapBuffers()
-+    {
-+    }
-+
-+    void copyFromTexture(uint32_t texture, const IntRect& sourceRect)
-+    {
-+        makeCurrent();
-+
-+        swapBuffers();
-+        doneCurrent();
-+    }
-+
-+    void* display() const { return 0; }
-+
-+    IntSize size() const
-+    {
-+        return IntSize(0, 0);
-+    }
-+
-+private:
-+    OffScreenRootWindow m_offScreenWindow;
-+    IntSize m_size;
-+    bool m_textureIsYInverted;
-+    bool m_hasAlpha;
-+    bool m_isReceiver;
-+};
-+
-+static bool resolveGLMethods()
-+{
-+    return true;
-+}
-+
-+GraphicsSurfaceToken GraphicsSurface::platformExport()
-+{
-+    return GraphicsSurfaceToken();
-+}
-+
-+uint32_t GraphicsSurface::platformGetTextureID()
-+{
-+    return 0;
-+}
-+
-+void GraphicsSurface::platformCopyToGLTexture(uint32_t /*target*/, uint32_t /*id*/, const IntRect& /*targetRect*/, const IntPoint& /*offset*/)
-+{
-+    // This is not supported by NoX
-+}
-+
-+void GraphicsSurface::platformCopyFromTexture(uint32_t texture, const IntRect& sourceRect)
-+{
-+    m_private->copyFromTexture(texture, sourceRect);
-+}
-+
-+
-+void GraphicsSurface::platformPaintToTextureMapper(TextureMapper* textureMapper, const FloatRect& targetRect, const TransformationMatrix& transform, float opacity, BitmapTexture* mask)
-+{
-+    TextureMapperGL* texMapGL = static_cast<TextureMapperGL*>(textureMapper);
-+    TransformationMatrix adjustedTransform = transform;
-+    adjustedTransform.multiply(TransformationMatrix::rectToRect(FloatRect(FloatPoint::zero(), m_private->size()), targetRect));
-+    TextureMapperGL::Flags flags = m_private->textureIsYInverted() ? TextureMapperGL::ShouldFlipTexture : 0;
-+    flags |= TextureMapperGL::SupportsBlending;
-+    texMapGL->drawTexture(platformGetTextureID(), flags, m_private->size(), targetRect, adjustedTransform, opacity, mask);
-+}
-+
-+uint32_t GraphicsSurface::platformFrontBuffer() const
-+{
-+    return 0;
-+}
-+
-+uint32_t GraphicsSurface::platformSwapBuffers()
-+{
-+    m_private->swapBuffers();
-+    return 0;
-+}
-+
-+IntSize GraphicsSurface::platformSize() const
-+{
-+    return m_private->size();
-+}
-+
-+PassRefPtr<GraphicsSurface> GraphicsSurface::platformCreate(const IntSize& size, Flags flags, const PlatformGraphicsContext3D shareContext)
-+{
-+    if (flags & SupportsCopyToTexture || flags & SupportsSingleBuffered)
-+        return PassRefPtr<GraphicsSurface>();
-+
-+    RefPtr<GraphicsSurface> surface = adoptRef(new GraphicsSurface(size, flags));
-+
-+    surface->m_private = new GraphicsSurfacePrivate(shareContext);
-+    if (!resolveGLMethods())
-+        return PassRefPtr<GraphicsSurface>();
-+
-+    surface->m_platformSurface = surface->m_private->createSurface(size);
-+
-+    return surface;
-+}
-+
-+PassRefPtr<GraphicsSurface> GraphicsSurface::platformImport(const IntSize& size, Flags flags, const GraphicsSurfaceToken& token)
-+{
-+    if (flags & SupportsCopyToTexture || flags & SupportsSingleBuffered)
-+        return PassRefPtr<GraphicsSurface>();
-+
-+    RefPtr<GraphicsSurface> surface = adoptRef(new GraphicsSurface(size, flags));
-+    surface->m_platformSurface = token.frontBufferHandle;
-+
-+    surface->m_private = new GraphicsSurfacePrivate(surface->m_platformSurface);
-+    if (!resolveGLMethods())
-+        return PassRefPtr<GraphicsSurface>();
-+
-+    return surface;
-+}
-+
-+char* GraphicsSurface::platformLock(const IntRect&, int* /*outputStride*/, LockOptions)
-+{
-+    // GraphicsSurface is currently only being used for WebGL, which does not require this locking mechanism.
-+    return 0;
-+}
-+
-+void GraphicsSurface::platformUnlock()
-+{
-+    // GraphicsSurface is currently only being used for WebGL, which does not require this locking mechanism.
-+}
-+
-+void GraphicsSurface::platformDestroy()
-+{
-+    m_private = 0;
-+}
-+
-+#if !PLATFORM(QT)
-+PassOwnPtr<GraphicsContext> GraphicsSurface::platformBeginPaint(const IntSize&, char*, int)
-+{
-+    notImplemented();
-+    return nullptr;
-+}
-+
-+PassRefPtr<Image> GraphicsSurface::createReadOnlyImage(const IntRect&)
-+{
-+    notImplemented();
-+    return 0;
-+}
-+#endif
-+}
-+#endif
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
deleted file mode 100644
index 719793fd..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
---- qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToken.h.orig	2013-09-07 13:44:47.906849335 +0530
-+++ qtwebkit/Source/WebCore/platform/graphics/surfaces/GraphicsSurfaceToken.h	2013-09-07 13:46:12.554845618 +0530
-@@ -50,17 +50,30 @@ struct GraphicsSurfaceToken {
-     {
-         return frontBufferHandle != rhs.frontBufferHandle;
-     }
- 
-     bool isValid() const
-     {
-         return frontBufferHandle;
-     }
-+#elif PLATFORM(QT)
-+    GraphicsSurfaceToken(uint32_t windowID = 0)
-+         : frontBufferHandle(windowID)
-+    { }
-+
-+     bool operator!=(const GraphicsSurfaceToken &rhs) const
-+     {
-+         return frontBufferHandle != rhs.frontBufferHandle;
-+     }
- 
-+     bool isValid() const
-+     {
-+         return frontBufferHandle;
-+     }
- #endif
- 
- #if OS(DARWIN) || OS(WINDOWS)
-     GraphicsSurfaceToken(BufferHandle frontBuffer = 0, BufferHandle backBuffer = 0)
-         : frontBufferHandle(frontBuffer)
-         , backBufferHandle(backBuffer)
-     { }
- 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
deleted file mode 100644
index cc2bf510..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
-diff --git a/Source/WebCore/WebCore.pri b/Source/WebCore/WebCore.pri
-index 0189394..00f7090 100644
---- a/Source/WebCore/WebCore.pri
-+++ b/Source/WebCore/WebCore.pri
-@@ -227,8 +227,10 @@ use?(3D_GRAPHICS) {
- use?(GRAPHICS_SURFACE) {
-     mac: LIBS += -framework IOSurface -framework CoreFoundation
-     linux-*: {
--        LIBS += -lXcomposite -lXrender
--        CONFIG *= x11
-+        xlibAvailable() {
-+            LIBS += -lXcomposite -lXrender
-+            CONFIG *= x11
-+        }
-     }
- }
- 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
deleted file mode 100644
index badf9349..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
---- qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp.orig	2013-09-08 17:28:48.633593482 +0530
-+++ qtwebkit/Tools/QtTestBrowser/qttestbrowser.cpp	2013-09-08 17:29:07.713592964 +0530
-@@ -235,19 +235,20 @@ void LauncherApplication::handleUserOpti
-     }
- 
-     if (args.contains("-webgl")) {
-         requiresGraphicsView("-webgl");
-         windowOptions.useWebGL = true;
-     }
- #endif
- 
-+#if 0
-     if (args.contains("-use-test-fonts"))
-         WebKit::QtTestSupport::initializeTestFonts();
--
-+#endif
-     if (args.contains("-print-loaded-urls"))
-         windowOptions.printLoadedUrls = true;
- 
-     QString inspectorUrlArg("-inspector-url");
-     int inspectorUrlIndex = args.indexOf(inspectorUrlArg);
-     if (inspectorUrlIndex != -1)
-        windowOptions.inspectorUrl = takeOptionValue(&args, inspectorUrlIndex);
- 
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
deleted file mode 100644
index 22d2dc70..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ /dev/null
@@ -1,18 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-#	file://GraphicsSurfaceToken.h.patch
-#	file://0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
-#	file://WebCore.pri.patch
-
-SRC_URI += " \
-	file://GraphicsSurfaceGL_NoX.cpp.patch \
-	file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch \
-"
-
-PR:append = ".arago8"
-
-EXTRA_OECMAKE:append = " -DCMAKE_BUILD_TYPE=Release"
-
-EXTRA_OECMAKE:append:k3 = " -DUSE_SYSTEM_MALLOC=ON"
-
-DEPENDS += "flex-native bison-native"
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index c703a813..fc04e6af 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -23,10 +23,6 @@ branch: master
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
-URI: https://github.com/meta-qt5/meta-qt5
-branch: master
-revision: HEAD
-
 Send pull requests, patches, comments or questions to:
 meta-arago@lists.yoctoproject.org
 
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
deleted file mode 100644
index 23c45abf..00000000
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Host packages for Qt Embedded SDK"
-PR = "r10"
-LICENSE = "MIT"
-
-inherit packagegroup
-inherit_defer nativesdk
-
-RDEPENDS:${PN} = "\
-    nativesdk-packagegroup-arago-tisdk-host \
-    nativesdk-qtbase \
-    nativesdk-qttools \
-    "
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
deleted file mode 100644
index 793fcd8f..00000000
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Target packages for Qt Embedded SDK"
-LICENSE = "MIT"
-
-PR = "r16"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-RDEPENDS:${PN} += " \
-        packagegroup-arago-standalone-sdk-target \
-        libsqlite3-dev \
-        qtbase-mkspecs \
-        qtdeclarative-mkspecs \
-        qtscript-mkspecs \
-        qt3d-mkspecs \
-        qtlocation-mkspecs \
-        qtsensors-mkspecs \
-        qtsvg-mkspecs \
-        qtxmlpatterns-mkspecs \
-        qtbase-dev \
-        qtbase-staticdev \
-        qtdeclarative-dev \
-        qtscript-dev \
-        qt3d-dev \
-        qtlocation-dev \
-        qtsensors-dev \
-        qtsvg-dev \
-        qtxmlpatterns-dev \
-        ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "qtwebengine-mkspecs qtwebengine-dev", "", d)} \
-        qtserialport-mkspecs \
-        qtserialport-dev  \
-        qtcharts-mkspecs \
-        qtcharts-dev \
-"
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
index 297e2152..d5e8872c 100644
--- a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
@@ -7,7 +7,6 @@ SRCREV = "8dc36cfa882f07a60b3ebdf16d9aac57871bd382"
 
 SRC_URI = " \
     git://anongit.kde.org/extra-cmake-modules;protocol=git;branch=master \
-    file://0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch \
 "
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
deleted file mode 100644
index a8c2132e..00000000
--- a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 90d6c2bce5a50d2c05af25978bccbe047705eed7 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Mon, 29 Dec 2014 12:05:20 +0100
-Subject: [PATCH] Search within OE_QMAKE_PATH_EXTERNAL_HOST_BINS for
- qtwaylandscanner
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
----
- find-modules/FindQtWaylandScanner.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/find-modules/FindQtWaylandScanner.cmake b/find-modules/FindQtWaylandScanner.cmake
-index 7fb8a00..f782275 100644
---- a/find-modules/FindQtWaylandScanner.cmake
-+++ b/find-modules/FindQtWaylandScanner.cmake
-@@ -88,7 +88,7 @@ include(${CMAKE_CURRENT_LIST_DIR}/ECMFindModuleHelpersStub.cmake)
- ecm_find_package_version_check(QtWaylandScanner)
- 
- # Find qtwaylandscanner
--find_program(QtWaylandScanner_EXECUTABLE NAMES qtwaylandscanner)
-+find_program(QtWaylandScanner_EXECUTABLE NAMES qtwaylandscanner HINTS ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS})
- 
- include(FindPackageHandleStandardArgs)
- find_package_handle_standard_args(QtWaylandScanner
--- 
-2.1.0
-- 
2.47.1


