Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 2E41A52990
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 04:42:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW400E23VQI12S0@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Nov 2013 22:42:28 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F09062008E; Mon,
	11 Nov 2013 23:42:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Nov 2013 23:42:08 -0500
Message-id: <1384231333-26952-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1384231333-26952-1-git-send-email-denis@denix.org>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
Subject: [PATCH 1/6] qt-provider: split out setting variables into own class
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
X-List-Received-Date: Tue, 12 Nov 2013 04:42:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

This way only variables can be used from other places where inheriting rest of
qt/qmake classes won't make sense.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/qt-provider.bbclass | 12 +-----------
 meta-arago-distro/classes/qt-vars.bbclass     | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 11 deletions(-)
 create mode 100644 meta-arago-distro/classes/qt-vars.bbclass

diff --git a/meta-arago-distro/classes/qt-provider.bbclass b/meta-arago-distro/classes/qt-provider.bbclass
index c0f7184..a0dbdef 100644
--- a/meta-arago-distro/classes/qt-provider.bbclass
+++ b/meta-arago-distro/classes/qt-provider.bbclass
@@ -10,14 +10,4 @@
 QT_PROVIDER ?= "qt4e"
 
 inherit ${QT_PROVIDER}
-
-# Build-time dependencies - those are now separate modules in Qt5 and
-# require separate dependencies, unlike Qt4 that provides everything
-# in a single qt4-embedded/qt4-x11 recipe
-QT_DEPENDS_BASE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase', 'qt4-embedded', d)}"
-QT_DEPENDS_WEBKIT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebkit', '', d)}"
-QT_DEPENDS_SVG = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtsvg', '', d)}"
-QT_DEPENDS_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtscript', '', d)}"
-
-# Run-time dependencies
-QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-fonts', 'qt4-embedded-fonts', d)}"
+inherit qt-vars
diff --git a/meta-arago-distro/classes/qt-vars.bbclass b/meta-arago-distro/classes/qt-vars.bbclass
new file mode 100644
index 0000000..b5efee2
--- /dev/null
+++ b/meta-arago-distro/classes/qt-vars.bbclass
@@ -0,0 +1,16 @@
+# Class to define many useful variables that differ between Qt4 and Qt5
+
+QT_PROVIDER ?= "qt4e"
+
+# Build-time dependencies - those are now separate modules in Qt5 and
+# require separate dependencies, unlike Qt4 that provides everything
+# in a single qt4-embedded/qt4-x11 recipe
+QT_DEPENDS_BASE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase', 'qt4-embedded', d)}"
+QT_DEPENDS_WEBKIT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebkit', '', d)}"
+QT_DEPENDS_SVG = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtsvg', '', d)}"
+QT_DEPENDS_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtscript', '', d)}"
+
+# Run-time dependencies
+QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-fonts', 'qt4-embedded-fonts', d)}"
+QT_RDEPENDS_NATIVESDK_TOOLS = "${@base_conditional('QT_PROVIDER', 'qt5', 'nativesdk-qtbase-tools nativesdk-qttools', 'nativesdk-qt4-tools', d)}"
+QT_RDEPENDS_MKSPECS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-mkspecs', 'qt4-embedded-mkspecs', d)}"
-- 
1.8.3.2


