Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBF0CA0FE1
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10180.1755127544492414159
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F6XQC/Hl;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPham2177554;
	Wed, 13 Aug 2025 18:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127543; i=@ti.com;
	bh=7XLf0Q28RY/JYvwAK9tYzIV67ePtBVpsoPrNrspvjy8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F6XQC/Hl5m0NPaRIq8/NiUf99XbZ1FhZHAm4r4UJ3RDDz0MlyTXioSYhTg3LOyHss
	 3gMOwm7UqO37D1GbWchvIipFr47ojvrOjf1T54xwrflSOEFJb4kdQZIPBgx0JpZ/JH
	 zPqs7LvC6WK6g+t15ZNCPZdEf4SSk45RYspvHgFY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPhN61412315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:43 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:42 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:42 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPg9Q3611012;
	Wed, 13 Aug 2025 18:25:42 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 4121B142E3A; Wed, 13 Aug 2025 18:25:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402152125
Date: Wed, 13 Aug 2025 18:25:42 -0500
Message-ID: <20250813232542.131796-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1708067613-128698-1-git-send-email-lcpdbld@list.ti.com>
References: <1708067613-128698-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16397

meta-arago / na / 1708067613-128698-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402152125
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 16 Feb 2024 01:13:33 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 139eaa8acad349329ee175c5328d869c0968c3b2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: kirkstone
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: ti-test: Add rng-tools
- Commit SHA: f8ad2232a4e52b50aecc6c847ee7cfa24fc84070

Patches
----------------------------------------
FAIL - [meta-arago][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402152125
    error: patch failed: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb:14
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb: patch does not apply
    Applying: CI/CD Auto-Merger: cicd.kirkstone.202402152125
    Patch failed at 0001 CI/CD Auto-Merger: cicd.kirkstone.202402152125




