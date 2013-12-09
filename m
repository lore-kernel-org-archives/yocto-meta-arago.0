Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id CB0CC5296F
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2013 18:47:35 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXJ00ILNYUQNHOP@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 09 Dec 2013 12:47:14 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F3847200E5; Mon,
	09 Dec 2013 13:47:13 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 09 Dec 2013 13:47:12 -0500
Message-id: <1386614832-12313-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1386614832-12313-1-git-send-email-denis@denix.org>
References: <1386614832-12313-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] linux-ti-staging: disable AUTOREV and use SRCREV from meta-ti for release
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
X-List-Received-Date: Mon, 09 Dec 2013 18:47:36 -0000

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
1.8.3.2


