Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019E4CA0EEB
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.10199.1755127552328079633
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jNapcDgV;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPpfc2177590;
	Wed, 13 Aug 2025 18:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127551; i=@ti.com;
	bh=FipmkM66kjpcfysHnzCVd+YpvDo7dzUV7SxWxaghv1U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jNapcDgVY2c+bSb5AoXHdFFQtGA+i+c9yFJqDUu0PhIYtrFACX4rW6XLII5r3hSAC
	 LXDnauTyRq88x2CsgOYTRU0Mt4i7UQqvL6RAIbStZO2+i2P6+r3+bX8Qo+M4U6WPJB
	 BM/yybvHalXMdwPALIQFDYxVqQvcJid1dP3Gp7CM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPpB91412362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:51 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:50 -0500
Received: from fllvdckhpci097.itg.ti.com (fllvdckhpci097.itg.ti.com [10.64.72.60])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPoRp2710316;
	Wed, 13 Aug 2025 18:25:50 -0500
Received: by fllvdckhpci097.itg.ti.com (Postfix, from userid 60899)
	id B73E91389BE; Wed, 13 Aug 2025 18:25:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.03.00.003 release
Date: Wed, 13 Aug 2025 18:25:50 -0500
Message-ID: <20250813232550.654652-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220506002345.4020-1-reatmon@ti.com>
References: <20220506002345.4020-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16429

meta-arago / na / 20220506002345.4020-1-reatmon

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
- Patch Series: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.03.00.003 release
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 5 May 2022 19:23:45 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e585f04f92394cc9bc622adbec1dd1e40e9fc096

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.03.00.003 release
    error: patch failed: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb:14
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: patch does not apply
    Applying: ltp-ddt: Bump to 08.03.00.003 release
    Patch failed at 0001 ltp-ddt: Bump to 08.03.00.003 release




