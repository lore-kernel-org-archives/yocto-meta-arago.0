Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF57ECA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 19:05:19 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3145.1756494319513361832
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 12:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vd0FlgFu;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57TJ5IMf2277272;
	Fri, 29 Aug 2025 14:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756494318; i=@ti.com;
	bh=VDNVvfZMaHZ9ORVaH0Y28S/QyKJY+DM8M3ywtlVW55U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vd0FlgFuwTc8Vb8wljQpsQMCzvo9MOi88MXYcCUPgXQWWrFwRb8CELvI+nDfGabH/
	 Q/HPxxB7e5+7diSwWGgCgmjvUEY0FMmrePHceMyskz8/GRZVMcnwvvNYrGBz+guCYk
	 bSeRBsc4XDyZMkIBWOQV3JGSrEdB6DYFdQDWC9FY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57TJ5INc032135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 14:05:18 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 14:05:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 14:05:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57TJ5HvP2804957;
	Fri, 29 Aug 2025 14:05:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 80CDE13F52D; Fri, 29 Aug 2025 14:05:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <afd@ti.com>,
        <reatmon@ti.com>, <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v4] chromium: Replace /dev/video* with Chromium naming convention
Date: Fri, 29 Aug 2025 14:05:17 -0500
Message-ID: <20250829190517.3776770-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250829190412.1644519-1-t-lannynd@ti.com>
References: <20250829190412.1644519-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 29 Aug 2025 19:05:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16506

meta-arago / na / 20250829190412.1644519-1-t-lannynd

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
- Patch Series: [meta-arago][scarthgap][PATCH v4] chromium: Replace /dev/video* with Chromium naming convention
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
-From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Fri, 29 Aug 2025 14:04:12 -0500
-Date: Thu, 7 Aug 2025 14:48:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f28c77222133b48d94830fcb37627a445fd7017f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202508281316
- Commit SHA: 852ba60bcfb7e4ed33f458dfc2c18819e06f875c

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




