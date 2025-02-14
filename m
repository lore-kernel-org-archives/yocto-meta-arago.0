Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0017CC021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 19:01:00 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.28964.1739559650857873374
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 11:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oo7NXPqU;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51EJ0mbY079229
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 13:00:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739559648;
	bh=SWuUoXqNhQ3oaK18kxeGix8NWzxpZlj6SzLs1zh6G2Y=;
	h=From:To:CC:Subject:Date;
	b=oo7NXPqUNvuhnQAMl+x0samrKqXEtj1IELpZIx+/1QqF97701Pew3biS1ke+tWsIo
	 TeTRKPhXeeKeGOIellh8JEj06+HfwUEe0OkXqWta8MGbSw/BexF+OzH45mFn/752Kw
	 uRCE6gjwumBunE19idg35w8TPGh3Bsj5Dv2P5yBw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51EJ0mBs024289
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Feb 2025 13:00:48 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 13:00:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 13:00:48 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EJ0l4q050654;
	Fri, 14 Feb 2025 13:00:47 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-arago][scarthgap][PATCH 0/2] Backport Graphics related changes
Date: Fri, 14 Feb 2025 13:00:34 -0600
Message-ID: <20250214190036.360301-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Feb 2025 19:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15849

From: Randolph Sapp <rs@ti.com>

Backport Graphics related patches from master. These enable opencl related
functions and break the dependency on meta-arago-demos. I'm going to try and
follow the advice given previously and split the oe-layersetup modifications
dropping meta-qt5 and meta-arago-demos into 3 stages for the automation working
on the scarthgap* branches.

Randolph Sapp (2):
  meta-arago: remove dependency on meta-arago-demos
  arago.conf: enable opencl distro feature

 meta-arago-distro/conf/distro/arago.conf        |  2 +-
 .../recipes-core/images/tisdk-default-image.bb  | 13 -------------
 ...ackagegroup-arago-tisdk-addons-sdk-target.bb | 17 -----------------
 .../packagegroup-arago-tisdk-addons.bb          |  2 --
 .../packagegroup-arago-tisdk-hmi.bb             | 11 -----------
 .../recipes-core/packagegroups/ti-world.bb      | 10 +---------
 6 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb

-- 
2.48.1


