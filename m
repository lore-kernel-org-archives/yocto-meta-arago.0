Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536C1CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 11:51:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.211544.1697543487103842535
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 04:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A9lF275R;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a0123456@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39HBpQwZ101016
	for <meta-arago@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697543486;
	bh=MfwmQOrNWppQdhQpmtLA/4dgoybKe4jHReeZWXpCZ5o=;
	h=From:To:CC:Subject:Date;
	b=A9lF275R6VABDX7fhsGkkoyqIUn0XcDLsrTAErJuG9YuG0z4J1l63QxuHPKdWu/TO
	 /RTj4qcxBl9MiBWtk+3Nk2jY4lrjfh44angBwMgTrx2XYaT/CM8Tt7V1AZL67VH0EN
	 BMHFl1MQodj1ADoHzWz4q5ImybmRmSUDwKfa4P28=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39HBpQ5u036525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:51:26 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 06:51:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 06:51:25 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39HBpOEr012976;
	Tue, 17 Oct 2023 06:51:25 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <p-mantena@ti.com>, <devarsht@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <denys@ti.com>, <r-ravikumar@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] gstreamer1.0-plugins-good: wave5-codec: Set max buffers same as min buffers
Date: Tue, 17 Oct 2023 17:21:19 +0530
Message-ID: <20231017115119.306574-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Oct 2023 11:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14941

wave5 codec driver can not work with new buffers allocated post stream
start. To avoid issues because of this set max_buffers same as min
buffers, so that new buffers are not allocated post stream start

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
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


