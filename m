Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 3C31052AB0
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 00:35:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM00E84UZ7BE80@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 13 Oct 2013 19:35:33 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E89A02156D; Sun,
	13 Oct 2013 20:35:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 13 Oct 2013 20:35:21 -0400
Message-id: <1381710923-22471-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381710923-22471-1-git-send-email-denis@denix.org>
References: <1381710923-22471-1-git-send-email-denis@denix.org>
Subject: [PATCH 7/9] libjpeg-turbo: update local bbappend with upstreamed fixes removed
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
X-List-Received-Date: Mon, 14 Oct 2013 00:35:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
index a3c05db..02d8830 100644
--- a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
+++ b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
@@ -1,15 +1,7 @@
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=http;module=trunk"
 
-# Temporarily add this append which incorporates the changes of meta-oe master 
-# patch "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
-# commit id 662fd013adcbee8c59f4f475a11911c3267eae90.
-
-RPROVIDES_${PN}  += "jpeg"
-RREPLACES_${PN}  += "jpeg"
-RCONFLICTS_${PN} += "jpeg"
-
 # Patch to incorporate the below changes will be sent to meta-oe master and
 # maintenance branch. When this fix is in the maintenance branch then the
 # below changes can be removed.
-- 
1.8.3.2


