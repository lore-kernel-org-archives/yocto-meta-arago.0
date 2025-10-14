Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E356DCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 19:12:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.4582.1760469134910795901
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 12:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EMYENrlp;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: t-lannynd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59EJCDxO1219525
	for <meta-arago@lists.yoctoproject.org>; Tue, 14 Oct 2025 14:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760469133;
	bh=YpkSWHKush+Sjfz/+RA6bdyEwcEAf/zIGpLAmU9n7xY=;
	h=From:To:CC:Subject:Date;
	b=EMYENrlpi/iO2PH0enxif7PqILWejTGbNgh2ftp+ZilZshzQ3jxL4LHHaVQMPoIqf
	 gSccbbsaPETdI/4jvehHCfKTyzLMtsuFLCq1qFOyRNItzvMfJSsxxEYVNi7DGRT4Z9
	 l+RU/V47gy2GNvKzS8uG6/qXtxoI8gV3Ptoc+XfQ=
Received: from DFLE209.ent.ti.com (dfle209.ent.ti.com [10.64.6.67])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59EJCCHH241393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 14 Oct 2025 14:12:13 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 14:12:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 14:12:12 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59EJCCjs610728;
	Tue, 14 Oct 2025 14:12:12 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <rs@ti.com>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-distro: chromium: Avoid placing incomplete H264 NALUs in buffer
Date: Tue, 14 Oct 2025 14:11:33 -0500
Message-ID: <20251014191133.1359834-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 14 Oct 2025 19:12:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16690

Add patch to prevent SPS, PPS and other NALUs from being placed in seperate
buffers unconditionally. These are not full access units and may confuse
the V4L2 stateful decoder.

This patch adds improved performance and stability for H264 video decoding.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...complete-H264-access-units-in-buffer.patch | 48 +++++++++++++++++++
 .../chromium/chromium-ozone-wayland-arago.inc |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-Avoid-placing-incomplete-H264-access-units-in-buffer.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-Avoid-placing-incomplete-H264-access-units-in-buffer.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-Avoid-placing-incomplete-H264-access-units-in-buffer.patch
new file mode 100644
index 00000000..e0ca7dfd
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-Avoid-placing-incomplete-H264-access-units-in-buffer.patch
@@ -0,0 +1,48 @@
+From 8542b683ca6a0774a452eb3d7cadc834d4f41436 Mon Sep 17 00:00:00 2001
+From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
+Date: Wed, 11 Jun 2025 11:07:05 +0300
+Subject: [PATCH] media/gpu/v4l2: Avoid placing incomplete H264 access units in
+ buffers
+
+Upstream-Status: Pending
+
+Don't place SPS, PPS, etc NALUs in their own separate buffers
+unconditionally, as they are not full access units by themselves,
+and may confuse the decoder.
+---
+ media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
+index 422cc72a34a83..61ab2f5bf1ab2 100644
+--- a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
++++ b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
+@@ -1340,7 +1340,7 @@ H264FrameReassembler::FindFrameBoundary(const uint8_t* const data,
+           return std::nullopt;
+         }
+         previous_slice_header_.reset();
+-        return FrameBoundaryInfo{.is_whole_frame = true,
++        return FrameBoundaryInfo{.is_whole_frame = false,
+                                  .is_start_of_new_frame = true,
+                                  .nalu_size = nalu_size};
+       case H264NALU::kPPS:
+@@ -1350,7 +1350,7 @@ H264FrameReassembler::FindFrameBoundary(const uint8_t* const data,
+           return std::nullopt;
+         }
+         previous_slice_header_.reset();
+-        return FrameBoundaryInfo{.is_whole_frame = true,
++        return FrameBoundaryInfo{.is_whole_frame = false,
+                                  .is_start_of_new_frame = true,
+                                  .nalu_size = nalu_size};
+       case H264NALU::kNonIDRSlice:
+@@ -1389,7 +1389,7 @@ H264FrameReassembler::FindFrameBoundary(const uint8_t* const data,
+       case H264NALU::kReserved18:
+         // Anything else than SPS, PPS and Non/IDRs marks a new frame boundary.
+         previous_slice_header_.reset();
+-        return FrameBoundaryInfo{.is_whole_frame = true,
++        return FrameBoundaryInfo{.is_whole_frame = false,
+                                  .is_start_of_new_frame = true,
+                                  .nalu_size = nalu_size};
+       default:
+--
+GitLab
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index d5a790fe..53669cf5 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -11,4 +11,5 @@ SRC_URI:append = " \
                   file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
+                  file://0004-Avoid-placing-incomplete-H264-access-units-in-buffer.patch \
                   "

