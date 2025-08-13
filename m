Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114CACA0FF4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.10047.1755127549847376263
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=e29tQnID;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPkeb2177566;
	Wed, 13 Aug 2025 18:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127546; i=@ti.com;
	bh=T25kqwXCNFQu1O3NGR2rvUfOvZ/4CRlOMzQscA4CEk4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=e29tQnID09DwyQ2maHzuSGmHp0BoyaDkXbNMlxx+kZ0cODfT93gtRvOP5ghJVag1p
	 ArOE36LtWZBYB7zwc93zckIOGhUCZUjsMq7i5tYuegYhEO3IAX4DFFlMd1nq+30Sk1
	 bKWqfLWlGseMnqbAPUKW0BtJFFTYZ8zFejFvxYJM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPkRg1412325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:46 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:46 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:46 -0500
Received: from fllvdckhpci101.itg.ti.com (fllvdckhpci101.itg.ti.com [10.64.72.84])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPkoR3611036;
	Wed, 13 Aug 2025 18:25:46 -0500
Received: by fllvdckhpci101.itg.ti.com (Postfix, from userid 60899)
	id 1AF3D4DC43; Wed, 13 Aug 2025 18:25:46 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202408050100
Date: Wed, 13 Aug 2025 18:25:46 -0500
Message-ID: <20250813232546.2900658-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1722854663-30384-1-git-send-email-lcpdbld@list.ti.com>
References: <1722854663-30384-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16418

meta-arago / na / 1722854663-30384-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202408050100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 5 Aug 2024 05:44:23 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bfa37e1a2f1bf16d1d099046e877b9cba19bceff

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202408050100
    Applying: CI/CD Auto-Merger: cicd.master.202408050100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202408050100
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb: does not exist in index




