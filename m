Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 79C9452A8B
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 22:40:50 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXB00JW4AZDO100@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 04 Nov 2015 16:40:26 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=AP1bPOkfmopSWgM4qr8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BA4B9161CB7;	Wed,
	4 Nov 2015 17:40:25 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 04 Nov 2015 17:40:25 -0500
Message-id: <1446676825-31087-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] busybox: enable taskset command and showing threads
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
X-List-Received-Date: Wed, 04 Nov 2015 22:40:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/defconfig  | 6 +++---
 meta-arago-distro/recipes-core/busybox/busybox_%.bbappend | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index e0d6540..9072493 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -702,8 +702,8 @@ CONFIG_MICROCOM=y
 # CONFIG_RX is not set
 CONFIG_SETSID=y
 CONFIG_STRINGS=y
-# CONFIG_TASKSET is not set
-# CONFIG_FEATURE_TASKSET_FANCY is not set
+CONFIG_TASKSET=y
+CONFIG_FEATURE_TASKSET_FANCY=y
 CONFIG_TIME=y
 CONFIG_TIMEOUT=y
 # CONFIG_TTYSIZE is not set
@@ -910,7 +910,7 @@ CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
 # CONFIG_FEATURE_TOP_DECIMALS is not set
 # CONFIG_FEATURE_TOP_SMP_PROCESS is not set
 # CONFIG_FEATURE_TOPMEM is not set
-# CONFIG_FEATURE_SHOW_THREADS is not set
+CONFIG_FEATURE_SHOW_THREADS=y
 CONFIG_WATCH=y
 
 #
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
index 297a442..aefb648 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago15"
+PR_append = "-arago16"
 
 SRC_URI += " \
 	file://inetd \
-- 
2.2.0


