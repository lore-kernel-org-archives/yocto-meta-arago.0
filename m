Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE12CAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 19:46:15 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.486.1758829569118417046
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 12:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ogIe5blk;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PJk7L51502054;
	Thu, 25 Sep 2025 14:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758829567; i=@ti.com;
	bh=GJ/46FxZ9rX3xg0JKRTIaGaw9/LKKZmmu7ff9SVcGjc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ogIe5blk0v4bTRcmr2sHsnhzztbvYn1+P82jj7MVXs1/a/kEJpToJjbnJJQEReT3j
	 6X+bh0WX2dyBo9Bz+xwysT1cVvCBip2IjVJ2zexEBJ1KCDh92ffS6Gaf0lnA/ZFSED
	 LjHDJMzLX4ZQ/a4BTKyCx88HVJMmBUs/eqifNtXQ=
Received: from DLEE210.ent.ti.com (dlee210.ent.ti.com [157.170.170.112])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PJk7iR3787072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Sep 2025 14:46:07 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 25 Sep
 2025 14:46:07 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 14:46:07 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PJk7WN2227521;
	Thu, 25 Sep 2025 14:46:07 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 15250168FED; Thu, 25 Sep 2025 14:46:07 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [master][PATCH v3] linux-firmware-arago: correct removal of overlapping FW
Date: Thu, 25 Sep 2025 14:46:06 -0500
Message-ID: <20250925194606.2250092-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250925194435.2938752-1-denis@denix.org>
References: <20250925194435.2938752-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 19:46:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16644

meta-arago / na / 20250925194435.2938752-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH v3] linux-firmware-arago: correct removal of overlapping FW
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
- Patch Series: [master][PATCH v3] linux-firmware-arago: correct removal of overlapping FW
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Thu, 25 Sep 2025 15:44:35 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a4caee230bbd05ce6fe794914b0373d83daa5303

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




