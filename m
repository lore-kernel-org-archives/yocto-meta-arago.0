Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0DBCA0EF9
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10040.1755127545248465560
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=b01F8WB9;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPiL21803025;
	Wed, 13 Aug 2025 18:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127544; i=@ti.com;
	bh=Kd2Yxbs1WRCGQqkPlgdK3dsztsJg7XjYom8kOXGPtUM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=b01F8WB9y15Wp/FGLrflEJLYfVdqZwj5aDm7qVP5ekVAKSv1f0t1h7/WJTkjNQSBm
	 AzSp45AqA+R3jphVjAJjPkMxxGyphiMEAvgaUtJv+OItfvCcApoDRRh3Rbb4gdqC8v
	 n+TBoXcrwB+8PwWqfJjOwpD0QMGTqsdvlRJT97Y0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPiHn1300278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:43 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:44 -0500
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPiMJ3678188;
	Wed, 13 Aug 2025 18:25:44 -0500
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id D2A7F18ECC8; Wed, 13 Aug 2025 18:25:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202404100939
Date: Wed, 13 Aug 2025 18:25:43 -0500
Message-ID: <20250813232543.2437134-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1712772537-126026-1-git-send-email-lcpdbld@list.ti.com>
References: <1712772537-126026-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16404

meta-arago / na / 1712772537-126026-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202404100939
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 10 Apr 2024 13:08:57 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 202b42fd5cda651324e676a78e285edcc7385a5e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202404100939
    Applying: CI/CD Auto-Merger: cicd.master.202404100939
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202404100939
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb: does not exist in index




