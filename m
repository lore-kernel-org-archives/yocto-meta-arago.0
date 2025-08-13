Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF55CA0FF2
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10050.1755127550671720626
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=apq2fAyd;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPn0E1803041;
	Wed, 13 Aug 2025 18:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127549; i=@ti.com;
	bh=rIeAHy1prm1fnQeC91Dx/U3QBbzY4i2ePNWbp69ZZco=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=apq2fAyd50dmoNp/iKg7WaEXwWaOx7HLgUIVKQsPL5Z4ym7cbcJ1KLhrInt2Q4Fw+
	 8Qjhh6AIFGznLyHKyxr4yz0FJPPtMjGXkt1uYWSmKnJeDyRz59rRcmguq+eKu6sCOA
	 her+X19W0ttdS48O8R4WFTTMgCEbc7o7d2JsZVVI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPnU81300406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:49 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:49 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPnCI2710207;
	Wed, 13 Aug 2025 18:25:49 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 5AD8D142E31; Wed, 13 Aug 2025 18:25:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] images: Build
Date: Wed, 13 Aug 2025 18:25:49 -0500
Message-ID: <20250813232549.142982-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220314202840.18904-1-reatmon@ti.com>
References: <20220314202840.18904-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16423

meta-arago / na / 20220314202840.18904-1-reatmon

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
- Patch Series: [meta-arago][master/dunfell][PATCH] images: Build tisdk-thinklinux-image with tisdk-core-bundle
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 14 Mar 2022 15:28:40 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bf19c79b224ce4504f4879dc2378015cbd816860

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] images: Build tisdk-thinklinux-image with tisdk-core-bundle
    error: patch failed: meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc:32
    error: meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc: patch does not apply
    Applying: images: Build tisdk-thinklinux-image with tisdk-core-bundle
    Patch failed at 0001 images: Build tisdk-thinklinux-image with tisdk-core-bundle

dunfell
=====================
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] images: Build tisdk-thinklinux-image with tisdk-core-bundle
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 14 Mar 2022 15:28:40 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bf19c79b224ce4504f4879dc2378015cbd816860

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] images: Build tisdk-thinklinux-image with tisdk-core-bundle
    Applying: images: Build tisdk-thinklinux-image with tisdk-core-bundle
    Patch failed at 0001 images: Build tisdk-thinklinux-image with tisdk-core-bundle
    error: patch failed: meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc:32
    error: meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc: patch does not apply




