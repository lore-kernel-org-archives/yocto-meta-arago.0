Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 0E86652A0D
	for <meta-arago@arago-project.org>;
	Fri, 10 Jul 2015 01:34:21 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NR900MI00CFO9Z0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 09 Jul 2015 20:34:02 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=lRIzUS_CGXFpfgAXmqEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B07BE161B0C;	Thu,
	9 Jul 2015 21:33:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 09 Jul 2015 21:33:51 -0400
Message-id: <1436492031-16328-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v2] linux-ti-staging: make TISDK-specific bbappend generic
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
X-List-Received-Date: Fri, 10 Jul 2015 01:34:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - use rename instead of add/remove

 ...-staging_3.14.bbappend => linux-ti-staging_%.bbappend} |  0
 .../recipes-kernel/linux/linux-ti-staging_3.12.bbappend   | 15 ---------------
 2 files changed, 15 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_3.14.bbappend => linux-ti-staging_%.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
rename to meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
deleted file mode 100644
index 2a6f090..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-MACHINE_KERNEL_PR_append = "-arago1"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
-
-require copy-defconfig.inc
-
-KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-
-kernel_do_configure_prepend() {
-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-    then
-        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
-        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
-    fi
-}
-- 
2.2.0


