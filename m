Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4817ECCF9E0
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 21:30:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2431.1761255019729926667
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 14:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=H+FON9d0;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NLUIQI625390;
	Thu, 23 Oct 2025 16:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761255018; i=@ti.com;
	bh=namGcrHhAadnS/H6P7IxQPlbKMWMzYZaijaj4ZsBg1o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H+FON9d0PjRufEaCi8ow5xgtngqP8ZeIDAzK6tmyezLNmzY7h2nk+B+kLE9GftW8j
	 kQh0LqVU/Yr0H50LC1MykEteRpnQy8eUHo7KioUCmQDRSyfgZeHVLw71WaSQVHw0Ae
	 5ng8FCemaMEAnCVmbvDdSQHafCZPw0TI/IbXivmA=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NLUIAD3104713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 16:30:18 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 16:30:18 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 16:30:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NLUITn628429;
	Thu, 23 Oct 2025 16:30:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5CD0918122A; Thu, 23 Oct 2025 16:30:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510231214
Date: Thu, 23 Oct 2025 16:30:18 -0500
Message-ID: <20251023213018.3560169-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251023212622.4160097-1-lcpdbld@list.ti.com>
References: <20251023212622.4160097-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Oct 2025 21:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16702

meta-arago / na / 20251023212622.4160097-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510231214
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202510231214. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510231214
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 23 Oct 2025 16:26:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 69d0edc60134e2dcdf1c52903a42d33f02963458

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: packagegroup-arago-standalone-sdk-target: Remove duplicate opkg-dev
- Commit SHA: a549badeba71618ecbce347cfc8dec9b1ea10354

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




