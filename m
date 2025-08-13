Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05471CA0EF3
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10167.1755127539249177628
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Kq52Yt+l;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPbCx2177512;
	Wed, 13 Aug 2025 18:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127537; i=@ti.com;
	bh=te3ZHeKAGb37ZTIMwzfptKgpQMC2ifDchuR6ajUbn/Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kq52Yt+lfqQZz8gPGnn8RF/9TJPRjcqsWG/OijCvRMs68Hpxesfaep+1nkYiw4e/Y
	 ztbNQwf5EqLSQ8kkvHWJnF0srB0MFASxwa2YU43Q9XwVZhchOwUMTuOSSfY9vFNOw3
	 OCR6pBY0JwQOzVyH+Fvpwus6GU0Yd1oZMOaMhlBE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPbT4403333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:37 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:37 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:37 -0500
Received: from fllvdckhpci027.itg.ti.com (fllvdckhpci027.itg.ti.com [10.64.72.35])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPbg63610966;
	Wed, 13 Aug 2025 18:25:37 -0500
Received: by fllvdckhpci027.itg.ti.com (Postfix, from userid 60899)
	id 01521138DB2; Wed, 13 Aug 2025 18:25:36 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202407080100
Date: Wed, 13 Aug 2025 18:25:36 -0500
Message-ID: <20250813232536.1775975-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1720433969-49499-1-git-send-email-lcpdbld@list.ti.com>
References: <1720433969-49499-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16371

meta-arago / na / 1720433969-49499-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202407080100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 8 Jul 2024 05:19:29 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1b22e6d4253154923da414c56e0dc0e3288152c0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202407080100
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb: does not exist in index
    Applying: CI/CD Auto-Merger: cicd.master.202407080100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202407080100




