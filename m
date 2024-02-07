Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A56C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 06:41:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.15139.1707288098557288520
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 22:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=BlbtDAsu;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4176fbLh086334;
	Wed, 7 Feb 2024 00:41:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707288097;
	bh=za0w9v1cbynfAxLayIGg0A/pRsQqqebITjqVB7zc+Z4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BlbtDAsuQ+ejcZYn21k8awva3S/Ob/Np5RoaM0NbjOOdhVIsk2qk/xIjxKeL7oKBX
	 TJnNgldcR3CryYCoYdvi1CHLqvaPj8ri7uoaRSVOZIti5rZTQQvnXa3Td7a5FqaFnd
	 TUPsd0UvBKfDDQ6pujiyKrTFojpcx2yDKkOXesTI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4176fb2j065702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Feb 2024 00:41:37 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Feb 2024 00:41:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Feb 2024 00:41:36 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4176fYKl081843;
	Wed, 7 Feb 2024 00:41:35 -0600
Message-ID: <8f816a8a-63cd-45c1-a6eb-b1157a4129a0@ti.com>
Date: Wed, 7 Feb 2024 12:11:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][kirkstone][PATCH 2/4] meta-arago: distro:
 add a bbapend to patch the chromium browser
Content-Language: en-US
To: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>
References: <20240206175841.32717-1-detheridge@ti.com>
 <20240206175841.32717-3-detheridge@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240206175841.32717-3-detheridge@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 4176fbLh086334
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Feb 2024 06:41:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15123

Hi Darren

In commit message title,
s/bbapend/bbappend


On 06/02/24 23:28, Etheridge, Darren via lists.yoctoproject.org wrote:
> From: Darren Etheridge <detheridge@=E2=80=8Ati.=E2=80=8Acom> This appli=
es a patch for=20
> meta-browser/chromium-ozone-wayland to make the sandboxing work with=20
> the Imagination GPU components without the need for the --no-sandbox=20
> flag. GPU acceleration in Chromium
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> From: Darren Etheridge <detheridge@ti.com>
>
> This applies a patch for meta-browser/chromium-ozone-wayland to make th=
e
> sandboxing work with the Imagination GPU components without the need fo=
r
> the --no-sandbox flag.
>
> GPU acceleration in Chromium is dependant on IMG DDK 23.3.  It works
> across AXE/BXS/8XE GPU's.   No acceleration is expected for SGX.
>
> Also add an upstream patch to stop Chromium from segfaulting when it is
> run with no input devices connected to the board.
> Patch was retrieved from:
> https://urldefense.com/v3/__https://chromium.googlesource.com/chromium/=
src/*/323077958301bc321d840a2c2b983ab469934753__;Kw!!G3vK!Q1ZI2dsaxka-0vu=
202whhUsEmBDa9DSQPM71DvdmC9MGFHwvBAjQmNdPgEtm1NZeBloRSk1T5iINRfCzyBwGDC_d=
omr6HHSGHXOR$
>
> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ---
>   meta-arago-distro/conf/layer.conf             |  2 +
>   ...omium-ozone-wayland_111.0.5563.64.bbappend |  8 ++
>   ...dbox-allow-access-to-PowerVR-GPU-fro.patch | 74 ++++++++++++++++++=
+
>   ...-chromium-32307795-fix-nullprt-deref.patch | 52 +++++++++++++
>   4 files changed, 136 insertions(+)
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-=
layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbapp=
end
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-=
layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-=
chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-=
layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-=
upstream-chromium-32307795-fix-nullprt-deref.patch
>
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf=
/layer.conf
> index 40b0f5bb..b0221860 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -24,9 +24,11 @@ LAYERDEPENDS_meta-arago-distro =3D " \
>   # clang-layer
>  =20
>   LAYERRECOMMENDS_meta-arago-distro =3D " \
> +    chromium-browser-layer \
>   "
>  =20
>   BBFILES_DYNAMIC +=3D " \
> +    chromium-browser-layer:${LAYERDIR}/dynamic-layers/chromium-browser=
-layer/recipes*/*/*.bbappend \
>   "
>  =20
>   BB_DANGLINGAPPENDS_WARNONLY =3D "true"
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend b/me=
ta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chr=
omium/chromium-ozone-wayland_111.0.5563.64.bbappend
> new file mode 100644
> index 00000000..df93e26b
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
> @@ -0,0 +1,8 @@
> +PR:append =3D ".arago0"
> +
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}_${PV}:"
> +
> +SRC_URI:append =3D " \
> +                  file://0001-chromium-gpu-sandbox-allow-access-to-Pow=
erVR-GPU-fro.patch \
> +                  file://0002-upstream-chromium-32307795-fix-nullprt-d=
eref.patch \
> +                  "
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium=
-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch b/meta-arago-distro/dy=
namic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozo=
ne-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerV=
R-GPU-fro.patch
> new file mode 100644
> index 00000000..1930f976
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sa=
ndbox-allow-access-to-PowerVR-GPU-fro.patch
> @@ -0,0 +1,74 @@
> +From 11267fe76f81dce283d565d517b679aa2be44466 Mon Sep 17 00:00:00 2001
> +From: Darren Etheridge <detheridge@ti.com>
> +Date: Fri, 26 Jan 2024 10:54:49 -0600
> +Subject: [PATCH] chromium: gpu: sandbox: allow access to PowerVR GPU f=
rom
> + sandbox
> +
> +Chromium runs in a sandbox to limit access to the system, however
> +the PowerVR drivers for the Imagination GPU used on TI hardware need
> +some extra libraries along with the DRM device nodes to be opened up.
> +This patch opens up the necessary pieces.
> +
> +Signed-off-by: Darren Etheridge <detheridge@ti.com>
> +---
> + content/gpu/gpu_sandbox_hook_linux.cc | 16 +++++++++++++++-
> + 1 file changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/content/gpu/gpu_sandbox_hook_linux.cc b/content/gpu/gpu_s=
andbox_hook_linux.cc
> +index d93285a..1f8aafd 100644
> +--- a/content/gpu/gpu_sandbox_hook_linux.cc
> ++++ b/content/gpu/gpu_sandbox_hook_linux.cc
> +@@ -67,6 +67,11 @@ inline bool UseChromecastSandboxAllowlist() {
> + #endif
> + }
> +
> ++inline bool IsGPUIMGRogue() {
> ++  return true;
> ++}
> ++
> ++
> + inline bool IsArchitectureArm() {
> + #if defined(ARCH_CPU_ARM_FAMILY)
> +   return true;
> +@@ -441,6 +446,11 @@ std::vector<BrokerFilePermission> FilePermissions=
ForGpu(
> +
> +   AddVulkanICDPermissions(&permissions);
> +
> ++  if (IsGPUIMGRogue()) {
> ++      // Add standard DRM permissions for snapdragon/PowerVR:
> ++      AddDrmGpuPermissions(&permissions);
> ++  }
> ++
> +   if (IsChromeOS()) {
> +     // Permissions are additive, there can be multiple GPUs in the sy=
stem.
> +     AddStandardChromeOsPermissions(&permissions);
> +@@ -508,6 +518,8 @@ void LoadArmGpuLibraries() {
> +         DRI_DRIVER_DIR "/mediatek_dri.so",
> +         DRI_DRIVER_DIR "/rockchip_dri.so",
> +         DRI_DRIVER_DIR "/asahi_dri.so",
> ++        DRI_DRIVER_DIR "/pvr_dri.so",
> ++        DRI_DRIVER_DIR "/tidss_dri.so",
> + #else
> +         "/usr/lib64/dri/msm_dri.so",
> +         "/usr/lib64/dri/panfrost_dri.so",
> +@@ -515,6 +527,8 @@ void LoadArmGpuLibraries() {
> +         "/usr/lib64/dri/rockchip_dri.so",
> +         "/usr/lib64/dri/asahi_dri.so",
> +         "/usr/lib/dri/msm_dri.so",
> ++        "/usr/lib/dri/tidss_dri.so",
> ++        "/usr/lib/dri/pvr_dri.so",
> +         "/usr/lib/dri/panfrost_dri.so",
> +         "/usr/lib/dri/mediatek_dri.so",
> +         "/usr/lib/dri/rockchip_dri.so",
> +@@ -632,7 +646,7 @@ sandbox::syscall_broker::BrokerCommandSet CommandS=
etForGPU(
> +   command_set.set(sandbox::syscall_broker::COMMAND_ACCESS);
> +   command_set.set(sandbox::syscall_broker::COMMAND_OPEN);
> +   command_set.set(sandbox::syscall_broker::COMMAND_STAT);
> +-  if (IsChromeOS() &&
> ++  if ((IsGPUIMGRogue() || IsChromeOS()) &&
> +       (options.use_amd_specific_policies ||
> +        options.use_intel_specific_policies ||
> +        options.use_virtio_specific_policies || IsArchitectureArm())) =
{
> +--
> +2.36.1
> +
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream=
-chromium-32307795-fix-nullprt-deref.patch b/meta-arago-distro/dynamic-la=
yers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayla=
nd_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch
> new file mode 100644
> index 00000000..5624de96
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromi=
um-32307795-fix-nullprt-deref.patch
> @@ -0,0 +1,52 @@
> +From 323077958301bc321d840a2c2b983ab469934753 Mon Sep 17 00:00:00 2001
> +From: Max Ihlenfeldt <max@igalia.com>
> +Date: Wed, 02 Aug 2023 15:46:56 +0000
> +Subject: [PATCH] ozone/wayland: Fix nullptr deref in WaylandWindowMana=
ger
> +
> +When no input devices are available (e.g. embedded devices),
> +`connection_->window_drag_controller()` returns nullptr. Add a check t=
o
> +ensure we don't accidentally dereference that.
> +
> +See alsohttps://urldefense.com/v3/__https://github.com/OSSystems/meta-=
browser/issues/736__;!!G3vK!Q1ZI2dsaxka-0vu202whhUsEmBDa9DSQPM71DvdmC9MGF=
HwvBAjQmNdPgEtm1NZeBloRSk1T5iINRfCzyBwGDC_domr6HPEd77cm$.
> +
> +Bug: 578890
> +Change-Id: I472d0dfabfea6b4d072ede98c8593370524f54f0
> +Reviewed-on:https://urldefense.com/v3/__https://chromium-review.google=
source.com/c/chromium/src/*/4724882__;Kw!!G3vK!Q1ZI2dsaxka-0vu202whhUsEmB=
Da9DSQPM71DvdmC9MGFHwvBAjQmNdPgEtm1NZeBloRSk1T5iINRfCzyBwGDC_domr6HIEZ9BQ=
2$
> +Reviewed-by: Antonio Gomes <tonikitoo@igalia.com>
> +Commit-Queue: Max Ihlenfeldt <max@igalia.com>
> +Cr-Commit-Position: refs/heads/main@{#1178426}
> +---
> +
> +diff --git a/ui/ozone/platform/wayland/host/wayland_window_manager.cc =
b/ui/ozone/platform/wayland/host/wayland_window_manager.cc
> +index e4a8e4541..24999725 100644
> +--- a/ui/ozone/platform/wayland/host/wayland_window_manager.cc
> ++++ b/ui/ozone/platform/wayland/host/wayland_window_manager.cc
> +@@ -96,15 +96,19 @@
> +
> + WaylandWindow* WaylandWindowManager::GetCurrentPointerOrTouchFocusedW=
indow()
> +     const {
> +-  // In case there is an ongoing window dragging session, favor the w=
indow
> +-  // according to the active drag source.
> +-  //
> +-  // TODO(https://urldefense.com/v3/__https://crbug.com/1317063__;!!G=
3vK!Q1ZI2dsaxka-0vu202whhUsEmBDa9DSQPM71DvdmC9MGFHwvBAjQmNdPgEtm1NZeBloRS=
k1T5iINRfCzyBwGDC_domr6HB0E-tho$): Apply the same logic to data drag sess=
ions
> +-  // too?
> +-  if (auto drag_source =3D connection_->window_drag_controller()->dra=
g_source()) {
> +-    return *drag_source =3D=3D mojom::DragEventSource::kMouse
> +-               ? GetCurrentPointerFocusedWindow()
> +-               : GetCurrentTouchFocusedWindow();
> ++  // Might be nullptr if no input devices are available.
> ++  if (connection_->window_drag_controller()) {
> ++    // In case there is an ongoing window dragging session, favor the=
 window
> ++    // according to the active drag source.
> ++    //
> ++    // TODO(https://urldefense.com/v3/__https://crbug.com/1317063__;!=
!G3vK!Q1ZI2dsaxka-0vu202whhUsEmBDa9DSQPM71DvdmC9MGFHwvBAjQmNdPgEtm1NZeBlo=
RSk1T5iINRfCzyBwGDC_domr6HB0E-tho$): Apply the same logic to data drag
> ++    // sessions too?
> ++    if (auto drag_source =3D
> ++            connection_->window_drag_controller()->drag_source()) {
> ++      return *drag_source =3D=3D mojom::DragEventSource::kMouse
> ++                 ? GetCurrentPointerFocusedWindow()
> ++                 : GetCurrentTouchFocusedWindow();
> ++    }
> +   }
> +
> +   for (const auto& entry : window_map_) {
> --=20
> 2.36.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15119):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15119__;!!G3vK!Q1ZI2dsaxka-0vu202whhU=
sEmBDa9DSQPM71DvdmC9MGFHwvBAjQmNdPgEtm1NZeBloRSk1T5iINRfCzyBwGDC_domr6HB6=
2lNke$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104202896/7030289__;!!G3vK!Q1ZI2dsaxka-0vu202whhUsEmBDa9DSQPM71Dvd=
mC9MGFHwvBAjQmNdPgEtm1NZeBloRSk1T5iINRfCzyBwGDC_domr6HFMYHaK3$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!Q1ZI2dsaxka-0vu202whhUsEmBDa9DSQPM71DvdmC9MGF=
HwvBAjQmNdPgEtm1NZeBloRSk1T5iINRfCzyBwGDC_domr6HOegsw2j$  [c-shilwant@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

