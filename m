Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE134CA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 23:40:26 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2298.1757115618220927175
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Sep 2025 16:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zQF3P9R8;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585NeHQ63424522
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757115617; i=@ti.com;
	bh=6z2HDNF0F0FKS2+0uhmM5aS212KZaxHWVJ3nPRbFMDo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zQF3P9R8+IHA8yRc62aYu4I490DTKvfRB7UxazvIQDinUpthcj3tQMaAfIfzhUeqa
	 K5sswFTnwY0cfbBQHQgUgN2yBsuhGHOBDISljlbOANRCyRhG2tHYpsqwX6/KFolQkq
	 w+I3EF/Do/F3F2Vv05ozOuSg/f5cHR7XvIyREdU0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585NeHN3692675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:40:17 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 18:40:17 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 18:40:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585NeHNH185389;
	Fri, 5 Sep 2025 18:40:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2C99613F531; Fri,  5 Sep 2025 18:40:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: Re: [meta-arago][master][PATCH v2 0/3] opencl-clhpp v2.0.16 ->  v2024.05.08
Date: Fri, 5 Sep 2025 18:40:17 -0500
Message-ID: <20250905234017.451963-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250905233849.2506703-1-a-christidis@ti.com>
References: <20250905233849.2506703-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Sep 2025 23:40:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16540

meta-arago / na / 20250905233849.2506703-1-a-christidis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH v2 0/3] opencl-clhpp v2.0.16 ->  v2024.05.08
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com> 
- Date: Date: Fri, 5 Sep 2025 18:38:46 -0500
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 93b8b15fea3dafa11a204a71fc932cfa8521a8c5

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508250100
- Commit SHA: 24d17d9be7261e4d78fa74d3f0e90c228a875519

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH v2 1/3] meta-arago-test: recipes-extended: Cmake support for opencl-headers
    error: meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc: does not exist in index
    Applying: meta-arago-test: recipes-extended: Cmake support for opencl-headers
    Patch failed at 0001 meta-arago-test: recipes-extended: Cmake support for opencl-headers




