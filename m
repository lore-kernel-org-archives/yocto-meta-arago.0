Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71573CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 07:45:28 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.19902.1759218318824799015
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 00:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qKuIpJHY;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58U7jIar2403686;
	Tue, 30 Sep 2025 02:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759218318; i=@ti.com;
	bh=WIqmvnbN4LDx2+dI+gbIdvwZ5c5fCI43tKqV/E56zZI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qKuIpJHYD+Q+PxUsFLAI6OrtkseKK+WBt8hznDdZo8nllFCNpr3K1dknV8LcMJFIh
	 b+UhVTWl+8qmG/lIyQ0v1bSUf9y72x2bSkjQYbJjcCiJIEq8tPb3gOW4ZNwwCvq6nS
	 nE95R0cMIrwwHPvv5vSNKNCCFKOpQkfPQectXmpw=
Received: from DFLE211.ent.ti.com (dfle211.ent.ti.com [10.64.6.69])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58U7jHsv2942286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Sep 2025 02:45:18 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Sep
 2025 02:45:17 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 02:45:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58U7jHSi2219694;
	Tue, 30 Sep 2025 02:45:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5B6DC13F538; Tue, 30 Sep 2025 02:45:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202509300100
Date: Tue, 30 Sep 2025 02:45:17 -0500
Message-ID: <20250930074517.1496296-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250930074420.281935-1-lcpdbld@list.ti.com>
References: <20250930074420.281935-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Sep 2025 07:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16657

meta-arago / na / 20250930074420.281935-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202509300100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.master.202509300100. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202509300100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 30 Sep 2025 02:44:20 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b2c8129d455b392df3bbfd839365aef694c6ce96

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko <denys@konsulko.com>
- Commit Subject: linux-firmware-arago: correct removal of overlapping FW
- Commit SHA: 46c521996fdcca29deb38e24b53a9f4534555e3c

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




