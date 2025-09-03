Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CBCCA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 05:00:28 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.5168.1756875625217831069
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 22:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eInvdcwG;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58350OrW3146766
	for <meta-arago@lists.yoctoproject.org>; Wed, 3 Sep 2025 00:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756875624; i=@ti.com;
	bh=r8oQsl+3ffeOCnxdJTCID/ZavlsFxU9YsuEBdDVtUTk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Post;
	b=eInvdcwGKWKo+a6RVy9/lhUVcANAq+RRMMFkkeD3+Sd4SQ11ObmxY1fDYjKX9e7Kq
	 pPYK3XUrTdAEFGgNeKGWnS0cFAMqYReA01fTIQsYP+KG+fx5KR/mR5X9j3CCGavDXL
	 oU8PNll2E/ynOL3+pryS1Om0HPbW6mv/bhm+Ws90=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58350OEs3266339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 3 Sep 2025 00:00:24 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 00:00:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 00:00:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58350NGK722599;
	Wed, 3 Sep 2025 00:00:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3AA3613F52F; Wed,  3 Sep 2025 00:00:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <linux-patch-review@list.ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>
Subject: Re: [meta-arago][PATCH 0/1] Use tisdk-tiny-initramfs in the
Date: Wed, 3 Sep 2025 00:00:23 -0500
Message-ID: <20250903050023.2042276-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250903045559.830651-1-m-shah@ti.com>
References: <20250903045559.830651-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Sep 2025 05:00:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16517

meta-arago / na / 20250903045559.830651-1-m-shah

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
- Patch Series: [meta-arago][PATCH 0/1] Use tisdk-tiny-initramfs in the
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Wed, 3 Sep 2025 10:25:58 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 780dc3cfae93d3ce58116cb27bb4410505c12a63

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508250100
- Commit SHA: 24d17d9be7261e4d78fa74d3f0e90c228a875519

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




