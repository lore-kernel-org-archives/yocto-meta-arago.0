Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 169F752995
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 14:20:11 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBL00IML6H7PLB0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 08 Sep 2014 09:19:55 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 17C1320086; Mon,
	08 Sep 2014 10:19:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 08 Sep 2014 10:19:54 -0400
Message-id: <1410185994-27663-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] cryptodev-module: fix module name in autoload statement
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
X-List-Received-Date: Mon, 08 Sep 2014 14:20:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Confusion caused by the recipe name change, but module name hasn't change.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
index 21ce4af..24c99ed 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
@@ -1,6 +1,6 @@
-PR_append = "-arago4"
+PR_append = "-arago5"
 
-module_autoload_cryptodev = "cryptodev-module"
+module_autoload_cryptodev = "cryptodev"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
2.0.4


