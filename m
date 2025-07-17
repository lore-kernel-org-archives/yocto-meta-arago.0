Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F37CC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 15:21:29 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1622.1752765679359532679
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 08:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wjp2mZp+;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HFLIbN040464
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 10:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752765678;
	bh=sPqi8HVJHu1w9frxza0yuHjT/Qo1thcKUGKEGQ8Asz4=;
	h=From:To:CC:Subject:Date;
	b=wjp2mZp+eNYKQK63qrl6gWxbW/voneVMyl8HIaYwItV7tN85LZhQihA8Wz5lJHlV8
	 4mgPmNF9qbysM51soiiNTPmFgWqUBHuy0pUzZX7WEuQunIYE9jNd8SATCS9m8bTDZE
	 tPI3Pjh8OX4sJWX6cXq5O4/8438rCFK8cfCmIVbU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HFLIMd2867427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 10:21:18 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 10:21:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 10:21:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HFLI3v2065602;
	Thu, 17 Jul 2025 10:21:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [meta-arago][master][PATCH v3 0/2] Addition of off-screen render demo
Date: Thu, 17 Jul 2025 10:21:16 -0500
Message-ID: <20250717152118.2525721-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 15:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16307

From: Antonios Christidis <a-christidis@ti.com>

This series adds a off-screen rendering demo to our sdk. It includes the
new recipe as well as the recipe addition to the ti-test packagegroup.

Kind Regards,
Antonios Christidis

v3:
- Change the SRC_URI ... I thought I changed it in v2.

v2:
- Changed the SRC_URI and removed mesa-pvr as a dependency


Antonios Christidis (2):
  meta-arago-test: recipes-graphics: Add lightweight off-screen demo
  meta-arago-test: packagegroups: Add off-screen demo to ti-test package
    group

 .../recipes-core/packagegroups/ti-test.bb          |  1 +
 .../offscreen-demo/offscreendemo_0.0.1.bb          | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb

-- 
2.34.1


