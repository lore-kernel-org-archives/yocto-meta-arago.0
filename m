Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1836CE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 16:30:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.19843.1734107431925662350
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 08:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Bf8U2ejU;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDGUVTn3170109
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Dec 2024 10:30:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734107431;
	bh=aNif3IHE3Vo/i/eh7XT6qRiQycIWymMhTOqzSpW6bRE=;
	h=From:To:CC:Subject:Date;
	b=Bf8U2ejUK67BnNz/G4bhr3k+S7Ml3TJEOD8sygr4cIq5+STY/jK69o59xlzVLweW2
	 8wm7l7J+lwl/sZlsQt1XTB2JAx1iWnDdwprCFz1tuam4i6ox7ytoby0EpYeLm1OEB5
	 db+WBRidoTARLT1tURTxCA92Nb9IJaLpQQTBvmp0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDGUV2T081356;
	Fri, 13 Dec 2024 10:30:31 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 10:30:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 10:30:30 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDGUUtm011275;
	Fri, 13 Dec 2024 10:30:30 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] packagegroup-arago: Update TI RTOS firmware package name
Date: Fri, 13 Dec 2024 10:30:30 -0600
Message-ID: <20241213163030.59993-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Dec 2024 16:30:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15658

The echo test firmware was renamed in meta-ti, include the new
name in the package groups here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-console.bb    | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 +-
 meta-arago-test/recipes-core/packagegroups/ti-test.bb           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 76a98fa2..3e0d373d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -67,7 +67,7 @@ ARAGO_SDK_PREREQ = "\
     "
 
 ARAGO_SDK_PREREQ:append:k3 = "\
-    ti-rtos-firmware \
+    ti-rtos-echo-test-fw \
     "
 
 ARAGO_CONSOLE = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index aaf53f3d..6b6533f5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -55,7 +55,7 @@ UTILS:append:k3 = " mmc-utils \
                     statcol \
 "
 
-UTILS:append:k3 = " ti-rtos-firmware"
+UTILS:append:k3 = " ti-rtos-echo-test-fw"
 UTILS:append:am64xx = " pru-icss"
 UTILS:append:am62xx = " pru-icss"
 
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index e8458cef..0bcdc83d 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -109,7 +109,7 @@ TI_TEST_TI_TOOLS:append:omap-a15 = " \
 TI_TEST_TI_TOOLS:append:k3 = " \
     k3conf \
     switch-config \
-    ti-rtos-firmware \
+    ti-rtos-echo-test-fw \
     ti-rpmsg-char \
     ti-rpmsg-char-examples \
 "
-- 
2.39.2


