Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702E7C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 15:21:29 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1586.1752765679804775870
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 08:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wmb49mV3;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HFLJvW501453
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 10:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752765679;
	bh=mI+ET609m79tqr3XPOXAGpcs0dekHCspqXirugNGWi4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wmb49mV3Oe5iNolMMD93TCYAd41Qw2twELC7gJ1h/Nl/RmdBsEl9jhZzRt2DU9s/W
	 JVb6SNNy61y6EuWFF0fPEhYZDkhIqre2rGyfLs6g0qaNcMWPp3QbyONl3V91sRuC83
	 AOuZGSt5YDyqA3CC1Kx2c3TmDKwaMUZ7TTWpUaZA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HFLIQJ2867430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 10:21:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 10:21:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 10:21:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HFLI3x2065602;
	Thu, 17 Jul 2025 10:21:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <rs@ti.com>
Subject: [meta-arago][master][PATCH v3 2/2] meta-arago-test: packagegroups: Add off-screen demo to ti-test package group
Date: Thu, 17 Jul 2025 10:21:18 -0500
Message-ID: <20250717152118.2525721-3-a-christidis@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16309

From: Antonios Christidis <a-christidis@ti.com>

Add the off-screen demo to ti-test package group.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 1ca23878..c940ea27 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -70,6 +70,7 @@ TI_TEST_EXTRAS = " \
     piglit \
     python3-numpy \
     wayland-utils \
+    offscreendemo \
     opencl-cts \
 "
 
-- 
2.34.1


