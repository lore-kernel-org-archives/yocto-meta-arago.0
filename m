Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C659CCA0EEA
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10201.1755127553004205356
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wzqus9WS;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPq3h1803057;
	Wed, 13 Aug 2025 18:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127552; i=@ti.com;
	bh=vNBX9JleuwpQCtqw2W+g35LmeeRZXb+lRHob5T086x0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wzqus9WSFtGH85BgYky/y4+Y2iU5Lw/DrL5xO5J8T3TDN7zoFoYrzp41iq7/cOVWv
	 eArU752vgMFia9aVz0L6eoxV+Zbh+ci4+b260k8hWj+yM0kKBtNY9KFQcAx9NLl7U0
	 SQtEbNptiuTMx1i2DqKv4A3go2BueyA7WTgl8cWU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPqQ8403432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:52 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:51 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:52 -0500
Received: from fllvdckhpci081.itg.ti.com (fllvdckhpci081.itg.ti.com [10.64.72.24])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPpin3678253;
	Wed, 13 Aug 2025 18:25:51 -0500
Received: by fllvdckhpci081.itg.ti.com (Postfix, from userid 60899)
	id CFEF21523DB; Wed, 13 Aug 2025 18:25:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.03.00.005 release
Date: Wed, 13 Aug 2025 18:25:51 -0500
Message-ID: <20250813232551.3718022-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220520182810.24312-1-reatmon@ti.com>
References: <20220520182810.24312-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16433

meta-arago / na / 20220520182810.24312-1-reatmon

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
- Patch Series: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.03.00.005 release
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 20 May 2022 13:28:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ccfe36c63a6d5903a173e1bcb45e58d049b6d97b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.03.00.005 release
    Applying: ltp-ddt: Bump to 08.03.00.005 release
    Patch failed at 0001 ltp-ddt: Bump to 08.03.00.005 release
    error: patch failed: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb:14
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: patch does not apply




