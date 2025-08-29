Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A172CA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 17:28:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.901.1756488487054558353
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 10:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 391BA410B0;
	Fri, 29 Aug 2025 17:28:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPRs4F7tD65i; Fri, 29 Aug 2025 17:28:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C2FC840DDA;
	Fri, 29 Aug 2025 17:27:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C8B2E1725D6; Fri, 29 Aug 2025 13:27:58 -0400 (EDT)
Date: Fri, 29 Aug 2025 13:27:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: t-lannynd@ti.com
Cc: meta-arago@lists.yoctoproject.org, afd@ti.com, reatmon@ti.com,
	detheridge@ti.com, rs@ti.com, b-brnich@ti.com
Subject: Re: [meta-arago][scarthgap][PATCH v3] chromium: Replace
 /dev/video* with Chromium naming convention
Message-ID: <20250829172758.GA24899@denix.org>
References: <20250828200933.1372572-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828200933.1372572-1-t-lannynd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 29 Aug 2025 17:28:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16504

On Thu, Aug 28, 2025 at 03:09:33PM -0500, Thorsten Lannynd via lists.yoctoproject.org wrote:
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



> This patch depends
> on the meta-ti/scarthgap-next branch, where the necessary udev rules have
> been added.

This kind of information in the last sentence referring to the current state 
of the "next" branch (which is already incorrect, as the change got merged 
into the main release branch) does not belong in the permanent commit message.

Think of everything you say above the "---" line as a permanent commit message 
that will be preserved forever in the git history of the corresponding repo. 
It might be confusing to someone reading this commit months/years later, 
thinking that they need to use "next" branch of meta-ti to get this working...

On the other hand everything you say just below the "---" line usually refers 
to the current state of this patch (before it gets applied and becomes a 
commit) and won't go into git history as a commit message. Hence you list 
there patch revisions. Same should be applied to things like "this patch 
depends on other patch getting applied first" kind of messages.


> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> 
> v3:
> - Removed meta-arago-distro: from subject line to pass check-yocto-patch
> 
> v2:
> - Fixed subject line to be 80 characters or less to pass check-yocto-patch
> 
>  ...box-Allow-GPU-sandbox-access-to-V4L.patch} | 14 -----
>  ...pu-v4l2-enable-V4L2-stateful-decoder.patch | 34 -----------
>  ...-Fix-OUTPUT-queue-streaming-in-V4L2.patch} | 61 +++++++++----------
>  .../chromium/chromium-ozone-wayland-arago.inc |  5 +-
>  4 files changed, 30 insertions(+), 84 deletions(-)
>  rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/{0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch => 0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch} (70%)
>  delete mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
>  rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/{0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch => 0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch} (74%)
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> similarity index 70%
> rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> index 1cadaa5b..4ccb8fc1 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
> @@ -20,20 +20,6 @@ diff --git a/content/common/gpu_pre_sandbox_hook_linux.cc b/content/common/gpu_p
>  index 2a3abc9775..1865246fa8 100644
>  --- a/content/common/gpu_pre_sandbox_hook_linux.cc
>  +++ b/content/common/gpu_pre_sandbox_hook_linux.cc
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
>  @@ -516,11 +521,14 @@ std::vector<BrokerFilePermission> FilePermissionsForGpu(
>         AddDrmGpuPermissions(&permissions);
>     }
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
> index f502eac5..ba113ff9 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
> @@ -19,6 +19,11 @@ during video decoding initialization.
>  the raw output frames are in the correct pixel format and picture
>  size.
>  
> +These changes rely on appropriate udev rules when running on a generic
> +Linux distribution to set the correct device node names. This patch depends
> +on the meta-ti/scarthgap-next branch, where the necessary udev rules have
> +been added.
> +
>  Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
>  ---
>   media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 40 ++++++++++++++-----
> @@ -29,18 +34,6 @@ diff --git a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc b/media/gpu/v4l2/v4l2
>  index e5069a3acf..6d11ea7e0f 100644
>  --- a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
>  +++ b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
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
>  @@ -410,10 +414,6 @@ void V4L2StatefulVideoDecoder::Initialize(const VideoDecoderConfig& config,
>       std::move(init_cb).Run(DecoderStatus::Codes::kFailedToCreateDecoder);
>       return;
> @@ -94,30 +87,32 @@ index e5069a3acf..6d11ea7e0f 100644
>     // If our |client_| has a VideoFramePool to allocate buffers for us, we'll
>     // use it, otherwise we have to ask the driver.
>     const bool use_v4l2_allocated_buffers = !client_->GetVideoFramePool();
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
>  diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
> -index 8bc88e938f..b79ff3e832 100644
> +index 9646e8be73..6a7feb49c9 100644
>  --- a/media/gpu/v4l2/v4l2_utils.cc
>  +++ b/media/gpu/v4l2/v4l2_utils.cc
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
>  -  constexpr int kMaxDevices = 256;
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
>  --
>  2.34.1
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> index 699813ed..d5a790fe 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> @@ -9,7 +9,6 @@ CHROMIUM_EXTRA_ARGS:append = " ${@bb.utils.contains('PACKAGECONFIG', 'use-v4l2',
>  
>  SRC_URI:append = " \
>                    file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
> -                  file://0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch \
> -                  file://0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
> -                  file://0004-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
> +                  file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
> +                  file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
>                    "
> -- 
> 2.34.1

