Return-Path: <denys@ti.com>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 333AE52AB5
	for <meta-arago@arago-project.org>;
	Sat, 17 Nov 2012 04:13:54 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MDM001GF6EQVRI1@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 16 Nov 2012 22:13:38 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 34F1C20024; Fri,
	16 Nov 2012 23:13:38 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 16 Nov 2012 23:13:36 -0500
Message-id: <1353125617-29095-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 1/2] task-arago-tisdk-matrix: remove dependencies on gui and qt for keystone
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
X-List-Received-Date: Sat, 17 Nov 2012 04:13:54 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-matrix.bb      | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
index 91e095f..9d002d5 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
@@ -1,28 +1,38 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r2"
+PR = "r3"
 
 inherit task
 
 MATRIX_ESSENTIALS = "        \
     matrix-gui               \
-    refresh-screen           \
     matrix-lighttpd-config   \
+"
+
+MATRIX_GUI = "               \
+    refresh-screen           \
     matrix-gui-browser       \
 "
 
+MATRIX_GUI_keystone = ""
+
 MATRIX_COMMON_APPS = "              \
     matrix-gui-armbenchmarks-demos  \
     matrix-gui-crypto-demos         \
     matrix-gui-oprofile-demos       \
-    matrix-gui-qt4-demos            \
     matrix-gui-settings-demos       \
     matrix-gui-usb-demos            \
     matrix-gui-submenus-ethernet    \
+"
+
+MATRIX_QT_APPS = "                  \
+    matrix-gui-qt4-demos            \
     matrix-gui-thermostat-demo      \
 "
 
+MATRIX_QT_APPS_keystone = ""
+
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_omap3 = "        \
@@ -87,6 +97,8 @@ RDEPENDS_append_am180x-evm = "      \
 
 RDEPENDS_${PN} = "        \
     ${MATRIX_ESSENTIALS}  \
+    ${MATRIX_GUI}         \
     ${MATRIX_COMMON_APPS} \
+    ${MATRIX_QT_APPS} \
     ${MATRIX_APPS}        \
 "
-- 
1.8.0


