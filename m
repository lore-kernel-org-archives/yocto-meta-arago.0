Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F337CA0FFB
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10211.1755127556673428179
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dK0kzIOm;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPt8T1803101;
	Wed, 13 Aug 2025 18:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127555; i=@ti.com;
	bh=gDtBeIO+hwvjqoutcvOwX7mcIZKRjwFJ9WhWoo8g+Co=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dK0kzIOmxxplkllMSh4CYZWI9cQ8p5cC3+xO+T3WTgVcjM1J7FhcO3MP5NqmNuO9L
	 CxDIGYWZvjKg9tptxm1k4nK87piIu9GEZ/vK7fB8Lx1+bPI8cz3WIFpyMyDY7pr/K7
	 /yLn01aU/Tzbx0hJXWWfpoUezp2DjXeA/k8W2Zqk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPtF2727203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:55 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:55 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:55 -0500
Received: from fllvdckhpci091.itg.ti.com (fllvdckhpci091.itg.ti.com [10.64.72.44])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPtBh3678292;
	Wed, 13 Aug 2025 18:25:55 -0500
Received: by fllvdckhpci091.itg.ti.com (Postfix, from userid 60899)
	id 698031893; Wed, 13 Aug 2025 18:25:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH] packagegroups: Mirror ti-test change
Date: Wed, 13 Aug 2025 18:25:55 -0500
Message-ID: <20250813232555.2799392-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220714162948.31295-1-reatmon@ti.com>
References: <20220714162948.31295-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16453

meta-arago / na / 20220714162948.31295-1-reatmon

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
- Patch Series: [meta-arago][dunfell][PATCH] packagegroups: Mirror ti-test change from meta-ti
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 14 Jul 2022 11:29:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 881802b080e1c5da6d0c6eae8987779128bc6c9b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] packagegroups: Mirror ti-test change from meta-ti
    error: patch failed: meta-arago-distro/recipes-core/packagegroups/ti-test.bb:83
    error: meta-arago-distro/recipes-core/packagegroups/ti-test.bb: patch does not apply
    Applying: packagegroups: Mirror ti-test change from meta-ti
    Patch failed at 0001 packagegroups: Mirror ti-test change from meta-ti




