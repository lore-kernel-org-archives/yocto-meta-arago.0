Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2DDF852AE4
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 15:05:46 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r32F5hA5031506
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 10:05:44 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32F5ghV008609
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 20:35:43 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 2 Apr 2013 20:35:41 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32F5aaD009456;
	Tue, 2 Apr 2013 20:35:40 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Apr 2013 10:05:33 -0500
Message-ID: <1364915134-30805-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] linux-ti-staging: use AUTOREV during development
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
X-List-Received-Date: Tue, 02 Apr 2013 15:05:47 -0000
Content-Type: text/plain

* While the kernel is still being developed to AUTOREV to avoid
  constand kernel SRCREV updates.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../linux/linux-ti-staging_3.8.bbappend            |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
index 5a08e89..bd90af9 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
@@ -1,5 +1,7 @@
-MACHINE_KERNEL_PR_append = "-arago1"
+MACHINE_KERNEL_PR_append = "-arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
 require copy-defconfig.inc
+
+SRCREV = "${AUTOREV}"
-- 
1.7.0.4


