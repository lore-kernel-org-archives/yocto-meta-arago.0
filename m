Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2ED4552AE5
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 15:05:46 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r32F5hl3022237
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 10:05:44 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32F5h29008613
	for <meta-arago@arago-project.org>; Tue, 2 Apr 2013 20:35:43 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 2 Apr 2013 20:35:43 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r32F5aaE009456;
	Tue, 2 Apr 2013 20:35:42 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Apr 2013 10:05:34 -0500
Message-ID: <1364915134-30805-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364915134-30805-1-git-send-email-Chase.Maupin@ti.com>
References: <1364915134-30805-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] u-boot-ti-staging: use AUTOREV during development
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

* While the U-Boot sources are being developed use AUTOREV to
  avoid constant SRCREV updates.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../u-boot/u-boot-ti-staging_2013.01.01.bbappend   |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
new file mode 100644
index 0000000..35f25b1
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago1"
+
+SRCREV = "${AUTOREV}"
-- 
1.7.0.4


