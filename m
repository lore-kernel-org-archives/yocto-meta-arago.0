Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A618CA0EE9
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:26:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.10218.1755127558066414276
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uPEPoQlU;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPujt1750984;
	Wed, 13 Aug 2025 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127556; i=@ti.com;
	bh=i0kS//c9pnsKzJNykRTybA+c/geiI0RN3Y+iBt0sEOE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uPEPoQlUdDlEGx7B15f/Gg/4onJwIxoQYmszp178VvG3N8Ul2jxhhil0L6tbyAE1w
	 /l9wddn2Dyw0h16yBcziXeh4iCZRw3J6Nnr9heq8IRsp39zbqW+zZcyDBA9REy9Wlj
	 He6lbyvU15fVdkLekZqrYyOj62TVy9nJtRbT9nm0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPupZ1300461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:56 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:56 -0500
Received: from fllvdckhpci086.itg.ti.com (fllvdckhpci086.itg.ti.com [10.64.72.34])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPugt2710389;
	Wed, 13 Aug 2025 18:25:56 -0500
Received: by fllvdckhpci086.itg.ti.com (Postfix, from userid 60899)
	id 68A77C516; Wed, 13 Aug 2025 18:25:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] tisdk-addons: Remove libdrm-kms from the dependencies
Date: Wed, 13 Aug 2025 18:25:56 -0500
Message-ID: <20250813232556.1591628-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20221130221721.8936-1-reatmon@ti.com>
References: <20221130221721.8936-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:26:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16465

meta-arago / na / 20221130221721.8936-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] tisdk-addons: Remove libdrm-kms from the dependencies
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 30 Nov 2022 16:17:21 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ae1217c9dd3b8723f7c28d75a30e35b70c42bb2a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] tisdk-addons: Remove libdrm-kms from the dependencies
    Applying: tisdk-addons: Remove libdrm-kms from the dependencies
    Patch failed at 0001 tisdk-addons: Remove libdrm-kms from the dependencies
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:16
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb: patch does not apply




