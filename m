Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9835BC001E0
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 00:20:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.22559.1690503636400481445
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 17:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qX4IG5wl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KY0O027737;
	Thu, 27 Jul 2023 19:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690503634;
	bh=L7aNkcyT19JGOr8wuYK1sy9b2/vE8pxxnQBWoAvMaqQ=;
	h=From:To:CC:Subject:Date;
	b=qX4IG5wl/oWeaq13BufCbElfuhYOJXwG3FxD8vfHKyCRGbMj/XhcqzszkQiCyJY64
	 ppqDUkMV+y7klXVQuPL3prq2phsMaVsRt3LpdXmdnNqw85QoptHqyXdlGR/yEUxqZd
	 unko0U2Z2p4wBuKM7CiSVejTXnsy810VApPxfpW8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36S0KYLg003074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jul 2023 19:20:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jul 2023 19:20:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jul 2023 19:20:34 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYfC025363;
	Thu, 27 Jul 2023 19:20:34 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <afd@ti.com>, <nm@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Randolph
 Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 0/5] Packagegroup cleaning and a new proposal
Date: Thu, 27 Jul 2023 19:20:27 -0500
Message-ID: <20230728002032.853330-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jul 2023 00:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14809

From: Randolph Sapp <rs@ti.com>

Clean up some package groups, introduce a new group for all-around
useful tools that all images should inherit, and drop some unnecessary
logic in the irqbalance append.

We'll have to talk a little more about what to do with the sysvinit
images. I see no reason why we can't inherit the configuration
mechanisms poky uses for multiple init systems, aside from having to
fragment the package feeds accordingly.

Randolph Sapp (5):
  packagegroup-arago-bootstrap: fix RDEPENDS notation
  packagegroup-arago-base: edit the summary to describe current use
  irqbalance: remove append to install systemd script
  packagegroup-arago-boot: add a new group for all-around useful
    packages
  arago-tiny-image: add packagegroup-arago-boot to IMAGE_INSTALL

 .../recipes-core/images/arago-image.inc         |  1 +
 .../recipes-core/images/arago-tiny-image.inc    |  1 +
 .../packagegroups/packagegroup-arago-base.bb    |  2 +-
 .../packagegroups/packagegroup-arago-boot.bb    | 17 +++++++++++++++++
 .../packagegroup-arago-bootstrap.bb             |  2 +-
 .../packagegroup-arago-tisdk-addons.bb          |  1 -
 .../irqbalance/irqbalance_git.bbappend          |  6 +-----
 7 files changed, 22 insertions(+), 8 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb

-- 
2.41.0


