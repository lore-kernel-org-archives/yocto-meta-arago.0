Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8123CCAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 21:10:27 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.541.1757625021336353861
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 14:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ANNCq+Ns;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BLAIfx889283;
	Thu, 11 Sep 2025 16:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757625018; i=@ti.com;
	bh=AgkiH4IM5iiWQRtfdo1EMwtxUGSp/tW1Rx+qS4CErQI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ANNCq+Ns8/4oS4rwNKoZTCQR7kpkNztxjzGDVgSgXOG38ngEuW/+E5wM7m60ilmt1
	 uY57MOobfzdP/eVPz/cZ83zW0OxXy1PULLwqhHFcKZ6tpx5f1LxV0RUn3ZZSI3ghe0
	 ryltXk6MjnRdS8mqypfawXWstCRFp5rArb1380Cc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BLAImL1376967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 16:10:18 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 16:10:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 16:10:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BLAIsc2855997;
	Thu, 11 Sep 2025 16:10:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 65F84168FED; Thu, 11 Sep 2025 16:10:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [master/scarthgap][PATCH] hwspinlocktest: Update hwspinlock recipe remote repo url
Date: Thu, 11 Sep 2025 16:10:18 -0500
Message-ID: <20250911211018.2042953-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250911210645.2142573-1-jm@ti.com>
References: <20250911210645.2142573-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 21:10:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16570

meta-arago / na / 20250911210645.2142573-1-jm

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
- Patch Series: [master/scarthgap][PATCH] hwspinlocktest: Update hwspinlock recipe remote repo url
- Submitter: From: Judith Mendez <jm@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Judith Mendez <jm@ti.com>
- Date: Date: Thu, 11 Sep 2025 16:06:45 -0500
-Date: Fri, 11 Apr 2025 13:49:11 -0500
-Date: Mon, 18 Nov 2024 14:57:45 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f31e15e8203a40c39a6a13448a4416fea74746bd

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: chromium: Replace /dev/video* with Chromium naming convention
- Commit SHA: e3ad867e65837c5892885b41510d09699b5a4b62

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [master/scarthgap][PATCH] hwspinlocktest: Update hwspinlock recipe remote repo url
- Submitter: From: Judith Mendez <jm@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Judith Mendez <jm@ti.com>
- Date: Date: Thu, 11 Sep 2025 16:06:45 -0500
-Date: Fri, 11 Apr 2025 13:49:11 -0500
-Date: Mon, 18 Nov 2024 14:57:45 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f31e15e8203a40c39a6a13448a4416fea74746bd

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509111148
- Commit SHA: 67c473bc6d88a2cce13b2e8c36fcb79cb0015339

Patches
----------------------------------------
FAIL - [master/scarthgap][PATCH] hwspinlocktest: Update hwspinlock recipe remote repo url
    error: patch failed: meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb:6
    error: meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb: patch does not apply
    Applying: hwspinlocktest: Update hwspinlock recipe remote repo url
    Patch failed at 0001 hwspinlocktest: Update hwspinlock recipe remote repo url




