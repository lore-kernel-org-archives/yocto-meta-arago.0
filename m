Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D302FC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:26:07 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.10071.1755127557669896312
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=guBW1yFF;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPuXx2252553;
	Wed, 13 Aug 2025 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127556; i=@ti.com;
	bh=uoX7NyUgfJBF5FbZByfUqmQWUf2TuEkktpDS6pDFtRc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=guBW1yFF129J14fSra2fEZ72/Pj7H+b5RKdEvLPSvJxYFL0o3SOCF6C0NepOs3+De
	 lRxpg+4i1SaME7WyuCJ5l6qYxROMtTt/+rQlzIk0GXI7Y/s0+k+COJrQ/0vlrBR9qh
	 b7Ce/oFLZfkazUcKAmtLEKFNtzs2cBTfldsxDIHc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPuEn403469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:56 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:56 -0500
Received: from fllvdckhpci086.itg.ti.com (fllvdckhpci086.itg.ti.com [10.64.72.34])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPudA3016647;
	Wed, 13 Aug 2025 18:25:56 -0500
Received: by fllvdckhpci086.itg.ti.com (Postfix, from userid 60899)
	id 82515C516; Wed, 13 Aug 2025 18:25:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] tisdk-addons: Remove libdrm-kms from the dependencies
Date: Wed, 13 Aug 2025 18:25:56 -0500
Message-ID: <20250813232556.1591884-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20221130221348.6803-1-reatmon@ti.com>
References: <20221130221348.6803-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16460

meta-arago / na / 20221130221348.6803-1-reatmon

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
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH 1/2] tisdk-addons: Remove libdrm-kms from the dependencies
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 30 Nov 2022 16:13:48 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: e4ff340b9b47870bc1b579671a0b7fe17a17795b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH 1/2] tisdk-addons: Remove libdrm-kms from the dependencies
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:16
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb: patch does not apply
    Applying: tisdk-addons: Remove libdrm-kms from the dependencies
    Patch failed at 0001 tisdk-addons: Remove libdrm-kms from the dependencies




