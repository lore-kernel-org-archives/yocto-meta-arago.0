Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA487CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 18:15:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.23663.1757700922383167467
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 11:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fMje63AX;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CIFJdb1023884;
	Fri, 12 Sep 2025 13:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757700919; i=@ti.com;
	bh=1Jz/YbmEDfwysYt/HoKU1H+fken2OLnvAkfCrlhF2Lc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fMje63AXgF+3jH8rapWAZGvvsRqN1JY+OntGwVfOZSQU3vFJa5ijmsUAOg4u7Z9vF
	 ViCt8XY3zOQe9X9htYzlhirImNl2hd+oTYcqMA17QPHkgrWYICcfJuP1gJSO9qh/7p
	 ZIpKwfeU1Jya72t7eKTk2wuVdDav6+swSingYyx0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CIFJSq1482084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 13:15:19 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 13:15:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 13:15:19 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CIFJCD110774;
	Fri, 12 Sep 2025 13:15:19 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4C4E116A91C; Fri, 12 Sep 2025 13:15:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>,
        <meta-arago@lists.yoctoproject.org>,
        Chirag
 Shilwant <c-shilwant@ti.com>
Subject: Re: [master/scarthgap][PATCH v2] hwspinlocktest: Update hwspinlock recipe remote repo url
Date: Fri, 12 Sep 2025 13:15:19 -0500
Message-ID: <20250912181519.1283508-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250912181407.2647500-1-jm@ti.com>
References: <20250912181407.2647500-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Sep 2025 18:15:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16576

meta-arago / na / 20250912181407.2647500-1-jm

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/scarthgap][PATCH v2] hwspinlocktest: Update hwspinlock recipe remote repo url
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [master/scarthgap][PATCH v2] hwspinlocktest: Update hwspinlock recipe remote repo url
- Submitter: From: Judith Mendez <jm@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Judith Mendez <jm@ti.com>
- Date: Date: Fri, 12 Sep 2025 13:14:07 -0500
-Date: Fri, 11 Apr 2025 13:49:11 -0500
-Date: Mon, 18 Nov 2024 14:57:45 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d84184bddaac3349212c367e72b8a48731b1de49

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
- Patch Series: [master/scarthgap][PATCH v2] hwspinlocktest: Update hwspinlock recipe remote repo url
- Submitter: From: Judith Mendez <jm@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Judith Mendez <jm@ti.com>
- Date: Date: Fri, 12 Sep 2025 13:14:07 -0500
-Date: Fri, 11 Apr 2025 13:49:11 -0500
-Date: Mon, 18 Nov 2024 14:57:45 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d84184bddaac3349212c367e72b8a48731b1de49

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509111148
- Commit SHA: 67c473bc6d88a2cce13b2e8c36fcb79cb0015339

Patches
----------------------------------------
FAIL - [master/scarthgap][PATCH v2] hwspinlocktest: Update hwspinlock recipe remote repo url
    error: patch failed: meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb:6
    error: meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb: patch does not apply
    Applying: hwspinlocktest: Update hwspinlock recipe remote repo url
    Patch failed at 0001 hwspinlocktest: Update hwspinlock recipe remote repo url




