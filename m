Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53C6CA1001
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10063.1755127555828281384
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Apia0ly+;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPsrx1803081;
	Wed, 13 Aug 2025 18:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127554; i=@ti.com;
	bh=IHz6EXqftII/EJ1JfjqjVoOu2UMTRBnTyX3NFQw4TtA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Apia0ly+o5+WoGKnfOgYV4qGgQHt1AaGciRrEuEz2q803MMQ/A0S2QfCUC6kksdS8
	 jyRQRDfplxOCRclHEQwDRuQ6HICYodJ14UyWqAQ2pod1/e7MF4PGnjQr5LA1exT2rQ
	 YnKwDJRnpk3tPtnUCB5oRZZ0smFNL6ejAXWyR5Uo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPsrQ403447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:54 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:54 -0500
Received: from fllvdckhpci098.itg.ti.com (fllvdckhpci098.itg.ti.com [10.64.72.64])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPs5w3016603;
	Wed, 13 Aug 2025 18:25:54 -0500
Received: by fllvdckhpci098.itg.ti.com (Postfix, from userid 60899)
	id EAA5A2C3B; Wed, 13 Aug 2025 18:25:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>, <devarsht@ti.com>, <s-adivi@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add ti-sci-firmware
Date: Wed, 13 Aug 2025 18:25:53 -0500
Message-ID: <20250813232553.1393687-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220512152846.661-1-a-m1@ti.com>
References: <20220512152846.661-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16448

meta-arago / na / 20220512152846.661-1-a-m1

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
dunfell
=====================
Summary:
- Patch Series: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add ti-sci-firmware binary to prebuilt-images directory of SDK
- Submitter: From: Aparna M <a-m1@ti.com>
- Date: Date: Thu, 12 May 2022 20:58:46 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 83a78130c6358a105f1334a7120232ee754e2c34

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add ti-sci-firmware binary to prebuilt-images directory of SDK
    Applying: tisdk-core-bundle: Add ti-sci-firmware binary to prebuilt-images directory of SDK
    Patch failed at 0001 tisdk-core-bundle: Add ti-sci-firmware binary to prebuilt-images directory of SDK
    error: patch failed: meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb:21
    error: meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb: patch does not apply




