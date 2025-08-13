Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290D0CA0EFC
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.10029.1755127541207164574
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wpiWX+tM;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPe082177530;
	Wed, 13 Aug 2025 18:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127540; i=@ti.com;
	bh=/G0kcYXZkC1kzatF1bR0hcjMUjUrgFriSIMT422DN+I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wpiWX+tM9YveKH215d8O0XWBePbGuFGkhgOyMDS9m3BUP8AQSAA2SSMTY0p9Jo1dF
	 +kyMoHcXGlSnxSPr5wHt+gy53Oq+wx37UE80KZrt+imP4iPaUxuad4HmuPnE6Va0mB
	 jO/pT/qvT1NgX/6RHZc+xeVukKMvic+ULv5iZzu8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPdV81300233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:40 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:39 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPd0c3016295;
	Wed, 13 Aug 2025 18:25:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7A2951801A2; Wed, 13 Aug 2025 18:25:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202406260816
Date: Wed, 13 Aug 2025 18:25:39 -0500
Message-ID: <20250813232539.3905695-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1719433686-119000-1-git-send-email-lcpdbld@list.ti.com>
References: <1719433686-119000-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16386

meta-arago / na / 1719433686-119000-1-git-send-email-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202406260816
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 26 Jun 2024 15:28:06 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c92f4187a6b3271c36a731dd184d2dab2c5a1316

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202507311300
- Commit SHA: b253a46d52348996c2abcd9d309c1a8da1e63ca1

Patches
----------------------------------------
FAIL - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202406260816
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb: does not exist in index
    Applying: CI/CD Auto-Merger: cicd.scarthgap.202406260816
    Patch failed at 0001 CI/CD Auto-Merger: cicd.scarthgap.202406260816




