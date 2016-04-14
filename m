Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id AB9BD52A81
	for <meta-arago@arago-project.org>;
	Thu, 14 Apr 2016 19:59:34 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5N004F43IVNP20@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Apr 2016 14:59:19 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=WNDY76dxAAAA:8
	a=wU5JFSukbhO4-OTIGjoA:9
Received: by 100.15.86.14 with SMTP id 1312672a; Thu, 14 Apr 2016 19:59:19 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9BED4161FAA;	Thu,
	14 Apr 2016 15:59:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 14 Apr 2016 15:59:16 -0400
Message-id: <1460663957-25942-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1460663957-25942-1-git-send-email-denis@denix.org>
References: <1460663957-25942-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] qtbase: rework bbappend to move env conf to own machine-specific recipe
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
X-List-Received-Date: Thu, 14 Apr 2016 19:59:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../qt5/{qtbase => qtbase-conf}/qt_env.sh          |  0
 .../ti33x/qt_env.sh}                               |  0
 .../recipes-qt/qt5/qtbase-conf_1.0.bb              | 16 +++++++++++++++
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 23 ++--------------------
 4 files changed, 18 insertions(+), 21 deletions(-)
 rename meta-arago-distro/recipes-qt/qt5/{qtbase => qtbase-conf}/qt_env.sh (100%)
 rename meta-arago-distro/recipes-qt/qt5/{qtbase/qt_env_ti33x.sh => qtbase-conf/ti33x/qt_env.sh} (100%)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh
rename to meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh
rename to meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
new file mode 100644
index 0000000..b2ad0a8
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "qtbase configuration files"
+HOMEPAGE = "http://www.qt.io/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "file://qt_env.sh"
+
+# Add custom Arago qtbase Environment script file
+do_install () {
+    install -d ${D}${sysconfdir}/profile.d
+    install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
+}
+
+FILES_${PN} += "${sysconfdir}/profile.d/*"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 19891e1..d504b2d 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,13 +1,10 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-GLES_EXTRA_DEPS = ""
-GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
-GLES_EXTRA_DEPS_ti43x = "libdrm wayland"
-GLES_EXTRA_DEPS_ti33x = "libdrm"
+GLES_EXTRA_DEPS = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = "-arago11"
+PR_append = "-arago12"
 
 QT_CONFIG_FLAGS += "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
@@ -17,11 +14,7 @@ QT_EGLFS_PATCHES = "\
     file://quit.png \
 "
 
-QT_ENV = "qt_env.sh"
-QT_ENV_ti33x = "${@base_contains('DISTRO_FEATURES', 'wayland', 'qt_env.sh', 'qt_env_ti33x.sh', d)}"
-
 SRC_URI += "\
-    file://${QT_ENV} \
     ${@base_contains('DISTRO_FEATURES', 'wayland', '', "${QT_EGLFS_PATCHES}", d)}\
     file://0001-deform-Fix-how-controls-are-shown.patch \
     file://0002-deform-disable-opengl-button.patch \
@@ -37,16 +30,4 @@ python do_patch_append() {
         shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"examples/widgets/animation/animatedtiles/images/"))
 }
 
-# Add custom Arago Qt 5 Environment script file
-do_install_append () {
-    install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/${QT_ENV} ${D}${sysconfdir}/profile.d/qt_env.sh
-
-    cp -a ${B}/lib/libqt* ${D}${libdir}
-}
-
-PACKAGES =+ "${PN}-conf"
-
-FILES_${PN}-conf = "${sysconfdir}/profile.d/qt_env.sh"
-
 RDEPENDS_${PN} += "${PN}-conf"
-- 
2.2.0


