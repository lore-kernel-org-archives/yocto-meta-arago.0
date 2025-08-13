Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D79FCA0EF4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10200.1755127552928906151
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ifd/dVvd;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPqIg1803053;
	Wed, 13 Aug 2025 18:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127552; i=@ti.com;
	bh=g8VJnucstMRnImzL+WHwsxdIp9h6SsVQf3ByhGpceh4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ifd/dVvdConP4U0XyqODl7zqTKNGEP56s0UZc00jFnVR73IQ6GKeuWLbYH7g4KJWZ
	 m+iNxcTSu7arCoubHAFvZ/KiyCFXtZ00ZKYbgUyBZF9tp+kQtWxKcsfhdWWL8DK+e/
	 aEupKfr2OM1tATKZpmBDumPhKcVI/4zsSyzt6WFU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPqCx1412366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:52 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:51 -0500
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPpcR2710334;
	Wed, 13 Aug 2025 18:25:51 -0500
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id BCD521436D0; Wed, 13 Aug 2025 18:25:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][kirkstone/master][PATCH 1/3] ti-crypto-examples: Remove
Date: Wed, 13 Aug 2025 18:25:51 -0500
Message-ID: <20250813232551.2448653-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220711164933.21445-1-afd@ti.com>
References: <20220711164933.21445-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16431

meta-arago / na / 20220711164933.21445-1-afd

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-arago][kirkstone/master][PATCH 2/3] big-data-ipc-demo: Merge include file and rename
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-UPDATE-1)
        patch




