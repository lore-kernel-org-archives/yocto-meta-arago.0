Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 4845952A6F
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2013 19:01:04 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUB00CCKBH2I6J0@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 07 Oct 2013 14:00:41 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 08137201BB; Mon,
	07 Oct 2013 15:00:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 07 Oct 2013 15:00:24 -0400
Message-id: <1381172427-18302-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381172427-18302-1-git-send-email-denis@denix.org>
References: <1381172427-18302-1-git-send-email-denis@denix.org>
Subject: [PATCH 09/12] qt-provider.bbclass: class to allow seamless switching between Qt4 and Qt5
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
X-List-Received-Date: Mon, 07 Oct 2013 19:01:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Recipes that need to compile against either Qt4 or Qt5 should inherit this class
instead of "inherit qt4e" or "inherit qt5" directly. Setting global QT_PROVIDER
to either "qt4e" or "qt5" will configure those recipes automatically.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin S. Cooper Jr <fcooper@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
---
 meta-arago-distro/classes/qt-provider.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-distro/classes/qt-provider.bbclass

diff --git a/meta-arago-distro/classes/qt-provider.bbclass b/meta-arago-distro/classes/qt-provider.bbclass
new file mode 100644
index 0000000..444c76a
--- /dev/null
+++ b/meta-arago-distro/classes/qt-provider.bbclass
@@ -0,0 +1,19 @@
+# Class to handle switching between Qt4 and Qt5
+# Usage:
+# 1. Set QT_PROVIDER in distro config to either "qt4e" or "qt5"
+#    It defaults to "qt4e" when not set
+#    Hasn't been tested with "qt4x11" but should theoretically work
+# 2. Update recipes to inherit qt-provider instead of qt4e directly
+# 3. May need to use below QT_DEPENDS_* and QT_RDEPENDS_* variables
+#    instead of the actual Qt-version specific values
+
+QT_PROVIDER ?= "qt4e"
+
+inherit ${QT_PROVIDER}
+
+# Build-time dependencies
+QT_DEPENDS_BASE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase', 'qt4-embedded', d)}"
+QT_DEPENDS_WEBKIT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebkit', '', d)}"
+
+# Run-time dependencies
+QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-fonts', 'qt4-embedded-fonts', d)}"
-- 
1.8.3.2


