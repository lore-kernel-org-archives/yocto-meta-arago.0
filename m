Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733A0C83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 18:35:24 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.85687.1752518119556909371
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 11:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EYrQnJ9y;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56EIZJdD2083219
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752518119;
	bh=YFaUPs2SYlrkkOZKSNd+WcGu0VvKy6Yb37fgHpFIn4E=;
	h=From:To:CC:Subject:Date;
	b=EYrQnJ9y8Qy37sDAcVdXUUNTLBcB2Ret8X3bxVKYoUcdX6oolE+lSwxXvsX/eEhdS
	 G2Dh+K0aD4DYtOb4aJQLzGIis/YvMvk0eLu7ap0kUugncIbFCIXF8f1HZ9qi4FRjeE
	 RvMYw+pLFi8RiguyxXbyy6MEjw2tM7SFURCuvCpM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56EIZImE667738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:35:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 13:35:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 13:35:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56EIZIv81246697;
	Mon, 14 Jul 2025 13:35:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [meta-arago][master][PATCH v2 0/2] Addition of off-screen render demo
Date: Mon, 14 Jul 2025 13:35:16 -0500
Message-ID: <20250714183518.1116312-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 18:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16297

From: Antonios Christidis <a-christidis@ti.com>

This series adds a off-screen rendering demo to our sdk. It includes the
new recipe as well as the recipe addition to the ti-test packagegroup.

Kind Regards,
Antonios Christidis

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


