Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94313CA0EE6
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10058.1755127553678481164
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U4y0CSfH;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPqdx1803073;
	Wed, 13 Aug 2025 18:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127552; i=@ti.com;
	bh=/m2XTITy7d65EnMs2fbun/UDnLQyYLv5Cz7/8P1+S/4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=U4y0CSfHS6w4+7Xi3Ym8VzxZy5C5v6tbx1e0JkPwIrvG2gP1++2CsarqcSRQ4Tpzx
	 WnOdmTRDQu1wb5gox+U0gTxBNztjQdodgZ+h/kpsn8z+RXJl2fA7GWUvghWQQd3CsT
	 AjOhd2Ju2T9MbaS+D0Ip28O7VRdNAvo0KQqR+7TM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPqs7403438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:52 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:52 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPqpM2710337;
	Wed, 13 Aug 2025 18:25:52 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 54F88142E3A; Wed, 13 Aug 2025 18:25:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH v2 0/2] Adding support for am62xx
Date: Wed, 13 Aug 2025 18:25:52 -0500
Message-ID: <20250813232552.148936-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220323210750.3959-1-reatmon@ti.com>
References: <20220323210750.3959-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16439

meta-arago / na / 20220323210750.3959-1-reatmon

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
- Patch Series: [meta-arago][master/dunfell][PATCH v2 0/2] Adding support for am62xx
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 23 Mar 2022 16:07:48 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 106e0a7af5e893e8c85094e2a5d6dfc85bb6ebc6

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH v2 1/2] ti-tisdk-makefile: adding uboot r5 config variable for am62xx
    Applying: ti-tisdk-makefile: adding uboot r5 config variable for am62xx
    Patch failed at 0001 ti-tisdk-makefile: adding uboot r5 config variable for am62xx
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb: does not exist in index
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:65
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb: patch does not apply
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image: does not exist in index
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb: does not exist in index

dunfell
=====================
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH v2 0/2] Adding support for am62xx
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 23 Mar 2022 16:07:48 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 106e0a7af5e893e8c85094e2a5d6dfc85bb6ebc6

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH v2 1/2] ti-tisdk-makefile: adding uboot r5 config variable for am62xx
    Applying: ti-tisdk-makefile: adding uboot r5 config variable for am62xx
    Patch failed at 0001 ti-tisdk-makefile: adding uboot r5 config variable for am62xx
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:65
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb: patch does not apply
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image:12
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image: patch does not apply
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb:239
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb: patch does not apply




