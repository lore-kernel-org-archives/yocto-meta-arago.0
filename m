Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A369CD612C
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 18:53:42 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.71248.1696877619434970318
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 11:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QFWlbtsg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 399Irac0001943;
	Mon, 9 Oct 2023 13:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696877616;
	bh=56SD246XkSlFvDhb/AnVQ3V7G3FQxXpN+exnRLXJNpM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QFWlbtsgpreosQXf/c10TpqdKQdjyEz9P2B9LiWc+TRIl5jrZswSoH0bHM8sHBmfg
	 SobMwe5h/8ovUafGYWdCQv367fgriZAaeAL8SSrX8qp5eUEWqF5NoCaUVs+JQGHAph
	 6a5IX5ZRTYtH8KVwf9H2o/Xo32i3YY0nZkM2ccew=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 399IraNS013978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Oct 2023 13:53:36 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 13:53:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 13:53:36 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 399Irahk005883;
	Mon, 9 Oct 2023 13:53:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qpvNo-0002a6-FN; Mon, 09 Oct 2023 13:53:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v5 3/4] ti-test: Various cleanups
Date: Mon, 9 Oct 2023 13:53:35 -0500
Message-ID: <20231009185336.9871-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231009185336.9871-1-reatmon@ti.com>
References: <20231009185336.9871-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Oct 2023 18:53:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14927

- Sort package lists to make it easier to see if a package is
  already in the list.
- Fix some whitespace to make things line up.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index e685ca51..44f4f75d 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -6,43 +6,43 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 TI_TEST_BASE = "\
+    bc \
     bonnie++ \
+    bridge-utils \
+    cryptodev-tests \
+    dma-heap-tests \
+    evtest \
+    fio \
+    git \
     hdparm \
     iozone3 \
+    kernel-selftest \
+    libdrm-tests \
+    linuxptp \
     lmbench \
-    rt-tests \
-    evtest \
-    bc \
     memtester \
-    libdrm-tests \
-    dma-heap-tests \
+    mstpd \
+    mtd-utils-ubifs-tests \
+    nbench-byte \
+    openntpd \
+    pcitest \
+    perf \
     powertop \
+    procps \
+    pulseaudio-misc \
+    rt-tests \
+    rwmem \
+    smcroute \
+    stream \
     stress \
     stress-ng \
-    yavta \
-    perf \
     v4l-utils \
-    smcroute \
-    rwmem \
-    pulseaudio-misc \
-    kernel-selftest \
-    procps \
-    mtd-utils-ubifs-tests \
-    pcitest \
-    mstpd \
-    fio \
-    git \
-    bridge-utils \
-    linuxptp \
-    openntpd \
-    nbench-byte \
-    stream \
-    cryptodev-tests \
+    yavta \
 "
 
 TI_TEST_EXTRAS = " \
-    python3-numpy \
     piglit \
+    python3-numpy \
 "
 
 TI_TEST_BASE:append:armv7a = " \
@@ -55,11 +55,11 @@ TI_TEST_BASE:append:armv7ve = " \
 
 #    timestamping
 TI_TEST_TI_TOOLS = " \
-    ltp-ddt \
-    input-utils \
+    arm-benchmarks \
     cpuloadgen \
+    input-utils \
+    ltp-ddt \
     uvc-gadget \
-    arm-benchmarks \
 "
 
 TI_TEST_TI_TOOLS:append:ti33x = " \
@@ -76,7 +76,7 @@ TI_TEST_TI_TOOLS:append:omap-a15 = " \
     omapconf \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
-	${NOT_MAINLINE_MMIP_DEPS} \
+	    ${NOT_MAINLINE_MMIP_DEPS} \
     ", d)} \
 "
 
-- 
2.17.1


