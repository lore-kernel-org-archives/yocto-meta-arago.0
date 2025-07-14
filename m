Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702F9C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 18:35:24 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.85688.1752518119787208375
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 11:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F2CIKhJj;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56EIZJHq2435051
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752518119;
	bh=MLCs1cDNOo5Z5/PoCg6SWiVhEUb3v155WGkhTa/yoQo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F2CIKhJjJ5ox2ZzfvTkfLTcLAD8NdW/TsTAiMkwuVwyOgsBI5hewc/GgPYTUcoUiC
	 5+aI70KpmfZQ9HoFOyOFOcUyclS/cQHT2KGx9VHG88GsXV8mKn97rXsFds2MRFE3R+
	 3H01mjXWkm6D3n84EEXoZnXsXOfRDcSbrgyAWRLw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56EIZIYu2073441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 13:35:19 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 13:35:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 13:35:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56EIZIv91246697;
	Mon, 14 Jul 2025 13:35:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [meta-arago][master][PATCH v2 1/2] meta-arago-test: recipes-graphics: Add lightweight off-screen demo
Date: Mon, 14 Jul 2025 13:35:17 -0500
Message-ID: <20250714183518.1116312-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714183518.1116312-1-a-christidis@ti.com>
References: <20250714183518.1116312-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Jul 2025 18:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16299

From: Antonios Christidis <a-christidis@ti.com>

Add recipe for lightweight off-screen rendering demo.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Changed the SRC_URI and removed mesa-pvr as a dependency

 .../offscreen-demo/offscreendemo_0.0.1.bb          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb

diff --git a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
new file mode 100644
index 00000000..a0b3355e
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Lightweight Render Example"
+DESCRIPTION = "Lightweight Render Example. Heavily inspired by Eduardo Lima's gpu-playground, this attempts to act as the smallest demo of offscreen rendering."
+
+HOMEPAGE = "https://github.com/StaticRocket/lightweight-offscreen"
+
+SRC_URI = "git://github.com/TexasInstruments/graphics-tests.git;protocol=https;branch=master"
+SRCREV = "eac40e0073cb5f81688aee890e0a67f99678a290"
+
+LICENSE = "CC0-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
+
+DEPENDS += "virtual/egl virtual/libgles2"
+
+inherit pkgconfig meson
-- 
2.34.1


