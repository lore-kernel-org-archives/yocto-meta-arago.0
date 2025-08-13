Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F77CA1006
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.10213.1755127557344279578
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=h2UBZr0p;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPuIb2252546;
	Wed, 13 Aug 2025 18:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127556; i=@ti.com;
	bh=3Lql/zlvR7FVJINokUXpS1ojy+u52UdYZtEpxYMtAfo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=h2UBZr0pbC2DasWkw/LNx2my96B10uwuyepDWIrb9Rv4OUmrS9AkwFdaqqULOf1lh
	 tg14pjfqI/8eQvrAqY4OPZOw0FRQPQfFWOwdhwudkgSIpain3YBT6kCjSklRfaBjHZ
	 BXGYmvqe8Ryk6uS2N+kUuaqWOCQwRlsCdrlLmOqA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPuVo1412389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:56 -0500
Received: from fllvdckhpci086.itg.ti.com (fllvdckhpci086.itg.ti.com [10.64.72.34])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPuk12710386;
	Wed, 13 Aug 2025 18:25:56 -0500
Received: by fllvdckhpci086.itg.ti.com (Postfix, from userid 60899)
	id 078B3C516; Wed, 13 Aug 2025 18:25:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] go: Update reproducibility patch to fix panic errors
Date: Wed, 13 Aug 2025 18:25:55 -0500
Message-ID: <20250813232555.1590507-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20221130024403.30115-1-reatmon@ti.com>
References: <20221130024403.30115-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16458

meta-arago / na / 20221130024403.30115-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] go: Update reproducibility patch to fix panic errors
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Khem Raj <raj.khem@gmail.com>
- Date: Date: Tue, 29 Nov 2022 20:44:03 -0600
+Date: Mon, 28 Mar 2022 10:59:03 -0700
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3d4e345b088606972fb1bb24e158feb6e8569052

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago: Pull in the Yocto space optimization settings
- Commit SHA: 92c8f2e19343496fe865682b2f308be7ed7e7b9b

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




