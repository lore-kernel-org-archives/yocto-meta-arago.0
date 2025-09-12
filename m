Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4651CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 21:20:23 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.128.1757712022752296430
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 14:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M+UPfV8l;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CLKKb81111809;
	Fri, 12 Sep 2025 16:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757712020; i=@ti.com;
	bh=ryd1xwtyL95cuFcazfENR92Kd6hWmjR7A02b5eBQQtU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=M+UPfV8laxGKlhhQ52hO4DUy23lW2CM7OrOLZ6wpk4VzdFvnd4QFDDq20hVjros6g
	 u6E3v3zxeAabhzlYUmtpXAjSZIz9KMhHni8/I+vZH50KEv+OXVlJZDvRO9ZrEil8TZ
	 YVk+jOC7j1pDzsY6HUXchAn3tBCylvTMVSzL2Fiw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CLKKmB3055271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 16:20:20 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 16:20:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 16:20:20 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CLKKhr006697;
	Fri, 12 Sep 2025 16:20:20 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 36A45185659; Fri, 12 Sep 2025 16:20:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>,
        <meta-arago@lists.yoctoproject.org>,
        Chirag
 Shilwant <c-shilwant@ti.com>
Subject: Re: [scarthgap][PATCH v3] hwspinlocktest: Update hwspinlock recipe remote repo url
Date: Fri, 12 Sep 2025 16:20:20 -0500
Message-ID: <20250912212020.1624086-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250912211811.2789974-1-jm@ti.com>
References: <20250912211811.2789974-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Sep 2025 21:20:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16580

meta-arago / na / 20250912211811.2789974-1-jm

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [scarthgap][PATCH v3] hwspinlocktest: Update hwspinlock recipe remote repo url
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [scarthgap][PATCH v3] hwspinlocktest: Update hwspinlock recipe remote repo url
- Submitter: From: Judith Mendez <jm@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Judith Mendez <jm@ti.com>
- Date: Date: Fri, 12 Sep 2025 16:18:11 -0500
-Date: Fri, 11 Apr 2025 13:49:11 -0500
-Date: Mon, 18 Nov 2024 14:57:45 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fb4178e7a6d37774f4bd1ae4717c539e515dae15

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: opencl-clhpp: opencl-clhpp v2.0.16 -> v2024.05.08
- Commit SHA: 449e984b83aaa6fd464654e98dbf44f60aa960a4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




