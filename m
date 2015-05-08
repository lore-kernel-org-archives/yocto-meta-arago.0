Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id ACD3152093
	for <meta-arago@arago-project.org>;
	Fri,  8 May 2015 18:21:45 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO100HGXMZ8NY30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 May 2015 13:21:14 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AawGxMSu c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=ELbvjPoe_9Gf_D-LK_QA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 49428200EC;	Fri,
	8 May 2015 14:21:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 May 2015 14:21:08 -0400
Message-id: <1431109268-17756-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux: remove obsolete bbappends, corresponding recipes gone from meta-ti
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
X-List-Received-Date: Fri, 08 May 2015 18:21:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/linux/linux-am335x-psp_3.2.bbappend              | 6 ------
 meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend         | 3 ---
 2 files changed, 9 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
deleted file mode 100644
index b881190..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PR_append = "-arago5"
-
-# KVER is used by arago-source-ipk.conf
-KVER = "3.2.0-psp04.06.00.11"
-
-require copy-defconfig.inc
diff --git a/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend b/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
deleted file mode 100644
index 5d130ba..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago1"
-
-require copy-defconfig.inc
-- 
2.2.0


