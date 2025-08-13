Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5CACA0EEC
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:55 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.10197.1755127552139153936
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=w3Zk/WHy;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPotv1750940;
	Wed, 13 Aug 2025 18:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127550; i=@ti.com;
	bh=aVYdsn8LubtG4p1ks0YW7pajDQUVa1ZykbK2a753Tss=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=w3Zk/WHymRvbW6wstx4uofN/aH8856QLufCewCxpF9fR6cgIWjoE9PdgKYSh0Z2Ra
	 z/jfegn4pSO5K4Dh36zyAI2sg0x4DXu0IGz/WulTO8P855KopKzZp3DOpQ+hMZj8Gi
	 NzM2L/rfV2If21UOir/ZaIO21icr67QqWyxge4sA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPoGs1412359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:50 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:50 -0500
Received: from fllvdckhpci097.itg.ti.com (fllvdckhpci097.itg.ti.com [10.64.72.60])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPo9i2710313;
	Wed, 13 Aug 2025 18:25:50 -0500
Received: by fllvdckhpci097.itg.ti.com (Postfix, from userid 60899)
	id 7BA741389BE; Wed, 13 Aug 2025 18:25:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][oe-layersetup PATCH v2 1/5] Remove unused sample-file
Date: Wed, 13 Aug 2025 18:25:50 -0500
Message-ID: <20250813232550.654132-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220428171851.19270-1-afd@ti.com>
References: <20220428171851.19270-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16427

meta-arago / na / 20220428171851.19270-1-afd

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
- Patch Series: [meta-arago][oe-layersetup PATCH v2 1/5] Remove unused sample-file bblayers-zeus-browser.conf.sample
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 28 Apr 2022 12:18:47 -0500
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: 669da9b7c86d47d6de84ba8e07b2374dc2632468

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup PATCH v2 1/5] Remove unused sample-file bblayers-zeus-browser.conf.sample
    error: sample-files/bblayers-zeus-browser.conf.sample: does not exist in index
    Applying: Remove unused sample-file bblayers-zeus-browser.conf.sample
    Patch failed at 0001 Remove unused sample-file bblayers-zeus-browser.conf.sample




