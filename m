Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A14C76196
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 03:08:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13766.1680318488532718665
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 20:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tkMxoqy5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 331387WY092140;
	Fri, 31 Mar 2023 22:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680318487;
	bh=jTfBh25Q8Nt24fUuGE8ZhY0XxgNn5iy+CVRja+6N/vQ=;
	h=From:To:CC:Subject:Date;
	b=tkMxoqy5c0VJP3mm6+FA9j93xqWoB/v+UmXYOIFIiLhPJIPRqD3JTp6woVDDgyCWa
	 bN+MjVmq9i4876V5Er4o/Mq1MKuB8Igcbi25dQqD02PB32xtgKLHe5efs1/etz+QYG
	 OBB0hbdeyERACwdWebMpesIZQW5PGG8Vc2MUouVM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 331387JJ010407
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Mar 2023 22:08:07 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 31
 Mar 2023 22:08:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 31 Mar 2023 22:08:07 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 331387Us026190;
	Fri, 31 Mar 2023 22:08:07 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <andrewd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [kirkstone/master][PATCH] meta-arago-distro: linux-firmware: remove cadence firmware
Date: Fri, 31 Mar 2023 22:08:01 -0500
Message-ID: <20230401030801.1972533-1-rs@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 01 Apr 2023 03:08:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14291

Cadence firmware is already being conditionally packaged in meta-ti
as cadence-mhdp-fw. Remove cadence firmware from this package.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_%.bbappend      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
index 8742c7bf..d4f3e679 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -14,4 +14,5 @@ RDEPENDS:${PN}-ibt-18 += "${PN}-ibt-license"
 
 do_install:append() {
 	rm -rf  ${D}/lib/firmware/ti-connectivity/
+	rm -rf  ${D}/lib/firmware/cadence/
 }
-- 
2.39.2


