Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 8D8F652A32
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 01:51:35 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00DT8IHOU8F0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 20:51:34 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 20D9320644; Wed,
	23 Apr 2014 21:51:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 21:51:20 -0400
Message-id: <1398304280-15426-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398304280-15426-1-git-send-email-denis@denix.org>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
Subject: [PATCH 8/8] linux-ti-staging: disable AUTOREV
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
X-List-Received-Date: Thu, 24 Apr 2014 01:51:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
index f99482c..2a6f090 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
@@ -1,11 +1,9 @@
-MACHINE_KERNEL_PR_append = "-arago0"
+MACHINE_KERNEL_PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
 require copy-defconfig.inc
 
-SRCREV = "${AUTOREV}"
-
 KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
 kernel_do_configure_prepend() {
-- 
1.9.2


