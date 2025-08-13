Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E916CA0EF8
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10060.1755127555243749645
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RhGNJ4KS;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPsE01750964;
	Wed, 13 Aug 2025 18:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127554; i=@ti.com;
	bh=e2gQx4YVAww9INVCrDaqpx/GJA+O77SaMgsiSIBZnGE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RhGNJ4KSh+fYN3k88RxmJgVWXeuJhkT15T2wk/VrYPYTGqUI5IQZ5dnasjEm9XeyD
	 s4RzELm6Gwpdr/iv0+8BBlx+C+bYF6Yuobv4vkBPRNjJleDZqjyL5SVwoiODqDljeF
	 ynwzdEhjEs7LefFnH5mcqDmODgcrQxj49B4euntI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPr4P1300439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:53 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:53 -0500
Received: from fllvdckhpci081.itg.ti.com (fllvdckhpci081.itg.ti.com [10.64.72.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPrkb3016596;
	Wed, 13 Aug 2025 18:25:53 -0500
Received: by fllvdckhpci081.itg.ti.com (Postfix, from userid 60899)
	id 9C6781523D8; Wed, 13 Aug 2025 18:25:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt
Date: Wed, 13 Aug 2025 18:25:53 -0500
Message-ID: <20250813232553.3722441-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220609170520.31162-1-afd@ti.com>
References: <20220609170520.31162-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16444

meta-arago / na / 20220609170520.31162-1-afd

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
- Patch Series: [meta-arago][dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt for k3
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 9 Jun 2022 12:05:20 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8da349cb70fe1f8fe4aeea255ccd9fea800459c5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt for k3
    Applying: tisdk-uenv: remove uEnv.txt for k3
    Patch failed at 0001 tisdk-uenv: remove uEnv.txt for k3
    error: meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt: does not exist in index

master
=====================
Summary:
- Patch Series: [meta-arago][dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt for k3
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 9 Jun 2022 12:05:20 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8da349cb70fe1f8fe4aeea255ccd9fea800459c5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt for k3
    Applying: tisdk-uenv: remove uEnv.txt for k3
    Patch failed at 0001 tisdk-uenv: remove uEnv.txt for k3
    error: meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt: does not exist in index




