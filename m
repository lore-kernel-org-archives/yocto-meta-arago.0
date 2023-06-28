Return-Path: <p-mantena@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FC8EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 13:59:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.17007.1687960789325469552
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 06:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SKm9V+7z;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-mantena@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35SDxikv095961;
	Wed, 28 Jun 2023 08:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687960784;
	bh=brryK+g5GgMENmjnctJEjRuhxWUDasFgAQ+YMIRJT5Q=;
	h=From:To:CC:Subject:Date;
	b=SKm9V+7zTpx9Y0cLpWVqW0vky7Lg2212A7V+9R2wtEVwalUuHy6cUzUwTGJScnxZi
	 Ojp2dMPSlYjELLbwqBErWv3pUdQNxkMebOsJEbnDLN+eWN2rEM6mn/OPUZz92+ko1U
	 G6Rjiw1hTLHVjqQY4UVoq/VXGvuReTMqhsiFeZCQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35SDxikW011372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Jun 2023 08:59:44 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 08:59:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 08:59:44 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35SDxhnq025681;
	Wed, 28 Jun 2023 08:59:44 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <denis@denix.org>,
        <r-ravikumar@ti.com>
Subject: [meta-arago][kirkstone][PATCH] receipes-multimedia: gstreamer: Increase decode display delay
Date: Wed, 28 Jun 2023 19:29:41 +0530
Message-ID: <20230628135941.29206-1-p-mantena@ti.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 13:59:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14719

Increase the number of buffers between the decoder and display to
support smooth streaming of decoded data to downstream pool.
This has been set to ref_frame plus 3 which was 2 before.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
 .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
index 45ad91ee..0e155ef1 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -1,4 +1,4 @@
-From b46a76bc1010aee88828eddcb4b3da01ce710b27 Mon Sep 17 00:00:00 2001
+From 6b01fbb7785a0c950d7b4b0a3767aa35c9f7e60f Mon Sep 17 00:00:00 2001
 From: Prasanth Babu Mantena <p-mantena@ti.com>
 Date: Wed, 7 Jun 2023 18:24:55 +0530
 Subject: [PATCH] v4l2: Changes for DMA Buf import j721s2
@@ -6,6 +6,7 @@ Subject: [PATCH] v4l2: Changes for DMA Buf import j721s2
 Add checks to release the buffer to downstream pool when returned with
 error flag from the driver. This buffer which registered with driver is
 used a an offset buffer without any new allocation in downstram pool.
+Set buffer offset to ref_frames plus 3.
 
 Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
 ---
@@ -67,7 +68,7 @@ index 60340c2..cec4207 100644
  
  #endif /*__GST_V4L2_BUFFER_POOL_H__ */
 diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index ee60540..e9026da 100644
+index ee60540..0952bb4 100644
 --- a/sys/v4l2/gstv4l2object.c
 +++ b/sys/v4l2/gstv4l2object.c
 @@ -5040,7 +5040,7 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
@@ -75,7 +76,7 @@ index ee60540..e9026da 100644
      /* In this case we'll have to configure two buffer pool. For our buffer
       * pool, we'll need what the driver one, and one more, so we can dequeu */
 -    own_min = obj->min_buffers + 1;
-+    own_min = obj->min_buffers + 2;
++    own_min = obj->min_buffers + 3;
      own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
  
      /* for the downstream pool, we keep what downstream wants, though ensure
-- 
2.39.0


