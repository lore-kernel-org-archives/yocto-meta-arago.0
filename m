Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD6BCCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 17:11:05 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.111.1761153063430683434
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 10:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Qp8kxaVg;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MHB1Yt321617
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 12:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761153061; i=@ti.com;
	bh=fSUmh/TBp1fnKYrHKWHNdahk15TXDH40smMdzdFm9Do=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Qp8kxaVg2I5yHcM0SHFZkIadmG2J8QyTVIDKHqhsGMv8n7BYrdkHa7C/JhwrIieKh
	 kVjDUxDCnI1pKb5ECy0dk5ZJLG+zLp72o2jtBtcuSbX5MbXDNgWmnqBF+6wXadhpbz
	 ZuU5Tb4n9heesiO/SaObja/zB0sIvNn+LKrMe4U8=
Received: from DLEE202.ent.ti.com (dlee202.ent.ti.com [157.170.170.77])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MHB1Ot2175146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 12:11:01 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 12:11:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 12:11:01 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MHB1Gh1552785;
	Wed, 22 Oct 2025 12:11:01 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 45BD013F52D; Wed, 22 Oct 2025 12:11:01 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH v1]  packagegroup-arago-tisdk-graphics-sdk-target: Add nlohmann-json
Date: Wed, 22 Oct 2025 12:11:01 -0500
Message-ID: <20251022171101.1637325-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251022170748.2333083-1-a-christidis@ti.com>
References: <20251022170748.2333083-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 17:11:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16698

meta-arago / na / 20251022170748.2333083-1-a-christidis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH v1]  packagegroup-arago-tisdk-graphics-sdk-target: Add nlohmann-json
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v1]  packagegroup-arago-tisdk-graphics-sdk-target: Add nlohmann-json
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 22 Oct 2025 12:07:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7ccbf9997f23dec66a6223d685288e31338aed1e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago-distro: chromium: Avoid placing incomplete H264 NALUs in buffer
- Commit SHA: 4ba6c5f1e81c6713bc34615f97fb4dfa3d5b4fca

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




