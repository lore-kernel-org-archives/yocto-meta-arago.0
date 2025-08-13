Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D10AC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:44 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10036.1755127543531740072
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EVP/4N05;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPg9l1803013;
	Wed, 13 Aug 2025 18:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127542; i=@ti.com;
	bh=8CaDH9i75Rup4d8fbD4CszsTckGWb6MUwoTrUm7SKgY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EVP/4N05AZDhiXYegdtEIV97BbWLCZkIL5isd0GrYOm1x0x9874N5MlAEmAl5M0pW
	 rtoNRrwAiwcb81x3L2i6qOxSsUC3zvLnQDlKni/s/ebFl28D+whzFJJ4MIT6GJcAJT
	 AArJKuTWz9FqgPN5YxbkzkJR10GxwR0MhutBVnj8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPgbV1300267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:42 -0500
Received: from fllvdckhpci097.itg.ti.com (fllvdckhpci097.itg.ti.com [10.64.72.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPg613016355;
	Wed, 13 Aug 2025 18:25:42 -0500
Received: by fllvdckhpci097.itg.ti.com (Postfix, from userid 60899)
	id 63A311389BE; Wed, 13 Aug 2025 18:25:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202406280400
Date: Wed, 13 Aug 2025 18:25:42 -0500
Message-ID: <20250813232542.635453-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1719586071-89850-1-git-send-email-lcpdbld@list.ti.com>
References: <1719586071-89850-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16395

meta-arago / na / 1719586071-89850-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202406280400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 28 Jun 2024 09:47:51 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: dfaf5825534636396701a55f63b50ddd9943b5ad

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202507311300
- Commit SHA: b253a46d52348996c2abcd9d309c1a8da1e63ca1

Patches
----------------------------------------
FAIL - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202406280400
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb: does not exist in index
    Applying: CI/CD Auto-Merger: cicd.scarthgap.202406280400
    Patch failed at 0001 CI/CD Auto-Merger: cicd.scarthgap.202406280400




