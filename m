Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB61C02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:59:28 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.116888.1738677566842033789
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 05:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GSmV1iRX;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514DxODi2404128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 07:59:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738677564;
	bh=lnEZwDZ+RELfmbCCja7tnWJy+pvSS41kFl5LcI/QbcE=;
	h=From:To:CC:Subject:Date;
	b=GSmV1iRXc6x7d9O+/kC5vPK7Kr/DS6tHhubn9Fwpl0cVTx2HIwLW/eHJcmieLTT8S
	 mbpyzg6MJ0HA3XVjCqro77dCnkuPm5QNpxUcdf0qzVrYiDOF10Q77FS9LVxJvk+tkR
	 /3Rf/qh+up9arDdo0GtGagnKx3mG3ZE6to651hhU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514DxO7Q003244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 07:59:24 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 07:59:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 07:59:24 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514DxNxb062885;
	Tue, 4 Feb 2025 07:59:24 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH 0/1] Add support for AM62L
Date: Tue, 4 Feb 2025 19:29:15 +0530
Message-ID: <20250204135916.974102-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Feb 2025 13:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15801

This series aims to enable support for am62lxx-evm in meta-arago-distro
& has to be integrated with corresponding meta-ti-bsp series [1]

[1]: https://lists.yoctoproject.org/g/meta-ti/message/18255

Chirag Shilwant (1):
  meta-arago-distro: Add support for AM62L

 meta-arago-distro/classes/tisdk-bundle.bbclass             | 1 +
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1


