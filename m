Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75E1C53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 17:48:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.134.1672768101089239243
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 09:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LOkS2ygO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 303HmJu3028138;
	Tue, 3 Jan 2023 11:48:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672768099;
	bh=/Q3LL+oGfRhy8JeRVFvZ4tpk8LmxgW0Q73QItlZSmVg=;
	h=From:To:CC:Subject:Date;
	b=LOkS2ygOtl5B0lZ5mQf31wYnKfgPKLcjSl9oUbLQZOfUjqfqUH/yccIoOomdvVJ9q
	 NmqbeRU8d4/ak8D+xuDgP6jw+lz/h9k0dR1tO3YqpNj4EBWiINgGGNW1fIRfBywXeq
	 RkQ+ldZTyXgboYsb18m0ou3jabl6JyUzp6QspXGY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 303HmJ9d118812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Jan 2023 11:48:19 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 11:48:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 11:48:19 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 303HmJtk071810;
	Tue, 3 Jan 2023 11:48:19 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] arago.conf: Remove redundant fitImage addition
Date: Tue, 3 Jan 2023 11:48:17 -0600
Message-ID: <20230103174818.3801-1-afd@ti.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Jan 2023 17:48:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14143

FIT images are already added as part of the meta-ti layer for K3.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index d675b077..6566f963 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -43,18 +43,6 @@ KERNEL_IMAGETYPES:am437x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES:am57xx-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES:dra7xx-hs-evm = "zImage fitImage"
 
-# FIT image for K3 secure devices
-KERNEL_CLASSES:append:am64xx-hs-evm = " kernel-fitimage"
-KERNEL_CLASSES:append:am65xx-hs-evm = " kernel-fitimage"
-KERNEL_CLASSES:append:j721e-hs-evm = " kernel-fitimage"
-KERNEL_CLASSES:append:j7200-hs-evm = " kernel-fitimage"
-
-KERNEL_IMAGETYPES:am64xx-hs-evm = "Image fitImage"
-KERNEL_IMAGETYPES:am65xx-hs-evm = "Image fitImage"
-KERNEL_IMAGETYPES:j721e-hs-evm = "Image fitImage"
-KERNEL_IMAGETYPES:j7200-hs-evm = "Image fitImage"
-KERNEL_IMAGETYPES:j721s2-hs-evm = "Image fitImage"
-
 # FIT image settings
 FITIMAGE_HASH_ALGO = ""
 FITIMAGE_PACK_TEE = "0"
-- 
2.38.1


