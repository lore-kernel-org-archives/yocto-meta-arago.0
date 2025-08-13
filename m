Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7592DCA0FE9
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10207.1755127554670190335
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UvAzzU+J;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPrEb2177598;
	Wed, 13 Aug 2025 18:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127553; i=@ti.com;
	bh=lapC0jcRos8aGOCmSR4IOd8mWkgFWMpnuBfUFgPh2qc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UvAzzU+JRa/w8jLutD48RZgtV9Kp7c6lHrTH3tQr7tad+4EItEKSx2EetsHfa6SMS
	 ekcBGOhzri+rdHTDeRh7xl7l0IFuw9AtzcdG6yH71GecY0jgOmGrluHAhAavgVKgGb
	 Uk8+Ui4GzL0OqjRarcXBREAv3/q1i++XKJ56Fx1Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPrUM403441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:53 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:53 -0500
Received: from fllvdckhpci081.itg.ti.com (fllvdckhpci081.itg.ti.com [10.64.72.24])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPrGt2710347;
	Wed, 13 Aug 2025 18:25:53 -0500
Received: by fllvdckhpci081.itg.ti.com (Postfix, from userid 60899)
	id 1FB781523D8; Wed, 13 Aug 2025 18:25:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] matrix-gui: Disable auto-startup
Date: Wed, 13 Aug 2025 18:25:53 -0500
Message-ID: <20250813232553.3720998-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220519214808.1853-1-reatmon@ti.com>
References: <20220519214808.1853-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16442

meta-arago / na / 20220519214808.1853-1-reatmon

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
- Patch Series: [meta-arago][master/dunfell][PATCH] matrix-gui: Disable auto-startup for am62xx-evm
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 19 May 2022 16:48:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: baea58ae7b0752320694cd8cfc94bedbece4649d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] matrix-gui: Disable auto-startup for am62xx-evm
    Applying: matrix-gui: Disable auto-startup for am62xx-evm
    Patch failed at 0001 matrix-gui: Disable auto-startup for am62xx-evm
    error: meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb: does not exist in index

dunfell
=====================
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] matrix-gui: Disable auto-startup for am62xx-evm
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 19 May 2022 16:48:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: baea58ae7b0752320694cd8cfc94bedbece4649d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] matrix-gui: Disable auto-startup for am62xx-evm
    Applying: matrix-gui: Disable auto-startup for am62xx-evm
    Patch failed at 0001 matrix-gui: Disable auto-startup for am62xx-evm
    error: patch failed: meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb:5
    error: meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb: patch does not apply




