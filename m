Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13187CCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:45:28 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.9026.1759412719749371988
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=V624sG4h;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DjIV53295598;
	Thu, 2 Oct 2025 08:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759412718; i=@ti.com;
	bh=ZJIOG02P3lJSkCm6/wXWyvxHTtcLY3MuL4vvWdV241s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=V624sG4hWQyfpLJ0nEcnucEqbSnl7LydwATRDa6wH61AEwQudFrwVO/tKWyml0bXx
	 glU6rbzoh+vQQOaiZyaOMhCSiX3x/yp2EraxQLCdGXm7SARcWiHh8MpDqFGa299o0H
	 YjMzZNOJSk5J0XFO3VqfG0xuUffF43CKURPy3vKM=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DjIIX466744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 08:45:18 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 08:45:18 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:45:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DjIct074283;
	Thu, 2 Oct 2025 08:45:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 011991801A4; Thu,  2 Oct 2025 08:45:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
Date: Thu, 2 Oct 2025 08:45:17 -0500
Message-ID: <20251002134517.120838-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251002134349.1818652-1-afd@ti.com>
References: <20251002134349.1818652-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16669

meta-arago / na / 20251002134349.1818652-1-afd

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
- Patch Series: [meta-arago][master][PATCH 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Daniel Schultz <d.schultz@phytec.de>
-From: Denys Dmytriyenko <denys@ti.com>
- Date: Date: Thu, 2 Oct 2025 08:43:48 -0500
-Date: Tue, 6 Aug 2024 11:26:55 +0200
-Date: Tue, 22 Jan 2019 20:39:15 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 53fce5088a91d13982a634412a6b1a2c0ee8c933

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Disable opengl for opencl-cts
- Commit SHA: 7e2bd85d8a6cd62318139012119c3386c7e1deea

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




