Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1E2CD6127
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 18:53:42 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.71742.1696877618093532030
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 11:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZlfNCWKa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 399IrbJt018925;
	Mon, 9 Oct 2023 13:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696877617;
	bh=yD4+ZBtrTBVpeyTqTb+XHGRdxii+aFhGbMwI8DKL17A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZlfNCWKa8Renb44dyTA35hFO8ZaMe4qHb1gx+MNq8GnBxSaJ57b5uIODMsf4AaO3+
	 bhcoEb3K3cfHeYCNusncgEFJlHSTbqit3bQbXMR69tZ+GVWeZZtnjuEMMpjZIUTHIh
	 fPnpYLzh8nTIfNn5ryG/dgJrK0qB+EFve4KLxosU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 399IrbY8013983
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Oct 2023 13:53:37 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 13:53:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 13:53:36 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 399IraRL005558;
	Mon, 9 Oct 2023 13:53:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qpvNo-0002aD-Ie; Mon, 09 Oct 2023 13:53:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v5 4/4] ti-test: Add various tools
Date: Mon, 9 Oct 2023 13:53:36 -0500
Message-ID: <20231009185336.9871-4-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14924

Testing with poky shows that we were missing some needed utilities
that our internal tests were calling.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v4: Added a lot more tools based on our upstream testing against our
    internal test scripts.

 .../recipes-core/packagegroups/ti-test.bb     | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 44f4f75d..cf720c03 100644
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
2.17.1


