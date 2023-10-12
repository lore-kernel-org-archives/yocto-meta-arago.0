Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1988CDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 08:45:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6939.1697100335804024352
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 01:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: list.ti.com, ip: 198.47.23.249, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39C8jYpt123283;
	Thu, 12 Oct 2023 03:45:34 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39C8jYxO059056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Oct 2023 03:45:34 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 03:45:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 03:45:33 -0500
Received: from fllvdckhpci028.itg.ti.com (fllvdckhpci028.itg.ti.com [10.248.130.161])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39C8jXJR083510;
	Thu, 12 Oct 2023 03:45:33 -0500
Received: by fllvdckhpci028.itg.ti.com (Postfix, from userid 60899)
	id B208A10E3A62; Thu, 12 Oct 2023 03:45:33 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ti-test: Add various tools
Date: Thu, 12 Oct 2023 03:45:33 -0500
Message-ID: <1697100333-93247-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Oct 2023 08:45:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14928

From: Ryan Eatmon <reatmon@ti.com>

Testing with poky shows that we were missing some needed utilities
that our internal tests were calling.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb          | 37 ++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 44f4f75..cf720c0 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -6,24 +6,36 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 TI_TEST_BASE = "\
+    alsa-utils \
     bc \
     bonnie++ \
     bridge-utils \
     cryptodev-tests \
     dma-heap-tests \
+    dosfstools \
+    ethtool \
     evtest \
     fio \
     git \
     hdparm \
+    i2c-tools \
     iozone3 \
+    iproute2-tc \
+    iproute2-devlink \
+    iperf3 \
+    kernel-modules \
     kernel-selftest \
     libdrm-tests \
     linuxptp \
     lmbench \
+    lsof \
     memtester \
     mstpd \
+    mtd-utils \
+    mtd-utils-ubifs \
     mtd-utils-ubifs-tests \
     nbench-byte \
+    netperf \
     openntpd \
     pcitest \
     perf \
@@ -36,6 +48,7 @@ TI_TEST_BASE = "\
     stream \
     stress \
     stress-ng \
+    tcpdump \
     v4l-utils \
     yavta \
 "
@@ -64,16 +77,22 @@ TI_TEST_TI_TOOLS = " \
 
 TI_TEST_TI_TOOLS:append:ti33x = " \
     omapconf \
+    pru-icss \
+    switch-config \
 "
 
 TI_TEST_TI_TOOLS:append:ti43x = " \
     omapconf \
+    pru-icss \
+    switch-config \
 "
 
 NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
 
 TI_TEST_TI_TOOLS:append:omap-a15 = " \
     omapconf \
+    pru-icss \
+    switch-config \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
 	    ${NOT_MAINLINE_MMIP_DEPS} \
@@ -82,15 +101,29 @@ TI_TEST_TI_TOOLS:append:omap-a15 = " \
 
 TI_TEST_TI_TOOLS:append:k3 = " \
     k3conf \
+    switch-config \
+    ti-rtos-firmware \
+    ti-rpmsg-char \
+    ti-rpmsg-char-examples \
 "
 
-TI_TEST_TI_TOOLS:append:j721e = " \
-    ufs-utils \
+TI_TEST_TI_TOOLS:append:am62xx   = " \
+    pru-icss \
+"
+
+TI_TEST_TI_TOOLS:append:am64xx   = " \
+    pru-icss \
+"
+
+TI_TEST_TI_TOOLS:append:am65xx   = " \
+    pru-icss \
 "
 
 # Disable due to breakage
 #    viddec-test-app 
 TI_TEST_TI_TOOLS:append:j721e = " \
+    pru-icss \
+    ufs-utils \
     videnc-test-app \
 "
 
-- 
1.8.3.1


