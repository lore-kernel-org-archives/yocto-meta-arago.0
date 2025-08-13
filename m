Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B67CA0EFB
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10168.1755127539262291664
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wvqOKBIc;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPbAH2177518;
	Wed, 13 Aug 2025 18:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127537; i=@ti.com;
	bh=MoGaWCYMoXLvxhS8tJ8ELgE44hBlTejhiAztRJuUOIc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wvqOKBIcY/EfECPyPgyVWth7H34aqqqRliYNTzBV5RXfvEclqzuu3Rz3YjTBYEqu+
	 pdXv9/PrIsRNVocWT++ZTr8M675FvmMqepMfKFLMmrTxQVVDCDiEVwy6Am1Aya+6Az
	 5g9r282EhIjvTuQhbe5eul4yi7VvN37kjeOZTrd8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPb5F1300224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:37 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPb5v2710049;
	Wed, 13 Aug 2025 18:25:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5613213F538; Wed, 13 Aug 2025 18:25:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202401090400
Date: Wed, 13 Aug 2025 18:25:37 -0500
Message-ID: <20250813232537.3901796-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1704821508-51569-1-git-send-email-lcpdbld@list.ti.com>
References: <1704821508-51569-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16374

meta-arago / na / 1704821508-51569-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202401090400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 9 Jan 2024 11:31:48 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7410930a27f5904b980be78128765a2217f139b7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: kirkstone
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: ti-test: Add rng-tools
- Commit SHA: f8ad2232a4e52b50aecc6c847ee7cfa24fc84070

Patches
----------------------------------------
FAIL - [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202401090400
    error: patch failed: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb:14
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb: patch does not apply
    Applying: CI/CD Auto-Merger: cicd.kirkstone.202401090400
    Patch failed at 0001 CI/CD Auto-Merger: cicd.kirkstone.202401090400




