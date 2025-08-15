Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB621CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 19:32:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.20095.1755286327648104486
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 12:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hfNXW5iG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FJW5892587526;
	Fri, 15 Aug 2025 14:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755286325;
	bh=7DIKii4j2D9YTV0W3/tr9sQTLzaZZVTsTuNXJ+h3FuM=;
	h=From:To:CC:Subject:Date;
	b=hfNXW5iGJZwqIEsCBZc1hDn3mmv1lIY62usbCnsBPic1L1+yaDPxAdMpEcf8GXni+
	 kIN53TbxW2d0iTv/Uj4Vwr+AivBGSCqqL7xg0k+gz49Kt6ZLNvQ3nn7lsl8KiUKy+n
	 av9K9QANGKkCADysgg8IAhtfR5ARp1YoqQQQ+KPU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FJW5A12803848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 14:32:05 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 14:32:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 14:32:04 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FJW4ob1745525;
	Fri, 15 Aug 2025 14:32:04 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <a-christidis@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH 0/2] piglit: use TestPlaceholder objects
Date: Fri, 15 Aug 2025 14:31:54 -0500
Message-ID: <20250815193156.1982216-1-rs@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 19:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16480

From: Randolph Sapp <rs@ti.com>

I've submitted this to the upstream piglit repo, but given that it isn't
actually a bugfix and more of just a requirement for our memory constrained
devices, we should probably carry it here until oe-core catches up.

Randolph Sapp (2):
  piglit: fix FILESEXTRAPATHS variable
  piglit: use TestPlaceholder to reduce memory usage

 .../recipes-graphics/piglit/piglit-ti.inc     |   4 +-
 ...-add-and-use-TestPlaceholder-objects.patch | 129 ++++++++++++++++++
 2 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch

-- 
2.50.1


