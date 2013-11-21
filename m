Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTP id 0841B52A77
	for <meta-arago@arago-project.org>;
	Thu, 21 Nov 2013 04:35:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWL006MIJETJV40@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Nov 2013 22:35:32 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0942C20033; Wed,
	20 Nov 2013 23:35:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Nov 2013 23:35:16 -0500
Message-id: <1385008516-30491-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] meta-toolchain-arago-qte: update qt.conf in SDK with host variables
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
X-List-Received-Date: Thu, 21 Nov 2013 04:35:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index e3bf80f..47bf9db 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
 
-PR = "r16"
+PR = "r17"
 
 # There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
 QT_DIR_NAME = "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia', d)}"
@@ -24,6 +24,7 @@ toolchain_create_sdk_env_script_append() {
 	echo 'export OE_QMAKE_AR=$AR' >> $script
 	echo 'export OE_QMAKE_LIBDIR_QT=$SDK_PATH_TARGET${libdir}' >> $script
 	echo 'export OE_QMAKE_INCDIR_QT=$SDK_PATH_TARGET${includedir}/${QT_DIR_NAME}' >> $script
+	echo 'export OE_QMAKE_HOST_BINDIR_QT=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}' >> $script
 	echo 'export OE_QMAKE_MOC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}moc${QT_BIN_SUFFIX}' >> $script
 	echo 'export OE_QMAKE_UIC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic${QT_BIN_SUFFIX}' >> $script
 	echo 'export OE_QMAKE_UIC3=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic3${QT_BIN_SUFFIX}' >> $script
@@ -45,6 +46,8 @@ toolchain_create_sdk_env_script_append() {
 	echo 'Prefix = $(SDK_PATH_TARGET)' >> $qt_conf
 	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
 	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
+	echo 'HostPrefix = $(SDK_PATH_NATIVE)' >> $qt_conf
+	echo 'HostBinaries = $(OE_QMAKE_HOST_BINDIR_QT)' >> $qt_conf
 
 	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
 	# and QTCreator
-- 
1.8.3.2


