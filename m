Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2990ACA0FF9
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10188.1755127548227902587
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hri6dpJ3;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPl2I1803029;
	Wed, 13 Aug 2025 18:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127547; i=@ti.com;
	bh=lx0rYLxgmPj39Pvz1lz4i3QF5Fh2YyBuEFWOtL6uddQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hri6dpJ3shyYH1w6xCl13n26OzFcMTd/GGQobwOrFxoVPpm38bxeA9r9/9TFIP3J4
	 XsZ9ZPa2m8S4lPC5B5EOVqEtU0yztubhsI67c5swIcOfhaHoUqttxYKbLmbRbcEWC8
	 E+EputfyuF3mJGcR3GyCXbc9uzzyCpF0VThHAgAw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPll2727149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:47 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:46 -0500
Received: from fllvdckhpci101.itg.ti.com (fllvdckhpci101.itg.ti.com [10.64.72.84])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPlsh3678206;
	Wed, 13 Aug 2025 18:25:47 -0500
Received: by fllvdckhpci101.itg.ti.com (Postfix, from userid 60899)
	id C85004DC43; Wed, 13 Aug 2025 18:25:46 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202407230400
Date: Wed, 13 Aug 2025 18:25:46 -0500
Message-ID: <20250813232546.2901637-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <1721739970-18241-1-git-send-email-lcpdbld@list.ti.com>
References: <1721739970-18241-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16408

meta-arago / na / 1721739970-18241-1-git-send-email-lcpdbld

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
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202407230400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 23 Jul 2024 08:06:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fd8afb77cde84032ad9882380f4e48f836121cb8

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202507311300
- Commit SHA: b253a46d52348996c2abcd9d309c1a8da1e63ca1

Patches
----------------------------------------
FAIL - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202407230400
    error: meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20240129.bb: does not exist in index
    Applying: CI/CD Auto-Merger: cicd.scarthgap.202407230400
    Patch failed at 0001 CI/CD Auto-Merger: cicd.scarthgap.202407230400




