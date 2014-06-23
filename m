Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 42D87529F2
	for <meta-arago@arago-project.org>;
	Mon, 23 Jun 2014 16:45:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7M00L7RRUWWJ90@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 Jun 2014 11:44:57 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C8797200BD; Mon,
	23 Jun 2014 12:44:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Jun 2014 12:44:54 -0400
Message-id: <1403541895-13243-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 1/2] linux: remove bbappends for old kernel recipes removed from meta-ti
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
X-List-Received-Date: Mon, 23 Jun 2014 16:45:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend          | 7 -------
 .../recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend      | 9 ---------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
deleted file mode 100644
index 8948157..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-MACHINE_KERNEL_PR_append = "-arago1"
-
-# KVER is used by arago-source-ipk.conf
-KVER = "2.6.37"
-PSPREL = "04.02.00.07"
-
-require copy-defconfig.inc
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
deleted file mode 100644
index 5d3c3f7..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-MACHINE_KERNEL_PR_append = "-arago3"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
-
-# KVER is used by arago-source-ipk.conf
-KVER = "2.6.37"
-PSPREL = "03.21.00.04.sdk"
-
-require copy-defconfig.inc
-- 
2.0.0


