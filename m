Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983DFC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:29:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.79234.1705940977767535955
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 08:29:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gAlDwDzH;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40MGTagF064819
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 10:29:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705940976;
	bh=kTVzv/TAi+PDkye7a2oLX4vU4GCrc6VRVehbqnah3+U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gAlDwDzHmrn5G5Zn3xIZBTXWMMXmAWeWvxpc6yPiXw/laYpVCLSupWHKHWEkN6t/Y
	 lsmd8ShKVC1m912kkY5jNvWHPQ9eNtGsM8M43Vu4V5MvCqpp0TT2cIQbI+Ljde2Jen
	 hnrI/MfKeF5pK94cw4a2oMTp/BgBSHLNTGtI5pLk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40MGTaF1090755
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 10:29:36 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jan 2024 10:29:36 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jan 2024 10:29:36 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40MGTZie025538;
	Mon, 22 Jan 2024 10:29:36 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>, <p-mantena@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 2/2] gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI capture
Date: Mon, 22 Jan 2024 21:59:17 +0530
Message-ID: <20240122162917.822825-3-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122162917.822825-1-r-ravikumar@ti.com>
References: <20240122162917.822825-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 16:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15079

This is required to avoid the frame drops and increase the tolrence
for CSI capture using gsteamer

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 ...1-gstv4l2object-Increase-min-buffers.patch | 29 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.%.bbappend |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch
new file mode 100644
index 00000000..f9ff4faa
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch
@@ -0,0 +1,29 @@
+From 9c5e0ee19be372c0477a509889d76ceaf97bdc87 Mon Sep 17 00:00:00 2001
+From: Rahul T R <r-ravikumar@ti.com>
+Date: Tue, 10 Oct 2023 14:42:13 +0530
+Subject: [PATCH] gstv4l2object: Increase min buffers for CSI capture
+
+This will improve the latency and tolerance
+of CSI pipeline
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
index 7ad943f6..bb4fdc09 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
@@ -5,6 +5,7 @@ SRC_URI:append = " \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
     file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
+    file://0001-gstv4l2object-Increase-min-buffers.patch \
 "
 
-PR:append = ".arago1"
+PR:append = ".arago2"
-- 
2.34.1


