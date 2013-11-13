Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 907495299C
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2013 20:32:56 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW7003ALYEG8L71@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 13 Nov 2013 14:32:41 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5DB2720092; Wed,
	13 Nov 2013 15:32:40 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Nov 2013 15:32:30 -0500
Message-id: <1384374750-19978-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1384231333-26952-7-git-send-email-denis@denix.org>
References: <1384231333-26952-7-git-send-email-denis@denix.org>
Subject: [PATCHv2 6/6] meta-toolchain-arago-qte: update to support Qt4 and Qt5 SDK
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
X-List-Received-Date: Wed, 13 Nov 2013 20:32:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - update qt.conf location to make qmake happy

 .../recipes-core/meta/meta-toolchain-arago-qte.bb  | 33 +++++++++++++---------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 6fcf4b4..7ca06cc 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -1,15 +1,20 @@
 # Qt Embedded toolchain
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-qte-toolchain-host"
-TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-qte-toolchain-target"
+TOOLCHAIN_TARGET_TASK ?= "${@base_conditional('QT_PROVIDER', 'qt5', 'packagegroup-arago-qt5-toolchain-target', 'packagegroup-arago-qte-toolchain-target', d)}"
 TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
 
-PR = "r15"
+PR = "r16"
 
-QT_DIR_NAME = "qtopia"
+# There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
+QT_DIR_NAME = "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia', d)}"
+QT_BIN_PREFIX = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT_DIR_NAME}/", '', d)}"
+QT_BIN_SUFFIX = "${@base_conditional('QT_PROVIDER', 'qt5', '', '4', d)}"
+QT_MKSPECS_LOCATION = "${@base_conditional('QT_PROVIDER', 'qt5', "${libdir}", "${datadir}", d)}"
 
 toolchain_create_sdk_env_script_append() {
+	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:$PATH' >> $script
 	echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
 	echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
 	echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
@@ -19,20 +24,22 @@ toolchain_create_sdk_env_script_append() {
 	echo 'export OE_QMAKE_AR=$AR' >> $script
 	echo 'export OE_QMAKE_LIBDIR_QT=$SDK_PATH_TARGET${libdir}' >> $script
 	echo 'export OE_QMAKE_INCDIR_QT=$SDK_PATH_TARGET${includedir}/${QT_DIR_NAME}' >> $script
-	echo 'export OE_QMAKE_MOC=$SDK_PATH_NATIVE${bindir_nativesdk}/moc4' >> $script
-	echo 'export OE_QMAKE_UIC=$SDK_PATH_NATIVE${bindir_nativesdk}/uic4' >> $script
-	echo 'export OE_QMAKE_UIC3=$SDK_PATH_NATIVE${bindir_nativesdk}/uic34' >> $script
-	echo 'export OE_QMAKE_RCC=$SDK_PATH_NATIVE${bindir_nativesdk}/rcc4' >> $script
-	echo 'export OE_QMAKE_QDBUSCPP2XML=$SDK_PATH_NATIVE${bindir_nativesdk}/qdbuscpp2xml4' >> $script
-	echo 'export OE_QMAKE_QDBUSXML2CPP=$SDK_PATH_NATIVE${bindir_nativesdk}/qdbusxml2cpp4' >> $script
-	echo 'export OE_QMAKE_QT_CONFIG=$SDK_PATH_TARGET${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+	echo 'export OE_QMAKE_MOC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}moc${QT_BIN_SUFFIX}' >> $script
+	echo 'export OE_QMAKE_UIC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic${QT_BIN_SUFFIX}' >> $script
+	echo 'export OE_QMAKE_UIC3=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic3${QT_BIN_SUFFIX}' >> $script
+	echo 'export OE_QMAKE_RCC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}rcc${QT_BIN_SUFFIX}' >> $script
+	echo 'export OE_QMAKE_QDBUSCPP2XML=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}qdbuscpp2xml${QT_BIN_SUFFIX}' >> $script
+	echo 'export OE_QMAKE_QDBUSXML2CPP=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}qdbusxml2cpp${QT_BIN_SUFFIX}' >> $script
+	echo 'export OE_QMAKE_QT_CONFIG=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
 	echo 'export OE_QMAKE_STRIP="echo"' >> $script
-	echo 'export QMAKESPEC=$SDK_PATH_TARGET${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+	echo 'export QMAKESPEC=$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+	echo 'export QMAKE_DEFAULT_LIBDIRS=${QT_QMAKE_LIBDIR_QT}' >> $script
+	echo 'export QMAKE_DEFAULT_INCDIRS=${QT_QMAKE_INCDIR_QT}' >> $script
 
 	#Adds qt.conf file that points qmake to properly locate Qt library and header files.
 	#This enables Qt Creator to work properly
 
-	qt_conf="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/qt.conf"
+	qt_conf="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}qt.conf"
 	touch $qt_conf
 	echo '[Paths]' >> $qt_conf
 	echo 'Prefix = $(SDK_PATH_TARGET)' >> $qt_conf
@@ -41,5 +48,5 @@ toolchain_create_sdk_env_script_append() {
 
 	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
 	# and QTCreator
-	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
+	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
 }
-- 
1.8.3.2


