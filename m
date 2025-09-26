Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD97FCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:15:29 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.12516.1758874521675551438
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 01:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JhQu7+pq;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58Q8FKwU2075331;
	Fri, 26 Sep 2025 03:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758874520; i=@ti.com;
	bh=PnKrksaSSTA5A4gZ/baovrXlfMSF9VhkBwZEQ/oQo+s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JhQu7+pq5qg4WVV2uxtkAREukAzuQx1HxUl2gB7s7lYvbvE0epi0tYe53rH2nReo4
	 ATKLrI4fGD26zTBQmM0AMbx188s4QgX1Dwhgt18vMYqYkLvLw+8lI12j1U0uW8yYYZ
	 piZBeNE3SkH0uvM4S/8Oc7AqnyeHkGJABBpcOcu4=
Received: from DFLE208.ent.ti.com (dfle208.ent.ti.com [10.64.6.66])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58Q8FKXG3843958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Sep 2025 03:15:20 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 26 Sep
 2025 03:15:19 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 03:15:19 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58Q8FJCW2740677;
	Fri, 26 Sep 2025 03:15:19 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 894F2181222; Fri, 26 Sep 2025 03:15:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202509260100
Date: Fri, 26 Sep 2025 03:15:19 -0500
Message-ID: <20250926081519.2622877-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250926081210.2079060-1-lcpdbld@list.ti.com>
References: <20250926081210.2079060-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:15:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16646

meta-arago / na / 20250926081210.2079060-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202509260100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.master.202509260100. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202509260100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 26 Sep 2025 03:12:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 56074b1d1e645f802d5daf40e606b0b16a47b4e1

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Make opencl-cts dependent on DISTRO_FEATURES
- Commit SHA: d3532063218f5c47b5e912554a0b236eb25e61f4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




