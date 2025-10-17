Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4379CCCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 21:05:44 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.3735.1760735141691919570
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Oct 2025 14:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZYHvXYtm;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59HL5eWH364726;
	Fri, 17 Oct 2025 16:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760735140; i=@ti.com;
	bh=HW0FGUC9IpXPei74QW8lM9856bcc8VxU2d7k+VF/R+k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZYHvXYtmJ5BJzBZ8O1/4mZHqmsUrvL4uqhrrDm6NIuDfQS1mCcN7UUGQUhiWbnVmo
	 IihzOFR5daMu27JcQXw1nOhWf/VOxiAlTWkpqHVBYMiiGzQlhf8KGCsYSoxRM+alAz
	 Z7OOk9p6p+Mqer6LsqvX59ou9mra2/vLuzL9cRDM=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59HL5exi2672425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 16:05:40 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 16:05:40 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 16:05:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59HL5eXt3390481;
	Fri, 17 Oct 2025 16:05:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7704D180193; Fri, 17 Oct 2025 16:05:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510170857
Date: Fri, 17 Oct 2025 16:05:40 -0500
Message-ID: <20251017210540.262273-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251017210337.1556670-1-lcpdbld@list.ti.com>
References: <20251017210337.1556670-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Oct 2025 21:05:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16693

meta-arago / na / 20251017210337.1556670-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510170857
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202510170857. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510170857
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 17 Oct 2025 16:03:37 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 38c834bb3306bac762fd892162b0047245920376

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-arago-extras: hevc-arm-decoder: Remove this recipe
- Commit SHA: 4e4e64fca24816d48a42d84c6973d1e2577b463d

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




