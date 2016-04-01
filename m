Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 4E18452981
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:41:51 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X0012CRLQYR50@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:50 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=Q6ia6gUKWg7ErJO9KrkA:9
Received: by 100.15.86.14 with SMTP id 77da1c6e; Fri, 01 Apr 2016 03:41:50 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B85E0161F5C;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:24 -0400
Message-id: <1459482106-27723-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 04/26] linux: remove bbappends for old kernel versions, removed from meta-ti
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
X-List-Received-Date: Fri, 01 Apr 2016 03:41:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend    | 17 -----------------
 .../linux/sitara-linux-ti-staging_3.14.bbappend         | 13 -------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend
deleted file mode 100644
index f331309..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend
+++ /dev/null
@@ -1,17 +0,0 @@
-MACHINE_KERNEL_PR_append = "-arago0"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
-
-require copy-defconfig.inc
-
-KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-
-# The below lines are overlayed until the LOCALVERSION change is merged into
-# the oe-core danny branch. Update: not coming to danny, keep until dylan.
-kernel_do_configure_prepend() {
-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-    then
-        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
-        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
-    fi
-}
diff --git a/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
deleted file mode 100644
index 7e8eaf2..0000000
--- a/meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-MACHINE_KERNEL_PR_append = "-arago1"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
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


