Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4377C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 13:04:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12858.1686315859037973792
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 06:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qhtCDGPv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359D4HZW026653
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 08:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686315857;
	bh=Z6F8G+5PHwMiqByV5SBbeSpcEbi2MvBcIOWUgiED0Fc=;
	h=From:To:CC:Subject:Date;
	b=qhtCDGPv4aeJgj+WrBPZLRCEnQcAStJf8SoQw9yqvelELMTRnkrZU18R4SfJF5js+
	 n4pqYSJ2CvbhatrixqqYqyXrisoVXl5XOgmyn16WVeVclibe08Hebr8i7528Q0Lpz+
	 bHknGW1ZyKg7NMJlJXTKDRCKBKA+dyjvvpNZfxV8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359D4H8o089174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 08:04:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 08:04:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 08:04:17 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359D4F0J066333;
	Fri, 9 Jun 2023 08:04:15 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>,
        <praneeth@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2 0/2] Removing SDK scripts that do not belong here anymore
Date: Fri, 9 Jun 2023 18:33:34 +0530
Message-ID: <20230609130336.1304394-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 13:04:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14569

Below recies were adding scripts that depend on the Rules.Make added by
Makefile or on the source ipk packages, both of which were removed from
meta-arago. This series is just clean up

---

Change from v1:
- Somehow had forgotten to remove packages from packagegroups. Now
  removed tisdk-install from amsdk-sdk-kost group. Did not find any
  reference to unshallow-repositories

Aniket Limaye (2):
  tisdk-install: Remove tisdk-install from meta-arago
  unshallow-repositories: Remove from meta-arago

 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |   1 -
 .../tisdk-install/sdk-install.sh              | 129 ------------------
 .../tisdk-install/tisdk-install_1.0.bb        |  15 --
 .../unshallow-repositories.sh                 | 110 ---------------
 .../unshallow-repositories_1.0.bb             |  16 ---
 5 files changed, 271 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
 delete mode 100755 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb

-- 
2.34.1


