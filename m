Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C66DC7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 19:41:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3676.1686253261882864991
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 12:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WakaTO+4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358Jf1c1071995
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 14:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686253261;
	bh=FPKACGG27HQOF6iJUmF3EbLwV9trpLURKNK9bVgbgIk=;
	h=From:To:CC:Subject:Date;
	b=WakaTO+4bxseUL7xoR1h1NtkK2NJ3bgEwd/ZvjC690O7nbxBridDxuAtHZyEcLBRl
	 sC5SaAtR4K/wH1f0Flcw6y2YftCGEvM0A6Jh/CU5Rh4/rzoKynDJQo6M+6P64vhEru
	 phb6PGZjcLfIijAAwIWp7EJXVjjEhntvFm4VD5os=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358Jf1hZ011491
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 14:41:01 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 14:41:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 14:41:01 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358JewG5082933;
	Thu, 8 Jun 2023 14:40:59 -0500
From: <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>,
        <praneeth@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 0/2] Removing SDK scripts that do not belong here anymore
Date: Fri, 9 Jun 2023 01:10:34 +0530
Message-ID: <20230608194036.906437-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 19:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14553

From: Aniket Limaye <a-limaye@ti.com>

Below recies were adding scripts that depend on the Rules.Make added by
Makefile or on the source ipk packages, both of which were removed from
meta-arago. This series is just clean up

Aniket Limaye (2):
  tisdk-install: Remove tisdk-install from meta-arago
  unshallow-repositories: Remove from meta-arago

 .../tisdk-install/sdk-install.sh              | 129 ------------------
 .../tisdk-install/tisdk-install_1.0.bb        |  15 --
 .../unshallow-repositories.sh                 | 110 ---------------
 .../unshallow-repositories_1.0.bb             |  16 ---
 4 files changed, 270 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
 delete mode 100755 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
 delete mode 100644 meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb

-- 
2.34.1


