Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCBFEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 04:06:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14117.1688616376973657000
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 21:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5013140C16;
	Thu,  6 Jul 2023 04:06:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tiJwsjMcDfzv; Thu,  6 Jul 2023 04:06:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F2A4040C13;
	Thu,  6 Jul 2023 04:06:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B30EC163BD7; Thu,  6 Jul 2023 00:06:08 -0400 (EDT)
Date: Thu, 6 Jul 2023 00:06:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: j-luthra@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Chirag Shilwant <c-shilwant@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [meta-arago] [master/kirkstone][PATCH v2 2/3] libcamera: Add
 support for TI CSI-RX
Message-ID: <20230706040608.GD1518@denix.org>
References: <20230706035522.1817402-1-j-luthra@ti.com>
 <20230706035522.1817402-2-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706035522.1817402-2-j-luthra@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 04:06:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14762

On Thu, Jul 06, 2023 at 09:25:21AM +0530, Jai Luthra via lists.yoctoproject.org wrote:
> TI's CSI-RX driver is not yet upstream, so the libcamera simple pipeline
> does not recognize it.
> 
> Apply a patch to the simple pipeline so that it can recognize the media
> entity for TI's CSI-RX driver.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
> 
> v2: Add upstream information in the patch
> Link to v1: https://lore.kernel.org/all/20230705130928.1201894-2-j-luthra@ti.com/
> 
>  .../0001-simple-Support-TI-CSI-RX.patch       | 32 +++++++++++++++++++
>  .../libcamera/libcamera_0.0.5.bb              |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> new file mode 100644
> index 00000000..f35b3613
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> @@ -0,0 +1,32 @@
> +From d0e4f4f224671e9fc992d39e7beb9c486303ede1 Mon Sep 17 00:00:00 2001
> +From: Jai Luthra <j-luthra@ti.com>
> +Date: Thu, 23 Mar 2023 11:38:46 +0530
> +Subject: [PATCH] simple: Support TI CSI-RX
> +
> +Add support for TI's CSI-RX pixel grabber device for the simple
> +pipeline.
> +
> +The driver is not yet merged, but v7 is posted [1] upstream.
> +
> +Link: https://lore.kernel.org/all/20230314115516.667-1-vaishnav.a@ti.com/ [1]

No, that is not a required Upstream-Status tag. See here:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status


> +Signed-off-by: Jai Luthra <j-luthra@ti.com>
> +---
> + src/libcamera/pipeline/simple/simple.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
> +index e1f8b989..520405a1 100644
> +--- a/src/libcamera/pipeline/simple/simple.cpp
> ++++ b/src/libcamera/pipeline/simple/simple.cpp
> +@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] = {
> + 	{ "mxc-isi", {} },
> + 	{ "qcom-camss", {} },
> + 	{ "sun6i-csi", {} },
> ++	{ "j721e-csi2rx", {} },
> ++
> + };
> + 
> + } /* namespace */
> +-- 
> +2.41.0
> +
> diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> index 6ad376f2..b2eb5fac 100644
> --- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\
>  
>  SRC_URI = " \
>          git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
> +        file://0001-simple-Support-TI-CSI-RX.patch \
>  "
>  
>  SRCREV = "fb44403f1c5571549ac128c21daee9761eb9249c"
> -- 
> 2.41.0

