Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29945CA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 19:07:00 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3140.1756494416179546730
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 12:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XP6PnLah;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57TJ6sQJ2277421;
	Fri, 29 Aug 2025 14:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756494414;
	bh=i9OSJ2z1kYFXrG/EyjXlhV4PNB2gO7JePbdaOx1CE/4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XP6PnLahGwp4mvszUdWv3p44ONsQFwJZXGawHVdk+U27+JCPcN80rYXl5EL+55eiB
	 t6zVtk66OkZlaW5z/kHUVnPKEEfdy57dSxgMsN6rp6HHk7Ixei7eme/Q7p511NAbQa
	 rKVQM+GxrUS952rWRTmRKBIWv68JYyK/bLQWucrc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57TJ6sKc763391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 14:06:54 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 14:06:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 14:06:53 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57TJ6rjc2806608;
	Fri, 29 Aug 2025 14:06:53 -0500
Message-ID: <1f70cf95-e5bc-44f3-9359-6ad7bc81e919@ti.com>
Date: Fri, 29 Aug 2025 14:06:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v4] chromium: Replace /dev/video*
 with Chromium naming convention
To: Thorsten Lannynd <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <denis@denix.org>, <afd@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
References: <20250829190412.1644519-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250829190412.1644519-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 29 Aug 2025 19:07:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16507


I think you misunderstood.

You don't need to mention in the commit message itself that it is 
dependent on anything.  The entire sentence should be under the -- and 
not in the commit message.

That entire statement is more of an comment on the patch to the 
maintainer(s) of when they should take the patch.  But it does not need 
to be in the permanent record for the commit.


On 8/29/2025 2:04 PM, Thorsten Lannynd wrote:
> Removed reliance on /dev/video* and instead adopted Chromium's
> implementation, using /dev/video-dec*, /dev/video-enc*, and /dev/jpeg-enc*.
> 
> When video devices are plugged in, the expected video device node may not
> match with the VPU decoder, encoder, and JPEG encoder. This patch ensures
> consistent naming conventions between the VPU and JPEG encoder with
> Chromium.
> 
> These changes rely on appropriate udev rules when running on a generic
> Linux distribution to set the correct device node names.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> 
> v4:
> - Removed reference to the meta-ti/scarthgap-next to avoid confusion in
>    permanent commit history
> 
> v3:
> - Removed meta-arago-distro: from subject line to pass check-yocto-patch
> 
> v2:
> - Fixed subject line to be 80 characters or less to pass check-yocto-patch
> 
>   ...box-Allow-GPU-sandbox-access-to-V4L.patch} | 14 -----
>   ...pu-v4l2-enable-V4L2-stateful-decoder.patch | 34 -----------
>   ...-Fix-OUTPUT-queue-streaming-in-V4L2.patch} | 59 ++++++++-----------
>   .../chromium/chromium-ozone-wayland-arago.inc |  5 +-
>   4 files changed, 28 insertions(+), 84 deletions(-)
>   rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/{0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch => 0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch} (70%)
>   delete mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
>   rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/{0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch => 0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch} (74%)
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> similarity index 70%
> rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> index 1cadaa5b..4ccb8fc1 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> @@ -20,20 +20,6 @@ diff --git a/content/common/gpu_pre_sandbox_hook_linux.cc b/content/common/gpu_p
>   index 2a3abc9775..1865246fa8 100644
>   --- a/content/common/gpu_pre_sandbox_hook_linux.cc
>   +++ b/content/common/gpu_pre_sandbox_hook_linux.cc
> -@@ -140,8 +140,13 @@ void AddV4L2GpuPermissions(
> -     static constexpr size_t MAX_V4L2_DECODERS = 5;
> -     static const base::FilePath::CharType kDevicePath[] =
> -         FILE_PATH_LITERAL("/dev/");
> -+#if BUILDFLAG(IS_LINUX)
> -+    static const base::FilePath::CharType kVideoDecBase[] = "video";
> -+    static const base::FilePath::CharType kMediaDecBase[] = "";
> -+#else
> -     static const base::FilePath::CharType kVideoDecBase[] = "video-dec";
> -     static const base::FilePath::CharType kMediaDecBase[] = "media-dec";
> -+#endif
> -     for (size_t i = 0; i < MAX_V4L2_DECODERS; i++) {
> -       std::ostringstream decoderPath;
> -       decoderPath << kDevicePath << kVideoDecBase << i;
>   @@ -516,11 +521,14 @@ std::vector<BrokerFilePermission> FilePermissionsForGpu(
>          AddDrmGpuPermissions(&permissions);
>      }
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
> deleted file mode 100644
> index ca94d2ab..00000000
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From c9a81537eb0bc1f11ea902cb9abe4d98b7be74a9 Mon Sep 17 00:00:00 2001
> -From: Thorsten Lannynd <t-lannynd@ti.com>
> -Date: Thu, 7 Aug 2025 14:48:31 -0500
> -Subject: [PATCH] chromium: gpu: v4l2: enable V4L2 stateful decoder
> -
> -Upstream-Status: Pending
> -
> -Setting the video device path to /dev/video0 for linux allows
> -Chromium to find the decoder and also check that it is stateful.
> -This patch setups the correct V4L2 pipeline.
> -
> -Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ----
> - media/gpu/v4l2/v4l2_utils.cc | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
> -index 9646e8be73..8bc88e938f 100644
> ---- a/media/gpu/v4l2/v4l2_utils.cc
> -+++ b/media/gpu/v4l2/v4l2_utils.cc
> -@@ -633,7 +633,11 @@ std::optional<SupportedVideoDecoderConfigs> GetSupportedV4L2DecoderConfigs() {
> - }
> -
> - bool IsV4L2DecoderStateful() {
> -+#if BUILDFLAG(IS_LINUX)
> -+  constexpr char kVideoDeviceDriverPath[] = "/dev/video0";
> -+#else
> -   constexpr char kVideoDeviceDriverPath[] = "/dev/video-dec0";
> -+#endif
> -   base::ScopedFD device_fd(HANDLE_EINTR(
> -       open(kVideoDeviceDriverPath, O_RDWR | O_NONBLOCK | O_CLOEXEC)));
> -   if (!device_fd.is_valid()) {
> ---
> -2.34.1
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
> similarity index 74%
> rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
> rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
> index f502eac5..55a630eb 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
> @@ -19,6 +19,9 @@ during video decoding initialization.
>   the raw output frames are in the correct pixel format and picture
>   size.
>   
> +These changes rely on appropriate udev rules when running on a generic
> +Linux distribution to set the correct device node names.
> +
>   Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
>   ---
>    media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 40 ++++++++++++++-----
> @@ -29,18 +32,6 @@ diff --git a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc b/media/gpu/v4l2/v4l2
>   index e5069a3acf..6d11ea7e0f 100644
>   --- a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
>   +++ b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
> -@@ -308,7 +308,11 @@ void V4L2StatefulVideoDecoder::Initialize(const VideoDecoderConfig& config,
> -   }
> -
> -   if (!device_fd_.is_valid()) {
> -+#if BUILDFLAG(IS_LINUX)
> -+    constexpr char kVideoDeviceDriverPath[] = "/dev/video0";
> -+#else
> -     constexpr char kVideoDeviceDriverPath[] = "/dev/video-dec0";
> -+#endif
> -     device_fd_.reset(HANDLE_EINTR(
> -         open(kVideoDeviceDriverPath, O_RDWR | O_NONBLOCK | O_CLOEXEC)));
> -     if (!device_fd_.is_valid()) {
>   @@ -410,10 +414,6 @@ void V4L2StatefulVideoDecoder::Initialize(const VideoDecoderConfig& config,
>        std::move(init_cb).Run(DecoderStatus::Codes::kFailedToCreateDecoder);
>        return;
> @@ -94,30 +85,32 @@ index e5069a3acf..6d11ea7e0f 100644
>      // If our |client_| has a VideoFramePool to allocate buffers for us, we'll
>      // use it, otherwise we have to ask the driver.
>      const bool use_v4l2_allocated_buffers = !client_->GetVideoFramePool();
> -@@ -1185,7 +1203,11 @@ int V4L2StatefulVideoDecoder::GetMaxNumDecoderInstances() {
> -   if (!base::FeatureList::IsEnabled(media::kLimitConcurrentDecoderInstances)) {
> -     return std::numeric_limits<int>::max();
> -   }
> -+#if BUILDFLAG(IS_LINUX)
> -+  constexpr char kVideoDeviceDriverPath[] = "/dev/video0";
> -+#else
> -   constexpr char kVideoDeviceDriverPath[] = "/dev/video-dec0";
> -+#endif
> -   base::ScopedFD device_fd(HANDLE_EINTR(
> -       open(kVideoDeviceDriverPath, O_RDWR | O_NONBLOCK | O_CLOEXEC)));
> -   if (!device_fd.is_valid()) {
>   diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
> -index 8bc88e938f..b79ff3e832 100644
> +index 9646e8be73..6a7feb49c9 100644
>   --- a/media/gpu/v4l2/v4l2_utils.cc
>   +++ b/media/gpu/v4l2/v4l2_utils.cc
> -@@ -577,7 +577,7 @@ std::optional<SupportedVideoDecoderConfigs> GetSupportedV4L2DecoderConfigs() {
> -   candidate_paths.push_back(kVideoDevicePattern);
> - #else
> -   constexpr char kVideoDevicePattern[] = "/dev/video";
> +@@ -572,18 +572,10 @@ std::optional<SupportedVideoDecoderConfigs> GetSupportedV4L2DecoderConfigs() {
> +   SupportedVideoDecoderConfigs supported_media_configs;
> +   std::vector<std::string> candidate_paths;
> +
> +-#if BUILDFLAG(IS_CHROMEOS)
> +-  constexpr char kVideoDevicePattern[] = "/dev/video-dec0";
> +-  candidate_paths.push_back(kVideoDevicePattern);
> +-#else
> +-  constexpr char kVideoDevicePattern[] = "/dev/video";
>   -  constexpr int kMaxDevices = 256;
> -+  constexpr int kMaxDevices = 2;
> -   candidate_paths.reserve(kMaxDevices);
> -   for (int i = 0; i < kMaxDevices; ++i) {
> -     candidate_paths.push_back(
> +-  candidate_paths.reserve(kMaxDevices);
> +-  for (int i = 0; i < kMaxDevices; ++i) {
> +-    candidate_paths.push_back(
> +-        base::StringPrintf("%s%d", kVideoDevicePattern, i));
> +-  }
> +-#endif
> ++  constexpr char kVideoDevicePattern0[] = "/dev/video-dec0";
> ++  constexpr char kVideoDevicePattern1[] = "/dev/video-dec1";
> ++  candidate_paths.push_back(kVideoDevicePattern0);
> ++  candidate_paths.push_back(kVideoDevicePattern1);
> +
> +   for (const auto& path : candidate_paths) {
> +     base::ScopedFD device_fd(
>   --
>   2.34.1
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> index 699813ed..d5a790fe 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> @@ -9,7 +9,6 @@ CHROMIUM_EXTRA_ARGS:append = " ${@bb.utils.contains('PACKAGECONFIG', 'use-v4l2',
>   
>   SRC_URI:append = " \
>                     file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
> -                  file://0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch \
> -                  file://0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
> -                  file://0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
> +                  file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
> +                  file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
>                     "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

