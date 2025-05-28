Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D5FC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 10:29:57 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.12493.1748428193276837071
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 May 2025 03:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LsVkDHRm;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: p-bhagat@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54SATpH32068924;
	Wed, 28 May 2025 05:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748428191;
	bh=n8Z3uIbRJ5gvUleqSPum2MmfGlgOeKCrgO9YhpUTnbU=;
	h=From:To:CC:Subject:Date;
	b=LsVkDHRmc1DnLUhLH6KNWNeRcTgPk8OOOwxwXKD/P/N37TYSphsA4YWh/t62qroWq
	 /Qud785Y4Z+4qef+O4x0v6ZMtbQQlC8oRFr6al7XWNr1gW92g40PEEG3GvpcZnJvbZ
	 dDFrkaGTEIcGbccPymt3k67FQwpbyZQ41pEJlECs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54SATpVc3369488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 28 May 2025 05:29:51 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 May 2025 05:29:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 May 2025 05:29:50 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54SATow8054784;
	Wed, 28 May 2025 05:29:50 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH] meta-arago-distro: packagegroups: Add additional libraries for audio
Date: Wed, 28 May 2025 15:59:48 +0530
Message-ID: <20250528102948.327229-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 May 2025 10:29:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16239

Add fftw and libsndfile1 libraries in multimedia package group, which are
used for signal processing and audio manipulation. Update corresponding
sdk target file to package header files and libraries for development.

Also add rpmsg DMA library for all k3 platforms and DSP offload example
for am62dxx-evm.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 2 ++
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb       | 6 ++++++
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb    | 6 ++++++
 3 files changed, 14 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 0d39907a..84ae1303 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -53,6 +53,7 @@ UTILS:append:omap-a15 = " mmc-utils \
 UTILS:append:k3 = " mmc-utils \
                     switch-config \
                     irqbalance \
+                    ti-librpmsg-dma \
                     ti-rpmsg-char \
                     ti-rpmsg-char-examples \
                     statcol \
@@ -61,6 +62,7 @@ UTILS:append:k3 = " mmc-utils \
 UTILS:append:k3 = " ti-rtos-echo-test-fw"
 UTILS:append:am64xx = " pru-icss"
 UTILS:append:am62xx = " pru-icss"
+UTILS:append:am62dxx = " ti-librpmsg-dma-example"
 
 ARAGO_JAILHOUSE_ENABLE ?= "0"
 UTILS:append:am62xx = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "jailhouse", "", d)}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 95939c09..73dc48e6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -13,7 +13,13 @@ MULTIMEDIA:append:dra7xx = " \
     hevc-arm-decoder-staticdev \
 "
 
+AUDIO = " \
+    fftw-dev \
+    libsndfile1-dev \
+"
+
 RDEPENDS:${PN} = "\
+    ${AUDIO} \
     ${MULTIMEDIA} \
     packagegroup-arago-gst-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 3aa1a051..6b0397b3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -11,6 +11,11 @@ MULTIMEDIA = " \
     libcamera-gst \
 "
 
+AUDIO = " \
+    fftw \
+    libsndfile1 \
+"
+
 MULTIMEDIA:append:arago = " ffmpeg mpv"
 
 MULTIMEDIA:omapl138 = ""
@@ -31,6 +36,7 @@ ACCEL_MM:append:omap-a15 = " \
 "
 
 RDEPENDS:${PN} = "\
+    ${AUDIO} \
     packagegroup-arago-gst \
     ${MULTIMEDIA} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', '${ACCEL_MM}', '', d)} \
-- 
2.34.1


