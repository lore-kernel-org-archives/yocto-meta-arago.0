Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB93C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 17:12:46 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4857.1739293963679157425
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 09:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qO4zY1sG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51BHCfMX3641084
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 11:12:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739293961;
	bh=EbUbeJha4osfRXmGucQMcwb/tIs+S2GIZC/RRnOYYFs=;
	h=From:To:Subject:Date;
	b=qO4zY1sGzcMxUhElVHWJDNj9WXOpzK11h8PETHVB/maHG88G0ETPSTh2rX3j+7ltX
	 OYuV5KTlflckJW+atJZ/JTRPICu5PpSgdu4EhdRkT1KAE+LYVWTg89eMV1Tl1Nz4SD
	 mETqCguMW8VZmtzOg/RK9vhtK1lJ7DWSL1taLKqU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51BHCf80028827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Feb 2025 11:12:41 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 11:12:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 11:12:41 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51BHCfgK074507;
	Tue, 11 Feb 2025 11:12:41 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1thtoO-0001YU-Uf; Tue, 11 Feb 2025 11:12:40 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] meta-toolchain-arago: Move from meta-arago-extras to meta-arago-distro
Date: Tue, 11 Feb 2025 11:12:40 -0600
Message-ID: <20250211171240.5937-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Feb 2025 17:12:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15838

In running yocto-check-layer, it was discovered that the
meta-toolchain-arago.bb recipe depends on tisdk-sw-manifest.bbclass
which is in meta-arago-distro.  But meta-arago-distro depends on
meta-arago-extras so we cannot have extras depend on distro.

Simple fix, move the impacted recipes into the distro layer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb                     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-extras => meta-arago-distro}/recipes-core/meta/meta-toolchain-arago.bb (100%)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
similarity index 100%
rename from meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
rename to meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
-- 
2.17.1


