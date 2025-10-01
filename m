Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841DECCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 18:36:17 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4940.1759343771272682257
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Oct 2025 11:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GHG7nHbi;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 591Ia7xr2727458;
	Wed, 1 Oct 2025 13:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759343767; i=@ti.com;
	bh=NvIruwkcphSZsUoGcU/MEIjMDrEoqUExeKj/hPaY2ls=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GHG7nHbi7JdJ5D7HIT1jnNyIXXbgKpRcW5gB6AaPqglEk2Tgl3xuCi/msTJPSgUpp
	 JHvwD1o88KpVNuyBRl+rMlY4pPJB4qUByAjgOYFfgfKkD3GEA/xmpmCIf2dmXRv+Y/
	 iGpix5srKJFr0TUPetmz+acgWI0ZZf4EKhlmeYW0=
Received: from DFLE212.ent.ti.com (dfle212.ent.ti.com [10.64.6.70])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 591Ia7Bx670660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Oct 2025 13:36:07 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 13:36:07 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 13:36:07 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 591Ia7RJ3526634;
	Wed, 1 Oct 2025 13:36:07 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7FE7813F52D; Wed,  1 Oct 2025 13:36:07 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>, <s-jain1@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH 1/2] emptty: backport fix for signal handeling
Date: Wed, 1 Oct 2025 13:36:07 -0500
Message-ID: <20251001183607.1911110-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251001183102.357345-1-rs@ti.com>
References: <20251001183102.357345-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Oct 2025 18:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16660

meta-arago / na / 20251001183102.357345-1-rs

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH 1/2] emptty: backport fix for signal handeling
    WARN: Commit message should not include directory path to recipe: emptty: backport fix for signal handeling.
              emptty: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH 1/2] emptty: backport fix for signal handeling
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
+From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 1 Oct 2025 13:31:01 -0500
+Date: Tue, 30 Sep 2025 20:05:05 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: b187606b26e81402f170cc37c03e685e1673ad37

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: ti-test: Add libsdl2-tests to packagegroup
- Commit SHA: 94aba9851641f221eb7334cc2c4873c0eb04fc35

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




