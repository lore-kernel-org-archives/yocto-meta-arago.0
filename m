Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id D353E5299D
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 03:22:09 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUO00CXWXCW6O80@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 14 Oct 2013 22:22:08 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2E6C52004B; Mon,
	14 Oct 2013 23:22:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 14 Oct 2013 23:21:53 -0400
Message-id: <1381807317-3759-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/5] qt-tstat: fix Makefile to support build outside of source, i.e. ${S} != ${B}
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
X-List-Received-Date: Tue, 15 Oct 2013 03:22:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...file.build-for-when-build-dir-is-not-the-.patch | 35 ++++++++++++++++++++++
 .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |  9 ++++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch

diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch
new file mode 100644
index 0000000..3ceb74a
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch
@@ -0,0 +1,35 @@
+From 00666002c48ebbb21e73eb9fbe90615cef87cc11 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 14 Oct 2013 18:53:28 -0400
+Subject: [PATCH] Update Makefile.build for when build dir is not the same as
+ source dir
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ Makefile.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.build b/Makefile.build
+index 18892d4..72b8e34 100644
+--- a/Makefile.build
++++ b/Makefile.build
+@@ -2,6 +2,7 @@
+ 
+ ENV_SETUP ?= ../../linux-devkit/environment-setup
+ DESTDIR ?= 
++BUILDDIR ?= .
+ PLATFORM ?= 
+ MATRIX_APP_DIR ?= /usr/share/matrix-gui-2.0/apps/
+ PLATFORM_DEFINE ?= "Platform_${PLATFORM}"
+@@ -28,7 +29,7 @@ clean : ${SOURCES} qmake
+ 
+ install_common:
+ 	@install -d ${DESTDIR}/usr/bin 
+-	@install -m 0755 ThermostatDemo ${DESTDIR}/usr/bin/ThermostatDemo
++	@install -m 0755 ${BUILDDIR}/ThermostatDemo ${DESTDIR}/usr/bin/ThermostatDemo
+ 	@install -d ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
+ 	@cp -rf matrix-files/*  ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
+ 
+-- 
+1.8.3.2
+
diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
index 19c29fb..198ef1f 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -10,12 +10,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=93a105adb99011afa5baee932b560714 \
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r3"
+PR = "r4"
 
 BRANCH ?= "master"
 SRCREV = "27e033a0ac59928cc3acbb45f4d9bc2101fcf024"
 
-SRC_URI = "git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git"
+SRC_URI = " \
+	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
+	file://0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch \
+"
 
 S = "${WORKDIR}/git/"
 
@@ -23,7 +26,7 @@ inherit qt4e
 
 # use the make targets already created in the Makefile.build files
 do_install() {
-	make -f Makefile.build DESTDIR=${D} install_common
+	cd ${S} && make -f Makefile.build DESTDIR=${D} BUILDDIR=${B} install_common
 }
 
 PACKAGES += "matrix-gui-thermostat-demo"
-- 
1.8.3.2


