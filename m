Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597E3C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 15:21:29 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1623.1752765679400182353
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 08:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q6FnYlTu;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HFLJQP040538
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 10:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752765679;
	bh=ct4+wEInVWv6opHb8PKkupkCqpvvXWw8/YGYvUuKv+A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q6FnYlTuwormy+VZMatqwe7WVIQFF5BzAd7XikAOuOd7QWz+HW5gHPei09dhL9tvk
	 Fgy/in5nnSPQt8fOi185g8bJimutFMepY1O8oPUa8b6UnOt0lOm94pKaYmbBuh3Xp1
	 1EepbfUV+zEnmXerpLu8GZ87JKQd7W6dYx5vpt0o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HFLIEL316220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 10:21:18 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 10:21:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 10:21:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HFLI3w2065602;
	Thu, 17 Jul 2025 10:21:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [meta-arago][master][PATCH v3 1/2] meta-arago-test: recipes-graphics: Add lightweight off-screen demo
Date: Thu, 17 Jul 2025 10:21:17 -0500
Message-ID: <20250717152118.2525721-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717152118.2525721-1-a-christidis@ti.com>
References: <20250717152118.2525721-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 15:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16308

From: Antonios Christidis <a-christidis@ti.com>

Add recipe for lightweight off-screen rendering demo.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v3:
- CHange the SRC_URI ... I thought I changed it in v2. 

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
+HOMEPAGE = "https://github.com/TexasInstruments/graphics-tests.git"
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


