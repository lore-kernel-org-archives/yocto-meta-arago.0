Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id AE23452972
	for <meta-arago@arago-project.org>;
	Tue, 28 Jan 2014 19:18:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N040092YLL052A0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 28 Jan 2014 13:17:43 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4E49B20076; Tue,
	28 Jan 2014 14:17:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 28 Jan 2014 14:17:23 -0500
Message-id: <1390936643-14487-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
MIME-version: 1.0
Subject: [master][PATCH] qt5: remove upstreamed nativesdk recipes, update bbappends 5.1.1 -> 5.2.0
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
X-List-Received-Date: Tue, 28 Jan 2014 19:18:08 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

* nativesdk recipes got merged upstream to meta-qt5/master
* meta-qt5/master updated from 5.1.1 to 5.2.0 version of Qt5
** may need to revisit some of local patches, unbreak parsing for now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc |  12 -
 .../recipes-qt/qt5/nativesdk-qtbase.inc            | 194 -------------
 .../0001-Add-linux-oe-g-platform.patch             | 304 ---------------------
 .../nativesdk-qtbase/0001-Always-build-uic.patch   |  40 ---
 ...ump-path-length-from-256-to-512-character.patch |  29 --
 ...reserve-built-qmake-and-swap-with-native-.patch |  29 --
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  36 ---
 .../0003-Add-external-hostbindir-option.patch      | 219 ---------------
 ..._functions-temporary-remove-isEmpty-check.patch |  51 ----
 ...-building-a-separate-qmake-for-the-target.patch |  29 --
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  29 --
 .../0008-qt_module-Fix-pkgconfig-replacement.patch |  70 -----
 .../0009-qt_module-Fix-paths-in-.prl-files.patch   |  62 -----
 ...on-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch |  44 ---
 ....prf-Allow-to-add-extra-arguments-to-make.patch |  37 ---
 .../0013-Disable-mkv8snapshot.patch                |  47 ----
 ...tslib-device-to-be-read-from-env-variable.patch |  35 ---
 .../0015-qtbase-allow-build-of-examples.patch      |  48 ----
 ...ure-make-pulseaudio-a-configurable-option.patch |  36 ---
 ...configure-make-alsa-a-configurable-option.patch |  35 ---
 ...igure-make-freetype-a-configurable-option.patch |  35 ---
 ...E_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch |  84 ------
 .../recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb       |   5 -
 .../recipes-qt/qt5/nativesdk-qttools.inc           |  32 ---
 ...w-to-build-only-lrelease-lupdate-lconvert.patch | 138 ----------
 .../recipes-qt/qt5/nativesdk-qttools_5.1.1.bb      |  10 -
 ...qtbase_5.1.1.bbappend => qtbase_5.2.0.bbappend} |   0
 ...bkit_5.1.1.bbappend => qtwebkit_5.2.0.bbappend} |   0
 28 files changed, 1690 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Add-linux-oe-g-platform.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Always-build-uic.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0003-Add-external-hostbindir-option.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0004-qt_functions-temporary-remove-isEmpty-check.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0006-Allow-building-a-separate-qmake-for-the-target.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0008-qt_module-Fix-pkgconfig-replacement.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0009-qt_module-Fix-paths-in-.prl-files.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0013-Disable-mkv8snapshot.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0014-enables-tslib-device-to-be-read-from-env-variable.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0015-qtbase-allow-build-of-examples.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0021-configure-make-pulseaudio-a-configurable-option.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0022-configure-make-alsa-a-configurable-option.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0023-configure-make-freetype-a-configurable-option.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
 rename meta-arago-distro/recipes-qt/qt5/{qtbase_5.1.1.bbappend => qtbase_5.2.0.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt5/{qtwebkit_5.1.1.bbappend => qtwebkit_5.2.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc b/meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc
deleted file mode 100644
index 2eb8c14..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qt5.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-inherit nativesdk qmake5_base
-
-# we don't want conflicts with qt4
-OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
-OE_QMAKE_PATH_ARCHDATA = "${OE_QMAKE_PATH_QT_ARCHDATA}"
-OE_QMAKE_PATH_DATA = "${OE_QMAKE_PATH_QT_DATA}"
-OE_QMAKE_PATH_BINS = "${OE_QMAKE_PATH_QT_BINS}"
-OE_QMAKE_PATH_TRANSLATIONS = "${OE_QMAKE_PATH_QT_TRANSLATIONS}"
-OE_QMAKE_PATH_DOCS = "${OE_QMAKE_PATH_QT_DOCS}"
-OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
-OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
-OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc
deleted file mode 100644
index f1a4f6b..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc
+++ /dev/null
@@ -1,194 +0,0 @@
-DESCRIPTION = "SDK version of Qt/[X11|Mac|Embedded]"
-DEPENDS = "nativesdk-zlib nativesdk-dbus qtbase-native"
-SECTION = "libs"
-HOMEPAGE = "http://qt-project.org"
-
-QT_MODULE = "qtbase"
-
-require nativesdk-qt5.inc
-
-PR = "r1"
-
-SRC_URI += " \
-    file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_functions-temporary-remove-isEmpty-check.patch \
-    file://0006-Allow-building-a-separate-qmake-for-the-target.patch \
-    file://0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0008-qt_module-Fix-pkgconfig-replacement.patch \
-    file://0009-qt_module-Fix-paths-in-.prl-files.patch \
-    file://0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch \
-    file://0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
-    file://0013-Disable-mkv8snapshot.patch \
-    file://0014-enables-tslib-device-to-be-read-from-env-variable.patch \
-    file://0015-qtbase-allow-build-of-examples.patch \
-    file://0021-configure-make-pulseaudio-a-configurable-option.patch \
-    file://0022-configure-make-alsa-a-configurable-option.patch \
-    file://0023-configure-make-freetype-a-configurable-option.patch \
-    file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch \
-"
-
-# specific for nativesdk version
-SRC_URI += " \
-    file://0001-Always-build-uic.patch \
-    file://0001-configure-preserve-built-qmake-and-swap-with-native-.patch \
-    file://0001-configure-bump-path-length-from-256-to-512-character.patch \
-"
-
-PACKAGES = "${PN}-tools-dbg ${PN}-tools"
-
-PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-
-FILES_${PN}-tools-dbg = " \
-    ${OE_QMAKE_PATH_BINS}/.debug \
-"
-
-FILES_${PN}-tools = " \
-    ${OE_QMAKE_PATH_BINS}/* \
-"
-
-QT_CONFIG_FLAGS += " \
-    -reduce-relocations \
-    -shared \
-    -silent \
-    -no-pch \
-    -no-rpath \
-    -pkg-config \
-    ${EXTRA_OECONF} \
-"
-
-# qtbase is exception, as these are used as install path for sysroots
-OE_QMAKE_PATH_HOST_DATA = "${libdir}/${QT_DIR_NAME}"
-OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
-
-do_generate_qt_config_file() {
-    cat > ${QT_CONF_PATH} <<EOF
-[Paths]
-Prefix = ${OE_QMAKE_PATH_PREFIX}
-Headers = ${OE_QMAKE_PATH_HEADERS}
-Libraries = ${OE_QMAKE_PATH_LIBS}
-ArchData = ${OE_QMAKE_PATH_ARCHDATA}
-Data = ${OE_QMAKE_PATH_DATA}
-Binaries = ${OE_QMAKE_PATH_BINS}
-LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}
-Plugins = ${OE_QMAKE_PATH_PLUGINS}
-Imports = ${OE_QMAKE_PATH_IMPORTS}
-Qml2Imports = ${OE_QMAKE_PATH_QML}
-Translations = ${OE_QMAKE_PATH_TRANSLATIONS}
-Documentation = ${OE_QMAKE_PATH_DOCS}
-Settings = ${OE_QMAKE_PATH_SETTINGS}
-Examples = ${OE_QMAKE_PATH_EXAMPLES}
-Tests = ${OE_QMAKE_PATH_TESTS}
-HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
-HostData = ${OE_QMAKE_PATH_HOST_DATA}
-HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
-HostSpec = ${OE_QMAKESPEC}
-TartgetSpec = ${OE_XQMAKESPEC}
-ExternalHostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
-Sysroot =
-EOF
-}
-
-do_generate_qt_config_file_append() {
-    cat >> ${QT_CONF_PATH} <<EOF
-
-[EffectivePaths]
-Prefix=..
-EOF
-}
-
-# qtbase is exception, we need to use mkspecs from ${S}
-QMAKE_MKSPEC_PATH = "${B}"
-
-# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
-export OE_QMAKE_COMPILER
-export OE_QMAKE_CC
-export OE_QMAKE_CFLAGS
-export OE_QMAKE_CXX
-export OE_QMAKE_CXXFLAGS
-export OE_QMAKE_LINK
-export OE_QMAKE_LDFLAGS
-export OE_QMAKE_AR
-export OE_QMAKE_STRIP
-
-# another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
-OE_QMAKE_QMAKE = "bin/qmake"
-
-do_configure() {
-    # we need symlink in path relative to source, because
-    # EffectivePaths:Prefix is relative to qmake location
-    # Also, configure expects qmake-native to swap with real one
-    if [ ! -e ${B}/bin/qmake-native ]; then
-        mkdir ${B}/bin
-        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake-native
-    fi
-
-    ${S}/configure -v \
-        -dont-process \
-        -opensource -confirm-license \
-        -sysroot ${STAGING_DIR_NATIVE} \
-        -no-gcc-sysroot \
-        -system-zlib \
-        -no-libjpeg \
-        -no-libpng \
-        -no-gif \
-        -no-accessibility \
-        -no-cups \
-        -no-nis \
-        -no-gui \
-        -no-qml-debug \
-        -no-sql-mysql \
-        -no-sql-sqlite \
-        -no-opengl \
-        -no-openssl \
-        -no-xcb \
-        -verbose \
-        -release \
-        -prefix ${OE_QMAKE_PATH_PREFIX} \
-        -bindir ${OE_QMAKE_PATH_BINS} \
-        -libdir ${OE_QMAKE_PATH_LIBS} \
-        -datadir ${OE_QMAKE_PATH_DATA} \
-        -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
-        -docdir ${OE_QMAKE_PATH_DOCS} \
-        -headerdir ${OE_QMAKE_PATH_HEADERS} \
-        -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
-        -libexecdir ${OE_QMAKE_PATH_LIBEXECS} \
-        -plugindir ${OE_QMAKE_PATH_PLUGINS} \
-        -importdir ${OE_QMAKE_PATH_IMPORTS} \
-        -qmldir ${OE_QMAKE_PATH_QML} \
-        -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
-        -testsdir ${OE_QMAKE_PATH_TESTS} \
-        -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
-        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
-        -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
-        -no-glib \
-        -no-iconv \
-        -silent \
-        -nomake examples \
-        -nomake tests \
-        -nomake libs \
-        -no-compile-examples \
-        -no-rpath \
-        -platform ${OE_QMAKESPEC} \
-        -xplatform linux-oe-g++ \
-        ${QT_CONFIG_FLAGS}
-
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-}
-
-do_install() {
-    # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
-
-    # switch back the proper qmake
-    rm ${B}/bin/qmake
-    mv ${B}/bin/qmake-real ${B}/bin/qmake
-
-    oe_runmake install INSTALL_ROOT=${D}
-
-    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
-    # e.g. qt3d, qtwayland
-    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
-}
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Add-linux-oe-g-platform.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Add-linux-oe-g-platform.patch
deleted file mode 100644
index 87c2612..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Add-linux-oe-g-platform.patch
+++ /dev/null
@@ -1,304 +0,0 @@
-From b91e232e603df102a1d305aceb0dbedc6ce3e89c Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/22] Add linux-oe-g++ platform
-
-* This qmake.conf unlike other platforms reads most variables from
-  shell environment, because it's easier for qt recipes to export
-  *FLAGS or CC specific for given recipe
-
-* configure: add getQEvalMakeConf and getXQEvalMakeConf
-  Allow expansion of $(...) references from qmake.conf to generate
-  qmake environment from shell environment as exported by qmake5_base
-
-* OE_QMAKE_CXX in order to allow compiler version check to succeed
-  which allows WebKit to be enabled.
-
-* Other variables in order to let config.tests to use our -platform
-  settings
-
-* Add setBootstrapEvalVariable to bootstrap qmake with our environment
-  too, this allows us to use -platform linux-oe-g++ also for native
-  recipe
-
-* disable gdb_dwarf_index
-  * qmake is trying to call native gdb and we don't depend on gdb-native
-    (or even provide gdb-native)
-  * fixes errors like this:
-    /bin/sh: gdb: command not found
-    /bin/sh: line 0: test: -gt: unary operator expected
-    which are not fatal, but still misleading in do_configure output
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure                            |  54 ++++++++++++++++---
- mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
- mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 3 files changed, 187 insertions(+), 7 deletions(-)
- create mode 100644 mkspecs/linux-oe-g++/qmake.conf
- create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
-
-diff --git a/configure b/configure
-index 140c7b4..397d53f 100755
---- a/configure
-+++ b/configure
-@@ -291,6 +291,16 @@ getQMakeConf()
-     getSingleQMakeVariable "$1" "$specvals"
- }
- 
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+getQEvalMakeConf()
-+{
-+    VAL=`getQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
-+    EVAL=`eval "echo ${VAL}"`
-+#    echo "Running getQEvalMakeConf: var='$1', val='`getQMakeConf \"$1\"`, val-sed='$VAL', eval='$EVAL'" >&2
-+    eval "echo ${VAL}"
-+}
-+
- getXQMakeConf()
- {
-     if [ -z "$xspecvals" ]; then
-@@ -300,6 +310,16 @@ getXQMakeConf()
-     getSingleQMakeVariable "$1" "$xspecvals"
- }
- 
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+getXQEvalMakeConf()
-+{
-+    VAL=`getXQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
-+    EVAL=`eval "echo ${VAL}"`
-+#    echo "Running getXQEvalMakeConf: var='$1', val='`getXQMakeConf \"$1\"`, val-sed='$VAL', eval='$EVAL'" >&2
-+    eval "echo ${VAL}"
-+}
-+
- compilerSupportsFlag()
- {
-     cat >conftest.cpp <<EOF
-@@ -816,6 +836,18 @@ fi
- # initalize variables
- #-------------------------------------------------------------------------------
- 
-+# Export all OE variables for qmake.conf from shell env to QMakeVars
-+OE_VARIABLES="AR CC CFLAGS COMPILER CXX CXXFLAGS LDFLAGS LINK QT_CONFIG STRIP"
-+for varname in $OE_VARIABLES; do
-+    qmakevarname="${varname}"
-+    cmd=`echo \
-+'if [ -n "\$OE_QMAKE_'${varname}'" ]; then
-+    QMakeVar set OE_QMAKE_'${qmakevarname}' "\$OE_QMAKE_'${varname}'"
-+#    echo "Exporting OE_QMAKE_'${qmakevarname}' value=\"\$OE_QMAKE_'${varname}'\"" >&2
-+fi'`
-+    eval "$cmd"
-+done
-+
- SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
- for varname in $SYSTEM_VARIABLES; do
-     qmakevarname="${varname}"
-@@ -2894,7 +2926,7 @@ if [ "$BUILD_ON_MAC" = "yes" ] && [ "$CFG_QGTKSTYLE" = "auto" ]; then
-     CFG_QGTKSTYLE=no
- fi
- 
--QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
-+QMAKE_CONF_COMPILER=`getXQEvalMakeConf QMAKE_CXX`
- 
- TEST_COMPILER=$QMAKE_CONF_COMPILER
- 
-@@ -2929,7 +2961,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
-         exit 1
-     fi
- fi
--TEST_COMPILER_CXXFLAGS=`getXQMakeConf QMAKE_CXXFLAGS`
-+TEST_COMPILER_CXXFLAGS=`getXQEvalMakeConf QMAKE_CXXFLAGS`
- 
- GCC_MACHINE_DUMP=
- case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3959,6 +3991,14 @@ setBootstrapVariable()
-     getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
- }
- 
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+setBootstrapEvalVariable()
-+{
-+    getQEvalMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
-+}
-+
-+
- # build qmake
- if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake..."
-@@ -3997,11 +4037,11 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-         fi
- 
-         [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
--        setBootstrapVariable QMAKE_CC CC "$CC_TRANSFORM"
--        setBootstrapVariable QMAKE_CXX CXX "$CC_TRANSFORM"
--        setBootstrapVariable QMAKE_CFLAGS
--        setBootstrapVariable QMAKE_CXXFLAGS
--        setBootstrapVariable QMAKE_LFLAGS
-+        setBootstrapEvalVariable QMAKE_CC CC "$CC_TRANSFORM"
-+        setBootstrapEvalVariable QMAKE_CXX CXX "$CC_TRANSFORM"
-+        setBootstrapEvalVariable QMAKE_CFLAGS
-+        setBootstrapEvalVariable QMAKE_CXXFLAGS
-+        setBootstrapEvalVariable QMAKE_LFLAGS
- 
-         if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
-             setBootstrapVariable QMAKE_CFLAGS_RELEASE
-diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
-new file mode 100644
-index 0000000..ca26b10
---- /dev/null
-+++ b/mkspecs/linux-oe-g++/qmake.conf
-@@ -0,0 +1,40 @@
-+#
-+# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
-+#
-+
-+MAKEFILE_GENERATOR	= UNIX
-+CONFIG += incremental
-+QMAKE_INCREMENTAL_STYLE = sublib
-+
-+include(../common/linux.conf)
-+
-+# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
-+QMAKE_AR              = $(OE_QMAKE_AR) cqs
-+QMAKE_STRIP           = $(OE_QMAKE_STRIP)
-+QMAKE_WAYLAND_SCANNER = $(OE_QMAKE_WAYLAND_SCANNER)
-+
-+include(../common/gcc-base-unix.conf)
-+
-+# *FLAGS from gcc-base.conf
-+QMAKE_CFLAGS                += $(OE_QMAKE_CFLAGS)
-+QMAKE_CXXFLAGS              += $(OE_QMAKE_CXXFLAGS)
-+QMAKE_LFLAGS                += $(OE_QMAKE_LDFLAGS)
-+
-+include(../common/g++-unix.conf)
-+
-+# tc settings from g++-base.conf
-+QMAKE_COMPILER = $(OE_QMAKE_COMPILER)
-+QMAKE_CC       = $(OE_QMAKE_CC)
-+QMAKE_CXX      = $(OE_QMAKE_CXX)
-+
-+QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
-+
-+QMAKE_LINK         = $(OE_QMAKE_LINK)
-+QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-+QMAKE_LINK_C       = $(OE_QMAKE_LINK)
-+QMAKE_LINK_C_SHLIB = $(OE_QMAKE_LINK)
-+
-+# for the SDK
-+isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
-+
-+load(qt_config)
-diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-new file mode 100644
-index 0000000..dd12003
---- /dev/null
-+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
-@@ -0,0 +1,100 @@
-+/****************************************************************************
-+**
-+** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
-+** Contact: http://www.qt-project.org/legal
-+**
-+** This file is part of the qmake spec of the Qt Toolkit.
-+**
-+** $QT_BEGIN_LICENSE:LGPL$
-+** Commercial License Usage
-+** Licensees holding valid commercial Qt licenses may use this file in
-+** accordance with the commercial license agreement provided with the
-+** Software or, alternatively, in accordance with the terms contained in
-+** a written agreement between you and Digia.  For licensing terms and
-+** conditions see http://qt.digia.com/licensing.  For further information
-+** use the contact form at http://qt.digia.com/contact-us.
-+**
-+** GNU Lesser General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU Lesser
-+** General Public License version 2.1 as published by the Free Software
-+** Foundation and appearing in the file LICENSE.LGPL included in the
-+** packaging of this file.  Please review the following information to
-+** ensure the GNU Lesser General Public License version 2.1 requirements
-+** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
-+**
-+** In addition, as a special exception, Digia gives you certain additional
-+** rights.  These rights are described in the Digia Qt LGPL Exception
-+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
-+**
-+** GNU General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU
-+** General Public License version 3.0 as published by the Free Software
-+** Foundation and appearing in the file LICENSE.GPL included in the
-+** packaging of this file.  Please review the following information to
-+** ensure the GNU General Public License version 3.0 requirements will be
-+** met: http://www.gnu.org/copyleft/gpl.html.
-+**
-+**
-+** $QT_END_LICENSE$
-+**
-+****************************************************************************/
-+
-+#ifndef QPLATFORMDEFS_H
-+#define QPLATFORMDEFS_H
-+
-+// Get Qt defines/settings
-+
-+#include "qglobal.h"
-+
-+// Set any POSIX/XOPEN defines at the top of this file to turn on specific APIs
-+
-+// 1) need to reset default environment if _BSD_SOURCE is defined
-+// 2) need to specify POSIX thread interfaces explicitly in glibc 2.0
-+// 3) it seems older glibc need this to include the X/Open stuff
-+#ifndef _GNU_SOURCE
-+#  define _GNU_SOURCE
-+#endif
-+
-+#include <unistd.h>
-+
-+
-+// We are hot - unistd.h should have turned on the specific APIs we requested
-+
-+#include <features.h>
-+#include <pthread.h>
-+#include <dirent.h>
-+#include <fcntl.h>
-+#include <grp.h>
-+#include <pwd.h>
-+#include <signal.h>
-+
-+#include <sys/types.h>
-+#include <sys/ioctl.h>
-+#include <sys/ipc.h>
-+#include <sys/time.h>
-+#include <sys/shm.h>
-+#include <sys/socket.h>
-+#include <sys/stat.h>
-+#include <sys/wait.h>
-+#include <netinet/in.h>
-+#ifndef QT_NO_IPV6IFNAME
-+#include <net/if.h>
-+#endif
-+
-+#define QT_USE_XOPEN_LFS_EXTENSIONS
-+#include "../common/posix/qplatformdefs.h"
-+
-+#undef QT_SOCKLEN_T
-+
-+#if defined(__GLIBC__) && (__GLIBC__ >= 2)
-+#define QT_SOCKLEN_T            socklen_t
-+#else
-+#define QT_SOCKLEN_T            int
-+#endif
-+
-+#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
-+#define QT_SNPRINTF		::snprintf
-+#define QT_VSNPRINTF		::vsnprintf
-+#endif
-+
-+#endif // QPLATFORMDEFS_H
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Always-build-uic.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Always-build-uic.patch
deleted file mode 100644
index 96c85f0..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-Always-build-uic.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f794542b10ccbf9c4cecaf23cf24658d64594cf3 Mon Sep 17 00:00:00 2001
-From: Mikko Levonmaa <mikko.levonmaa@palm.com>
-Date: Tue, 27 Nov 2012 12:46:44 -0800
-Subject: [PATCH 22/22] Always build uic
-
-Even if we are not building gui or widgets. This tool is needed later
-as a native tool when compiling the target.
-
-Change-Id: I257668ac28c22b192e7ec7736e6c23fa3be6bab6
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/src.pro | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/src.pro b/src/src.pro
-index b4c9602..f30ec1f 100644
---- a/src/src.pro
-+++ b/src/src.pro
-@@ -122,7 +122,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
-     contains(QT_CONFIG, opengl(es1|es2)?):SUBDIRS += src_openglextensions
-     src_plugins.depends += src_gui src_platformsupport
-     !contains(QT_CONFIG, no-widgets) {
--        SUBDIRS += src_tools_uic src_widgets
-+        SUBDIRS += src_widgets
-         src_plugins.depends += src_widgets
-         contains(QT_CONFIG, opengl(es1|es2)?) {
-             SUBDIRS += src_opengl
-@@ -134,7 +134,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
-         }
-     }
- }
--SUBDIRS += src_plugins src_tools_qdoc
-+SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
- 
- nacl: SUBDIRS -= src_network src_testlib
- 
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch
deleted file mode 100644
index 3b312b6..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-bump-path-length-from-256-to-512-character.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9500744fee36c908d0cb7e034f8c8dd3dd1c4fa4 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH] configure: bump path length from 256 to 512 characters
-
-Increase the path length that gets hardcoded into generated config.cpp file
-from 256 to 512 characters, as nativesdk path can be quite long.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 304d30f..a37a587 100755
---- a/configure
-+++ b/configure
-@@ -3870,7 +3870,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
- static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
- 
- /* Installation Info */
--static const char qt_configure_prefix_path_strs[][256 + 12] = {
-+static const char qt_configure_prefix_path_strs[][512 + 12] = {
-     "qt_prfxpath=$QT_INSTALL_PREFIX",
-     "qt_docspath=$QT_INSTALL_DOCS",
-     "qt_hdrspath=$QT_INSTALL_HEADERS",
--- 
-1.8.3.2
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch
deleted file mode 100644
index 048eab7..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6cd7ade28662730e5de89a171501e3902b321ffc Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH] configure: preserve built qmake and swap with native one
-
-Let configure script build the real qmake, but right after it's built, swap
-it with a native qmake for further internal use, preserving the real one.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure b/configure
-index 140c7b4..304d30f 100755
---- a/configure
-+++ b/configure
-@@ -4104,6 +4104,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
- 
-     (cd "$outpath/qmake"; "$MAKE") || exit 2
- fi # Build qmake
-+mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
-+mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
- 
- echo "Running configuration tests..."
- 
--- 
-1.8.3.2
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
deleted file mode 100644
index fab5880..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a899fba459928c7e5196f15dcea4d561807dc825 Mon Sep 17 00:00:00 2001
-From: Holger Freyther <zecke@selfish.org>
-Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/22] qlibraryinfo: allow to set qt.conf from the outside
- using the environment
-
-Allow to set a qt.conf from the outside using the environment. This allows
-to inject new prefixes and other paths into qmake. This is needed when using
-the same qmake binary to build qt/x11 and qt/embedded
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/corelib/global/qlibraryinfo.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 53a3ebb..8ca2102 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -138,7 +138,10 @@ QLibrarySettings::QLibrarySettings()
- 
- QSettings *QLibraryInfoPrivate::findConfiguration()
- {
--    QString qtconfig = QStringLiteral(":/qt/etc/qt.conf");
-+    QByteArray config = getenv("QT_CONF_PATH");
-+    QString qtconfig = QFile::decodeName(config);
-+    if(!QFile::exists(qtconfig))
-+        qtconfig = QStringLiteral(":/qt/etc/qt.conf");
- #ifdef QT_BOOTSTRAPPED
-     if(!QFile::exists(qtconfig))
-         qtconfig = qt_libraryInfoFile();
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0003-Add-external-hostbindir-option.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0003-Add-external-hostbindir-option.patch
deleted file mode 100644
index b4bf10f..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0003-Add-external-hostbindir-option.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From 062621e0310eddb448ebcc27fc4c1507c2d6e30d Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/22] Add -external-hostbindir option
-
-* when cross-compiling it's sometimes useful to use existing tools from machine
-  (or in OpenEmbedded built with separate native recipe) when building for target
-
-* this way we can skip bootstraping tools we already have
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure                           | 16 +++++++++++++++-
- mkspecs/features/qt_functions.prf   |  5 ++++-
- mkspecs/features/qt_tool.prf        |  2 +-
- qmake/property.cpp                  |  1 +
- qtbase.pro                          | 12 +++++++++---
- src/corelib/global/qlibraryinfo.cpp |  3 ++-
- src/corelib/global/qlibraryinfo.h   |  1 +
- tools/configure/configureapp.cpp    |  8 ++++++++
- 8 files changed, 41 insertions(+), 7 deletions(-)
-
-diff --git a/configure b/configure
-index 397d53f..80bdd7a 100755
---- a/configure
-+++ b/configure
-@@ -1046,6 +1046,7 @@ QT_HOST_PREFIX=
- QT_HOST_BINS=
- QT_HOST_LIBS=
- QT_HOST_DATA=
-+QT_EXTERNAL_HOST_BINS=
- 
- #flags for SQL drivers
- QT_CFLAGS_PSQL=
-@@ -1191,7 +1192,8 @@ while [ "$#" -gt 0 ]; do
-     -android-ndk-platform| \
-     -android-ndk-host| \
-     -android-arch| \
--    -android-toolchain-version)
-+    -android-toolchain-version| \
-+    -external-hostbindir)
-         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
-         shift
-         VAL="$1"
-@@ -1379,6 +1381,9 @@ while [ "$#" -gt 0 ]; do
-     hostlibdir)
-         QT_HOST_LIBS="$VAL"
-         ;;
-+    external-hostbindir)
-+        QT_EXTERNAL_HOST_BINS="$VAL"
-+        ;;
-     pkg-config)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_PKGCONFIG="$VAL"
-@@ -3240,6 +3245,11 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
-     QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
- fi
- 
-+# default is empty, don't call makeabs if it is empty
-+if [ ! -z "$QT_EXTERNAL_HOST_BINS" ]; then
-+    QT_EXTERNAL_HOST_BINS=`"$relpath/config.tests/unix/makeabs" "$QT_EXTERNAL_HOST_BINS"`
-+fi
-+
- #-------------------------------------------------------------------------------
- # help - interactive parts of the script _after_ this section please
- #-------------------------------------------------------------------------------
-@@ -3408,6 +3418,9 @@ Installation options:
-     -hostdatadir <dir> . Data used by qmake will be installed to <dir>
-                          (default HOSTPREFIX)
- 
-+    -external-hostbindir <dir> Use external host executables instead of building them
-+                         (not used by defaut)
-+
- Configure options:
- 
-  The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3923,6 +3936,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
-     "qt_hbinpath=$QT_HOST_BINS",
-     "qt_hlibpath=$QT_HOST_LIBS",
-     "qt_hdatpath=$QT_HOST_DATA",
-+    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
-     "qt_targspec=$shortxspec",
-     "qt_hostspec=$shortspec",
- #endif
-diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 2f2c94c..4e12d3d 100644
---- a/mkspecs/features/qt_functions.prf
-+++ b/mkspecs/features/qt_functions.prf
-@@ -194,7 +194,10 @@ defineTest(qtAddRpathLink) {
- defineTest(qtPrepareTool) {
-     $$1 = $$eval(QT_TOOL.$${2}.binary)
-     isEmpty($$1) {
--        $$1 = $$[QT_HOST_BINS]/$$2
-+        $$1 = $$[QT_EXTERNAL_HOST_BINS]/$$2
-+        isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
-+            $$1 = $$[QT_HOST_BINS]/$$2
-+        }
-         exists($$eval($$1).pl) {
-             $$1 = perl -w $$eval($$1).pl
-         } else: contains(QMAKE_HOST.os, Windows) {
-diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 9a6b963..83ef3a0 100644
---- a/mkspecs/features/qt_tool.prf
-+++ b/mkspecs/features/qt_tool.prf
-@@ -16,7 +16,7 @@ CONFIG += console
- # If we are doing a prefix build, create a "module" pri which enables
- # qtPrepareTool() to work with the non-installed build.
- # Non-bootstrapped tools always need this because of the environment setup.
--!build_pass:if(!host_build|!force_bootstrap|force_independent) {
-+!build_pass:if(!host_build|!force_bootstrap|force_independent):isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
-     isEmpty(MODULE):MODULE = $$TARGET
- 
-     !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, )
-diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 4685440..93eb1d4 100644
---- a/qmake/property.cpp
-+++ b/qmake/property.cpp
-@@ -75,6 +75,7 @@ static const struct {
-     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
-     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
-     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
-+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
-     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
-     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
- };
-diff --git a/qtbase.pro b/qtbase.pro
-index d6726b5..28ca7d5 100644
---- a/qtbase.pro
-+++ b/qtbase.pro
-@@ -70,16 +70,22 @@ CONFIG -= qt
- 
- #qmake
- qmake.path = $$[QT_HOST_BINS]
-+qmake.files = $$OUT_PWD/bin/qmake
-+!isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
-+   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/bin/qmake
-+}
- equals(QMAKE_HOST.os, Windows) {
--   qmake.files = $$OUT_PWD/bin/qmake.exe
--} else {
--   qmake.files = $$OUT_PWD/bin/qmake
-+   qmake.files = $${qmake.files}.exe
- }
- INSTALLS += qmake
- 
- #syncqt
- syncqt.path = $$[QT_HOST_BINS]
- syncqt.files = $$PWD/bin/syncqt.pl
-+syncqt.files = $$PWD/bin/syncqt.pl
-+!isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
-+   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/bin/syncqt.pl
-+}
- INSTALLS += syncqt
- 
- # If we are doing a prefix build, create a "module" pri which enables
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 8ca2102..9f5d444 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -270,7 +270,7 @@ QLibraryInfo::isDebugBuild()
-  */
- 
- static const struct {
--    char key[19], value[13];
-+    char key[21], value[13];
- } qtConfEntries[] = {
-     { "Prefix", "." },
-     { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -296,6 +296,7 @@ static const struct {
-     { "HostBinaries", "bin" },
-     { "HostLibraries", "lib" },
-     { "HostData", "." },
-+    { "ExternalHostBinaries", "" },
-     { "TargetSpec", "" },
-     { "HostSpec", "" },
- #endif
-diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index b275e01..0e6baed 100644
---- a/src/corelib/global/qlibraryinfo.h
-+++ b/src/corelib/global/qlibraryinfo.h
-@@ -84,6 +84,7 @@ public:
-         HostBinariesPath,
-         HostLibrariesPath,
-         HostDataPath,
-+        ExternalHostBinariesPath,
-         TargetSpecPath,
-         HostSpecPath,
-         LastHostPath = HostSpecPath,
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index a6376bb..aed85ce 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -1162,6 +1162,13 @@ void Configure::parseCmdLine()
-             dictionary[ "QT_HOST_DATA" ] = configCmdLine.at(i);
-         }
- 
-+        else if (configCmdLine.at(i) == "-external-hostbindir") {
-+            ++i;
-+            if (i == argCount)
-+                break;
-+            dictionary[ "QT_EXTERNAL_HOST_BINS" ] = configCmdLine.at(i);
-+        }
-+
-         else if (configCmdLine.at(i) == "-make-tool") {
-             ++i;
-             if (i == argCount)
-@@ -3708,6 +3715,7 @@ void Configure::generateQConfigCpp()
-                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
-                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
-+                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_targspec=" << targSpec << "\"," << endl
-                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
-                   << "#endif" << endl
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0004-qt_functions-temporary-remove-isEmpty-check.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0004-qt_functions-temporary-remove-isEmpty-check.patch
deleted file mode 100644
index 955d791..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0004-qt_functions-temporary-remove-isEmpty-check.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 21c573762a168f874f32c8bf49f75442e608e08a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 17 Apr 2013 18:06:25 +0200
-Subject: [PATCH 04/22] qt_functions: temporary remove isEmpty check
-
-* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
-* isEmpty works correctly only with qmake variables (e.g. $$FOO -
-  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/qt_functions.prf | 6 +++++-
- mkspecs/features/qt_tool.prf      | 3 +--
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 4e12d3d..e20ad9d 100644
---- a/mkspecs/features/qt_functions.prf
-+++ b/mkspecs/features/qt_functions.prf
-@@ -195,7 +195,11 @@ defineTest(qtPrepareTool) {
-     $$1 = $$eval(QT_TOOL.$${2}.binary)
-     isEmpty($$1) {
-         $$1 = $$[QT_EXTERNAL_HOST_BINS]/$$2
--        isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
-+        # for some reason isEmpty does not work here, FIXME before submitting upstream
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: calling built-in isEmpty(/OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/qt5)
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: test function returned true
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: taking 'then' branch
-+        !exists($$[QT_EXTERNAL_HOST_BINS]/$$2) {
-             $$1 = $$[QT_HOST_BINS]/$$2
-         }
-         exists($$eval($$1).pl) {
-diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 83ef3a0..21c9eb7 100644
---- a/mkspecs/features/qt_tool.prf
-+++ b/mkspecs/features/qt_tool.prf
-@@ -15,8 +15,7 @@ CONFIG += console
- 
- # If we are doing a prefix build, create a "module" pri which enables
- # qtPrepareTool() to work with the non-installed build.
--# Non-bootstrapped tools always need this because of the environment setup.
--!build_pass:if(!host_build|!force_bootstrap|force_independent):isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
-+!build_pass:if(!host_build|!force_bootstrap|force_independent):!exists($$[QT_EXTERNAL_HOST_BINS]) {
-     isEmpty(MODULE):MODULE = $$TARGET
- 
-     !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, )
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0006-Allow-building-a-separate-qmake-for-the-target.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0006-Allow-building-a-separate-qmake-for-the-target.patch
deleted file mode 100644
index 56b0fdd..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0006-Allow-building-a-separate-qmake-for-the-target.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c36477f621c7d682ee7140156127ad32e91a40ad Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Mon, 29 Oct 2012 20:26:36 -0700
-Subject: [PATCH 06/22] Allow building a separate qmake for the target
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- qmake/qmake.pro | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/qmake/qmake.pro b/qmake/qmake.pro
-index a81d0cd..ed7aebf 100644
---- a/qmake/qmake.pro
-+++ b/qmake/qmake.pro
-@@ -8,6 +8,7 @@ CONFIG -= qt shared app_bundle uic
- DEFINES += QT_BUILD_QMAKE QT_BOOTSTRAPPED \
-     PROEVALUATOR_FULL PROEVALUATOR_DEBUG
- DESTDIR = ../bin/
-+TARGET = qmake
- 
- OBJECTS_DIR = .
- MOC_DIR = .
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
deleted file mode 100644
index 00affb1..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c2cc1f9251953f680191c5cf53b019d5d480c79e Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 07/22] configureapp: Prefix default LIBDIRS and INCDIRS with
- SYSROOT
-
-Upstream-Status: Pending
----
- tools/configure/configureapp.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index aed85ce..0575520 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -3111,8 +3111,8 @@ void Configure::generateQConfigPri()
-         configStream << "QT_HOST_CPU_FEATURES = " << dictionary["QT_HOST_CPU_FEATURES"] << endl;
-         if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
-             // FIXME: add detection
--            configStream << "QMAKE_DEFAULT_LIBDIRS = /lib /usr/lib" << endl;
--            configStream << "QMAKE_DEFAULT_INCDIRS = /usr/include /usr/local/include" << endl;
-+            configStream << "QMAKE_DEFAULT_LIBDIRS = $$[QT_SYSROOT]/lib $$[QT_SYSROOT]/usr/lib" << endl;
-+            configStream << "QMAKE_DEFAULT_INCDIRS = $$[QT_SYSROOT]/usr/include $$[QT_SYSROOT]/usr/local/include" << endl;
-         }
-         if (dictionary["QT_EDITION"].contains("OPENSOURCE"))
-             configStream << "QT_EDITION = " << QLatin1String("OpenSource") << endl;
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0008-qt_module-Fix-pkgconfig-replacement.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0008-qt_module-Fix-pkgconfig-replacement.patch
deleted file mode 100644
index dfc018f..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0008-qt_module-Fix-pkgconfig-replacement.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 0089c1ecba912aed6a8cd6126297300e0f7ffcb9 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 08/22] qt_module: Fix pkgconfig replacement
-
-* in situation like this:
-  QT_SYSROOT:/OE/oe-core/tmp-eglibc/sysroots/qemuarm
-  QT_INSTALL_LIBS:/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib
-  QT_INSTALL_LIBS/raw:/usr/lib
-  QT_INSTALL_LIBS/get:/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib
-
-  I don't want the replacement like this:
-  sed
-    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/include,/usr/include/qt5,g"
-    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib,/usr/lib,g"
-    "../../lib/pkgconfig/Qt5Core.pc"
-    >"/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/image/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib/pkgconfig/Qt5Core.pc"
-  because that way I'll end with -L/usr/lib in .pc file which is
-  cross-compile unfriendly, keeping ${libdir}/${includedir} works better
-  in my case
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/qt_module.prf | 20 ++++++++++++++++----
- 1 file changed, 16 insertions(+), 4 deletions(-)
-
-diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 390fb49..e85c2a8 100644
---- a/mkspecs/features/qt_module.prf
-+++ b/mkspecs/features/qt_module.prf
-@@ -140,18 +140,30 @@ unix|win32-g++* {
-       rplbase = $$dirname(_QMAKE_SUPER_CACHE_)/[^/][^/]*
-    else: \
-       rplbase = $$MODULE_BASE_OUTDIR
-+   pkgconfig_include_replace.match = $$rplbase/include
-+   pkgconfig_include_replace.replace = "\$$\\{includedir}"
-+   pkgconfig_lib_replace.match = $$rplbase/lib
-+   pkgconfig_lib_replace.replace = "\$$\\{libdir}"
-    include_replace.match = $$rplbase/include
-    include_replace.replace = $$[QT_INSTALL_HEADERS/raw]
-    lib_replace.match = $$rplbase/lib
--   lib_replace.replace = $$QMAKE_PKGCONFIG_LIBDIR
--   QMAKE_PKGCONFIG_INSTALL_REPLACE += include_replace lib_replace
-+   lib_replace.replace = $$[QT_INSTALL_LIBS/raw]
-+   lafile_replace.match = $$rplbase
-+   lafile_replace.replace = "=$$[QT_INSTALL_PREFIX/raw]"
-+
-+   !isEmpty(SYSROOT): \
-+      rplbase = $$[SYSROOT] \
-+      lafile_replace.match = $$rplbase \
-+      lafile_replace.replace = "=" \
-+
-+   QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace pkgconfig_lib_replace
-    QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
- }
- 
- unix {
-    CONFIG += create_libtool explicitlib
--   QMAKE_LIBTOOL_LIBDIR = $$QMAKE_PKGCONFIG_LIBDIR
--   QMAKE_LIBTOOL_INSTALL_REPLACE += include_replace lib_replace
-+   QMAKE_LIBTOOL_LIBDIR = $$[QT_INSTALL_LIBS/raw]
-+   QMAKE_LIBTOOL_INSTALL_REPLACE += include_replace lib_replace lafile_replace
- }
- 
- unix|win32-g++* {
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0009-qt_module-Fix-paths-in-.prl-files.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0009-qt_module-Fix-paths-in-.prl-files.patch
deleted file mode 100644
index 5c8f818..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0009-qt_module-Fix-paths-in-.prl-files.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From d4f6f5afa36d87d991051f0079f129d2682455d9 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 28 Apr 2013 12:56:55 +0200
-Subject: [PATCH 09/22] qt_module: Fix paths in .prl files
-
-* qmake does not prefix them with QT_SYSROOT when using them
-  so e.g. when building qtdeclarative we get -L/usr/lib to LINKAGE
-  variable, which is unsafe for cross-compilation
-* writting QT_SYSROOT in .prl files is dangerous for sstate when
-  builds are in different directories, so we need
-  SSTATE_SCAN_FILES += "*.pri *.prl"
-  to make them relocateble
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/qt_module.prf | 28 +++++++++++++++++-----------
- 1 file changed, 17 insertions(+), 11 deletions(-)
-
-diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index e85c2a8..7fcfcfe 100644
---- a/mkspecs/features/qt_module.prf
-+++ b/mkspecs/features/qt_module.prf
-@@ -144,17 +144,23 @@ unix|win32-g++* {
-    pkgconfig_include_replace.replace = "\$$\\{includedir}"
-    pkgconfig_lib_replace.match = $$rplbase/lib
-    pkgconfig_lib_replace.replace = "\$$\\{libdir}"
--   include_replace.match = $$rplbase/include
--   include_replace.replace = $$[QT_INSTALL_HEADERS/raw]
--   lib_replace.match = $$rplbase/lib
--   lib_replace.replace = $$[QT_INSTALL_LIBS/raw]
--   lafile_replace.match = $$rplbase
--   lafile_replace.replace = "=$$[QT_INSTALL_PREFIX/raw]"
--
--   !isEmpty(SYSROOT): \
--      rplbase = $$[SYSROOT] \
--      lafile_replace.match = $$rplbase \
--      lafile_replace.replace = "=" \
-+   !exists($$[QT_SYSROOT]) {
-+      include_replace.match = $$rplbase/include
-+      include_replace.replace = $$[QT_INSTALL_HEADERS/raw]
-+      lib_replace.match = $$rplbase/lib
-+      lib_replace.replace = $$[QT_INSTALL_LIBS/raw]
-+      lafile_replace.match = $$rplbase
-+      lafile_replace.replace = "$$[QT_INSTALL_PREFIX/raw]"
-+   } else {
-+      # include_replace and lib_replace are duplicate, but we don't want to
-+      # make QMAKE_PKGCONFIG_INSTALL_REPLACE, QMAKE_PRL_INSTALL_REPLACE conditional
-+      include_replace.match = $$rplbase
-+      include_replace.replace = $$[QT_SYSROOT]$$[QT_INSTALL_PREFIX/raw]
-+      lib_replace.match = $$rplbase
-+      lib_replace.replace = $$[QT_SYSROOT]$$[QT_INSTALL_PREFIX/raw]
-+      lafile_replace.match = $$rplbase
-+      lafile_replace.replace = "=$$[QT_INSTALL_PREFIX/raw]"
-+   }
- 
-    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace pkgconfig_lib_replace
-    QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
deleted file mode 100644
index bea83a8..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 05fc8b21f40d2e6bc35fa717ea340ef26f922d32 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 8 May 2013 23:54:35 +0200
-Subject: [PATCH 11/22] configure: don't export SYSTEM_VARIABLES to .qmake.vars
-
-* linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
-  causing issues as we need g++ to be used as linker
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 15 +--------------
- 1 file changed, 1 insertion(+), 14 deletions(-)
-
-diff --git a/configure b/configure
-index 40f2b02..11c11c4 100755
---- a/configure
-+++ b/configure
-@@ -849,20 +849,7 @@ fi'`
- done
- 
- SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
--for varname in $SYSTEM_VARIABLES; do
--    qmakevarname="${varname}"
--    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
--    if [ "${varname}" = "LDFLAGS" ]; then
--        qmakevarname="LFLAGS"
--    elif [ "${varname}" = "LD" ]; then
--        qmakevarname="LINK"
--    fi
--    cmd=`echo \
--'if [ -n "\$'${varname}'" ]; then
--    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}'"
--fi'`
--    eval "$cmd"
--done
-+
- # Use CC/CXX to run config.tests
- mkdir -p "$outpath/config.tests"
- rm -f "$outpath/config.tests/.qmake.cache"
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
deleted file mode 100644
index b6c3ae3..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b4f8c636cb265951979868a65006ce49f442e5e7 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 9 May 2013 10:06:50 +0200
-Subject: [PATCH 12/22] configure.prf: Allow to add extra arguments to make
-
-* sometimes we would like to add -e or define some variable and respect it from both
-  Makefiles used in configure tests and also Makefiles to build the application
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/configure.prf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index b4569df..d189e50 100644
---- a/mkspecs/features/configure.prf
-+++ b/mkspecs/features/configure.prf
-@@ -57,12 +57,12 @@ defineTest(qtCompileTest) {
-     qmake_configs = "\"CONFIG -= qt debug_and_release app_bundle lib_bundle\""
- 
-     # Clean up after previous run
--    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE distclean")
-+    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS) distclean")
- 
-     mkpath($$test_out_dir)|error("Aborting.")
- 
-     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qmake_configs $$shell_quote($$test_dir)") {
--        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
-+        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
-             log("yes$$escape_expand(\\n)")
-             msg = "test $$1 succeeded"
-             write_file($$QMAKE_CONFIG_LOG, msg, append)
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0013-Disable-mkv8snapshot.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0013-Disable-mkv8snapshot.patch
deleted file mode 100644
index 2c4fa20..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0013-Disable-mkv8snapshot.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 70669010c6f8a541db6f87f96aee3ff50ec8483f Mon Sep 17 00:00:00 2001
-From: Mikko Levonmaa <mikko.levonmaa@palm.com>
-Date: Tue, 8 Jan 2013 15:58:29 -0800
-Subject: [PATCH 13/22] Disable mkv8snapshot
-
-It seems to generate code that throws SIGILL, so disabling it
-
-Program received signal SIGILL, Illegal instruction.
-0x26312c60 in ?? ()
-(gdb) bt
-    function=..., receiver=..., argc=1978934572, args=0x7efff254,
-    has_pending_exception=0x7efff277, qml=...)
-    at ../3rdparty/v8/src/execution.cc:125
-    argc=1, argv=0x7efff254, pending_exception=0x7efff277,
-    convert_receiver=false, qml=...) at ../3rdparty/v8/src/execution.cc:194
-    receiver=<optimized out>, argc=<optimized out>, argv=<optimized out>,
-    pending_exception=0x7efff277, convert_receiver=false)
-    at ../3rdparty/v8/src/execution.cc:161
-    data=<optimized out>, exc=0x7efff277)
-    at ../3rdparty/v8/src/execution.cc:734
-    at ../3rdparty/v8/src/api.cc:4742
-    at qml/v8/qv8contextwrapper.cpp:155
-    ownership=<optimized out>) at qml/v8/qv8engine.cpp:155
-    parent=<optimized out>) at qml/v8/qjsengine.cpp:192
-
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 11c11c4..521e374 100755
---- a/configure
-+++ b/configure
-@@ -910,7 +910,7 @@ CFG_SKIP_MODULES=""
- CFG_COMPILE_EXAMPLES=yes
- CFG_RELEASE_QMAKE=no
- CFG_AUDIO_BACKEND=auto
--CFG_V8SNAPSHOT=auto
-+CFG_V8SNAPSHOT=no
- CFG_QML_DEBUG=yes
- CFG_JAVASCRIPTCORE_JIT=auto
- CFG_PKGCONFIG=auto
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0014-enables-tslib-device-to-be-read-from-env-variable.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0014-enables-tslib-device-to-be-read-from-env-variable.patch
deleted file mode 100644
index 56b4a66..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0014-enables-tslib-device-to-be-read-from-env-variable.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3642ea2f7eff14c0835385f28a13514b806eba32 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
-Date: Mon, 27 May 2013 18:32:37 +0200
-Subject: [PATCH 14/22] enables tslib device to be read from env variable
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-from :
-https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/tslib.patch
-
-Signed-off-by: Eric Bénard <eric@eukrea.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/plugins/generic/tslib/qtslib.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/plugins/generic/tslib/qtslib.cpp b/src/plugins/generic/tslib/qtslib.cpp
-index 6986fd5..2ed4a69 100644
---- a/src/plugins/generic/tslib/qtslib.cpp
-+++ b/src/plugins/generic/tslib/qtslib.cpp
-@@ -64,7 +64,9 @@ QTsLibMouseHandler::QTsLibMouseHandler(const QString &key,
-     qDebug() << "QTsLibMouseHandler" << key << specification;
-     setObjectName(QLatin1String("TSLib Mouse Handler"));
- 
--    QByteArray device = "/dev/input/event1";
-+    QByteArray device = qgetenv("TSLIB_TSDEVICE");
-+    if(device.isEmpty())
-+       device = "/dev/input/event1";
-     if (specification.startsWith("/dev/"))
-         device = specification.toLocal8Bit();
- 
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0015-qtbase-allow-build-of-examples.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0015-qtbase-allow-build-of-examples.patch
deleted file mode 100644
index 59c9466..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0015-qtbase-allow-build-of-examples.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 52172f09d646949c32f7b70188f1ffc779adbdef Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
-Date: Sat, 25 May 2013 17:34:32 +0200
-Subject: [PATCH 15/22] qtbase: allow build of examples
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-this revert the following commit :
-
-commit 2b397f985e4ef6ae5c0571a928bb1320fb048c61
-Author: Oswald Buddenhagen <oswald.buddenhagen@digia.com>
-Date:   Fri Dec 21 19:36:12 2012 +0100
-
-    do not actually build examples in production builds
-
-    -developer-build enables an actual build of examples, based on the
-    assumption that developers want to test it (it can be still disabled
-    with -nomake examples). regular users otoh want only the examples
-    sources installed.
-
-    Change-Id: Ifc6a108099929175a3960480802b271a758fdd38
-    Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
-
-Signed-off-by: Eric Bénard <eric@eukrea.com>
----
- mkspecs/features/qt_example_installs.prf | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/mkspecs/features/qt_example_installs.prf b/mkspecs/features/qt_example_installs.prf
-index 2db752c..ca1b0c7 100644
---- a/mkspecs/features/qt_example_installs.prf
-+++ b/mkspecs/features/qt_example_installs.prf
-@@ -92,11 +92,4 @@ probase = $$relative_path($$_PRO_FILE_PWD_, $$dirname(_QMAKE_CONF_)/examples)
-         allfiles -= doc
-         !isEmpty(allfiles): warning("remaining files in $$_PRO_FILE_PWD_: $$allfiles")
-     }
--
--    !equals(TEMPLATE, subdirs):!compile_examples {
--        TEMPLATE = aux
--        CONFIG -= have_target qt staticlib dll
--        SOURCES =
--        INSTALLS -= target
--    }
- }
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0021-configure-make-pulseaudio-a-configurable-option.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0021-configure-make-pulseaudio-a-configurable-option.patch
deleted file mode 100644
index eaa3ae6..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0021-configure-make-pulseaudio-a-configurable-option.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0bc48cdb5e3556a96320ea963d2e031b0810d0d4 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 18/22] configure: make pulseaudio a configurable option
-
-Allows disabling pulseaudio support at configure time.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/configure b/configure
-index 521e374..896e012 100755
---- a/configure
-+++ b/configure
-@@ -2039,6 +2039,13 @@ while [ "$#" -gt 0 ]; do
-             UNKNOWN_OPT=yes
-         fi
-         ;;
-+    pulseaudio)
-+        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-+            CFG_PULSEAUDIO="$VAL"
-+        else
-+            UNKNOWN_OPT=yes
-+        fi
-+        ;;
-     gtkstyle)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_QGTKSTYLE="$VAL"
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0022-configure-make-alsa-a-configurable-option.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0022-configure-make-alsa-a-configurable-option.patch
deleted file mode 100644
index c01f635..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0022-configure-make-alsa-a-configurable-option.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e6430c64e4dcc48ae59e48fa303bbea33b253011 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 19 Jul 2013 23:21:28 +0200
-Subject: [PATCH 19/22] configure: make alsa a configurable option
-
-Allows disabling alsa support at configure time.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/configure b/configure
-index 896e012..3470b32 100755
---- a/configure
-+++ b/configure
-@@ -2046,6 +2046,13 @@ while [ "$#" -gt 0 ]; do
-             UNKNOWN_OPT=yes
-         fi
-         ;;
-+    alsa)
-+        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-+            CFG_ALSA="$VAL"
-+        else
-+            UNKNOWN_OPT=yes
-+        fi
-+        ;;
-     gtkstyle)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_QGTKSTYLE="$VAL"
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0023-configure-make-freetype-a-configurable-option.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0023-configure-make-freetype-a-configurable-option.patch
deleted file mode 100644
index 9cec921..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0023-configure-make-freetype-a-configurable-option.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 98201094967e2e4224c394d0c92c0be7d39582a6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 20 Jul 2013 10:56:37 +0200
-Subject: [PATCH 20/22] configure: make freetype a configurable option
-
-Allows disabling freetype support at configure time.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/configure b/configure
-index 3470b32..b0ec977 100755
---- a/configure
-+++ b/configure
-@@ -2053,6 +2053,13 @@ while [ "$#" -gt 0 ]; do
-             UNKNOWN_OPT=yes
-         fi
-         ;;
-+    freetype)
-+        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ] || [ "$VAL" = "system" ]; then
-+            CFG_LIBFREETYPE="$VAL"
-+        else
-+            UNKNOWN_OPT=yes
-+        fi
-+        ;;
-     gtkstyle)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_QGTKSTYLE="$VAL"
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
deleted file mode 100644
index 70c0c0e..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From b4d383bf47374c7132ecbcaec2c6aea31f858f54 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Mon, 22 Jul 2013 21:09:41 +0000
-Subject: [PATCH 21/22] Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path
- to host binaries
-
-Upstream-Status: Inappropiate (configuration)
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
----
- src/corelib/Qt5CoreConfigExtras.cmake.in    | 6 +++---
- src/dbus/Qt5DBusConfigExtras.cmake.in       | 4 ++--
- src/widgets/Qt5WidgetsConfigExtras.cmake.in | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index e01b448..5382730 100644
---- a/src/corelib/Qt5CoreConfigExtras.cmake.in
-+++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qmake$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::moc)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/moc$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-@@ -37,7 +37,7 @@ if (NOT TARGET Qt5::rcc)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/rcc$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
-index 1d94715..301af8f 100644
---- a/src/dbus/Qt5DBusConfigExtras.cmake.in
-+++ b/src/dbus/Qt5DBusConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qdbuscpp2xml)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_DBus_check_file_exists(${imported_location})
- 
-@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::qdbusxml2cpp)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_DBus_check_file_exists(${imported_location})
- 
-diff --git a/src/widgets/Qt5WidgetsConfigExtras.cmake.in b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-index e5650ff..16ff007 100644
---- a/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-+++ b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::uic)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Widgets_install_prefix}/$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/uic$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Widgets_check_file_exists(${imported_location})
- 
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
deleted file mode 100644
index b2a388e..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require recipes-qt/qt5/qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "955d1e4da875f3872ef3208f21a757dd"
-SRC_URI[sha256sum] = "d4620e0b1aff6d2b6f4d8066e6f8258e012a8b5507af7c03b661029a1ffa75c9"
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
deleted file mode 100644
index 30bb357..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-# doesnt have GFDL-1.3 like qtbase, LICENSE files are missing in 5.0.0 and 5.0.1, this is for 5.0.2 and git
-LICENSE = "LGPL-2.1 | GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-"
-
-DEPENDS = "nativesdk-qtbase qtbase-native"
-
-QT_MODULE = "qttools"
-
-require nativesdk-qt5.inc
-
-SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
-
-PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-
-FILES_${PN}-dbg = " \
-    ${OE_QMAKE_PATH_BINS}/.debug \
-"
-
-FILES_${PN} = " \
-    ${OE_QMAKE_PATH_BINS}/* \
-"
-
-do_configure() {
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
-}
-
-do_install() {
-    oe_runmake install INSTALL_ROOT=${D}
-}
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
deleted file mode 100644
index a5f26a3..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 9337242944c936104db5eee64df804a27fb02bb8 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.jansa@gmail.com>
-Date: Wed, 11 Sep 2013 18:30:08 +0200
-Subject: [PATCH] Allow to build only lrelease + lupdate + lconvert
-
-This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
-is built without GUI support (no-png is set) and we still want to build
-native lrelease + lupdate + lconvert tools.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.jansa@gmail.com>
----
- examples/examples.pro     |  4 ++--
- src/designer/src/src.pro  | 16 +++++++++-------
- src/linguist/linguist.pro |  2 +-
- src/src.pro               | 10 ++++++----
- tests/auto/auto.pro       | 22 ++++++++++++----------
- 5 files changed, 30 insertions(+), 24 deletions(-)
-
-diff --git a/examples/examples.pro b/examples/examples.pro
-index 4955969..8e86419 100644
---- a/examples/examples.pro
-+++ b/examples/examples.pro
-@@ -1,3 +1,3 @@
- TEMPLATE = subdirs
--qtHaveModule(widgets): SUBDIRS += help designer linguist uitools assistant
--
-+!linguistonly:qtHaveModule(widgets): SUBDIRS += help designer assistant
-+qtHaveModule(widgets): SUBDIRS += linguist uitools
-diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
-index e02ca8e..49527c5 100644
---- a/src/designer/src/src.pro
-+++ b/src/designer/src/src.pro
-@@ -1,18 +1,20 @@
- TEMPLATE = subdirs
- 
--SUBDIRS = \
--    uitools \
--    lib \
--    components \
--    designer
-+!linguistonly {
-+    SUBDIRS = \
-+        lib \
-+        components \
-+        designer
-+}
-+SUBDIRS += uitools
- 
--contains(QT_CONFIG, shared): SUBDIRS += plugins
-+!linguistonly:contains(QT_CONFIG, shared): SUBDIRS += plugins
- 
- components.depends = lib
- designer.depends = components
- plugins.depends = lib
- 
--qtNomakeTools( \
-+!linguistonly:qtNomakeTools( \
-     lib \
-     components \
-     designer \
-diff --git a/src/linguist/linguist.pro b/src/linguist/linguist.pro
-index df3c0c7..75bdf26 100644
---- a/src/linguist/linguist.pro
-+++ b/src/linguist/linguist.pro
-@@ -3,7 +3,7 @@ SUBDIRS  = \
-     lrelease \
-     lupdate \
-     lconvert
--!no-png:qtHaveModule(widgets): SUBDIRS += linguist
-+!linguistonly:!no-png:qtHaveModule(widgets): SUBDIRS += linguist
- 
- qtNomakeTools( \
-     linguist \
-diff --git a/src/src.pro b/src/src.pro
-index c8756db..d71c4a0 100644
---- a/src/src.pro
-+++ b/src/src.pro
-@@ -4,10 +4,12 @@ qtHaveModule(widgets) {
-     no-png {
-         message("Some graphics-related tools are unavailable without PNG support")
-     } else {
--        SUBDIRS = assistant \
-+        !linguistonly { 
-+            SUBDIRS = assistant \
-                   pixeltool \
--                  qtestlib \
--                  designer
-+                  qtestlib
-+        }
-+        SUBDIRS += designer
- #    unix:!mac:!embedded:!qpa:SUBDIRS += qtconfig
- 
-         linguist.depends = designer
-@@ -20,7 +22,7 @@ mac {
-     SUBDIRS += macdeployqt
- }
- 
--qtHaveModule(dbus): SUBDIRS += qdbus
-+!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
- 
- qtNomakeTools( \
-     pixeltool \
-diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
-index eaf440b..1778ad1 100644
---- a/tests/auto/auto.pro
-+++ b/tests/auto/auto.pro
-@@ -1,14 +1,16 @@
- TEMPLATE=subdirs
--SUBDIRS=\
--    linguist \
--    host.pro \
--    qhelpcontentmodel \
--    qhelpenginecore \
--    qhelpgenerator \
--    qhelpindexmodel \
--    qhelpprojectdata \
--    cmake \
--    installed_cmake
-+!linguistonly {
-+    SUBDIRS=\
-+        linguist \
-+        host.pro \
-+        qhelpcontentmodel \
-+        qhelpenginecore \
-+        qhelpgenerator \
-+        qhelpindexmodel \
-+        qhelpprojectdata \
-+        cmake \
-+        installed_cmake
-+}
- 
- installed_cmake.depends = cmake
- 
--- 
-1.8.3.1
-
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb b/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
deleted file mode 100644
index 0bf946a..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qttools_5.1.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-qt/qt5/qt5-${PV}.inc
-require ${PN}.inc
-
-# LICENSE files are missing in 5.0.0 and 5.0.1
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
-                    file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891 \
-"
-
-SRC_URI[md5sum] = "022073d32ff9d408de0182b5d1f01781"
-SRC_URI[sha256sum] = "2b42c6d5feeccffb67e890b86a150bae64dd2ff550be39a3cc449ee0e95462b6"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
-- 
1.8.3.2


