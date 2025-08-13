Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AF2C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10039.1755127545223561127
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KssZeJTk;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPiIw1803021;
	Wed, 13 Aug 2025 18:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127544; i=@ti.com;
	bh=wWhkDSDQXYKEW5vbSxG0apphZIhA/Bw+14YM3FoCKHM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KssZeJTkOm448lODwhu5RSBnogxfCkrNAB3ulgCCXVVHI+5aFrIVFY4broxxmbhU7
	 +cKr/umBR7GQR6ruwWc3C3e3RFnU4neRT1Z7zwOZB+TVwc5BkGvKxcfXOkpbWbYF0G
	 /646n0rMqefcQ3wZNU7Zm4GTKioO2gdAarEyVX04=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPiID403392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:43 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:43 -0500
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPhgh3678185;
	Wed, 13 Aug 2025 18:25:43 -0500
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id AF2A11436D0; Wed, 13 Aug 2025 18:25:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202403280400
Date: Wed, 13 Aug 2025 18:25:43 -0500
Message-ID: <20250813232543.2436770-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1711644296-112597-1-git-send-email-lcpdbld@list.ti.com>
References: <1711644296-112597-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16403

meta-arago / na / 1711644296-112597-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202403280400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 28 Mar 2024 11:44:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e66307441f15627fdc8b6bab13f7a9adcc66fe23

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: kirkstone
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: ti-test: Add rng-tools
- Commit SHA: f8ad2232a4e52b50aecc6c847ee7cfa24fc84070

Patches
----------------------------------------
FAIL - [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202403280400
    Applying: CI/CD Auto-Merger: cicd.kirkstone.202403280400
    Patch failed at 0001 CI/CD Auto-Merger: cicd.kirkstone.202403280400
    error: patch failed: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb:14
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb: patch does not apply




