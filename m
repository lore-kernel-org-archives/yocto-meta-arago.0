Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A33FEC8753
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 18:53:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.21727.1694112795041892914
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 11:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ECSQPsKO;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 387IrDAB095935;
	Thu, 7 Sep 2023 13:53:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694112793;
	bh=6pIXGlYcX/ZguIz3Y5mYcpHEmtnqQZx9BaVXWaC1oVo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ECSQPsKO0S+PUWEyeT8Ftt63mYVrqv+3OEv0SEK5/pSB6/G1gFd1c7iw0NPWyAzyQ
	 o1lbs9oaUYXgb1CLRId2Ukl8mjfmUE6DH+lvcshtGtHdWUIxM9gmlUg2TOqQzAshXO
	 n/GtsEToy51HuOkf+2eNIHbTbHnO9kEzYCMSG9d4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 387IrDJk043516
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Sep 2023 13:53:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Sep 2023 13:53:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Sep 2023 13:53:13 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 387IrDrk067579;
	Thu, 7 Sep 2023 13:53:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qeK7t-0004MY-9G; Thu, 07 Sep 2023 13:53:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v4 2/4] ti-test: Rename variables to remove ARAGO
Date: Thu, 7 Sep 2023 13:53:10 -0500
Message-ID: <20230907185312.16718-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230907185312.16718-1-reatmon@ti.com>
References: <20230907185312.16718-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Sep 2023 18:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14891

In preparation for moving to meta-ti, rename the recipes variables
used for building the depends to not reference ARAGO.  There is still
a reference to ARAGO_BRAND that might be cleaned up later.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 11c327a0..e685ca51 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-ARAGO_TEST = "\
+TI_TEST_BASE = "\
     bonnie++ \
     hdparm \
     iozone3 \
@@ -40,21 +40,21 @@ ARAGO_TEST = "\
     cryptodev-tests \
 "
 
-ARAGO_TEST_EXTRAS = " \
+TI_TEST_EXTRAS = " \
     python3-numpy \
     piglit \
 "
 
-ARAGO_TEST:append:armv7a = " \
+TI_TEST_BASE:append:armv7a = " \
     cpuburn-neon \
 "
 
-ARAGO_TEST:append:armv7ve = " \
+TI_TEST_BASE:append:armv7ve = " \
     cpuburn-neon \
 "
 
 #    timestamping
-ARAGO_TI_TEST = " \
+TI_TEST_TI_TOOLS = " \
     ltp-ddt \
     input-utils \
     cpuloadgen \
@@ -62,17 +62,17 @@ ARAGO_TI_TEST = " \
     arm-benchmarks \
 "
 
-ARAGO_TI_TEST:append:ti33x = " \
+TI_TEST_TI_TOOLS:append:ti33x = " \
     omapconf \
 "
 
-ARAGO_TI_TEST:append:ti43x = " \
+TI_TEST_TI_TOOLS:append:ti43x = " \
     omapconf \
 "
 
 NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
 
-ARAGO_TI_TEST:append:omap-a15 = " \
+TI_TEST_TI_TOOLS:append:omap-a15 = " \
     omapconf \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
@@ -80,31 +80,31 @@ ARAGO_TI_TEST:append:omap-a15 = " \
     ", d)} \
 "
 
-ARAGO_TI_TEST:append:k3 = " \
+TI_TEST_TI_TOOLS:append:k3 = " \
     k3conf \
 "
 
-ARAGO_TI_TEST:append:j721e = " \
+TI_TEST_TI_TOOLS:append:j721e = " \
     ufs-utils \
 "
 
 # Disable due to breakage
 #    viddec-test-app 
-ARAGO_TI_TEST:append:j721e = " \
+TI_TEST_TI_TOOLS:append:j721e = " \
     videnc-test-app \
 "
 
-ARAGO_TI_TEST:append:omapl138 = " \
+TI_TEST_TI_TOOLS:append:omapl138 = " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test', d)} \
 "
 
 RDEPENDS:${PN} = "\
-    ${ARAGO_TEST} \
-    ${ARAGO_TI_TEST} \
+    ${TI_TEST_BASE} \
+    ${TI_TEST_TI_TOOLS} \
 "
 
 # Package group for things that should only be present in tisdk-default-image
 PACKAGES += " ${PN}-extras"
 RDEPENDS:${PN}-extras = "\
-    ${ARAGO_TEST_EXTRAS} \
+    ${TI_TEST_EXTRAS} \
 "
-- 
2.17.1


