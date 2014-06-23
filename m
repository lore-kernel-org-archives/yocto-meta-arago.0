Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id D5E7A529C8
	for <meta-arago@arago-project.org>;
	Mon, 23 Jun 2014 16:45:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7M00BL1RUW07D0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 Jun 2014 11:44:57 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CCB3720368; Mon,
	23 Jun 2014 12:44:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Jun 2014 12:44:55 -0400
Message-id: <1403541895-13243-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403541895-13243-1-git-send-email-denis@denix.org>
References: <1403541895-13243-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] u-boot: remove bbappends for old u-boot recipes removed from meta-ti
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
X-List-Received-Date: Mon, 23 Jun 2014 16:45:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend | 5 -----
 meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend | 5 -----
 2 files changed, 10 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend
deleted file mode 100644
index 06a69a0..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-arago0"
-
-# PSPREL and UVER are used by arago-source-ipk.conf
-UVER = "2010.12"
-PSPREL = "03.21.00.04.sdk"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend
deleted file mode 100644
index 9871300..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-arago0"
-
-# PSPREL and UVER are used by arago-source-ipk.conf
-PSPREL = "04.06.00.08"
-UVER = "2011.09"
-- 
2.0.0


