Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id EB7C6529AA
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 00:21:51 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0J008Q5T00D9A0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 05 Feb 2014 18:21:36 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 06392200AC; Wed,
	05 Feb 2014 19:21:34 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 05 Feb 2014 19:21:32 -0500
Message-id: <1391646093-6544-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1391646093-6544-1-git-send-email-denis@denix.org>
References: <1391646093-6544-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] linux-ti-staging: disable AUTOREV and use SRCREV from meta-ti for release
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
X-List-Received-Date: Thu, 06 Feb 2014 00:21:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
index 3450a1f..4899ab7 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
@@ -1,11 +1,9 @@
-MACHINE_KERNEL_PR_append = "-arago4"
+MACHINE_KERNEL_PR_append = "-arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
 require copy-defconfig.inc
 
-SRCREV = "${AUTOREV}"
-
 KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
 kernel_do_configure_prepend() {
-- 
1.8.3.2


