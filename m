Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTP id BDBAA52990
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 04:42:21 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW400GUNVQJRY70@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Nov 2013 22:42:20 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9C05E201B5; Mon,
	11 Nov 2013 23:42:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Nov 2013 23:42:10 -0500
Message-id: <1384231333-26952-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1384231333-26952-1-git-send-email-denis@denix.org>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/6] nativesdk-qttools: add nativesdk version of qttools necessary for SDK tools
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
X-List-Received-Date: Tue, 12 Nov 2013 04:42:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/nativesdk-qttools.inc           |  32 +++++
 ...w-to-build-only-lrelease-lupdate-lconvert.patch | 138 +++++++++++++++++++++
 .../recipes-qt/qt5/nativesdk-qttools_5.1.1.bb      |  10 ++
 3 files changed, 180 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb

diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
new file mode 100644
index 0000000..30bb357
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
@@ -0,0 +1,32 @@
+# doesnt have GFDL-1.3 like qtbase, LICENSE files are missing in 5.0.0 and 5.0.1, this is for 5.0.2 and git
+LICENSE = "LGPL-2.1 | GPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+"
+
+DEPENDS = "nativesdk-qtbase qtbase-native"
+
+QT_MODULE = "qttools"
+
+require nativesdk-qt5.inc
+
+SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
+FILES_${PN}-dbg = " \
+    ${OE_QMAKE_PATH_BINS}/.debug \
+"
+
+FILES_${PN} = " \
+    ${OE_QMAKE_PATH_BINS}/* \
+"
+
+do_configure() {
+    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
+}
+
+do_install() {
+    oe_runmake install INSTALL_ROOT=${D}
+}
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
new file mode 100644
index 0000000..a5f26a3
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -0,0 +1,138 @@
+From 9337242944c936104db5eee64df804a27fb02bb8 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.jansa@gmail.com>
+Date: Wed, 11 Sep 2013 18:30:08 +0200
+Subject: [PATCH] Allow to build only lrelease + lupdate + lconvert
+
+This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
+is built without GUI support (no-png is set) and we still want to build
+native lrelease + lupdate + lconvert tools.
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.jansa@gmail.com>
+---
+ examples/examples.pro     |  4 ++--
+ src/designer/src/src.pro  | 16 +++++++++-------
+ src/linguist/linguist.pro |  2 +-
+ src/src.pro               | 10 ++++++----
+ tests/auto/auto.pro       | 22 ++++++++++++----------
+ 5 files changed, 30 insertions(+), 24 deletions(-)
+
+diff --git a/examples/examples.pro b/examples/examples.pro
+index 4955969..8e86419 100644
+--- a/examples/examples.pro
++++ b/examples/examples.pro
+@@ -1,3 +1,3 @@
+ TEMPLATE = subdirs
+-qtHaveModule(widgets): SUBDIRS += help designer linguist uitools assistant
+-
++!linguistonly:qtHaveModule(widgets): SUBDIRS += help designer assistant
++qtHaveModule(widgets): SUBDIRS += linguist uitools
+diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
+index e02ca8e..49527c5 100644
+--- a/src/designer/src/src.pro
++++ b/src/designer/src/src.pro
+@@ -1,18 +1,20 @@
+ TEMPLATE = subdirs
+ 
+-SUBDIRS = \
+-    uitools \
+-    lib \
+-    components \
+-    designer
++!linguistonly {
++    SUBDIRS = \
++        lib \
++        components \
++        designer
++}
++SUBDIRS += uitools
+ 
+-contains(QT_CONFIG, shared): SUBDIRS += plugins
++!linguistonly:contains(QT_CONFIG, shared): SUBDIRS += plugins
+ 
+ components.depends = lib
+ designer.depends = components
+ plugins.depends = lib
+ 
+-qtNomakeTools( \
++!linguistonly:qtNomakeTools( \
+     lib \
+     components \
+     designer \
+diff --git a/src/linguist/linguist.pro b/src/linguist/linguist.pro
+index df3c0c7..75bdf26 100644
+--- a/src/linguist/linguist.pro
++++ b/src/linguist/linguist.pro
+@@ -3,7 +3,7 @@ SUBDIRS  = \
+     lrelease \
+     lupdate \
+     lconvert
+-!no-png:qtHaveModule(widgets): SUBDIRS += linguist
++!linguistonly:!no-png:qtHaveModule(widgets): SUBDIRS += linguist
+ 
+ qtNomakeTools( \
+     linguist \
+diff --git a/src/src.pro b/src/src.pro
+index c8756db..d71c4a0 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -4,10 +4,12 @@ qtHaveModule(widgets) {
+     no-png {
+         message("Some graphics-related tools are unavailable without PNG support")
+     } else {
+-        SUBDIRS = assistant \
++        !linguistonly { 
++            SUBDIRS = assistant \
+                   pixeltool \
+-                  qtestlib \
+-                  designer
++                  qtestlib
++        }
++        SUBDIRS += designer
+ #    unix:!mac:!embedded:!qpa:SUBDIRS += qtconfig
+ 
+         linguist.depends = designer
+@@ -20,7 +22,7 @@ mac {
+     SUBDIRS += macdeployqt
+ }
+ 
+-qtHaveModule(dbus): SUBDIRS += qdbus
++!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
+ 
+ qtNomakeTools( \
+     pixeltool \
+diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
+index eaf440b..1778ad1 100644
+--- a/tests/auto/auto.pro
++++ b/tests/auto/auto.pro
+@@ -1,14 +1,16 @@
+ TEMPLATE=subdirs
+-SUBDIRS=\
+-    linguist \
+-    host.pro \
+-    qhelpcontentmodel \
+-    qhelpenginecore \
+-    qhelpgenerator \
+-    qhelpindexmodel \
+-    qhelpprojectdata \
+-    cmake \
+-    installed_cmake
++!linguistonly {
++    SUBDIRS=\
++        linguist \
++        host.pro \
++        qhelpcontentmodel \
++        qhelpenginecore \
++        qhelpgenerator \
++        qhelpindexmodel \
++        qhelpprojectdata \
++        cmake \
++        installed_cmake
++}
+ 
+ installed_cmake.depends = cmake
+ 
+-- 
+1.8.3.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
new file mode 100644
index 0000000..0bf946a
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
@@ -0,0 +1,10 @@
+require recipes-qt/qt5/qt5-${PV}.inc
+require ${PN}.inc
+
+# LICENSE files are missing in 5.0.0 and 5.0.1
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
+                    file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891 \
+"
+
+SRC_URI[md5sum] = "022073d32ff9d408de0182b5d1f01781"
+SRC_URI[sha256sum] = "2b42c6d5feeccffb67e890b86a150bae64dd2ff550be39a3cc449ee0e95462b6"
-- 
1.8.3.2


