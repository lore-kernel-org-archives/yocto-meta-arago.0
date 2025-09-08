Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9DACAC582
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 18:56:08 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3048.1757357761729926964
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 11:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BTLtcYKy;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Iu1Yl115704
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 13:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757357761;
	bh=wzRK9QlFIgeHbX7Thr7dd5umW7ZAi/aac1bf3GFAYEA=;
	h=From:To:Subject:Date;
	b=BTLtcYKy0qdxudOXDYgkDPMQb62Hh97GMlryqLDbXBN/7W5y34MeZuYZuTpoPNsYO
	 OWgAmzkV+i10pSeycfxLS5p56YsOllLGJcDSQdibgqtIMoDknFXN+8/4TaA3B7Qb1Y
	 1HgxSggs91SjQeZKTJU75ecw/9tfetLCbr15d/5Q=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Iu16L3977337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 13:56:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 13:56:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 13:56:00 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Iu0aE1367803;
	Mon, 8 Sep 2025 13:56:00 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v3 0/3] opencl-clhpp: v2.0.16 ->  v2024.05.08
Date: Mon, 8 Sep 2025 13:55:57 -0500
Message-ID: <20250908185600.152317-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Sep 2025 18:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16548

From: Antonios Christidis <a-christidis@ti.com> 

Dear all, 

The C OpenCL Headers are on version 2024.05.08, however the C++ are lagging
behind. With this patch series, I am bumping the C++ OpenCL headers also to
version 2024.05.08. 

The C++ headers, depend on cmake files from the C headers. The current
package was not providing them. I made some changes to correct this. 

This series is a continuation to the following: 
https://patchwork.yoctoproject.org/project/arago/list/?series=34239&state=*

Kind Regards,
Antonios


Antonios Christidis (3): meta-arago-test: recipes-extended: Cmake support
for opencl-headers meta-arago-test: recipes-extended: Specify correct PV
for ocl headers meta-arago-test: recipes-extended: opencl-clhpp v2.0.16 ->
v2024.05.08

 .../opencl/opencl-clhpp_%.bbappend               |  4 ++++
.../recipes-extended/opencl/opencl_clhpp-ti.inc  |  7 +++++++
.../opencl/opencl_headers-ti.inc                 | 16 ++++++++++++++++ 3
files changed, 27 insertions(+) create mode 100644
meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend create mode
100644 meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc

-- 2.34.1


