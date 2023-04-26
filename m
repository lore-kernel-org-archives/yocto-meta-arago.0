Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CD8C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 23:17:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.7851.1682551040211742699
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 16:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DLKqDoOr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QNHEv3088063;
	Wed, 26 Apr 2023 18:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682551034;
	bh=AjvuweAZoXpTqjfzmEHwYeBifJI3+5g75bqQQ92hQY8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DLKqDoOrbqjhyGEPbIMWsLUm4/LOCtptfRzgTuezmGHB+x1vx5Q1GN93KfvHVipYh
	 OhVo/e3sxFT72Kc2THxyFX1IFEWT8ShP2Xo85mUKN7dviNlZuHoOT2LNv7FQyN/avf
	 IMOucDTIci0gXvysJ5qCRDMXQwBqWh9N0RYMuiMM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QNHECH008278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 18:17:14 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 26
 Apr 2023 18:17:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 18:17:14 -0500
Received: from [10.250.35.77] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QNHD25031664;
	Wed, 26 Apr 2023 18:17:14 -0500
Message-ID: <bb23f78d-2906-fb8e-26ae-c0f189f5f55b@ti.com>
Date: Wed, 26 Apr 2023 18:17:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/6] arago.conf: drop the
 explicit removal of x11, add vulkan
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230426213214.3501230-1-rs@ti.com>
 <20230426213214.3501230-2-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230426213214.3501230-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 23:17:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14358

On 4/26/23 4:32 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Drop the explicit removal of x11 as the new PVR Vulkan libs have runtime
> dependencies on libx11.
> 
> Add vulkan as a distro feature.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 094e67da..58841051 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -45,12 +45,10 @@ TMPDIR .= "${TCMODEAPPEND}"
>   # Start with default set of distro features
>   DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
>   
> -# Remove some unwanted features
> -DISTRO_FEATURES:remove = "x11"

This is probably fine, but to get it to work on our SGX platforms
I also needed:

PACKAGECONFIG:remove:pn-xserver-xorg = "dri3"
PACKAGECONFIG:remove:pn-xserver-xorg = "xshmfence"
PACKAGECONFIG:remove:pn-xserver-xorg = "glx"
PACKAGECONFIG:remove:pn-cairo = "opengl"
PACKAGECONFIG:remove:pn-libepoxy = "x11"
PACKAGECONFIG:remove:pn-mesa-demos = "gbm"
PACKAGECONFIG:remove:pn-mesa-demos = "wayland"
PACKAGECONFIG:remove:pn-mesa-demos = "glew"
PACKAGECONFIG:remove:pn-mesa-demos = "glu"

To prevent any of these trying to build against desktop OpenGL or GLESv3.

> -
>   # Add additional distro features
>   DISTRO_FEATURES:append = " pam wayland opengl"
>   #DISTRO_FEATURES:append = " opencl"
> +DISTRO_FEATURES:append = " vulkan"

You going to add Vulkan support to SGX? You do remember we have
to turn that back on at some point...

Ideally, like "opengl", these should become machine features, not distro.

Andrew

>   DISTRO_FEATURES:append = " opencv"
>   DISTRO_FEATURES:append = " openmp"
>   

