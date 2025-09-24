Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3557CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 13:45:28 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.13529.1758721521500188271
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 06:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BffqVcbu;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58ODjKHx1709412;
	Wed, 24 Sep 2025 08:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758721520; i=@ti.com;
	bh=9L1LbN7prR3u4ncJ6nd2yVa2RnktmLGppqA4+n0xQz4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BffqVcbuEKvWAf5ZuCcBPZ4kWmrgyc8gAOHLfIcFil9DMOHccZjGfVWprZnf7NBhu
	 PnM6JBpHfmW/kFG47afewZYNeNaeaBrNQoaC/mp0sTZyiHsNiBfID8GbZAV/Nkl/VX
	 bIhV205YbeVBMVnBuU+XLhxfboPWIdZy9175lzuU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58ODjKZJ2475521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 24 Sep 2025 08:45:20 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 08:45:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 08:45:20 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58ODjJ9t1826970;
	Wed, 24 Sep 2025 08:45:19 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id D7F4CD6F33; Wed, 24 Sep 2025 08:45:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] check_yocto_rules: Flip to regex for files
Date: Wed, 24 Sep 2025 08:45:19 -0500
Message-ID: <20250924134519.881837-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250924134256.18304-1-reatmon@ti.com>
References: <20250924134256.18304-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 13:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16620

meta-arago / na / 20250924134256.18304-1-reatmon

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
- Patch Series: [meta-arago][scarthgap][PATCH] check_yocto_rules: Flip to regex for files
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 24 Sep 2025 08:42:56 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0277b0ac060ab8091c5161d4f6171fd817704143

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509181257
- Commit SHA: 96f3c5b8e2efec96de9db131992e56272becc174

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




