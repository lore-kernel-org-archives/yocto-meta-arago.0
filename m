Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811C2C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:35:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.14694.1647977756689113266
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 12:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rOE/0Cti;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MJZtlG014881;
	Tue, 22 Mar 2022 14:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647977755;
	bh=OZmeZr3LLJmb6CTpx7pCK0M3JwL+jpIMplYuYNoQe14=;
	h=From:To:Subject:Date;
	b=rOE/0CtixkbPLPurCFB/TS2lvUExJCFlkOOMvuBsSy47KkX1+t33fF6fnlNPL4PsC
	 W8efWq1xVJ/aBm+z4i+v2lTaYsjLWYrKMRTFF1K51duP+xf2x/B0V5ceC6eS/Cvd9B
	 NiSlfbsNreTgbk8vBbrToJsErRLxVUectBuLmXGc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MJZta2039613
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 14:35:55 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 14:35:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 14:35:54 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MJZsia066394;
	Tue, 22 Mar 2022 14:35:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWkIM-0006MM-OV; Tue, 22 Mar 2022 14:35:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 0/3] Adding support for am62xx
Date: Tue, 22 Mar 2022 14:35:51 -0500
Message-ID: <20220322193554.24404-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 19:35:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13712

These patches add initial recipe support for am62xx.

Krunal Bhargav (1):
  packagegroup-*-graphics: add virtual provider for AM62x GPU driver v2

Nishanth Menon (2):
  ti-tisdk-makefile: adding uboot r5 config variable for am62xx
  busybox: Enable rtcwake

 .../conf/distro/include/arago-prefs.inc              | 12 ++++++------
 .../recipes-core/busybox/busybox/defconfig           |  2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb       |  1 +
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.17.1


