Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2BC4B52AA9
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 14:06:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16E5xox023898
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:05:59 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E5xEf016321
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:05:59 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 08:05:59 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E5p5U011240;
	Thu, 6 Feb 2014 08:05:57 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 09:34:45 -0600
Message-ID: <1391700887-26166-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1391700887-26166-1-git-send-email-fcooper@ti.com>
References: <1391700887-26166-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/5] Update recipes to pull in Makefile changes
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 14:06:00 -0000
Content-Type: text/plain

* Update SRCREV to pull in Makefile changes.
* Some makefile changes results in changes to do_install.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    4 +-
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |    4 +-
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    4 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    4 +-
 .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 +-
 .../oprofile-example/oprofile-example_git.bb       |    4 +-
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |    4 +-
 ...file.build-for-when-build-dir-is-not-the-.patch |   35 --------------------
 .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |   13 ++++---
 .../recipes-qt/qt-apps/quick-playground_1.0.bb     |   11 ++++--
 10 files changed, 29 insertions(+), 58 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index d46c0ab..952e50b 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,10 +4,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r6"
+PR = "r7"
 
 BRANCH ?= "master"
-SRCREV = "eba9e69247c105f6d8dbcb56452ad4c4ea2df31e"
+SRCREV = "7f76ec24d3fedb9b2e3331f77c2f790c8b43f5f0"
 
 SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
 
diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 5d13ad5..493a80a 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e7
 SECTION = "system"
 
 PACKAGE_STRIP = "no"
-PR = "r8"
+PR = "r9"
 
 BRANCH ?= "master"
-SRCREV = "7aa7e7a316d24c06c8e6a4931f7297f209dfd8e1"
+SRCREV = "5df7da69a50d27b7f594db0918c5e6793c3a6237"
 
 SRC_URI = "git://gitorious.org/am_sysinfo/am_sysinfo.git;protocol=git;branch=${BRANCH}"
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 329b65a..4d41b73 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -11,9 +11,9 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r3"
+PR = "r4"
 
-SRCREV = "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
+SRCREV = "d962b18b628f0006642491c2250ef01557591e66"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index fa1f1e0..b96d67c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r14"
+PR = "r15"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -16,7 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit update-rc.d
 
 BRANCH ?= "master"
-SRCREV = "25311718417147bd87aaa25d758cde9a5bffa0a8"
+SRCREV = "a67a9721134fcbf9017d2dd361079f67b10b0ace"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
            file://init \
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 68381e7..f409c1e 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -7,9 +7,9 @@ SECTION = "multimedia"
 # Make sure that QT font libraries have been installed
 RDEPENDS_${PN} += "qt4-embedded-fonts"
 
-PR = "r2"
+PR = "r3"
 
-SRCREV = "23acf023743e864bb30158636840a080e36d45b6"
+SRCREV = "e652edf9403fe9329e1bcd14b79503045a53705c"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index 5799f6c..fa203e0 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -7,10 +7,10 @@ SECTION = "system"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH ?= "master"
-SRCREV = "3aa2de4bb698c96f8a481c4048e3140503b26082"
+SRCREV = "066ecdab2bf0788eec253bf27fd44f7436f0cd04"
 
 SRC_URI = "git://gitorious.org/oprofile-example/oprofile-example.git;protocol=git;branch=${BRANCH}"
 
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 995d60a..485faed 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965
 SECTION = "console"
 DEPENDS += "openssl"
 
-PR = "r5"
+PR = "r6"
 
 BRANCH ?= "master"
-SRCREV = "1c6a493600ce1a830611cc5671639c03cc3ebc01"
+SRCREV = "616ca5b6a0feefc1ba2e876c7ced4407f927ef1b"
 
 SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
 
diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch
deleted file mode 100644
index 3ceb74a..0000000
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 00666002c48ebbb21e73eb9fbe90615cef87cc11 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 14 Oct 2013 18:53:28 -0400
-Subject: [PATCH] Update Makefile.build for when build dir is not the same as
- source dir
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- Makefile.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.build b/Makefile.build
-index 18892d4..72b8e34 100644
---- a/Makefile.build
-+++ b/Makefile.build
-@@ -2,6 +2,7 @@
- 
- ENV_SETUP ?= ../../linux-devkit/environment-setup
- DESTDIR ?= 
-+BUILDDIR ?= .
- PLATFORM ?= 
- MATRIX_APP_DIR ?= /usr/share/matrix-gui-2.0/apps/
- PLATFORM_DEFINE ?= "Platform_${PLATFORM}"
-@@ -28,7 +29,7 @@ clean : ${SOURCES} qmake
- 
- install_common:
- 	@install -d ${DESTDIR}/usr/bin 
--	@install -m 0755 ThermostatDemo ${DESTDIR}/usr/bin/ThermostatDemo
-+	@install -m 0755 ${BUILDDIR}/ThermostatDemo ${DESTDIR}/usr/bin/ThermostatDemo
- 	@install -d ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
- 	@cp -rf matrix-files/*  ${DESTDIR}${MATRIX_APP_DIR}/qt_tstat
- 
--- 
-1.8.3.2
-
diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
index 8035537..6704354 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -12,16 +12,15 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
 
 BRANCH ?= "master"
-SRCREV = "27e033a0ac59928cc3acbb45f4d9bc2101fcf024"
+SRCREV = "e6225f9e485675e4390dcc7575810e9f63501692"
 
 SRC_URI = " \
 	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
-	file://0001-Update-Makefile.build-for-when-build-dir-is-not-the-.patch \
 "
 
 SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch \
@@ -29,9 +28,13 @@ SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui
 
 S = "${WORKDIR}/git/"
 
-# use the make targets already created in the Makefile.build files
+BUILDDIR ?= "."
+
 do_install() {
-	cd ${S} && make -f Makefile.build DESTDIR=${D} BUILDDIR=${B} install_common
+	install -d ${D}/usr/bin
+	install -m 0755 ${BUILDDIR}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
+	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
+	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
 }
 
 PACKAGES += "matrix-gui-thermostat-demo"
diff --git a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
index a8e8869..5f493d3 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://Licence.txt;md5=7cc88160b55ec5db6c6c5bb8e3238c0b"
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
-SRCREV = "49bb5b7e1df2f61fc361b7d83a6ec838ffc5381c"
+SRCREV = "0be45ce805147798c98b2dee65e41de67bfcea5d"
 
 SRC_URI = "git://arago-project.org/git/projects/qt4-demos.git;protocol=git;branch=${BRANCH}"
 
@@ -17,9 +17,12 @@ S = "${WORKDIR}/git/qml_playground"
 
 inherit qt4e
 
-# use the make targets already created in the Makefile.build files
 do_install() {
-    make -f Makefile.build DESTDIR=${D} install_common
+    install -d ${D}/usr/bin 
+    install -m 0755 runQMLplay.sh ${D}/usr/bin/
+    install -d ${D}${MATRIX_APP_DIR}/qml_playground
+    cp -r apps/qml_playground/*  ${D}${MATRIX_APP_DIR}/qml_playground
+    install -m 0755 qtquickplayground ${D}${MATRIX_APP_DIR}/qml_playground/
 }
 
 PACKAGES += "matrix-gui-apps-quick-playground"
-- 
1.7.0.4


