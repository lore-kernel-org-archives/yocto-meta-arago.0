Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20873CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 22:30:25 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4510.1761604219113790895
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 15:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IKfuxcFE;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RMUI5O1353590
	for <meta-arago@lists.yoctoproject.org>; Mon, 27 Oct 2025 17:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761604218; i=@ti.com;
	bh=RsIH4WjHE8lL3M6DBlFJV2Rtsq38L7qOpT7miExDlFY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IKfuxcFELd7J+ACRXXZ2iaUr9N7cgVuSNi5DuG4KF6lWWO4tMZcLjuGxBITxEBV5+
	 tbdnI2cSRaW4C2cmrwKVktlitmT+z2BR1CWne/GRzSPjf7mYmxS1R8QWUl+2BpNlA2
	 fWnrE4UzLFV5xCdLgX8BbFx1lxVgkAlok6Kn5aWo=
Received: from DLEE206.ent.ti.com (dlee206.ent.ti.com [157.170.170.90])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RMUIJZ1944309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 27 Oct 2025 17:30:18 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 17:30:18 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 17:30:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RMUIaD096511;
	Mon, 27 Oct 2025 17:30:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 16B7913F536; Mon, 27 Oct 2025 17:30:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH]  packagegroup-arago-tisdk-graphics-sdk-target: Add stb-dev
Date: Mon, 27 Oct 2025 17:30:18 -0500
Message-ID: <20251027223018.490662-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251027222551.2445083-1-a-christidis@ti.com>
References: <20251027222551.2445083-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Oct 2025 22:30:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16706

meta-arago / na / 20251027222551.2445083-1-a-christidis

PRC Results: FAIL

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
- Patch Series: [meta-arago][scarthgap][PATCH]  packagegroup-arago-tisdk-graphics-sdk-target: Add stb-dev
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Mon, 27 Oct 2025 17:25:51 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b965bf586ec3c736cc14750735d3a61e2f911fbf

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202510231214
- Commit SHA: 79da6b4a0ae6285a9bf2806c2cffc186d6c40a3a

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    WARN: Include file should reference ${BPN}: opencl_clhpp-ti.inc (GUARD-3)
        meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend:2
            OPENCL_HEADERS_TI:ti-soc = "opencl_clhpp-ti.inc"
    
    WARN: Include file should reference ${BPN}: opencl_headers-ti.inc (GUARD-3)
        meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend:2
            OPENCL_HEADERS_TI:ti-soc = "opencl_headers-ti.inc"
    
    
    Code Summary
    ============
    
    GUARD-3
    -------------------------------------------
      The guard file should be named the same as the bbappend.  Feel free
      to use ${BPN} to make it easier.




