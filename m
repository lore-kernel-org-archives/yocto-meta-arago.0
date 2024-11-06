Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ECFD29FA8
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:09:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.40506.1730876958892817235
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 23:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=O2fgJIxM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A679Iuc080748
	for <meta-arago@lists.yoctoproject.org>; Wed, 6 Nov 2024 01:09:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730876958;
	bh=ZbZR0Jwdc0UPa38Jx3qN5kUPOjosNShqL2NF7goSBAI=;
	h=From:To:CC:Subject:Date;
	b=O2fgJIxM6sDL6F6SbLDLJJHQXAlany22vaNHJSMxmqDMW21elMyFPz26uQ/CvxiNk
	 ZqcdrR7Uq/V9geDC9UGRkb4ZWSloyrn0ElLihx5j9FHfRCl50dpqkDFIcI6viLaQqq
	 1vM4ZJlbc3kFccV+E+a8QQ+WeGcP6b0AAyWwBcEk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A679I7E093550
	for <meta-arago@lists.yoctoproject.org>; Wed, 6 Nov 2024 01:09:18 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 01:09:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 01:09:17 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A679GKJ033450;
	Wed, 6 Nov 2024 01:09:16 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <n-francis@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] meta-arago-test: packagegroups: ti-test: j742s2: Add ufs-utils package
Date: Wed, 6 Nov 2024 12:38:09 +0530
Message-ID: <20241106070909.200961-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Nov 2024 07:09:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15593

j742s2 supports UFS, add the ufs-utils package to its rootfs.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 85398eaf..bcca9d95 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -137,6 +137,10 @@ TI_TEST_TI_TOOLS:append:j784s4 = " \
     ufs-utils \
 "
 
+TI_TEST_TI_TOOLS:append:j742s2 = " \
+    ufs-utils \
+"
+
 TI_TEST_TI_TOOLS:append:omapl138 = " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test', d)} \
 "
-- 
2.47.0


