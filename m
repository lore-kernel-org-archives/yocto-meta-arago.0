Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F74CCAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:20:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.15457.1758630025072311244
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 05:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uuMIb9PO;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NCKLBx987623;
	Tue, 23 Sep 2025 07:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758630021; i=@ti.com;
	bh=GgPGrsKO39Psn+b0Rkt3FRo4IedlzU/WTWDuCDKL7sM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uuMIb9PO8xOI2KhgbM/lgyWZgaAMa6DBvyFGS4xCEuSaeR8cYfryLNVWX8OkMS7Qj
	 uyqHl4y0SQq2cx0pmyDrLS0/YL/cgbJiRK1WDIslv1+kt21yvNBEZCdGAsPKDTt6AW
	 +LqKLyJdHV/peLlfJudQeEgn/vidB21lUioJrYow=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NCKL1S1066463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 07:20:21 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 07:20:21 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 07:20:21 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NCKLPb024483;
	Tue, 23 Sep 2025 07:20:21 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 23981D6F2D; Tue, 23 Sep 2025 07:20:21 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Prudhvi
 Veeramachaneni <prudhvi@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] bt-ti: Restrict bt-ti packages
Date: Tue, 23 Sep 2025 07:20:21 -0500
Message-ID: <20250923122021.4144301-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250923121539.i7bx4zt7krbzmc7v@yogi-work-pc>
References: <20250923121539.i7bx4zt7krbzmc7v@yogi-work-pc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Sep 2025 12:20:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16614

meta-arago / na / 20250923121539.i7bx4zt7krbzmc7v

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master/scarthgap][PATCH] bt-ti: Restrict bt-ti packages to legacy platforms only
    WARN: Commit message does not include file/recipe name: bt-ti: Restrict bt-ti packages. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH] bt-ti: Restrict bt-ti packages to legacy platforms only
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Tue, 23 Sep 2025 17:45:39 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2aada6d3a406c7ae53258ec5177f1323c2674ff3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Make opencl-cts dependent on DISTRO_FEATURES
- Commit SHA: d3532063218f5c47b5e912554a0b236eb25e61f4

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH] bt-ti: Restrict bt-ti packages to legacy platforms only
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Tue, 23 Sep 2025 17:45:39 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2aada6d3a406c7ae53258ec5177f1323c2674ff3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509181257
- Commit SHA: 96f3c5b8e2efec96de9db131992e56272becc174

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

scarthgap
=====================
PASS




