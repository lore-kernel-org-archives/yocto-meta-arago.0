Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A28EC83F21
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 14:26:18 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.15272.1752243972410539809
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 07:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SqZ9e0QO;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56BEQBBq1826915
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 09:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752243971;
	bh=pTe1CZGURcWGyRmPq4RiFLTkbYBXYxIxHNzADKJm8NU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=SqZ9e0QO8XJDbpkV9cUxwP+AzrXjdWt5zxsCbakOcPwU7WrMsR7wmMv4VGc8xGaK9
	 OrE5Rr/sTAfakCbGM9kSPKxad1mScrSoT2O2r6VRBNEu8zGdPGPy/WGcPXDdcRPqd+
	 Pa0btGmTKRAEd3TjaHTOdeQTxb92MvTP+cz+Sv8E=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56BEQBLJ1219045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 09:26:11 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 09:26:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 09:26:11 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56BEQBws3626506;
	Fri, 11 Jul 2025 09:26:11 -0500
From: <a-christidis@ti.com>
To: <rs@ti.com>, <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][1/2] meta-arago-test: recipes-graphics: Add lightweight off-screen demo
Date: Fri, 11 Jul 2025 09:26:10 -0500
Message-ID: <20250711142611.3567574-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711142611.3567574-1-a-christidis@ti.com>
References: <20250711142611.3567574-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 14:26:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16286

From: Antonios Christidis <a-christidis@ti.com>

Add recipe for lightweight off-screen rendering demo.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../offscreen-demo/offscreendemo_0.0.1.bb        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb

diff --git a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
new file mode 100644
index 00000000..f0b6a1fd
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Lightweight Render Example"
+DESCRIPTION = "Lightweight Render Example. Heavily inspired by Eduardo Lima's gpu-playground, this attempts to act as the smallest demo of offscreen rendering."
+
+HOMEPAGE = "https://github.com/StaticRocket/lightweight-offscreen"
+
+SRC_URI = "git://github.com/StaticRocket/lightweight-offscreen.git;protocol=https;branch=master"
+SRCREV = "eac40e0073cb5f81688aee890e0a67f99678a290"
+
+LICENSE = "CC0-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "virtual/egl virtual/libgles2 mesa-pvr"
+
+inherit pkgconfig meson
-- 
2.34.1


