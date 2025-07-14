Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72197C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 18:42:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.85849.1752518522746145310
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 11:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d2NdvxFn;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56EIg2qR2669195
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752518522;
	bh=gfIAA19LoB1h4YPPqp+cjZWL+v+g2/8Fs9KmqLY4xJ4=;
	h=From:To:CC:Subject:Date;
	b=d2NdvxFnxgEP2d2wTWzsO7JiJ/E8yqBHlduyKQM1A6POIrIIwKLnbUViQ0YGoWyWU
	 u00pC3jGtgqPSH6k654poT2z+tYfZwAU3MJOZ5nPN3igJTBWvznQ4kWRBWh7bDhXK8
	 Q0Af5kZWjKfTEsRijqt5mHEAn5hUIwoczL4glInU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56EIg2Tg673009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:42:02 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 13:42:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 13:42:01 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56EIg1Lm1554357;
	Mon, 14 Jul 2025 13:42:01 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [meta-arago][scarthgap][PATCH v3 0/2] Addition of off-screen render demo
Date: Mon, 14 Jul 2025 13:41:59 -0500
Message-ID: <20250714184201.1119178-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 18:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16301

From: Antonios Christidis <a-christidis@ti.com>

This series adds a off-screen rendering demo to our sdk. It includes the
new recipe as well as the recipe addition to the ti-test packagegroup.

Kind Regards,
Antonios Christidis 

v3:
- Changed SRC_URI

v2:
- Removed mesa-pvr as a dependency


Antonios Christidis (2):
  meta-arago-test: recipes-graphics: Add lightweight off-screen demo
  meta-arago-test: packagegroups: Add off-screen demo to ti-test package
    group

 .../recipes-core/packagegroups/ti-test.bb        |  1 +
 .../offscreen-demo/offscreendemo_0.0.1.bb        | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb

-- 
2.34.1


