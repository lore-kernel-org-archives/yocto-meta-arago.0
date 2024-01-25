Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF932C47DDF
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 07:57:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12125.1706169440334712594
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 23:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Fh33i6jT;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40P7vIAG068536
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 01:57:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706169438;
	bh=FjmVaNAfgN6j/XhVeQ6akBClMULVrT8w9YtARYfsMC8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Fh33i6jTTL6hZVoM+HJgHONq2qwjWFEaV1aeRZQL2Mif9YzCCbbG8pYI4m38Tnfcy
	 KK57TrOBweGbCr5bTUBvOPzjQQ+D1gPjjoxNbB7mqxgA741IgQ+OTmkB7sPFv468va
	 U4fgN7SMr9E45FPF3Pie0//0GxW951SBM5ISPxZw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40P7vIBB006635
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 01:57:18 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 01:57:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 01:57:18 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40P7vH8m086258;
	Thu, 25 Jan 2024 01:57:18 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>, <p-mantena@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v3 2/2]  gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI capture
Date: Thu, 25 Jan 2024 13:27:10 +0530
Message-ID: <20240125075710.843604-3-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125075710.843604-1-r-ravikumar@ti.com>
References: <20240125075710.843604-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 07:57:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15095

This is required to avoid the frame drops and increase the tolrence
for CSI capture using gsteamer

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 ...ct-Increase-min-buffers-for-CSI-capt.patch | 34 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.%.bbappend |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch
new file mode 100644
index 00000000..a981b037
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch
@@ -0,0 +1,34 @@
+From 48c3063b6704921fc46b718ea06281c79ec892ef Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Pending
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


