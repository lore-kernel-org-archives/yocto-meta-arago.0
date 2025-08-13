Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF07DCA0EF3
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.10041.1755127545309323737
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wpi/I0pv;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPioe2252513;
	Wed, 13 Aug 2025 18:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127544; i=@ti.com;
	bh=ILg68A8PBQG8X8MJ0rAxjx0s+5V5kZjt3+5i/8P9ALc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Wpi/I0pvg97jtVvfHRZXjvJim6PLvBUlZXnGUPWwT1CGwAHY6i33MdADteHLmWEuS
	 gdgIdQSNPJufT8oHZGessFnY3rCtC3W0mkqCYn0uVFU5m57rVWQ5VZKwz9sdoDnQ+D
	 v0pTVIFw3bxaQu4dS/LSe7Zf7Mfzu2ZNZNUXRTL4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPiwD403395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:44 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:43 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:44 -0500
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPixa3611024;
	Wed, 13 Aug 2025 18:25:44 -0500
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id CF5EC1436F5; Wed, 13 Aug 2025 18:25:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402281524
Date: Wed, 13 Aug 2025 18:25:43 -0500
Message-ID: <20250813232543.2437141-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1709170604-75212-1-git-send-email-lcpdbld@list.ti.com>
References: <1709170604-75212-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16405

meta-arago / na / 1709170604-75212-1-git-send-email-lcpdbld

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
kirkstone
=====================
Summary:
- Patch Series: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402281524
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 28 Feb 2024 19:36:44 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8e64ab3749e29531329c0840cc808c5a9dcdadb6

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: kirkstone
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: ti-test: Add rng-tools
- Commit SHA: f8ad2232a4e52b50aecc6c847ee7cfa24fc84070

Patches
----------------------------------------
FAIL - [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402281524
    Applying: CI/CD Auto-Merger: cicd.kirkstone.202402281524
    Patch failed at 0001 CI/CD Auto-Merger: cicd.kirkstone.202402281524
    error: patch failed: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb:14
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb: patch does not apply




