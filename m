Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC26CA0EF5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10021.1755127539241517647
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dp6txSkk;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPbJZ1750750;
	Wed, 13 Aug 2025 18:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127537; i=@ti.com;
	bh=nlkDxNWp8znFKVqHjHaNu8flqObF6ntNJkMzeVSrcG8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dp6txSkk2e0OvZPba/Vxqj2WOvUZSe9CM+tz6tBCghZQpWzhm7hKIyD4tQx/m++3o
	 /ZpgUoaKiWHLoD1/Sm3HmBou14TfEygRMJs1e1qeNa3La3+qXFSjZ6Oe81JXlGpcMr
	 tMpN6FVov8vLIDoSY4aP69dSsZTpl0VutPFJJQeo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPbxa1300220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPbXo3016269;
	Wed, 13 Aug 2025 18:25:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0D5AF13F538; Wed, 13 Aug 2025 18:25:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202312070100
Date: Wed, 13 Aug 2025 18:25:37 -0500
Message-ID: <20250813232537.3901306-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1701960339-77512-1-git-send-email-lcpdbld@list.ti.com>
References: <1701960339-77512-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16372

meta-arago / na / 1701960339-77512-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202312070100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 7 Dec 2023 08:45:39 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ece910bd130021b9cd7968099611f29439747560

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202312070100
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb: does not exist in index
    Applying: CI/CD Auto-Merger: cicd.master.202312070100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202312070100




