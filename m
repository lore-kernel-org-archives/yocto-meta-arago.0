Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75CCCA1005
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.10070.1755127557027048984
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U8NEwDLr;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPuvG2252541;
	Wed, 13 Aug 2025 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127556; i=@ti.com;
	bh=v/pu3lARMVVnAZZsVNRzV7bwwVL3tpmDLRNUa4mjYSw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=U8NEwDLrWFaSwvfNCs3DOaQqSYbP/XwfOtN7GAgOsULkkpnTefjdsul7RRuDiYgp2
	 y7wJxO/4VXs8g3uaTIXD+Ls201sdV9bpW31NLbzF26+LJyboyqkci1bSXjYUIMRkWJ
	 3y38SgA6y7H29i60dzez4o3RfP6nHQxXojvDJOGw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPuaw727206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:56 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:55 -0500
Received: from fllvdckhpci091.itg.ti.com (fllvdckhpci091.itg.ti.com [10.64.72.44])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPtMm2710383;
	Wed, 13 Aug 2025 18:25:55 -0500
Received: by fllvdckhpci091.itg.ti.com (Postfix, from userid 60899)
	id C8F751895; Wed, 13 Aug 2025 18:25:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] conf: machine: j721s2: add new
Date: Wed, 13 Aug 2025 18:25:55 -0500
Message-ID: <20250813232555.2801072-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220701161237.10497-1-reatmon@ti.com>
References: <20220701161237.10497-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16457

meta-arago / na / 20220701161237.10497-1-reatmon

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
master
=====================
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] conf: machine: j721s2: add new dtb for GESI
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 1 Jul 2022 11:12:37 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ce85f15c18776edd7dae6c1fddc9ceda91b5207f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] conf: machine: j721s2: add new dtb for GESI
    Applying: conf: machine: j721s2: add new dtb for GESI
    Patch failed at 0001 conf: machine: j721s2: add new dtb for GESI
    error: conf/machine/j721s2-evm.conf: does not exist in index

dunfell
=====================
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] conf: machine: j721s2: add new dtb for GESI
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 1 Jul 2022 11:12:37 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ce85f15c18776edd7dae6c1fddc9ceda91b5207f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] conf: machine: j721s2: add new dtb for GESI
    error: conf/machine/j721s2-evm.conf: does not exist in index
    Applying: conf: machine: j721s2: add new dtb for GESI
    Patch failed at 0001 conf: machine: j721s2: add new dtb for GESI




