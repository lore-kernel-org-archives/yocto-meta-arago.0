Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A3FCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 09:19:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.277799.1697620791189554068
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 02:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YLuFfZi7;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a0123456@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39I9JoqH104372
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 04:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697620790;
	bh=rGEbK0hKA1v7xFT4FdLkHLzQA9CgVY+ELEtifbmOFsk=;
	h=From:To:CC:Subject:Date;
	b=YLuFfZi7RBC0st2+bt1F5ADCPL8UuM2dbzEI1V3rgDuAwP5jm/HvXguANB57Jbttf
	 /+9dfk8yRKpuQQFjqw9xEvr60XwgZFwraoAKE0cDuG3STw6fKW504PXptQnrg3Lh3/
	 OHKu/txPmv4Fe3tftupRjJ2d/NYAlNSy0GiKkeqY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39I9Joj9032170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 04:19:50 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Oct 2023 04:19:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Oct 2023 04:19:49 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39I9Jm64024214;
	Wed, 18 Oct 2023 04:19:49 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <p-mantena@ti.com>, <devarsht@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <denys@ti.com>, <r-ravikumar@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2] gstreamer1.0-plugins-good: wave5-codec: Set max buffers same as min buffers
Date: Wed, 18 Oct 2023 14:49:46 +0530
Message-ID: <20231018091946.754458-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 09:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14948

v4l2src plugin queues same external buffer with different v4l2 buffer
with different index. This workaround was implemented as a workaround
for this. Workaround needs all buffers to be allocated during the init
phase, if new buffers are allocated post stream start it fails. Avoid
such issues by enforcing max buffers same as min buffers

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Reviewed-by: Prasanth Babu Mantena <p-mantena@ti.com>
---

Notes:
    v2:
        Updated commit message as per the comments
        Added the reviewed bys

 .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
index a1471661..bf73e257 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -14,9 +14,9 @@ Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
 ---
  sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
  sys/v4l2/gstv4l2bufferpool.h |  2 ++
- sys/v4l2/gstv4l2object.c     | 15 ++++++++++++---
+ sys/v4l2/gstv4l2object.c     | 16 +++++++++++++---
  sys/v4l2/gstv4l2videodec.c   | 20 ++++++++++++++------
- 4 files changed, 42 insertions(+), 12 deletions(-)
+ 4 files changed, 43 insertions(+), 12 deletions(-)
 
 diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
 index d85f036..e6a60dc 100644
@@ -86,7 +86,7 @@ index ee60540..eff1cf2 100644
      own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
 
      /* for the downstream pool, we keep what downstream wants, though ensure
-@@ -5049,8 +5053,13 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+@@ -5049,8 +5053,14 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
      min = MAX (min, GST_V4L2_MIN_BUFFERS (obj));
 
      /* To import we need the other pool to hold at least own_min */
@@ -95,6 +95,7 @@ index ee60540..eff1cf2 100644
 +    if (obj_pool == pool) {
 +        if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
 +            min = own_min;
++            max = min;
 +        } else {
 +            min += own_min;
 +        }
-- 
2.34.1


