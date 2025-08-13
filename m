Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4C2CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:55:31 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1633.1755104124449676209
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 09:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gUls4tX2;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DGtOIb1744140
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755104124; i=@ti.com;
	bh=LgOnSwxUruvdIR+xEEphRGxqqGcEfqMOpoFRyTMJLR8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gUls4tX2SypnJockp+EI5YTcgGLdW7sRUOt46zjQpWRrIh7hGJIXHa2SCP7c9uRN2
	 gjf5/8rhVSwzl0KAOECjuqpOdl+iDjEIhr36KA1i0cXiJFOiPaQbbRRgx4pMEP1sqj
	 LnXPEm/UEwt8TiLVaRiSwwvnups7DxHlyXc6B3WI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DGtN06200425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:55:24 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 11:55:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 11:55:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DGtNvc2602369;
	Wed, 13 Aug 2025 11:55:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2ED7E13F530; Wed, 13 Aug 2025 11:55:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <rs@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH 0/5] Enable hardware acceleration on chromium
Date: Wed, 13 Aug 2025 11:55:23 -0500
Message-ID: <20250813165523.2912309-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250813165148.220012-1-t-lannynd@ti.com>
References: <20250813165148.220012-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 16:55:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16367

meta-arago / na / 20250813165148.220012-1-t-lannynd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH 0/5] Enable hardware acceleration on chromium
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 13 Aug 2025 11:51:43 -0500
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: b3e10bf13b5c837fb5691fc379737d413e7dd6fc

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago: Pull in the Yocto space optimization settings
- Commit SHA: 92c8f2e19343496fe865682b2f308be7ed7e7b9b

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH 0/5] Enable hardware acceleration on chromium
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 13 Aug 2025 11:51:43 -0500
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: b3e10bf13b5c837fb5691fc379737d413e7dd6fc

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202507311300
- Commit SHA: b253a46d52348996c2abcd9d309c1a8da1e63ca1

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

scarthgap
=====================
PASS




