Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id D461052974
	for <meta-arago@arago-project.org>;
	Fri, 21 Mar 2014 18:43:36 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N2S00J4SUO6F202@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 21 Mar 2014 13:43:34 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6DD3B20086; Fri,
	21 Mar 2014 14:43:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 21 Mar 2014 14:43:17 -0400
Message-id: <1395427397-24498-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] cryptodev: may still conflict with ocf-linux, add RREPLACES
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
X-List-Received-Date: Fri, 21 Mar 2014 18:43:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
index 939a795..637e59a 100644
--- a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
+++ b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
@@ -2,8 +2,10 @@ require cryptodev_${PV}.inc
 
 SUMMARY = "Linux Cryptodev KERNEL MODULE"
 DESCRIPTION = "The Cryptodev package contains the kernel /dev/crypto module"
+
 RCONFLICTS_${PN} = "ocf-linux"
+RREPLACES_${PN} = "ocf-linux"
 
 inherit module
 
-PR = "r0"
+PR = "r1"
-- 
1.8.3.2


