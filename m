Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF43C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:13:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.30254.1753863188132401286
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 01:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U/nd86BG;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56U8D7pM2746733;
	Wed, 30 Jul 2025 03:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753863187;
	bh=OiHiRY8LUTfPviqd4TrwhCqA6AiDIhOxwGDwjVWYF2w=;
	h=From:To:CC:Subject:Date;
	b=U/nd86BGVnvzhbhQFLs2E0c8MdFT3ydtd347rc527JAKvTGrm/uo99EC2DQC0Xhu4
	 MwsxP7RXR33xtx8a7sQM8oVHyorz+MPNLXkb7ApN6A/5c8jWbYjGB+XxK/yT4eSJCK
	 oljCGCAA5+vtwWrgEuQmWwvT6JZkZUbTVPfWv4to=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56U8D7RP2418658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 03:13:07 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 03:13:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 03:13:06 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56U8D4bc629204;
	Wed, 30 Jul 2025 03:13:04 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH RESEND] packagegroup-arago: Add ti-pka-fw for all K3 platforms
Date: Wed, 30 Jul 2025 13:43:03 +0530
Message-ID: <20250730081303.2705939-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Jul 2025 08:13:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16342

Add PKA firmware package needed by sa2_ul driver for PKA operations
across all K3 platforms.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Resending Patch after subscribing to meta-arago list.

 .../recipes-core/packagegroups/packagegroup-arago-console.bb     | 1 +
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 meta-arago-test/recipes-core/packagegroups/ti-test.bb            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index f6ec0a05..66c73746 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -68,6 +68,7 @@ ARAGO_SDK_PREREQ = "\
 
 ARAGO_SDK_PREREQ:append:k3 = "\
     ti-rtos-echo-test-fw \
+    ti-pka-fw \
     "
 
 ARAGO_CONSOLE = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index d9ab3617..08e6050c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -57,6 +57,7 @@ UTILS:append:k3 = " mmc-utils \
                     ti-rpmsg-char \
                     ti-rpmsg-char-examples \
                     statcol \
+                    ti-pka-fw \
 "
 
 UTILS:append:k3 = " ti-rtos-echo-test-fw"
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index fb4c3e4c..09262dd8 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -120,6 +120,7 @@ TI_TEST_TI_TOOLS:append:k3 = " \
     ti-rtos-echo-test-fw \
     ti-rpmsg-char \
     ti-rpmsg-char-examples \
+    ti-pka-fw \
 "
 
 TI_TEST_TI_TOOLS:append:am62xx   = " \
-- 
2.34.1


