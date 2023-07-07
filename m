Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C52EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 22:09:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.7471.1688767795298272079
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 15:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wjIU1OX6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 367M9qKD098800;
	Fri, 7 Jul 2023 17:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688767792;
	bh=TgAi7yvMeAejU1jDxC8LAYgYWBLNS7QV3EpSFHxQCiA=;
	h=From:To:Subject:Date;
	b=wjIU1OX64cc+rIK7l4J09TeEbhuuWw+PZXRawE6DhcJawWiHRQ55uBDfjExvnHevL
	 wbslFajM6lwm2bxFCDVp6km2DGfDj+gyUueoyadTi2gcrCdjGdqoKxdNl2TeIog/S/
	 xCqyFXqYe+h/uFnPjx3F9+pxrWiENg4dPYYIMHfM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 367M9q1Y018162
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jul 2023 17:09:52 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jul 2023 17:09:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jul 2023 17:09:52 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 367M9qpL004745;
	Fri, 7 Jul 2023 17:09:52 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qHteC-0002D9-8O; Fri, 07 Jul 2023 17:09:52 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Fix patch fuzz
Date: Fri, 7 Jul 2023 17:09:52 -0500
Message-ID: <20230707220952.8460-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Jul 2023 22:09:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14792

Clean up a little patch fuzz with applying this patch against a newer
version on master.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
index 4ef17a8d..79176749 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -95,16 +95,16 @@ diff --git a/sys/v4l2/gstv4l2videodec.c b/sys/v4l2/gstv4l2videodec.c
 index 3042995..0e4ac09 100644
 --- a/sys/v4l2/gstv4l2videodec.c
 +++ b/sys/v4l2/gstv4l2videodec.c
-@@ -536,6 +536,8 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
+@@ -738,6 +738,8 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
    GstVideoCodecFrame *frame;
    GstBuffer *buffer = NULL;
    GstFlowReturn ret;
 +  GstV4l2MemoryGroup *group;
 +  int buffer_valid=0;
 
-   GST_LOG_OBJECT (decoder, "Allocate output buffer");
+   GST_LOG_OBJECT (self, "Looping.");
 
-@@ -558,6 +560,7 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
+@@ -795,6 +797,7 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
 
      if (ret != GST_FLOW_OK)
        goto beach;
@@ -112,7 +112,7 @@ index 3042995..0e4ac09 100644
 
      GST_LOG_OBJECT (decoder, "Process output buffer");
      {
-@@ -602,13 +605,18 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
+@@ -861,13 +864,18 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
      if (oldest_frame)
        gst_video_codec_frame_unref (oldest_frame);
 
-- 
2.17.1


