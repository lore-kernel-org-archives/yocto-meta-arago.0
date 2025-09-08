Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6572DCAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 19:00:28 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.3142.1757358018711275987
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 12:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zNnLNsAy;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588J0I9Q3929240
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 14:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757358018; i=@ti.com;
	bh=tC3pCgxIU1d9I8INt/NMcZA/geqoxPfV74b6puoYz8Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zNnLNsAyvlqSOqgnNGths8tV+8z6n1pqwQCohO71bFKlH6+oQt+VFJNRNEKx/nz34
	 LclKybA/WOEl/zJPhkOYc/cvwDEH8u211HUmg3TTgvy/dyCDP10pwqLZ5b/EWlmJ9k
	 pyizGTdNWyDLWXD16mgCQBSZz+TkZsVnTQ41Jaz8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588J0IqH3164157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 14:00:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 14:00:18 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 14:00:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588J0Hoc2679325;
	Mon, 8 Sep 2025 14:00:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DA1A013F52D; Mon,  8 Sep 2025 14:00:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH v3 0/3] opencl-clhpp: v2.0.16 ->  v2024.05.08
Date: Mon, 8 Sep 2025 14:00:17 -0500
Message-ID: <20250908190017.3536845-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250908185600.152317-1-a-christidis@ti.com>
References: <20250908185600.152317-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Sep 2025 19:00:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16551

meta-arago / na / 20250908185600.152317-1-a-christidis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH v3 1/3] opencl-headers: Use Cmake class
    WARN: Commit message does not include file/recipe name: opencl-headers: Use Cmake class. (COMMIT-MESSAGE-2)
        patch
WARN - [meta-arago][scarthgap][PATCH v3 2/3] opencl-headers: Specify  correct PV
    WARN: Commit message does not include file/recipe name: opencl-headers: Specify  correct PV. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v3 0/3] opencl-clhpp: v2.0.16 ->  v2024.05.08
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com> 
- Date: Date: Mon, 8 Sep 2025 13:55:57 -0500
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 53a355ebf952568b7940b59058edbf5fffb8e0f9

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509080400
- Commit SHA: 1517a1f7fcac22a35c21a424d96493172f8fd8b2

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




