Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC8BCA0EE8
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:44 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10171.1755127540614697585
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=htC4uqVU;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPdJL1802985;
	Wed, 13 Aug 2025 18:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127539; i=@ti.com;
	bh=u0yn88zj2R2fsPoinefHSwI2r0elxtLHmCESRRvI+7w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=htC4uqVUHgifAYHn6FRIe2QQ6rUXa3Instcq4X7zi5zaQldVJouXaJBjQlLxDt+cH
	 d+Z0BcN5JJR+ALeU4uzCwQBSx/rQ+Y0NCZwBuQmvDfdKOUllIiSyJbnWcMqx5SkXDn
	 IHKUoZfsnehSDX85aGYaFjtxbkoERHxNvre/iqrg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPdHa727113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:39 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:39 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPdaN2710068;
	Wed, 13 Aug 2025 18:25:39 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 2C0FA142E3A; Wed, 13 Aug 2025 18:25:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202401251532
Date: Wed, 13 Aug 2025 18:25:39 -0500
Message-ID: <20250813232539.124478-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1706243481-75839-1-git-send-email-lcpdbld@list.ti.com>
References: <1706243481-75839-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16377

meta-arago / na / 1706243481-75839-1-git-send-email-lcpdbld

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
kirkstone
=====================
Summary:
- Patch Series: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202401251532
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 25 Jan 2024 22:31:21 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 464c42723d746563f053107e24993691b65f9611

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: kirkstone
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: ti-test: Add rng-tools
- Commit SHA: f8ad2232a4e52b50aecc6c847ee7cfa24fc84070

Patches
----------------------------------------
FAIL - [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202401251532
    Applying: CI/CD Auto-Merger: cicd.kirkstone.202401251532
    Patch failed at 0001 CI/CD Auto-Merger: cicd.kirkstone.202401251532
    error: patch failed: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb:14
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb: patch does not apply




