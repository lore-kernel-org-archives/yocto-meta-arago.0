Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 32A2552A55
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 20:57:17 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CKvFj7010650
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:57:16 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKvEfM019090
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2013 02:27:14 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 13 Apr 2013 02:27:14 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKv9cX016412;
	Sat, 13 Apr 2013 02:27:13 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2013 15:57:07 -0500
Message-ID: <1365800227-25071-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365800227-25071-1-git-send-email-Chase.Maupin@ti.com>
References: <1365800227-25071-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] linux-ti-staging: use KERNEL_LOCALVERSION for SRCPV
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
X-List-Received-Date: Fri, 12 Apr 2013 20:57:17 -0000
Content-Type: text/plain

* Use the KERNEL_LOCALVERSION functionality to add the first
  seven characters of the commit id to the kernel version string.
  This will make it easier to identify which kernel is being
  run on a system.
* The fancy python line used for KERNEL_LOCALVERSION is compliments
  of Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linux/linux-ti-staging_3.8.bbappend            |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
index bd90af9..4eafeb8 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
@@ -1,7 +1,9 @@
-MACHINE_KERNEL_PR_append = "-arago2"
+MACHINE_KERNEL_PR_append = "-arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
 require copy-defconfig.inc
 
 SRCREV = "${AUTOREV}"
+
+KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-- 
1.7.0.4


