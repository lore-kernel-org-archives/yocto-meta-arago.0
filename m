Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983C0CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 14:36:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.10218.1760106970165414344
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Oct 2025 07:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o6Lh7rv4;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59AEa9Fs785246;
	Fri, 10 Oct 2025 09:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760106969; i=@ti.com;
	bh=4rHlc0RvKKwkgMEnjSWrKp+IoQbAqYLDY+O7jtH36Yg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o6Lh7rv4rvvBbPFWO63m4UgPU+0nYy/uFdKpozg+9jh+4ZXLEIpP+TwVAbaSIGqFT
	 Tgy9orIf0EpTlSZrEbZmXJyrtzCmCjXD7u5thbnGxwgJegc9o9DjGH4a02AmPKdv6p
	 JvHoG2V/Qu8e1TTgQVrFtj42LPRVpAA4ChL/iFeo=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59AEa9Y01743649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 09:36:09 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 09:36:08 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 09:36:08 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59AEa8kG3258586;
	Fri, 10 Oct 2025 09:36:08 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AD63313F536; Fri, 10 Oct 2025 09:36:08 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] pm-qa: Add PATCHTOOL = "git"
Date: Fri, 10 Oct 2025 09:36:08 -0500
Message-ID: <20251010143608.2941813-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251010143231.370-1-reatmon@ti.com>
References: <20251010143231.370-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 10 Oct 2025 14:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16681

meta-arago / na / 20251010143231.370-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] pm-qa: Add PATCHTOOL = "git"
    WARN: Commit message does not include file/recipe name: pm-qa: Add PATCHTOOL = "git". (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] pm-qa: Add PATCHTOOL = "git"
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 10 Oct 2025 09:32:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7eca86dd0b5bfd55a1c7f09897c58d4fb6d7863b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510100100
- Commit SHA: 7b9e9923326f558d0c7a329e2c83f3fc16f4cc49

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




