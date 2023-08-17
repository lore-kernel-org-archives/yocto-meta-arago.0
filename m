Return-Path: <p-mantena@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BA6C2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 08:07:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.182374.1692259625541305827
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 01:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hPMK9+mR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-mantena@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37H871jP091444;
	Thu, 17 Aug 2023 03:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692259621;
	bh=ii7Rmrb3q7ckJc2xpf9Mo0gk+hELxKxJkN5to/zFOcw=;
	h=From:To:CC:Subject:Date;
	b=hPMK9+mR8rd4+Fmt5LmFkigVrIMEaiJ3h9gKcHmNxAI702/hMXHzdKxSFfpZ0dZfY
	 scHiTZQmQ+hMdqPGJYhT9xMDAiFFOwK9dfYyAbgDguCVxpx7HAhOsZcci/blxQIbjv
	 s3Nj9geIGVeXEmBv+rDQ8S9zoOm085Z5+WPtpoI8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37H8717r014753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Aug 2023 03:07:01 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Aug 2023 03:07:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Aug 2023 03:07:01 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37H870OX019487;
	Thu, 17 Aug 2023 03:07:01 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <denis@denix.org>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][kirkstone][PATCH] gstreamer: Add driver specific checks for buffer allocations
Date: Thu, 17 Aug 2023 13:36:58 +0530
Message-ID: <20230817080658.22521-1-p-mantena@ti.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Aug 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14854

v4l2src also uses the same set of buffer allocations, which are only
needed for wave5 driver, due to its limitation of working with buffers
of known memory addresses. This patch adds the check for buffer
modifications to apply only for wave5 driver and v4l2src to use the
default memory allocation flow.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
 ...l2-Changes-for-DMA-Buf-import-j721s2.patch | 33 +++++++++++++------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
index 0e155ef1..486b48d1 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -1,4 +1,4 @@
-From 6b01fbb7785a0c950d7b4b0a3767aa35c9f7e60f Mon Sep 17 00:00:00 2001
+From b9727b08f69649a2ec58055b4fb1d40c094ba8d0 Mon Sep 17 00:00:00 2001
 From: Prasanth Babu Mantena <p-mantena@ti.com>
 Date: Wed, 7 Jun 2023 18:24:55 +0530
 Subject: [PATCH] v4l2: Changes for DMA Buf import j721s2
@@ -6,15 +6,17 @@ Subject: [PATCH] v4l2: Changes for DMA Buf import j721s2
 Add checks to release the buffer to downstream pool when returned with
 error flag from the driver. This buffer which registered with driver is
 used a an offset buffer without any new allocation in downstram pool.
-Set buffer offset to ref_frames plus 3.
+Set buffer offset to ref_frames plus 3. Added check for buffer
+allocations that are applied only for wave5 driver. v4l2src which uses
+the buffer pool objects uses the default allocations.
 
 Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
 ---
  sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
  sys/v4l2/gstv4l2bufferpool.h |  2 ++
- sys/v4l2/gstv4l2object.c     |  4 ++--
+ sys/v4l2/gstv4l2object.c     | 15 ++++++++++++---
  sys/v4l2/gstv4l2videodec.c   | 20 ++++++++++++++------
- 4 files changed, 32 insertions(+), 11 deletions(-)
+ 4 files changed, 42 insertions(+), 12 deletions(-)
 
 diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
 index d85f036..e6a60dc 100644
@@ -68,24 +70,35 @@ index 60340c2..cec4207 100644
  
  #endif /*__GST_V4L2_BUFFER_POOL_H__ */
 diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index ee60540..0952bb4 100644
+index ee60540..eff1cf2 100644
 --- a/sys/v4l2/gstv4l2object.c
 +++ b/sys/v4l2/gstv4l2object.c
-@@ -5040,7 +5040,7 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+@@ -5040,7 +5040,11 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
    } else {
      /* In this case we'll have to configure two buffer pool. For our buffer
       * pool, we'll need what the driver one, and one more, so we can dequeu */
 -    own_min = obj->min_buffers + 1;
-+    own_min = obj->min_buffers + 3;
++    if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
++        own_min = obj->min_buffers + 3;
++    } else {
++        own_min = obj->min_buffers + 1;
++    }
      own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
  
      /* for the downstream pool, we keep what downstream wants, though ensure
-@@ -5050,7 +5050,7 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+@@ -5049,8 +5053,13 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+     min = MAX (min, GST_V4L2_MIN_BUFFERS (obj));
  
      /* To import we need the other pool to hold at least own_min */
-     if (obj_pool == pool)
+-    if (obj_pool == pool)
 -      min += own_min;
-+      min = own_min;
++    if (obj_pool == pool) {
++        if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
++            min = own_min;
++        } else {
++            min += own_min;
++        }
++    }
    }
  
    /* Request a bigger max, if one was suggested but it's too small */
-- 
2.39.0


