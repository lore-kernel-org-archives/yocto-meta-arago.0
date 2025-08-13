Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8F5CA0FFD
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.10210.1755127556637440933
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E72foh47;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPt4Z2252537;
	Wed, 13 Aug 2025 18:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127555; i=@ti.com;
	bh=8oBELsvtN7MTd9XBiRP9WfCSfwJ9tFWBqKVv9PyeG9U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E72foh47gFOVtpsxca56Aa02e3p7Mm4huXoLcSSmVumNQOseFySQhD08nJTayj6dI
	 XApts6EZ18weRclntJsN6zfcLS4hK5Xk/2kmn4/Y+KqoEt6b/V/Xc59xQNr8i+bKvD
	 WpGvsOc0ZDUZU22I7s1sYDVcwVKVjr0Crbkm1HsY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPt0Q403450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:55 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:54 -0500
Received: from fllvdckhpci089.itg.ti.com (fllvdckhpci089.itg.ti.com [10.64.72.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPsfw2710368;
	Wed, 13 Aug 2025 18:25:54 -0500
Received: by fllvdckhpci089.itg.ti.com (Postfix, from userid 60899)
	id 624AC9B; Wed, 13 Aug 2025 18:25:54 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>, <devarsht@ti.com>, <s-adivi@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH 0/5] Add support in toplevel Makefile of
Date: Wed, 13 Aug 2025 18:25:54 -0500
Message-ID: <20250813232554.1687-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220513074923.28761-1-a-m1@ti.com>
References: <20220513074923.28761-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16454

meta-arago / na / 20220513074923.28761-1-a-m1

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
- Patch Series: [meta-arago][dunfell][PATCH 0/5] Add support in toplevel Makefile of SDK
- Submitter: From: Aparna M <a-m1@ti.com>
- Date: Date: Fri, 13 May 2022 13:19:18 +0530
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: 48ec6f3a8af6719a4f2ee9e13522104ad2f314b5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH 1/5] ti-tisdk-makefile: Makefile_u-boot-spl: Add support for u-boot-a53 build for am62xx-evm
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl:10
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl: patch does not apply
    Applying: ti-tisdk-makefile: Makefile_u-boot-spl: Add support for u-boot-a53 build for am62xx-evm
    Patch failed at 0001 ti-tisdk-makefile: Makefile_u-boot-spl: Add support for u-boot-a53 build for am62xx-evm




