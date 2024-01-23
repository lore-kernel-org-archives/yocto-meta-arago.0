Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECB1C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 15:53:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16316.1706025191453396318
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 07:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sk/NFChJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-ravikumar@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NFrAb9060582
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 09:53:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706025190;
	bh=1X4FpbIZisw0PdoD+VH4N8dqOE3MkBuhbbBWEeGBCsc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sk/NFChJsRkiVhfIo88o8kfBR8pAkxqo0JHfQbrvYze5kKxrozNTtnngw+/e8VpXg
	 ISLWBrwPukvkAwkC54YW1Wiy6SGAalczTeIcUnIfkz229ujYZ9rLC4x3VY4pbXO6QL
	 t9+IHQNAJmI6aqDmPknntkYUoc/SEl74zhhL7AzM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NFrA6b018223
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 09:53:10 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 09:53:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 09:53:10 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NFr9Sq080348;
	Tue, 23 Jan 2024 09:53:10 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>, <p-mantena@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2 2/2] gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI capture
Date: Tue, 23 Jan 2024 21:23:04 +0530
Message-ID: <20240123155304.832636-3-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240123155304.832636-1-r-ravikumar@ti.com>
References: <20240123155304.832636-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 15:53:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15088

This is required to avoid the frame drops and increase the tolrence
for CSI capture using gsteamer

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 ...ct-Increase-min-buffers-for-CSI-capt.patch | 32 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.%.bbappend |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch
new file mode 100644
index 00000000..cd3ff613
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch
@@ -0,0 +1,32 @@
+From a314ac52a306f8ddde1b53321b8cba5e35f5fa72 Mon Sep 17 00:00:00 2001
+From: Rahul T R <r-ravikumar@ti.com>
+Date: Tue, 10 Oct 2023 14:42:13 +0530
+Subject: [PATCH] HACK: gstv4l2object: Increase min buffers for CSI capture
+
+With default min buffers, frame drops are observed with CSI capture
+pipeline with VISS, LDC and DSS with DMABuf Import mode
+
+Increasing min buffers queued in v4l2src seems to fix this issue.
+Need more amalysis on the exact root cause
+
+Signed-off-by: Rahul T R <r-ravikumar@ti.com>
+---
+ sys/v4l2/gstv4l2object.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 4ce9fac..9f5a85b 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -5172,6 +5172,8 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+      * pool, we'll need what the driver one, and one more, so we can dequeu */
+     if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
+         own_min = obj->min_buffers + 3;
++    } else if (0 == strcmp(obj->vcap.driver, "j721e-csi2rx")) {
++        own_min = obj->min_buffers + 4;
+     } else {
+         own_min = obj->min_buffers + 1;
+     }
+-- 
+2.34.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
index 2a1a6e68..782b54a4 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
@@ -5,6 +5,7 @@ SRC_URI:append = " \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
     file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
+    file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
 "
 
-PR:append = ".arago1"
+PR:append = ".arago2"
-- 
2.34.1


