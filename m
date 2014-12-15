Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 014A052A6A
	for <meta-arago@arago-project.org>;
	Mon, 15 Dec 2014 21:23:32 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGN003FW7ED5V30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 15 Dec 2014 15:23:14 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=D9vw8UVm c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8 a=lRxpQPx1AAAA:8	a=1pZ7qDjGxu2JMB1SyOkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 57951200F4;	Mon,
	15 Dec 2014 16:23:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 Dec 2014 16:22:59 -0500
Message-id: <1418678579-22938-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1418678579-22938-1-git-send-email-denis@denix.org>
References: <1418678579-22938-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] matrix-gui-browser: patch Makefile.build to work with Qt5
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
X-List-Received-Date: Mon, 15 Dec 2014 21:23:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Makefile.build is only used when building from within SDK through a
top-level SDK Makefile.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...uild-with-Qt5-use-qmake-available-in-PATH.patch |   31 ++++++++++++++++++++
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |   10 +++++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
new file mode 100644
index 0000000..42cfc23
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch
@@ -0,0 +1,31 @@
+From 155da553d7a5d4d84babb94fb0ecac073680c1cd Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 15 Dec 2014 15:51:59 -0500
+Subject: [PATCH] Makefile.build: with Qt5 use qmake available in PATH
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ Makefile.build |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.build b/Makefile.build
+index 192c6f6..79b55f5 100644
+--- a/Makefile.build
++++ b/Makefile.build
+@@ -8,11 +8,11 @@ all: release
+ .PHONY: qmake
+ qmake : matrix_browser.pro
+ 	@. ${ENV_SETUP}; \
+-	qmake2 CONFIG+=release matrix_browser.pro
++	qmake CONFIG+=release matrix_browser.pro
+ 
+ qmake_debug : matrix_browser.pro
+ 	@. ${ENV_SETUP}; \
+-	qmake2 CONFIG+=debug matrix_browser.pro
++	qmake CONFIG+=debug matrix_browser.pro
+ 
+ debug : qmake_debug
+ 	@. ${ENV_SETUP}; \
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index afd5aa3..cc73456 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -11,14 +11,20 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r7"
+PR = "r8"
 
 SRCREV = "7f5dccfb5b1b68a3f9162f6ee072eef0e0ba06fe"
 BRANCH ?= "master"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
 
-SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://qt5-webkit.patch file://qt5-gui-widgets-move.patch', '', d)}"
+QT5_DIFF = " \
+	file://qt5-webkit.patch \
+	file://qt5-gui-widgets-move.patch \
+	file://0001-Makefile.build-with-Qt5-use-qmake-available-in-PATH.patch \
+"
+
+SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_DIFF}", '', d)}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


