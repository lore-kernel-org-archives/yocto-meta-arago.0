Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53CFEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 04:17:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.14235.1688617020898222322
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 21:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nArTGZUy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-luthra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3664Gw7v068245;
	Wed, 5 Jul 2023 23:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688617018;
	bh=b7nMZVa88Bxof23y4VPxo4kQOSlYLdN49mcE5pnzXlE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nArTGZUytKOODetQ0GGKhNcTcSxKUYCUDGy1buWw19Aqo8Cy7jpWfIRe1d1CmB+4G
	 dCqrRBI8hGPX3uqhSGE/sneYYKLhMm7vo1ihDlFL9eSanQHcShVW5t8kdG0XZaGjhs
	 Lq4SorcYdgTBhW2HtlZDJPtAHpzCN88PJNRkUBuU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3664GwW0101867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 23:16:58 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 23:16:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 23:16:57 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3664GvQT047333;
	Wed, 5 Jul 2023 23:16:57 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Chirag
 Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH v3 2/3] libcamera: Add support for TI CSI-RX
Date: Thu, 6 Jul 2023 09:46:51 +0530
Message-ID: <20230706041652.1843102-2-j-luthra@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706041652.1843102-1-j-luthra@ti.com>
References: <20230706041652.1843102-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 04:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14764

TI's CSI-RX driver is not yet upstream, so the libcamera simple pipeline
does not recognize it.

Apply a patch to the simple pipeline so that it can recognize the media
entity for TI's CSI-RX driver.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---

v3: Add Upstream-Status tag
Link to v2: https://lore.kernel.org/all/20230706035522.1817402-2-j-luthra@ti.com/

 .../0001-simple-Support-TI-CSI-RX.patch       | 33 +++++++++++++++++++
 .../libcamera/libcamera_0.0.5.bb              |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch

diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
new file mode 100644
index 00000000..82b02200
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
@@ -0,0 +1,33 @@
+From d0e4f4f224671e9fc992d39e7beb9c486303ede1 Mon Sep 17 00:00:00 2001
+From: Jai Luthra <j-luthra@ti.com>
+Date: Thu, 23 Mar 2023 11:38:46 +0530
+Subject: [PATCH] simple: Support TI CSI-RX
+
+Add support for TI's CSI-RX pixel grabber device for the simple
+pipeline.
+
+The driver is not yet merged, but v7 is posted [1] upstream.
+
+Link: https://lore.kernel.org/all/20230314115516.667-1-vaishnav.a@ti.com/ [1]
+Upstream-Status: Pending
+Signed-off-by: Jai Luthra <j-luthra@ti.com>
+---
+ src/libcamera/pipeline/simple/simple.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
+index e1f8b989..520405a1 100644
+--- a/src/libcamera/pipeline/simple/simple.cpp
++++ b/src/libcamera/pipeline/simple/simple.cpp
+@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] = {
+ 	{ "mxc-isi", {} },
+ 	{ "qcom-camss", {} },
+ 	{ "sun6i-csi", {} },
++	{ "j721e-csi2rx", {} },
++
+ };
+ 
+ } /* namespace */
+-- 
+2.41.0
+
diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
index 6ad376f2..b2eb5fac 100644
--- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
+++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
+        file://0001-simple-Support-TI-CSI-RX.patch \
 "
 
 SRCREV = "fb44403f1c5571549ac128c21daee9761eb9249c"
-- 
2.41.0


