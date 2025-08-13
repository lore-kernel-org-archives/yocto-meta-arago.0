Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4F9CA1003
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10064.1755127556146727496
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GX6ZUabo;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPsYT1803085;
	Wed, 13 Aug 2025 18:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127554; i=@ti.com;
	bh=BaSbz6+lYGz6H8ejzKqptCBuYb3jQZSVT+qfo9zceLs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GX6ZUabojGH5wEGOa6jDf1c7qeqM1RvguLQvbgYiXk5osjjE7hVlDECRTU5j8XWrc
	 jxNP9m1aMI0Vn4m7bDj+U0SurEl1qidRbKtbEZ1C7DE70dWbXKB6OEqrkZj50LEkJx
	 f9XaVcCnLdObNe+G6gLc3j5QF2/+9+mEO6mGFO/8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPs8X1300448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:54 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:54 -0500
Received: from fllvdckhpci084.itg.ti.com (fllvdckhpci084.itg.ti.com [10.64.72.30])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPsBR2710363;
	Wed, 13 Aug 2025 18:25:54 -0500
Received: by fllvdckhpci084.itg.ti.com (Postfix, from userid 60899)
	id 30F3C134B3E; Wed, 13 Aug 2025 18:25:54 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <g-gupta@ti.com>, <s-adivi@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] meta-arago-distro: add initial support for am62axx
Date: Wed, 13 Aug 2025 18:25:54 -0500
Message-ID: <20250813232554.1377628-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20221206093820.10929-1-p-bhagat@ti.com>
References: <20221206093820.10929-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16449

meta-arago / na / 20221206093820.10929-1-p-bhagat

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
dunfell
=====================
Summary:
- Patch Series: [meta-arago][dunfell][PATCH] meta-arago-distro: add initial support for am62axx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 6 Dec 2022 15:08:20 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 27dde8c785f1ba75301c8c662a608019fab212b5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] meta-arago-distro: add initial support for am62axx
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:65
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb: patch does not apply
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image:12
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image: patch does not apply
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl:21
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl: patch does not apply
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb:377
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb: patch does not apply
    Applying: meta-arago-distro: add initial support for am62axx
    Patch failed at 0001 meta-arago-distro: add initial support for am62axx




