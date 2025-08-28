Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21D2CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 20:05:21 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.6797.1756411513813695242
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Aug 2025 13:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j2UWIFnn;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57SK5DpY2083528
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Aug 2025 15:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756411513; i=@ti.com;
	bh=tMYXoxyg2M7mpCKQM0pqHWjAekakm6ajRAQwq8fxxOg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j2UWIFnn8GyGVfr3kEx47flFIlzqCBtIJg6A4rubRuXDhbiN1hW/zxZSJUC+6n6M0
	 NmoS3wdUfi+zvVP0AWLywBSWEGvPTmxY3AZQWsX/7JG6qZSKrnPgMVUWyHiukDSuMn
	 PAU7fp4o6hH+/z7OaEA07wMA7ZOodoAQj50AJTI0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57SK5D5v3126674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Aug 2025 15:05:13 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 15:05:13 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 15:05:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57SK5Ddl1041059;
	Thu, 28 Aug 2025 15:05:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F15CB13F529; Thu, 28 Aug 2025 15:05:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v2] meta-arago-distro: chromium:  Replace /dev/video* with Chromium naming convention
Date: Thu, 28 Aug 2025 15:05:12 -0500
Message-ID: <20250828200512.4042880-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250828200104.1371992-1-t-lannynd@ti.com>
References: <20250828200104.1371992-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Aug 2025 20:05:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16498

meta-arago / na / 20250828200104.1371992-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][scarthgap][PATCH v2] meta-arago-distro: chromium:  Replace /dev/video* with Chromium naming convention
    ERROR: Commit message too long (> 80 chars): meta-arago-distro: chromium:  Replace /dev/video* with Chromium naming convention. (COMMIT-MESSAGE-1)
        patch:42
            Subject: [meta-arago][scarthgap][PATCH v2] meta-arago-distro: chromium:  Replace /dev/video* with Chromium naming convention




