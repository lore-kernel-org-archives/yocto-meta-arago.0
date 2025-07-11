Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5A6C83F22
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 14:26:18 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.15273.1752243972412544829
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 07:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FiKLCJAz;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56BEQBGO1826911
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 09:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752243971;
	bh=EL724urpLsewkb4x/+FBfmxqcYyYwCZPbYM9d2z+YA0=;
	h=From:To:Subject:Date;
	b=FiKLCJAzVqYrOz5IrQDDE20lrE/Ni56TJOJKbwpRIH0i4Iz/WAcPXhcEXuR/Skdq7
	 6BGGUdUEKz3lbh+QPFx+JW80OthMmMBMg2KTFgUwG/+dGJF8TmWiIbDVAX/Zepo6Ug
	 XZgAn899Xebd3wUL0+TN/cHVnxIcjQRtCzyiJd7g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56BEQB8R1219042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 09:26:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 09:26:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 09:26:11 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56BEQBwr3626506;
	Fri, 11 Jul 2025 09:26:11 -0500
From: <a-christidis@ti.com>
To: <rs@ti.com>, <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][0/2] Addition of off-screen render demo
Date: Fri, 11 Jul 2025 09:26:09 -0500
Message-ID: <20250711142611.3567574-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 14:26:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16284

From: Antonios Christidis <a-christidis@ti.com>

This series adds a off-screen rendering demo to our sdk. It includes the
new recipe as well as the recipe addition to the ti-test packagegroup.

Kind Regards,
Antonios Christidis

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


