Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF8AC4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 21:45:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4769.1706910300906807679
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Feb 2024 13:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Pie0oRBP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 412Lj0Dt094414
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Feb 2024 15:45:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706910300;
	bh=TKewebCwwHNDIGuksE8tJCI+JyY6CG7dWSaPjrOgGIc=;
	h=From:To:CC:Subject:Date;
	b=Pie0oRBPHT78tC1c3r9sDIKq+NT5FOyZRWvVP/DtymOx/Q9uwDNVjyXsbjcgaAZzI
	 tvHhB9fKHDkqEW/OuxgpZBctZ5fE9nQr921EPN4ONChucOPjT97dHrYKr1V3hn8loS
	 Wtm3eHoeXcivn7IGe9R+iSHCrjtaaMDPa7p6iZYU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 412Lj0aZ030460
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Feb 2024 15:45:00 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Feb 2024 15:45:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Feb 2024 15:44:59 -0600
Received: from localhost (praneethhome.dhcp.ti.com [128.247.81.61])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 412Lix7C126027;
	Fri, 2 Feb 2024 15:44:59 -0600
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [master PATCH] branding-ltsprep: Move to uboot 2024.04
Date: Fri, 2 Feb 2024 15:44:59 -0600
Message-ID: <20240202214459.31292-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Feb 2024 21:45:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15107

From: Praneeth Bajjuri <praneeth@ti.com>

Move the U-Boot version to 2024.04 for LTS prep.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index f0634e7a..59eb116e 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -2,7 +2,7 @@
 PREFERRED_VERSION_linux-ti-staging = "6.6%"
 PREFERRED_VERSION_linux-ti-staging-rt = "6.6%"
 PREFERRED_VERSION_linux-ti-staging-systest = "6.6%"
-PREFERRED_VERSION_u-boot-ti-staging = "2024.01%"
+PREFERRED_VERSION_u-boot-ti-staging = "2024.04%"
 
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
 MACHINE_FEATURES:remove = "mmip"
-- 
2.17.1


