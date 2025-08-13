Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F3CCA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 18:27:02 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.3739.1755109620387404240
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 11:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HL1fI5vx;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DIQxXL1759201
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 13:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755109619;
	bh=R2IsP4BJmmEtBTKjgKSZpZ2RsPQ14k2QZ5cWC/p+RvQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HL1fI5vxeJzS7eCMWWQGE9a033b6FTPWZk2uGmTNvvai0z+8bZuiYQYpbK4ppmOQJ
	 cKYGvEl64+kwuUBghZ1GQ57y+OctTKsrjdYuPzAX6JGSPhvJSgTLgWQE5hjJb2rO18
	 4NcYi7hrAVqnxYQjWX5YnPu2AQ3dQfFcc/TtQyhI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DIQxLE1263653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 13:26:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 13:26:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 13:26:59 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DIQwZe2710292;
	Wed, 13 Aug 2025 13:26:59 -0500
Message-ID: <ed8ac3f4-9970-4b0a-84d8-15c749c86085@ti.com>
Date: Wed, 13 Aug 2025 13:26:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/5] meta-arago-distro:
 chromium: enable V4L2 stateful decoder
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
References: <20250813165148.220012-1-t-lannynd@ti.com>
 <20250813165148.220012-3-t-lannynd@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250813165148.220012-3-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:27:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16368

On 8/13/25 11:51 AM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Add patch that enables the V4L2 stateful decoder in Chromium
> by making sure that Chromium is opening the right V4L2
> device path for Linux.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>   ...pu-v4l2-enable-V4L2-stateful-decoder.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
> new file mode 100644
> index 00000000..ca94d2ab
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
> @@ -0,0 +1,34 @@
> +From c9a81537eb0bc1f11ea902cb9abe4d98b7be74a9 Mon Sep 17 00:00:00 2001
> +From: Thorsten Lannynd <t-lannynd@ti.com>
> +Date: Thu, 7 Aug 2025 14:48:31 -0500
> +Subject: [PATCH] chromium: gpu: v4l2: enable V4L2 stateful decoder
> +
> +Upstream-Status: Pending
> +
> +Setting the video device path to /dev/video0 for linux allows
> +Chromium to find the decoder and also check that it is stateful.
> +This patch setups the correct V4L2 pipeline.
> +
> +Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> +---
> + media/gpu/v4l2/v4l2_utils.cc | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
> +index 9646e8be73..8bc88e938f 100644
> +--- a/media/gpu/v4l2/v4l2_utils.cc
> ++++ b/media/gpu/v4l2/v4l2_utils.cc
> +@@ -633,7 +633,11 @@ std::optional<SupportedVideoDecoderConfigs> GetSupportedV4L2DecoderConfigs() {
> + }
> +
> + bool IsV4L2DecoderStateful() {
> ++#if BUILDFLAG(IS_LINUX)
> ++  constexpr char kVideoDeviceDriverPath[] = "/dev/video0";

/dev/video0 could just as easily be a USB webcam or something. Using
a name not normally created by the kernel such as /dev/video-dec0
works better as it allows userspace to use some better heuristic
to make that a symlink to the correct device (such as some udev
rule which you can add to Arago instead).

Andrew

> ++#else
> +   constexpr char kVideoDeviceDriverPath[] = "/dev/video-dec0";
> ++#endif
> +   base::ScopedFD device_fd(HANDLE_EINTR(
> +       open(kVideoDeviceDriverPath, O_RDWR | O_NONBLOCK | O_CLOEXEC)));
> +   if (!device_fd.is_valid()) {
> +--
> +2.34.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16363): https://lists.yoctoproject.org/g/meta-arago/message/16363
> Mute This Topic: https://lists.yoctoproject.org/mt/114686887/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


