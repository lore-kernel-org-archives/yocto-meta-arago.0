Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C765CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:40:28 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.9307.1759412421861043000
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PU9h/VEm;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DeJqx3346604;
	Thu, 2 Oct 2025 08:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759412419; i=@ti.com;
	bh=1J36hUxNoeoo8bfOIsJZrwQFAN96PnzZmhYADiEOXL4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PU9h/VEmW6tKZbNZhjq7vtJftc3rGfIY9KLPypuEaasGMI0qA2GeWCcEr3K1Lhf37
	 PquT77tz4q7tEcxFMTEjOM5HOFonmxIObOvRiceRfMHAzA/M2YcE42DvmnB2oRQA7g
	 trg2qSQPQcOZAplBmAjbaCwsjj3/lp7eIRCImMPc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DeJNp464365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 2 Oct 2025 08:40:19 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 2
 Oct 2025 08:40:18 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:40:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DeIt6070880;
	Thu, 2 Oct 2025 08:40:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B7F611801A4; Thu,  2 Oct 2025 08:40:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
Date: Thu, 2 Oct 2025 08:40:18 -0500
Message-ID: <20251002134018.119515-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251002133735.1817686-1-afd@ti.com>
References: <20251002133735.1817686-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:40:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16663

meta-arago / na / 20251002133735.1817686-1-afd

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
- Patch Series: [meta-arago][scarthgap][PATCH 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Denys Dmytriyenko <denys@ti.com>
- Date: Date: Thu, 2 Oct 2025 08:37:34 -0500
-Date: Tue, 22 Jan 2019 20:39:15 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 817f8d2fcf28a509a55003d6cb067b7dff350261

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: ti-test: Add libsdl2-tests to packagegroup
- Commit SHA: 94aba9851641f221eb7334cc2c4873c0eb04fc35

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




