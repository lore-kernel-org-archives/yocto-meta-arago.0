Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 44A0152A30
	for <meta-arago@arago-project.org>;
	Sun,  8 Nov 2015 22:44:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXI007Y7PTNZP90@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 08 Nov 2015 16:44:16 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=1zHx4MCnymZhJoQfroYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E693B161CF3;	Sun,
	8 Nov 2015 17:44:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 08 Nov 2015 17:44:10 -0500
Message-id: <1447022650-27272-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1447022650-27272-1-git-send-email-denis@denix.org>
References: <1447022650-27272-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] linux-ti-staging-rt: enable copying defconfig and AUTOREV-ing
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
X-List-Received-Date: Sun, 08 Nov 2015 22:44:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc              | 1 +
 .../recipes-kernel/linux/linux-ti-staging-rt_%.bbappend              | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index b759469..6661392 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -7,5 +7,6 @@
 
 # Auto rev important packages to pick up latest
 SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
 SRCREV_pn-ltp-ddt = "${AUTOREV}"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
new file mode 100644
index 0000000..b93b610
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
@@ -0,0 +1,5 @@
+MACHINE_KERNEL_PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+require copy-defconfig.inc
-- 
2.2.0


