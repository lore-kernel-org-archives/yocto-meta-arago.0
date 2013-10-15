Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 2F2A25299D
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 03:22:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUO00MXVXCWKZ21@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 14 Oct 2013 22:22:13 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3BE832009B; Mon,
	14 Oct 2013 23:22:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 14 Oct 2013 23:21:54 -0400
Message-id: <1381807317-3759-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381807317-3759-1-git-send-email-denis@denix.org>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] qt-provider: expand with extra dependency variables for qtsvg and qtscript
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
X-List-Received-Date: Tue, 15 Oct 2013 03:22:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/qt-provider.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/qt-provider.bbclass b/meta-arago-distro/classes/qt-provider.bbclass
index 444c76a..c0f7184 100644
--- a/meta-arago-distro/classes/qt-provider.bbclass
+++ b/meta-arago-distro/classes/qt-provider.bbclass
@@ -11,9 +11,13 @@ QT_PROVIDER ?= "qt4e"
 
 inherit ${QT_PROVIDER}
 
-# Build-time dependencies
+# Build-time dependencies - those are now separate modules in Qt5 and
+# require separate dependencies, unlike Qt4 that provides everything
+# in a single qt4-embedded/qt4-x11 recipe
 QT_DEPENDS_BASE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase', 'qt4-embedded', d)}"
 QT_DEPENDS_WEBKIT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebkit', '', d)}"
+QT_DEPENDS_SVG = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtsvg', '', d)}"
+QT_DEPENDS_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtscript', '', d)}"
 
 # Run-time dependencies
 QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-fonts', 'qt4-embedded-fonts', d)}"
-- 
1.8.3.2


