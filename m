Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC799CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:35:30 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.11304.1761312923036903866
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 06:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yOgOXY/2;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59ODZLOE1897830;
	Fri, 24 Oct 2025 08:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761312921; i=@ti.com;
	bh=Ew4qpegMtiUbJ0IDVj3FNJIX4kC70nscRAtdJTwgQC8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yOgOXY/24h+sir3oINVV+Fcm2P6SoJ8ABQaafzryRkEgZnY/gWr//dhDj9SUCvJVE
	 e6gS8zwSbeU8E3aDkrp8Uasa0nxMlQja5Nm1Se4Wc7eLMkil0qI4bTFnjTXp+Lz52V
	 NbEgK2mOXXoNRVmI0J/ik/gvFYZZYw2bOUi+3lVI=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59ODZLsJ3911003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 08:35:21 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 08:35:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 08:35:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59ODZKnB394096;
	Fri, 24 Oct 2025 08:35:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B42DD18122B; Fri, 24 Oct 2025 08:35:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510240100
Date: Fri, 24 Oct 2025 08:35:20 -0500
Message-ID: <20251024133520.2608317-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251024133307.804954-1-lcpdbld@list.ti.com>
References: <20251024133307.804954-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:35:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16704

meta-arago / na / 20251024133307.804954-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510240100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.master.202510240100. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510240100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 24 Oct 2025 08:33:07 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 82255d43fb9536001e8c0710bc3fd1bc91ee7422

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: packagegroup-arago-standalone-sdk-target: Remove duplicate opkg-dev
- Commit SHA: 8dc130979f6cc7493483f751a89b5afdf71f4d39

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




