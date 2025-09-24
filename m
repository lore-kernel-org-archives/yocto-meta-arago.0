Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB63CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 17:30:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.20316.1758735018581921337
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 10:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IdMnOHZY;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58OHUIgo1748640
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 12:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758735018; i=@ti.com;
	bh=oM3VohEn6Ubpc/NGbtsnjSfv34b1B/0GCI/vos/ocBs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IdMnOHZY4OhSkwfYmlgbSeweLsmdhomDyKeEukRJSEkmCbjaVh6YLyjXIESP2sEjk
	 r/JBOnuEb++kE3B7cPd9Dbw9I78NwfU7SMbLXZ8t9GNe8kHgTvYCdgGM0eQ0bGZEp+
	 CrV8ZFi56pKyeUtZeUCaVJlMpysJoAL7Cmxey5Sw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58OHUIiQ2599181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 12:30:18 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 12:30:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 12:30:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58OHUHLK2117292;
	Wed, 24 Sep 2025 12:30:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 625A6181221; Wed, 24 Sep 2025 12:30:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <c-shilwant@ti.com>, <khasim@ti.com>, <v-singh1@ti.com>
Subject: Re: [scarthgap][PATCH] meta-arago-test: hwspinlocktest: Update SRCREV to latest
Date: Wed, 24 Sep 2025 12:30:17 -0500
Message-ID: <20250924173017.2622060-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250924172610.8166-1-p-bhagat@ti.com>
References: <20250924172610.8166-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 17:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16623

meta-arago / na / 20250924172610.8166-1-p-bhagat

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [scarthgap][PATCH] meta-arago-test: hwspinlocktest: Update SRCREV to latest
    WARN: Commit message should not include directory path to recipe: meta-arago-test: hwspinlocktest: Update SRCREV to latest.
              meta-arago-test: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [scarthgap][PATCH] meta-arago-test: hwspinlocktest: Update SRCREV to latest
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 24 Sep 2025 22:56:10 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5835411a904d7fb7ee2ba99e93b16725babe7e64

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Flip to regex for files
- Commit SHA: 7aedd68536e2fdc3f84579560e8c5a99c98a12d0

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




