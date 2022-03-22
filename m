Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973B4C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:35:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.14695.1647977756934213233
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 12:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=d7CLGI4c;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MJZtgs119066;
	Tue, 22 Mar 2022 14:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647977755;
	bh=IIuGJ+HasIJZRhg2ZbuBjPLacMIZmkj7gO6MNxmfNO4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=d7CLGI4cP/kjbWL9uRod8cLezW2V9fl7s8W3OtMRF7oRVqSsQbOWMTDtzUFKJPwwZ
	 QzKA0q69teGkv1PJuMMRjKbmnwhdJMVUpIxKKynrp8t9GP4cxCokPI8hm5ZMvu9wDQ
	 TK7j5ZBzZ/NLK9otpwobOWGxSCRrBqci1ubOOjik=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MJZtD9076933
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 14:35:55 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 14:35:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 14:35:55 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MJZtGZ042273;
	Tue, 22 Mar 2022 14:35:55 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWkIN-0006Md-4L; Tue, 22 Mar 2022 14:35:55 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 3/3] busybox: Enable rtcwake
Date: Tue, 22 Mar 2022 14:35:54 -0500
Message-ID: <20220322193554.24404-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322193554.24404-1-reatmon@ti.com>
References: <20220322193554.24404-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 19:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13710

From: Nishanth Menon <nm@ti.com>

This is esp useful for testing low power states with a minimal system.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 65470bc7..351b80d4 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -583,7 +583,7 @@ CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
 # CONFIG_READPROFILE is not set
-# CONFIG_RTCWAKE is not set
+CONFIG_RTCWAKE=y
 # CONFIG_SCRIPT is not set
 # CONFIG_SCRIPTREPLAY is not set
 # CONFIG_SETARCH is not set
-- 
2.17.1


