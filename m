Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id C414B52998
	for <meta-arago@arago-project.org>;
	Wed, 11 Dec 2013 18:43:09 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXN004ETNZHNNG0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Dec 2013 12:42:53 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CB0CC2016B; Wed,
	11 Dec 2013 13:42:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Dec 2013 13:42:48 -0500
Message-id: <1386787369-9286-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1386787369-9286-1-git-send-email-denis@denix.org>
References: <1386787369-9286-1-git-send-email-denis@denix.org>
Subject: [ti2013.12.x][PATCH 3/4] u-boot-ti-staging: disable AUTOREV and use SRCREV from meta-ti for release
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
X-List-Received-Date: Wed, 11 Dec 2013 18:43:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend             | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
index 8174bc7..47c7292 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
@@ -1,6 +1,4 @@
-PR_append = "-arago0"
-
-SRCREV = "${AUTOREV}"
+PR_append = "-arago1"
 
 UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
-- 
1.8.3.2


