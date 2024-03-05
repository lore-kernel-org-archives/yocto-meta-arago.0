Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B184C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:11:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1645.1709665907498299230
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 11:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OUzPsdeo;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425JBkCZ062869;
	Tue, 5 Mar 2024 13:11:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709665906;
	bh=KSmSFxbQ8xzDtnalPWI41oYJDURk/BcDDgPK/5NGXzs=;
	h=From:To:CC:Subject:Date;
	b=OUzPsdeoJbHWCN/Z3f2hn1/76jfGD1TtBP22OgH/toEpA132C7W2thbtApFnvgpB3
	 nF6OzEWC7pcQl+/s3P/+D5DMQlG6TP5fmRZb3OIaZCJbf7AfXg+XnwlzvOcDEIl+6E
	 CiyDRu4G9OSI9SjUA28JiVh4KybrpdsGColuWusM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425JBkMC007163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 13:11:46 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 13:11:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 13:11:45 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425JBjiB106837;
	Tue, 5 Mar 2024 13:11:45 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] base-files: Remove fstab override
Date: Tue, 5 Mar 2024 13:11:45 -0600
Message-ID: <20240305191145.67894-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 19:11:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15220

There is already a version of this file provided by oe-core that
is kept up to date. Do not override it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/base-files/base-files/fstab        | 13 -------------
 .../recipes-core/base-files/base-files_%.bbappend   |  2 +-
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/base-files/base-files/fstab

diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab b/meta-arago-distro/recipes-core/base-files/base-files/fstab
deleted file mode 100644
index 8ddadd98..00000000
--- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
+++ /dev/null
@@ -1,13 +0,0 @@
-# stock fstab - you probably want to override this with a machine specific one
-
-/dev/root            /                    auto       defaults              1  1
-proc                 /proc                proc       defaults              0  0
-devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
-usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
-tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
-tmpfs                /var/volatile        tmpfs      defaults,size=50M     0  0
-tmpfs                /media/ram           tmpfs      defaults,size=16M     0  0
-
-# uncomment this if your device has a SD/MMC/Transflash slot
-#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
-
diff --git a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
index e5c53e80..7d1f6751 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-PR:append = ".arago4"
+PR:append = ".arago5"
-- 
2.39.2


