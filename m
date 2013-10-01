Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 5F1A752099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:11:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ008AFAN6K820@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:11:32 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 23ADD273B8; Tue,
	01 Oct 2013 03:11:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:11:07 -0400
Message-id: <1380611472-23600-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380611472-23600-1-git-send-email-denis@denix.org>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
Subject: [PATCH 08/13] qt5.bbclass: add new class similar to existing qt4e for configuring recipes
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
X-List-Received-Date: Tue, 01 Oct 2013 07:11:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

The base class to set everything for recipes to build against Qt5

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/qt5.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-distro/classes/qt5.bbclass

diff --git a/meta-arago-distro/classes/qt5.bbclass b/meta-arago-distro/classes/qt5.bbclass
new file mode 100644
index 0000000..8669ea4
--- /dev/null
+++ b/meta-arago-distro/classes/qt5.bbclass
@@ -0,0 +1,20 @@
+# Class to mimic the old qt4e to prep recipe for use with Qt5 libraries
+
+QT5EDEPENDS ?= "qtbase "
+DEPENDS_prepend = "${QT5EDEPENDS}"
+
+inherit qmake5
+
+# we don't want conflicts with qt4
+OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
+OE_QMAKE_PATH_ARCHDATA = "${OE_QMAKE_PATH_QT_ARCHDATA}"
+OE_QMAKE_PATH_DATA = "${OE_QMAKE_PATH_QT_DATA}"
+OE_QMAKE_PATH_BINS = "${OE_QMAKE_PATH_QT_BINS}"
+OE_QMAKE_PATH_TRANSLATIONS = "${OE_QMAKE_PATH_QT_TRANSLATIONS}"
+OE_QMAKE_PATH_DOCS = "${OE_QMAKE_PATH_QT_DOCS}"
+OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
+OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
+OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
+
+# Qt uses atomic instructions not supported in thumb mode
+ARM_INSTRUCTION_SET = "arm"
-- 
1.8.3.2


