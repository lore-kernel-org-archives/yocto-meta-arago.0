Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF81FCAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 19:35:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.263.1758828932356361917
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 12:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Coy+W1ln;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PJZU6d1523242;
	Thu, 25 Sep 2025 14:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758828930; i=@ti.com;
	bh=53VjEV8nc1HxIv3NytrTyPB/+No/bJDia/OW8nah048=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Coy+W1lnHSOxbLI079uK9jLFgLN4D03Ulx8LYp1djpuabIEkQah2WmL1sOI2j5MWz
	 4rdsI7ImQHTD3Smd6lGb3IelObXCFWAPhc9Th1lUvV497fp6qUuG1Ov1w/9JX9URuq
	 VMc9Jma/2chEoV3ZktvP/dapAdAijgzYSWwO/BEc=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PJZUAg3782050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Sep 2025 14:35:30 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 25 Sep
 2025 14:35:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 14:35:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PJZU8H077741;
	Thu, 25 Sep 2025 14:35:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 20C17168FED; Thu, 25 Sep 2025 14:35:30 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [master][PATCH v2] linux-firmware-arago: correct removal of overlapping FW
Date: Thu, 25 Sep 2025 14:35:30 -0500
Message-ID: <20250925193530.1853671-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250925193019.2938469-1-denis@denix.org>
References: <20250925193019.2938469-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 19:35:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16639

meta-arago / na / 20250925193019.2938469-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH v2] linux-firmware-arago: correct removal of overlapping FW
    WARN: Commit message does not include file/recipe name: linux-firmware-arago: correct removal of overlapping FW. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH v2] linux-firmware-arago: correct removal of overlapping FW
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Thu, 25 Sep 2025 15:30:19 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c7753a67a6e1bcb35152ed4024885a47bbbc2428

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Make opencl-cts dependent on DISTRO_FEATURES
- Commit SHA: d3532063218f5c47b5e912554a0b236eb25e61f4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




