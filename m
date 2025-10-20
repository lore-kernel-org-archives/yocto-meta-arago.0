Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5047ECCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 13:07:17 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.18203.1760965630110540493
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 06:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bjKy0dM8;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KD78UJ907695;
	Mon, 20 Oct 2025 08:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760965629; i=@ti.com;
	bh=nmkNM12JED7WUwc6XSyXtwvf4vVZ92jjV4YuJClWHCA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bjKy0dM83OyqKmPWxfQC1kOAxSs4/LCTCXFuWQjnI4m0F4/vB/9UmFjBs3fkLFF8w
	 QmO73ic4ZAexxzOYGim+tUkM+ORfqWJh6Q1e5g3Eu3wz4vVxhcUASgYRe4CRBO6gUW
	 nDSXZhht94WJA6q9Jcz7NxbRZs0j99vDhQNcpO0I=
Received: from DFLE212.ent.ti.com (dfle212.ent.ti.com [10.64.6.70])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KD78uL032658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Oct 2025 08:07:08 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 08:07:08 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 08:07:08 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KD78R91664757;
	Mon, 20 Oct 2025 08:07:08 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7203E13F538; Mon, 20 Oct 2025 08:07:08 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
Date: Mon, 20 Oct 2025 08:07:08 -0500
Message-ID: <20251020130708.576279-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251020130348.270528-1-lcpdbld@list.ti.com>
References: <20251020130348.270528-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Oct 2025 13:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16695

meta-arago / na / 20251020130348.270528-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.master.202510200100. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202510200100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 20 Oct 2025 08:03:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: dccd078d7c7a29547f8be86e987cc3f65952a3fb

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-arago-extras: hevc-arm-decoder: Remove this recipe
- Commit SHA: d1375d284422bc072890ed9bcdd08c18ba227be4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




