Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86B7CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 19:35:37 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.20010.1755286527932269050
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 12:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NgZgeOsj;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FJZPb82587922;
	Fri, 15 Aug 2025 14:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755286525; i=@ti.com;
	bh=csLibPCXipPb6+87XNjPlvFSRffUt1s0PCTPVAkOriI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NgZgeOsjDIMSPiOrHlS2KJywMIKJhINzHEPQTXuGb0/UGroqsHhSrSNIAPZDw0G21
	 ec6P7Anp9n4YVX5QrfwXlTWqrTqfbpFvnjgf7rEkIEvGaZV5g7mM5o1zfvu5pzMClc
	 SvnwRTQ1wb8P6e11JoU8wVgFPJpY+IRBZhpWH4WA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FJZPd92805133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 14:35:25 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 14:35:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 14:35:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FJZPtW1444643;
	Fri, 15 Aug 2025 14:35:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 269F813F532; Fri, 15 Aug 2025 14:35:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>,
        <a-christidis@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH 0/2] piglit: use TestPlaceholder objects
Date: Fri, 15 Aug 2025 14:35:25 -0500
Message-ID: <20250815193525.3798227-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250815193156.1982216-1-rs@ti.com>
References: <20250815193156.1982216-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 19:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16481

meta-arago / na / 20250815193156.1982216-1-rs

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
- Patch Series: [meta-arago][master/scarthgap][PATCH 0/2] piglit: use TestPlaceholder objects
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 15 Aug 2025 14:31:54 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1350f147ab21dd6a5a778531d097a51d06abd221

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago-distro: chromium: add patches to chromium recipe
- Commit SHA: d1ef0b67ed595c06f205f145736eaef81a3f670c

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH 0/2] piglit: use TestPlaceholder objects
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 15 Aug 2025 14:31:54 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1350f147ab21dd6a5a778531d097a51d06abd221

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago-distro: chromium: add patches to chromium recipe
- Commit SHA: 651670d4bc7d0187c50f5b805e1df1b69e0ca8e9

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




