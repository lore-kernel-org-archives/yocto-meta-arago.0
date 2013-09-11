Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id B22C852A19
	for <meta-arago@arago-project.org>;
	Wed, 11 Sep 2013 02:35:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSX00M58WJ6WAH0@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 10 Sep 2013 21:35:30 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2292220080; Tue,
	10 Sep 2013 22:35:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 10 Sep 2013 22:35:29 -0400
Message-id: <1378866929-16570-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] arago-qt4: undo RRECOMMENDS for eglibc-gconv-utf-16
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
X-List-Received-Date: Wed, 11 Sep 2013 02:35:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Commit 995502d19cce43430c3f4dce80ce6ef5feee7421 in or-core adds RRECOMMENDS
for eglibc-gconv-utf-16 to resolve Qt's warning related to i18n and l10n.
Current external toolchains in use by meta-arago do not provide gconv modules.
While it is possible to fix for Linaro, as it is shipped with gconv modules,
Arago toolchain had no gconv modules distributed, unfortunately.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
index 0291555..715092e 100644
--- a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
+++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
@@ -1,11 +1,15 @@
 # Common file for patches or tweaks that are needed by qt4-embedded and
 # qt4-embedded-gles
 
-PR := "${PR}-arago4"
+PR := "${PR}-arago5"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
+python __anonymous () {
+    d.setVar("RRECOMMENDS_libqt-embeddedcore4", "")
+}
+
 # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
 # For our distribution purposes we only use LGPLv2.1
 LICENSE = "LGPLv2.1"
-- 
1.8.3.2


