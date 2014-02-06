Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id BFF26529AA
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 00:21:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0J00MKLSZXWDQ0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 05 Feb 2014 18:21:34 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 95EEC20086; Wed,
	05 Feb 2014 19:21:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 05 Feb 2014 19:21:31 -0500
Message-id: <1391646093-6544-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/3] u-boot-ti-staging: disable AUTOREV and use SRCREV from meta-ti for release
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 00:21:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend             | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
index c5c5ae5..5b06505 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
@@ -1,6 +1,4 @@
-PR_append = "-arago2"
-
-SRCREV = "${AUTOREV}"
+PR_append = "-arago3"
 
 UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
-- 
1.8.3.2


