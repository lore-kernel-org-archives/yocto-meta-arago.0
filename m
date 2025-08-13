Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27A5CA0EF1
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:44 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.10166.1755127538969276446
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VuKhJSUl;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPcu92252477;
	Wed, 13 Aug 2025 18:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127538; i=@ti.com;
	bh=fJRYSqHYrhjGBRPWUW7OZhvmyaJ/QLL2moQOxK2rO6c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VuKhJSUlZwKXC3JUfRwS7AcL2+XWYarJH6yHFQN/h8itrfJgwaaezDDmEAsPJUu4b
	 BRQ68I0x9TMmqIJXenOYTbzMOj2JE0c2XqeQdMsOcKMcA/fcYmLAzQt9F6/SVrB8ui
	 oD+qJTmPRmQPpWkIuLspy3ZO+iFzGW+/xXzYJqk0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPc6n403339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:38 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:37 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:37 -0500
Received: from fllvdckhpci027.itg.ti.com (fllvdckhpci027.itg.ti.com [10.64.72.35])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPbQU3610975;
	Wed, 13 Aug 2025 18:25:37 -0500
Received: by fllvdckhpci027.itg.ti.com (Postfix, from userid 60899)
	id 73EA0138DA1; Wed, 13 Aug 2025 18:25:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202407160400
Date: Wed, 13 Aug 2025 18:25:37 -0500
Message-ID: <20250813232537.1777548-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1721130682-136630-1-git-send-email-lcpdbld@list.ti.com>
References: <1721130682-136630-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16370

meta-arago / na / 1721130682-136630-1-git-send-email-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202407160400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 16 Jul 2024 06:51:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 71b26428319e69f5e152ad68839c5a17357c7640

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202507311300
- Commit SHA: b253a46d52348996c2abcd9d309c1a8da1e63ca1

Patches
----------------------------------------
FAIL - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202407160400
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb: does not exist in index
    Applying: CI/CD Auto-Merger: cicd.scarthgap.202407160400
    Patch failed at 0001 CI/CD Auto-Merger: cicd.scarthgap.202407160400




