Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 97894529C8
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 20:57:14 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CKvCGv010644
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:57:13 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKvBCS019077
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2013 02:27:11 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 13 Apr 2013 02:27:11 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKv9cV016412;
	Sat, 13 Apr 2013 02:27:10 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2013 15:57:05 -0500
Message-ID: <1365800227-25071-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/3] linux-am335x: use setup-defconfig from meta-ti
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
X-List-Received-Date: Fri, 12 Apr 2013 20:57:14 -0000
Content-Type: text/plain

* Use the full path in the require statement so that the
  setup-defconfig from the meta-ti layer will be pulled in.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
index e487f43..237a516 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -16,7 +16,7 @@ inherit kernel
 KVER = "${PV}"
 
 require copy-defconfig.inc
-require setup-defconfig.inc
+require recipes-kernel/linux/setup-defconfig.inc
 ###################################################
 
 # Stage the power management firmware before building the kernel
@@ -25,7 +25,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "i+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
-- 
1.7.0.4


