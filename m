Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB9ACAC580
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 23:38:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2361.1757115531237652606
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Sep 2025 16:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AXuzd281;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585NcoXJ3812427
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757115530;
	bh=l5SscmGy1wKf7O1EcY3bvsNXYSbhBN1DgH7M8N8xuqI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AXuzd281NH7EFLRKjgywFZ6Un4iBP1tw0jtJegAGnKOa19sQTZpy3mUH0TOTmYeX8
	 QXU3nXTl4Eo2/nC/y00AiRarojOAPUEC8mNTx0ZylJIkP9O1B7p2mkuKgC51euGbst
	 26T9etdNp937J+wgobv3Dxeeu8vlgKRqQEoyVUtY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585NcomA1232705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:38:50 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 18:38:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 18:38:49 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585Nco9W1174327;
	Fri, 5 Sep 2025 18:38:50 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][master][PATCH v2 1/3] meta-arago-test: recipes-extended: Cmake support for opencl-headers
Date: Fri, 5 Sep 2025 18:38:47 -0500
Message-ID: <20250905233849.2506703-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905233849.2506703-1-a-christidis@ti.com>
References: <20250905233849.2506703-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Sep 2025 23:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16539

From: Antonios Christidis <a-christidis@ti.com>

In the meta-oe recipe, where the bbappend links from, the recipe does
not use cmake. It explicitly disabled do_configure and do_compile
tasks. While setting up a custom do_install task.

Since cmake support exists, use it. It will automatically
configure, build and install the header files, as well as cmake files.

Such cmake files are a dependency, for the c++ opencl headers.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Implemented the changes in a yocto compliant way, not by creating a new recipe outright

 .../recipes-extended/opencl/opencl_headers-ti.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
index 4dff02d9..48335204 100644
--- a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
+++ b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
@@ -1 +1,16 @@
+inherit cmake
+
 SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
+
+EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
+
+python() {
+    # Delete the noexec flags for the following tasks.
+    # Ensuring the tasks run.
+    d.delVarFlag("do_configure", "noexec")
+    d.delVarFlag("do_compile", "noexec")
+}
+
+do_install() {
+	cmake_do_install
+}
-- 
2.34.1


