Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2430AC05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 17:42:20 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.81284.1674236533621616120
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 09:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TO0+xKZm;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30KHgCJ2013434
	for <meta-arago@lists.yoctoproject.org>; Fri, 20 Jan 2023 11:42:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674236532;
	bh=IQPe2CbFRpyorV2fOIUDSJo2NUy4QaMZN1NBD/Hxf7g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TO0+xKZmVyGYQoH4xySiqmyA+BUNWew0dazhSsREbO5TGV3J6wacAdTNO5Tid8KFq
	 CHvSS/wxtz0SMovUzq01XDc0kL1DirYDhC01TNh36DJdhFFQjOU2ysnRw/9SWyEkmY
	 7/CpU6RplMcsA/2+WiLWf4A/jhNjnSHd5x8k/RTE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30KHgCYD120393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 20 Jan 2023 11:42:12 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 20
 Jan 2023 11:42:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 20 Jan 2023 11:42:12 -0600
Received: from [10.250.32.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30KHgB4E085853;
	Fri, 20 Jan 2023 11:42:12 -0600
Message-ID: <09c8b020-ed7d-0bb0-6c6b-adcd23388397@ti.com>
Date: Fri, 20 Jan 2023 11:42:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arago] [master/kirkstone][PATCH] all: Graphics recipe
 overhaul
Content-Language: en-US
To: <rs@ti.com>, <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230119204205.1297727-1-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230119204205.1297727-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Jan 2023 17:42:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14178

On 1/19/23 2:42 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> Leverage the graphics changes introduced in meta-ti by the patch with
> the same name as this one. The following logic is applied:
>    1. oe-core sees the inclusion of opengl as a distro feature to be an
>       invitation to build all graphics toolkits and libraries. We now
>       follow suit. Remove opengl as a distro feature if you do not wish
>       to have any graphics tools.
>    2. Rogue and SGX graphics libraries are out of tree modules and should
>       be treated as such. Inclusion of them is optional through the use
>       of powervr-rogue-graphics and powervr-sgx-graphics distro features
>       and the appropriate packages will be selected based on the matching
>       machine features.

I thought these (powervr-*-graphics) were MACHINE features, not DISTRO..

>    3. The gpu machine feature was removed to assist with the inclusion of
>       the two previously mentioned points. Anything wishing to build off
>       of Arago with piecemeal graphics components should introduce their
>       own package groups to do so.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf             |  2 +-
>   .../conf/distro/include/branding-mainline.inc        |  4 ++--
>   .../conf/distro/include/branding-next.inc            |  2 +-
>   .../recipes-core/images/tisdk-core-bundle.inc        |  4 ++--
>   .../recipes-core/images/tisdk-default-image.bb       | 12 +++++-------
>   .../recipes-core/images/tisdk-thinlinux-image.bb     |  4 +---
>   .../packagegroup-arago-tisdk-addons-sdk-target.bb    |  2 +-
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb |  2 +-
>   .../packagegroup-arago-tisdk-graphics-sdk-target.bb  |  4 +---
>   .../packagegroup-arago-tisdk-graphics.bb             |  4 +---
>   .../packagegroup-arago-tisdk-gtk-sdk-target.bb       |  4 +---
>   .../packagegroups/packagegroup-arago-tisdk-gtk.bb    |  4 +---
>   .../packagegroups/packagegroup-arago-tisdk-hmi.bb    |  4 +---
>   .../packagegroups/packagegroup-arago-tisdk-matrix.bb | 10 +++++-----
>   ...packagegroup-arago-tisdk-multimedia-sdk-target.bb |  2 +-
>   .../packagegroup-arago-tisdk-multimedia.bb           |  4 ++--
>   .../packagegroups/packagegroup-arago-tisdk-qte.bb    |  4 +---
>   .../packagegroup-arago-toolchain-tisdk-target.bb     |  6 +++---
>   .../recipes-core/packagegroups/ti-analytics.bb       |  2 +-
>   .../recipes-core/packagegroups/ti-demos.bb           |  2 +-
>   .../recipes-core/packagegroups/ti-world.bb           | 10 +++++-----
>   .../recipes-graphics/cairo/cairo_%.bbappend          |  3 ---
>   .../gstreamer/gstreamer1.0-plugins-%.bbappend        |  6 ------
>   .../matrix/matrix-gui-machinevision-demos_2.0.bb     |  2 +-
>   .../matrix/matrix-gui-video-analytics-demos_2.0.bb   |  2 +-
>   .../recipes-core/matrix/matrix-gui_2.0.bb            |  2 +-
>   26 files changed, 41 insertions(+), 66 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
>   delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-%.bbappend
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index d675b077..fde30cfe 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -82,7 +82,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
>   DISTRO_FEATURES:remove = "x11"
>   
>   # Add additional distro features
> -DISTRO_FEATURES:append = " pam wayland opengl"
> +DISTRO_FEATURES:append = " pam wayland opengl powervr-sgx-graphics powervr-rogue-graphics"
>   #DISTRO_FEATURES:append = " opencl"
>   DISTRO_FEATURES:append = " opencv"
>   DISTRO_FEATURES:append = " openmp"
> diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc b/meta-arago-distro/conf/distro/include/branding-mainline.inc
> index 2fc9dc5f..2e6198d3 100644
> --- a/meta-arago-distro/conf/distro/include/branding-mainline.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
> @@ -3,5 +3,5 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-mainline"
>   PREFERRED_PROVIDER_u-boot = "u-boot-ti-mainline"
>   SRCREV_ti-upstream-tools:pn-linux-ti-mainline = "${AUTOREV}"
>   
> -# GPU support requires out-of-tree SGX and RGX drivers not available in mainline
> -MACHINE_FEATURES:remove = "gpu"
> +# GPU support requires out-of-tree SGX and RGX rivers not available in mainline

s/rivers/drivers

> +DISTRO_FEATURES:remove = "powervr-sgx-graphics powervr-rogue-graphics"

This should be MACHINE_FEATURES and be moved out of meta-arago and down
into the meta-ti layer where we define the mainline kernel if we can.

If mainline kernel is selected, then we should fallback to regular mesa/swrast.
This way the distro does not have to concern itself which what kernel
supports what GPU.

All the rest of the DISTRO_FEATURES/opengl stuff in this patch looks good to me.

Andrew

