Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B58375298C
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 14:39:06 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TEd4p4023095
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 09:39:05 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TEd3i0001791
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 20:09:04 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 29 Mar 2013 20:09:03 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TEd0Xh009116;
	Fri, 29 Mar 2013 20:09:01 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Mar 2013 09:38:57 -0500
Message-ID: <1364567938-26710-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] linux: remove setup-defconfig includes
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
X-List-Received-Date: Fri, 29 Mar 2013 14:39:06 -0000
Content-Type: text/plain

* Since the setup-defconfig.inc file has been moved to the
  meta-ti layer the base recipes in meta-ti can be updated
  to use that .inc file.  This means the bbappend files no
  longer need to include this file.
* Patch has already been submitted to use setup-defconfig.inc
  in the base kernel recipes in meta-ti

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linux-am335x_3.2.0-psp04.06.00.08.bbappend     |    3 +--
 .../linux/linux-omap-psp_2.6.37.bbappend           |    3 +--
 .../linux/linux-omapl138-psp_2.6.37.bbappend       |    3 +--
 .../recipes-kernel/linux/linux_3.3.7.bbappend      |    3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
index c100597..431edcd 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
@@ -6,4 +6,3 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 KVER = "${PV}"
 
 require copy-defconfig.inc
-require setup-defconfig.inc
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
index c4daac1..8948157 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
@@ -1,8 +1,7 @@
-MACHINE_KERNEL_PR_append = "-arago0"
+MACHINE_KERNEL_PR_append = "-arago1"
 
 # KVER is used by arago-source-ipk.conf
 KVER = "2.6.37"
 PSPREL = "04.02.00.07"
 
 require copy-defconfig.inc
-require setup-defconfig.inc
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
index e8b0606..5d3c3f7 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = "-arago0"
+MACHINE_KERNEL_PR_append = "-arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
@@ -7,4 +7,3 @@ KVER = "2.6.37"
 PSPREL = "03.21.00.04.sdk"
 
 require copy-defconfig.inc
-require setup-defconfig.inc
diff --git a/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend b/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
index 6e1c92c..5d130ba 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
@@ -1,4 +1,3 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 require copy-defconfig.inc
-require setup-defconfig.inc
-- 
1.7.0.4


