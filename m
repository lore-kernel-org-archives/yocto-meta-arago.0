Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A473CC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:52:01 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1579.1755103915273881374
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 09:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FpJ4oChW;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: t-lannynd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DGpsBY1691394
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755103914;
	bh=MBBtLhfBSGCezzdW0Nmogy9mgDtrYhCBF+eyJCGk3dY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FpJ4oChWLeMXP/hoOPSUWkQT809ZTUx1Eh6ZuJJ6sE48e8vYLjNW85Poeo08uMds9
	 PcfPJ1lifFYeZHkz0UjY7VSkFnGq7HZAieCrvBa/P4MCSdesczhy2to3mgFTmOjKlI
	 6BOoCbslKpJ337kIpYcsFyJ19rsurpxdc4D1hmpM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DGpskx1211815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:54 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 11:51:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 11:51:54 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DGpoA22292823;
	Wed, 13 Aug 2025 11:51:54 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 4/5] meta-arago-distro: chromium: Fix V4L2 Stateful decoder
Date: Wed, 13 Aug 2025 11:51:47 -0500
Message-ID: <20250813165148.220012-5-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813165148.220012-1-t-lannynd@ti.com>
References: <20250813165148.220012-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16365

Add patch to fix the V4L2 Stateful decoder
in Chromium to work with Wave5:
    Correct the device paths that are opened.

    Reorder EnqueueBuffers() and Streamon() since Wave5
    needs buffers enqueued before StreamOn() is called.

    Set the pixel format on the raw video frames to
    send to display.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...2-Fix-OUTPUT-queue-streaming-in-V4L2.patch | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
new file mode 100644
index 00000000..f502eac5
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
@@ -0,0 +1,123 @@
+From 3f5cdbc3b1871b6b8cdfa96eccd96f59d66a8afc Mon Sep 17 00:00:00 2001
+From: Thorsten Lannynd <t-lannynd@ti.com>
+Date: Sat, 9 Aug 2025 01:46:14 -0500
+Subject: [PATCH] chromium: gpu: v4l2: Fix OUTPUT queue streaming in
+ V4L2StatefulVideoDecoder
+
+Upstream-Status: Inappropriate [this change is needed to satisfy
+Wave5 conditions, which isn't applicable upstream]
+
+This patch ensures that the OUTPUT queue in `V4L2StatefulVideoDecoder`
+is properly checked and started before attempting to enqueue buffers.
+Wave5 requires buffers to be enqueued before streaming.
+
+It adds a check for `IsStreaming()` and attempts to start streaming
+with `Streamon()` if necessary. This prevents potential failures
+during video decoding initialization.
+
+`SetFormat()` needs to be called on the CAPTURE queue to ensure
+the raw output frames are in the correct pixel format and picture
+size.
+
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 40 ++++++++++++++-----
+ media/gpu/v4l2/v4l2_utils.cc                  |  2 +-
+ 2 files changed, 32 insertions(+), 10 deletions(-)
+
+diff --git a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
+index e5069a3acf..6d11ea7e0f 100644
+--- a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
++++ b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
+@@ -308,7 +308,11 @@ void V4L2StatefulVideoDecoder::Initialize(const VideoDecoderConfig& config,
+   }
+
+   if (!device_fd_.is_valid()) {
++#if BUILDFLAG(IS_LINUX)
++    constexpr char kVideoDeviceDriverPath[] = "/dev/video0";
++#else
+     constexpr char kVideoDeviceDriverPath[] = "/dev/video-dec0";
++#endif
+     device_fd_.reset(HANDLE_EINTR(
+         open(kVideoDeviceDriverPath, O_RDWR | O_NONBLOCK | O_CLOEXEC)));
+     if (!device_fd_.is_valid()) {
+@@ -410,10 +414,6 @@ void V4L2StatefulVideoDecoder::Initialize(const VideoDecoderConfig& config,
+     std::move(init_cb).Run(DecoderStatus::Codes::kFailedToCreateDecoder);
+     return;
+   }
+-  if (!OUTPUT_queue_->Streamon()) {
+-    std::move(init_cb).Run(DecoderStatus::Codes::kFailedToCreateDecoder);
+-    return;
+-  }
+   client_->NotifyEstimatedMaxDecodeRequests(base::checked_cast<int>(
+       std::min(static_cast<size_t>(4), num_input_buffers)));
+
+@@ -518,10 +518,22 @@ void V4L2StatefulVideoDecoder::Decode(scoped_refptr<DecoderBuffer> buffer,
+                                           std::move(decode_cb));
+   }
+
+-  if (!TryAndEnqueueOUTPUTQueueBuffers()) {
+-    // All accepted entries in |decoder_buffer_and_callbacks_| must have had
+-    // their |decode_cb|s Run() from inside TryAndEnqueueOUTPUTQueueBuffers().
+-    return;
++  if(!OUTPUT_queue_->IsStreaming()) {
++    TryAndEnqueueOUTPUTQueueBuffers();
++    if(!OUTPUT_queue_->Streamon()) {
++      VLOG(1) << "Failed to start OUTPUT queue streaming";
++      while (!decoder_buffer_and_callbacks_.empty()) {
++        auto cb = std::move(decoder_buffer_and_callbacks_.front().second);
++        decoder_buffer_and_callbacks_.pop();
++        std::move(cb).Run(DecoderStatus::Codes::kFailed);
++      }
++      return;
++    }
++    client_->NotifyEstimatedMaxDecodeRequests(base::checked_cast<int>(
++        std::min(static_cast<size_t>(4), OUTPUT_queue_->AllocatedBuffersCount())));
++  }
++  else {
++    TryAndEnqueueOUTPUTQueueBuffers();
+   }
+
+   if (!event_task_runner_) {
+@@ -729,7 +741,13 @@ bool V4L2StatefulVideoDecoder::InitializeCAPTUREQueue() {
+   auto chosen_fourcc = output_format.fourcc;
+   const auto chosen_size = output_format.size;
+   const auto chosen_modifier = output_format.modifier;
+-
++  VLOG(1) << "Chosen |CAPTURE_queue_| format: " << chosen_fourcc.ToString() << " " << chosen_size.ToString() << " (modifier: 0x" << std::hex << chosen_modifier;
++  constexpr size_t kMiB = 1024 * 1024;
++  constexpr int kFullHDNumPixels = 1920 * 1080;
++  const size_t kInputBufferInMBs =
++      (chosen_size.GetArea() <= kFullHDNumPixels) ? 2 : 4;
++  const auto capture_format = CAPTURE_queue_->SetFormat(
++      V4L2_PIX_FMT_NV12, chosen_size, kInputBufferInMBs * kMiB);
+   // If our |client_| has a VideoFramePool to allocate buffers for us, we'll
+   // use it, otherwise we have to ask the driver.
+   const bool use_v4l2_allocated_buffers = !client_->GetVideoFramePool();
+@@ -1185,7 +1203,11 @@ int V4L2StatefulVideoDecoder::GetMaxNumDecoderInstances() {
+   if (!base::FeatureList::IsEnabled(media::kLimitConcurrentDecoderInstances)) {
+     return std::numeric_limits<int>::max();
+   }
++#if BUILDFLAG(IS_LINUX)
++  constexpr char kVideoDeviceDriverPath[] = "/dev/video0";
++#else
+   constexpr char kVideoDeviceDriverPath[] = "/dev/video-dec0";
++#endif
+   base::ScopedFD device_fd(HANDLE_EINTR(
+       open(kVideoDeviceDriverPath, O_RDWR | O_NONBLOCK | O_CLOEXEC)));
+   if (!device_fd.is_valid()) {
+diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
+index 8bc88e938f..b79ff3e832 100644
+--- a/media/gpu/v4l2/v4l2_utils.cc
++++ b/media/gpu/v4l2/v4l2_utils.cc
+@@ -577,7 +577,7 @@ std::optional<SupportedVideoDecoderConfigs> GetSupportedV4L2DecoderConfigs() {
+   candidate_paths.push_back(kVideoDevicePattern);
+ #else
+   constexpr char kVideoDevicePattern[] = "/dev/video";
+-  constexpr int kMaxDevices = 256;
++  constexpr int kMaxDevices = 2;
+   candidate_paths.reserve(kMaxDevices);
+   for (int i = 0; i < kMaxDevices; ++i) {
+     candidate_paths.push_back(
+--
+2.34.1

