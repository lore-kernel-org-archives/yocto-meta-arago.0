Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE88CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 23:09:07 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.713.1758150540543650156
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 16:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rMuwxcRn;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HN8x0Y1618333
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 18:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758150539;
	bh=kCTcIOorZCtjDgVPJ+rKC4GYaxExpAE1i+RbqYG554o=;
	h=From:To:Subject:Date;
	b=rMuwxcRnW41jikVmVld7EfOI1Tr63vmOxZPXilgPa8uVXrA7XFubnBrnlScfnvqcZ
	 VgVQk5y7Jp6KhTQJKn2S0OehUxcb9Zu5MgDqmqSbVb9xYgX0RZXCcwqgKf2dPwClWO
	 pQqneMFfKZWYkL8f3aVrekCyln05G6iOZhU9bMXE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HN8xBU1105241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 18:08:59 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 18:08:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 18:08:59 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HN8xbO4118378;
	Wed, 17 Sep 2025 18:08:59 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v1 0/2] Add ktx-software
Date: Wed, 17 Sep 2025 18:08:57 -0500
Message-ID: <20250917230859.2083846-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 23:09:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16589

From: Antonios Christidis <a-christidis@ti.com>

Introduce recipe for ktx-software, version 4.4.0.

This patch series is backported from [1].

ktx-software is needed as it is a build & runtime dependency for the 
upcoming graphics compressed texture test demo/app. Recipe for that 
is coming soon. 

[1] https://patchwork.yoctoproject.org/project/oe/list/?series=36661&state=*


Antonios Christidis (2):
  licenses: Add licenses for ktx-software
  ktx-software: Add recipe v4.4.0

 .../licenses/Cesium-Trademark-Terms           |  39 +++++++
 meta-arago-test/licenses/ETCSLA               | 109 ++++++++++++++++++
 meta-arago-test/licenses/HI-Trademark         |   5 +
 meta-arago-test/licenses/Kodak                |   7 ++
 meta-arago-test/licenses/PNGSuite             |  14 +++
 meta-arago-test/licenses/fmt                  |  27 +++++
 .../ktx-software/ktx-software_4.4.0.bb        |  19 +++
 7 files changed, 220 insertions(+)
 create mode 100644 meta-arago-test/licenses/Cesium-Trademark-Terms
 create mode 100644 meta-arago-test/licenses/ETCSLA
 create mode 100644 meta-arago-test/licenses/HI-Trademark
 create mode 100644 meta-arago-test/licenses/Kodak
 create mode 100644 meta-arago-test/licenses/PNGSuite
 create mode 100644 meta-arago-test/licenses/fmt
 create mode 100644 meta-arago-test/recipes-graphics/ktx-software/ktx-software_4.4.0.bb

-- 
2.34.1


