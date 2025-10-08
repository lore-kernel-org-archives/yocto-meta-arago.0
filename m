Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4015CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:52:24 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.781.1759935139880327640
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Oct 2025 07:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NT3HOf4b;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 598EqJpm4062212
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Oct 2025 09:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759935139; i=@ti.com;
	bh=NsxdhbW0Hxh3kMrG+q3BvoPya/1XofTuqkMac2KQW8M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NT3HOf4b6Z2Sm1XHqFh689duTYJ7zCDYk54j0D610T1EX/EaPho5D4f0o/L58iqFg
	 b2qZYMkwmsJrS5kj4bBajXPpnuQ4bioq9vTjdCUuYChL2o4hHJozBgN3aC1XkEUAtQ
	 zLD5A4+/621dqfsgzOOy4/R+COwvsiWd3G9SwUXw=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 598EqJWw719146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Oct 2025 09:52:19 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Oct
 2025 09:51:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Oct 2025 09:51:48 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 598EpmVO2948221;
	Wed, 8 Oct 2025 09:51:48 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C5E5A13F536; Wed,  8 Oct 2025 09:51:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] packagegroup-arago-tisdk-graphics-sdk-target: Add KTX and SDL2
Date: Wed, 8 Oct 2025 09:51:48 -0500
Message-ID: <20251008145148.4053791-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251008144535.2679476-1-a-christidis@ti.com>
References: <20251008144535.2679476-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Oct 2025 14:52:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16673

meta-arago / na / 20251008144535.2679476-1-a-christidis

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
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] packagegroup-arago-tisdk-graphics-sdk-target: Add KTX and SDL2
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 8 Oct 2025 09:45:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7a10b601606b79cb84ce9e19e9ea571a1ba44107

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202510021800
- Commit SHA: bfe1f7dd39b0a36a80a73c3e2a6c692e3fa1d56e

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




