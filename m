Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D56B5529C8
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 20:58:07 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CKw6qI010705
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:58:06 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKw5rZ019178
	for <meta-arago@arago-project.org>;
	Sat, 13 Apr 2013 02:28:05 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 13 Apr 2013 02:28:05 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKw3PB016456;
	Sat, 13 Apr 2013 02:28:04 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Apr 2013 15:58:02 -0500
Message-ID: <1365800282-25368-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/1] u-boot-ti-staging: use UBOOT_LOCALVERSION to add version string
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
X-List-Received-Date: Fri, 12 Apr 2013 20:58:08 -0000
Content-Type: text/plain

* Use the UBOOT_LOCALVERSION variable to add the commit id to
  the u-boot version string.  This makes it easier to identify
  the version of the running u-boot.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../u-boot/u-boot-ti-staging_2013.01.01.bbappend   |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
index 35f25b1..47a2971 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
@@ -1,3 +1,5 @@
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 SRCREV = "${AUTOREV}"
+
+UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-- 
1.7.0.4


