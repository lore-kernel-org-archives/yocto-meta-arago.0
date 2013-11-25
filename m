Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 8B8995299B
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 21:39:26 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWU006Q79HANGE1@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 25 Nov 2013 15:39:10 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 007702004B; Mon,
	25 Nov 2013 16:39:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 25 Nov 2013 16:39:08 -0500
Message-id: <1385415548-19021-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] nativesdk-qtbase: switch back the proper qmake binary
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
X-List-Received-Date: Mon, 25 Nov 2013 21:39:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Accidentally, native version of qmake was packaged, instead of nativesdk one. Fixed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc
index d431dce..f1a4f6b 100644
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -7,6 +7,8 @@ QT_MODULE = "qtbase"
 
 require nativesdk-qt5.inc
 
+PR = "r1"
+
 SRC_URI += " \
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
@@ -180,6 +182,10 @@ do_install() {
     # Fix install paths for all
     find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
 
+    # switch back the proper qmake
+    rm ${B}/bin/qmake
+    mv ${B}/bin/qmake-real ${B}/bin/qmake
+
     oe_runmake install INSTALL_ROOT=${D}
 
     # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
-- 
1.8.3.2


