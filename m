Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9851EC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 12:32:35 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.29201.1750077151886728331
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 05:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rbNJkosN;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55GCWS393734359;
	Mon, 16 Jun 2025 07:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750077148;
	bh=TrdYOGFxasRu7LwIM27EpzYh9UltxfMyZmDZHP+Mb6o=;
	h=From:To:CC:Subject:Date;
	b=rbNJkosNGj1rxff+fSD3iZYKRXDcUfvAIZ+o6eoHBRo6Vzx7RS1pInBzC1gUsJtOM
	 ivd6D7IEEDESWxqVfhUclYfSNfrVwyvr9SeIqDUc8z+sSKEwXaxWTT/iWSW8bH1kuO
	 XbggFDMX42kaFQc0hF6sLACQVbD8ULZZSIXL8Brk=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55GCWS3L946418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 16 Jun 2025 07:32:28 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 16
 Jun 2025 07:32:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 16 Jun 2025 07:32:28 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55GCWRL64064374;
	Mon, 16 Jun 2025 07:32:27 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <afd@ti.com>
Subject: [scarthgap][PATCH v2] meta-arago-distro: packagegroups: Add additional libraries for audio
Date: Mon, 16 Jun 2025 18:02:21 +0530
Message-ID: <20250616123221.2058197-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Jun 2025 12:32:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16265

Add fftw and libsndfile1 libraries in multimedia package group, which are
used for signal processing and audio manipulation. Update corresponding
sdk target file to package header files and libraries for development.

Also add rpmsg DMA library for all k3 platforms.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Boot logs
https://gist.github.com/paresh-bhagat12/5deee18beb726c6efb94cbdb7a07d8a8

Note: This patch depends on below patch
https://lists.yoctoproject.org/g/meta-ti/message/18635

Change log
V1 -> V2
	- Drop ti-librpmsg-dma-example.

 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 1 +
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb       | 6 ++++++
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb    | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f02f013b..d9ab3617 100644
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
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 9daaa06d..6edc0dfd 100644
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


