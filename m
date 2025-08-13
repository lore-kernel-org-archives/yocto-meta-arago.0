Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3B4CA0FF7
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10189.1755127548300702647
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VkDn5v/m;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPl6u2177570;
	Wed, 13 Aug 2025 18:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127547; i=@ti.com;
	bh=HqwgagsrBYjTQrqg9qSbk9sMHds/nFh3fz4Zq1cOA+E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VkDn5v/mlkzxfsaG0sRS+VrRB/SA8XNTDUhm8OV4EU4xEAe5ZlrasyGS3PszS6vpx
	 WlsMJsx7Jyjt3IyKGFcGX6QhS8cJl7S2MBVjiWkSwaQ6d37QHLkKlCWdlXvDpTA0UD
	 BH/MOz3GHi1vqKpmneaLMFJbaXD4+9VnsuPQ3ki0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPlCi1412328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:47 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:46 -0500
Received: from fllvdckhpci081.itg.ti.com (fllvdckhpci081.itg.ti.com [10.64.72.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPkTL3016395;
	Wed, 13 Aug 2025 18:25:46 -0500
Received: by fllvdckhpci081.itg.ti.com (Postfix, from userid 60899)
	id A68871523D8; Wed, 13 Aug 2025 18:25:46 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH 0/3] Adding support for am62xx
Date: Wed, 13 Aug 2025 18:25:46 -0500
Message-ID: <20250813232546.3708632-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220322193554.24404-1-reatmon@ti.com>
References: <20220322193554.24404-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16409

meta-arago / na / 20220322193554.24404-1-reatmon

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
- Patch Series: [meta-arago][dunfell][PATCH 0/3] Adding support for am62xx
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 22 Mar 2022 14:35:51 -0500
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 62c45955c11f5703f31475e6545e759b115eba62

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH 1/3] ti-tisdk-makefile: adding uboot r5 config variable for am62xx
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb:363
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb: patch does not apply
    Applying: ti-tisdk-makefile: adding uboot r5 config variable for am62xx
    Patch failed at 0001 ti-tisdk-makefile: adding uboot r5 config variable for am62xx




