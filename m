Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE71CCCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 12:00:38 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.41640.1760356829354306514
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 05:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=K3SbDNl4;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DC0Onw1253144;
	Mon, 13 Oct 2025 07:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760356824; i=@ti.com;
	bh=lrHFbcs2T/3qhjFrVrt0DAg75oNLf4evCz0VO91i2dM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=K3SbDNl4rZm4PNcI55LF+r9JjheaulA6BTVOLUKqQqdYWfynp+ZX1rhCO951mBPn1
	 0QTWpxDa00KJ8pwY1AcU4NvaDNx9ic76xZeDk4DVcphPiR4GoEM73X5SQRU+9qTOba
	 7K/pTZVzN1XoeUflde35qloaTKjeagIZuHzAhOmQ=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DC0Okw2938971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 07:00:24 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 07:00:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 07:00:24 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DC0OhJ1773123;
	Mon, 13 Oct 2025 07:00:24 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id EE45E185661; Mon, 13 Oct 2025 07:00:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH v3 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
Date: Mon, 13 Oct 2025 07:00:23 -0500
Message-ID: <20251013120023.3514827-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251013115504.3733584-1-afd@ti.com>
References: <20251013115504.3733584-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 13 Oct 2025 12:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16689

meta-arago / na / 20251013115504.3733584-1-afd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH v3 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [meta-arago][scarthgap][PATCH v3 2/2] meta-arago-extras: hevc-arm-decoder: Remove this recipe
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v3 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Daniel Schultz <d.schultz@phytec.de>
-From: Denys Dmytriyenko <denys@ti.com>
- Date: Date: Mon, 13 Oct 2025 06:55:03 -0500
-Date: Tue, 6 Aug 2024 11:26:55 +0200
-Date: Tue, 22 Jan 2019 20:39:15 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: fa7b5ef4204d49e930c6d44acda6946306dd48c2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: packagegroup-arago-tisdk-graphics-sdk-target: Add KTX and SDL2
- Commit SHA: e01485c1e9000cfdcfa7decf841cfa91def96f4e

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




