Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15940CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 22:10:46 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.36431.1758147036945987464
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 15:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AkwMmctv;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HMAaeg351448
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 17:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758147036; i=@ti.com;
	bh=JRMbb2NiYLMtxQHc/sNJPMFRecwWK/m1N2qjVpncPdA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AkwMmctv0YZ1EyEkK+c50cDhoMtL7AnoHLz9RPKXjGoEQrlrI7GF1oR2tdzt5AuQX
	 j4zkwdZfrFTCLYV1RSWilSqnf5Bbrpb7YveWEPW496nsXDtVeIyspEqGBbz9opshpt
	 A3E1+hObQoUIkVGgHJvv4EGdiWerWvv8jqPPjXHQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HMAaOR2667492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 17:10:36 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 17:10:35 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 17:10:35 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HMAZ3R3125385;
	Wed, 17 Sep 2025 17:10:35 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D0C8313F530; Wed, 17 Sep 2025 17:10:35 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v1 0/2] Add libsdl2 test support
Date: Wed, 17 Sep 2025 17:10:35 -0500
Message-ID: <20250917221035.1589097-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250917220826.2078836-1-a-christidis@ti.com>
References: <20250917220826.2078836-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 22:10:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16588

meta-arago / na / 20250917220826.2078836-1-a-christidis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH v1 1/2] libsdl2: Add tests package
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [meta-arago][scarthgap][PATCH v1 2/2] ti-test: Add libsdl2-tests to packagegroup
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v1 0/2] Add libsdl2 test support
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 17 Sep 2025 17:08:24 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: c5041f8638fdfc2a4805fe140df097fe72d552ea

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: hwspinlocktest: Update hwspinlock recipe remote repo url
- Commit SHA: 7ace3e876c987b0aa03c119db5d708dcc807b6b1

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




