Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E171FCCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 12:00:28 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.41639.1760356826529520956
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 05:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=blbbik8O;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DC0OU1891569;
	Mon, 13 Oct 2025 07:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760356824; i=@ti.com;
	bh=yyEHicqRjJR1VEJ8zUa7b6tKETEAmPxlJOBjC7rMXG4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=blbbik8OeuHMOzMMMNaCeTmuTRDJ2CMRLhxD4Iz/11YGC0QdJ2MXQ0HFwi7W2GTMy
	 RBVOUBnR9S9Zc5evN1sk1t0h1pt/HDDBhPCbiv+19NeoDAIGdgQxoGmIqq+tT9+rjr
	 A47XqOTwqQTw3KKq2eh3rPlOw6ALzRxY6qGZnNs4=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DC0OnT3162064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 07:00:24 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 07:00:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 07:00:24 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DC0OxR2007844;
	Mon, 13 Oct 2025 07:00:24 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 023A61856CD; Mon, 13 Oct 2025 07:00:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v3 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
Date: Mon, 13 Oct 2025 07:00:23 -0500
Message-ID: <20251013120023.3514895-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251013115734.3733931-1-afd@ti.com>
References: <20251013115734.3733931-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 13 Oct 2025 12:00:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16688

meta-arago / na / 20251013115734.3733931-1-afd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH v3 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [meta-arago][master][PATCH v3 2/2] meta-arago-extras: hevc-arm-decoder: Remove this recipe
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH v3 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Daniel Schultz <d.schultz@phytec.de>
-From: Denys Dmytriyenko <denys@ti.com>
- Date: Date: Mon, 13 Oct 2025 06:57:33 -0500
-Date: Tue, 6 Aug 2024 11:26:55 +0200
-Date: Tue, 22 Jan 2019 20:39:15 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: fc1b7c960c29a3048f8733773fc5d170a0f9444f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: pm-qa: Add PATCHTOOL = "git"
- Commit SHA: c97d76c64e1dad0b998c3b73dd74bd2201b88ff9

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




