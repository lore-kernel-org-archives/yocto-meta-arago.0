Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8865ECA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:30:31 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.58683.1758562225239407904
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 10:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=H8/LLSqW;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MHUNT81282622;
	Mon, 22 Sep 2025 12:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758562223; i=@ti.com;
	bh=xNgb1EXFsaUC/f1DmciHg24IufZJaH5gKjoq+G9uH64=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H8/LLSqW3+GRZExwIxwBktYfJzpns1gwBd95sTBURpXkmv4+UReRyHIrWe/NcksH0
	 UeXWLuILqPHtD1k9r1xk0QUiHb1b2D8yrpsCtNH7fOGq678zO/QMWEBikwpqyqCkh5
	 lmRGODduJc5qBVGXiORpI9k1sosmWhFRykk3P+tA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MHUN4b466102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 12:30:23 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 12:30:23 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 12:30:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MHUNUU3410749;
	Mon, 22 Sep 2025 12:30:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4BC0116A265; Mon, 22 Sep 2025 12:30:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ti-test: Make opencl-cts dependent on DISTRO_FEATURES
Date: Mon, 22 Sep 2025 12:30:23 -0500
Message-ID: <20250922173023.1558474-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250922172501.21690-1-reatmon@ti.com>
References: <20250922172501.21690-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Sep 2025 17:30:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16609

meta-arago / na / 20250922172501.21690-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] ti-test: Make opencl-cts dependent on DISTRO_FEATURES
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Sep 2025 12:25:01 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 03cf38ecc6cce8d5bcb88988a8807008b4c12be9

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202509220100
- Commit SHA: bc4070905b7434a863b5a6e9eb50d40db75e38cf

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




