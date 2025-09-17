Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C39CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 23:10:37 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.737.1758150617699632955
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 16:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W6Tk5E/l;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HNAHxB356644
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 18:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758150617; i=@ti.com;
	bh=TWdSR10MRZ3ltVVjm13XlZyOywv9xSzZuFD1TsDrf5M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=W6Tk5E/lYskuNz+L09mD+k7xlfrwKxtECs5xEB/uhB5W/Nasa6nkzelBWiEB40GC3
	 XYEECBbQpS38IMQnRIX91RDy/Zl/zffqrOfPJroYUjMMHtOr5kXJJ1F1qiKcbTcfHv
	 bTN6oS3M/Vh6qUn3T8m0yYkTHTdYH5x1+GNfsYoM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HNAHPi1105920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 18:10:17 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 18:10:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 18:10:16 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HNAGoX3825673;
	Wed, 17 Sep 2025 18:10:16 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CA9CA13F536; Wed, 17 Sep 2025 18:10:16 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v1 0/2] Add ktx-software
Date: Wed, 17 Sep 2025 18:10:16 -0500
Message-ID: <20250917231016.2346839-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250917230859.2083846-1-a-christidis@ti.com>
References: <20250917230859.2083846-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 23:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16592

meta-arago / na / 20250917230859.2083846-1-a-christidis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH v1 1/2] licenses: Add licenses for ktx-software
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [meta-arago][scarthgap][PATCH v1 2/2] ktx-software: Add recipe v4.4.0
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v1 0/2] Add ktx-software
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 17 Sep 2025 18:08:57 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 8e996688f3cc8abc531f90a09bd2076e6483622a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: ti-test: Add libsdl2-tests to packagegroup
- Commit SHA: e6a424b6288cbc0806ed63349521100c498cbe88

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




