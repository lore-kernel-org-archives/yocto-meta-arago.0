Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7A2CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 23:46:46 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3621.1755820002534037967
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 16:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hXYtBhOT;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LNkfsL591275;
	Thu, 21 Aug 2025 18:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755820001; i=@ti.com;
	bh=tMReN6sSpCnkEMJ6ZGvviYuzt7P0ifi5F8T6ZNqLGyY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hXYtBhOTwP0p3TqxrweCdeMLpRpwNvglISRJsxgUR/zRTVlFrHuazQHzdufO+ZD6Q
	 0PjCMxxTuSNkDZQMX4Z4PGcmyEl8z8+fPivLBQkHJNU0TYLS7E9yYQZsEeZVd/u0Fz
	 8QpTPe75NQWIP0kuHN/hlmb2eGNyIunvaiy3Fc8g=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LNkfm42480393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 18:46:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 18:46:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 18:46:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LNkeoG2644593;
	Thu, 21 Aug 2025 18:46:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 618171801A0; Thu, 21 Aug 2025 18:46:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508211416
Date: Thu, 21 Aug 2025 18:46:40 -0500
Message-ID: <20250821234640.253153-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250821234138.3563677-1-lcpdbld@list.ti.com>
References: <20250821234138.3563677-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Aug 2025 23:46:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16492

meta-arago / na / 20250821234138.3563677-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202508211416
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 21 Aug 2025 18:41:38 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a4cd43c5332972630acd90e6627c5de3f4659779

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Beleswar Padhi <b-padhi@ti.com>
- Commit Subject: packagegroup-arago-tisdk-addons: Add ti-rtos-messageq-test-fw package
- Commit SHA: 1ae04b44fcc17afdda95a7bbaa7a9d84e9188fa2

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




