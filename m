Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E109BC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 16:33:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.49868.1674664410233447799
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 08:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HiZdHAZG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PGXTUm027211
	for <meta-arago@lists.yoctoproject.org>; Wed, 25 Jan 2023 10:33:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674664409;
	bh=4t4E+ufSGuI0zw+My8Gdw56Dtj32D4t3gnhhRDMBVak=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HiZdHAZGKPfM6kqgde5Glr06psJpKdly+EBhee1WM6lyvPVRhwJUkAJPXc0kc5dHp
	 TVNJ5VSLGz1Iryo4ls9DDB313to9CL/07x5zF7hEkZ6ho3W+sS4Lx2D4UU1r00qyMY
	 MZsotiWSxS49I+XpitY2QR/IKm9OYAa1or4NmnLc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PGXTKD055404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 25 Jan 2023 10:33:29 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 10:33:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 10:33:28 -0600
Received: from [10.250.32.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PGXRf9120353;
	Wed, 25 Jan 2023 10:33:28 -0600
Message-ID: <36cee5a5-3b57-646f-086e-5f7e53197281@ti.com>
Date: Wed, 25 Jan 2023 10:33:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arago] [PATCH] all: Remove excessive switches based on gpu
Content-Language: en-US
To: <rs@ti.com>, <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230124231733.2219206-1-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230124231733.2219206-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Jan 2023 16:33:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14185

On 1/24/23 5:17 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> Everything that previously switched using the GPU machine feature should
> instead switch based on the opengl distro feature to allow for software
> rendering.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> This is the part of my previous graphics overhaul patch that's not
> dependent on my changes to meta-ti. Should be able to merge this without
> any issue while I'm working on the other stuff.
> 
> Relates-to: LCPD-27817
> 
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
>   23 files changed, 37 insertions(+), 62 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
>   delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> index 9da4b0d0..c7bd9629 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> @@ -31,8 +31,8 @@ DTB_FILTER:j721s2 = "j721s2"
>   # List of target side images to build for the SDK
>   TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image tisdk-bootstrap-image"
>   
> -TISDK_TOOLCHAIN = "${@bb.utils.contains('MACHINE_FEATURES','gpu','meta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
> -TOOLCHAIN_SUFFIX = "${@bb.utils.contains('MACHINE_FEATURES','gpu','-tisdk','-tisdk-server',d)}"
> +TISDK_TOOLCHAIN = "${@bb.utils.contains('DISTRO_FEATURES','opengl','meta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
> +TOOLCHAIN_SUFFIX = "${@bb.utils.contains('DISTRO_FEATURES','opengl','-tisdk','-tisdk-server',d)}"
>   
>   IMAGE_INSTALL = "\
>       packagegroup-arago-tisdk-amsdk-sdk-host \
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 8cd10429..ffe78ec9 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -5,16 +5,14 @@ DESCRIPTION = "Complete Arago TI SDK filesystem image containing complete\
>   
>   require arago-image.inc
>   
> -SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
> -

Looks like we forgot to add "SPLASH" to the list below, if we ever want to
add this back it should depend on MACHINE_FEATURES "screen".

[snip]

>   "
>   
> -#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','gpu',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
> +#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('DISTRO_FEATURES','opengl',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
>   #                                \

note to self: we can probably now combine the "and" since they are both
checking DISTRO_FEATURES now. Couple more spots below we could do similar.

[snip]

> diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> deleted file mode 100644
> index 1de9aebb..00000000
> --- a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -PR:append = ".arago1"
> -
> -PACKAGECONFIG:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl glesv2', '', d)}"

I think we need to keep this, but it can be unconditional, if you need cairo on our plats
you probably want 'egl glesv2'. We can do that in arago.conf with the other PACKAGECONFIGs.

It's not perfect but I see no real problem with this patch, it should be taken promptly
so we can quickly begin to iterate towards a complete solution from this base.

Acked-by: Andrew Davis <afd@ti.com>

