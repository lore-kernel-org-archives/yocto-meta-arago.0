Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D46ACCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 18:21:06 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1862.1761157264091584652
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 11:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EWDqgr/l;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MIL3mj1480699
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 13:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761157263; i=@ti.com;
	bh=GRWVGcfJTf+Gv/KhgQh4GVh7ol+AAa3+iGpXgYdrMVo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EWDqgr/lvNblQ0BQpAdjSNtASFFbcrvM4yGkwboJ1POfgCmkKY/s1yedZU9EqsNEH
	 FyDQw6XQyop0Kiibh3EJOIeqO0CVr3s0P2dwdwt4d8s/+EWdU/Va+k1aW7bEAhCTMc
	 T4BBg4TOGcRT/W6MGylOUwKs60C3FvaUQsR4j8ro=
Received: from DFLE201.ent.ti.com (dfle201.ent.ti.com [10.64.6.59])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MIL3E02120859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 13:21:03 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 13:21:03 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 13:21:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MIL3as3766630;
	Wed, 22 Oct 2025 13:21:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0601418121F; Wed, 22 Oct 2025 13:21:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH]  packagegroup-arago-standalone-sdk-target: Remove duplicate opkg-dev
Date: Wed, 22 Oct 2025 13:21:02 -0500
Message-ID: <20251022182102.4012310-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251022181648.2411290-1-a-christidis@ti.com>
References: <20251022181648.2411290-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 18:21:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16700

meta-arago / na / 20251022181648.2411290-1-a-christidis

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
- Patch Series: [meta-arago][scarthgap][PATCH]  packagegroup-arago-standalone-sdk-target: Remove duplicate opkg-dev
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 22 Oct 2025 13:16:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 97785b5e71d34982bc5082648b154d674b880965

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




