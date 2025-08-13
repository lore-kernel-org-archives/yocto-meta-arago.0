Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4063CA1004
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10065.1755127556367116737
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FQeCkhgO;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPtWU1803093;
	Wed, 13 Aug 2025 18:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127555; i=@ti.com;
	bh=Hkh3Hs+r3F4yIcbC4b43rs4e74eYcdoDSBm4aZHbGvI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FQeCkhgOhdzbAGDDZt9RUMzKoLjECE74BZYzxQPE++fI3hdBd2e1EroVNd3GoGQmo
	 y4W3sW9mNlKzFbrxwe3mqjiBSfwkZViQgsO8CBAejyKpCKKMnvY8LUH8YWRNqSToVx
	 4xfbeb1gnMtRG84yDHh0l5MU247wM8/kXGLx2i58=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPtKR727197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:55 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:55 -0500
Received: from fllvdckhpci091.itg.ti.com (fllvdckhpci091.itg.ti.com [10.64.72.44])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPtI43016621;
	Wed, 13 Aug 2025 18:25:55 -0500
Received: by fllvdckhpci091.itg.ti.com (Postfix, from userid 60899)
	id 32D971893; Wed, 13 Aug 2025 18:25:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.04.00.005 release
Date: Wed, 13 Aug 2025 18:25:55 -0500
Message-ID: <20250813232555.2798912-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220726123931.20171-1-reatmon@ti.com>
References: <20220726123931.20171-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16450

meta-arago / na / 20220726123931.20171-1-reatmon

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
- Patch Series: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.04.00.005 release
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 26 Jul 2022 07:39:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 73d32298c18d0f547a9fd00a5c7afa770f405fd8

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.04.00.005 release
    error: patch failed: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb:14
    error: meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb: patch does not apply
    Applying: ltp-ddt: Bump to 08.04.00.005 release
    Patch failed at 0001 ltp-ddt: Bump to 08.04.00.005 release




