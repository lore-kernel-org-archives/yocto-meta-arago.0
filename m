Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C077C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 15:46:39 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2223.1752767196897984285
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 08:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Mb5rQVAL;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HFkaWI512643
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 10:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752767196;
	bh=9Pvhs9AYsJ85e+CMGN4Ii7UZUBtNkhcjPFBhEctVWM4=;
	h=From:To:CC:Subject:Date;
	b=Mb5rQVALN62logjda6OX4hwx1NYtAn/EnZs0cF2mE3o/NYoMtqTYDQsSpQJX5B0WD
	 FSQwu3+aFjzhe7x3f3epD74iG0wNrN1XOHaQUnkfZucqNzkd7hLogi/c4HLprU1yr5
	 KKvpVnAjn5RD5b0Q4G0R619ZGMirrOiEVQjmGbf8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HFkabT1740819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 10:46:36 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 10:46:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 10:46:35 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HFkZMC2098477;
	Thu, 17 Jul 2025 10:46:35 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [meta-arago][scarthgap][PATCH v4 0/2] Addition of off-screen render demo
Date: Thu, 17 Jul 2025 10:46:33 -0500
Message-ID: <20250717154635.2528929-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 15:46:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16312

From: Antonios Christidis <a-christidis@ti.com>

This series adds a off-screen rendering demo to our sdk. It includes the
new recipe as well as the recipe addition to the ti-test packagegroup.

Kind Regards,
Antonios Christidis 

v4:
- Changed the SRC_URI ... I thought I did that in v3

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


