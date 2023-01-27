Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF33C61DA4
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 20:20:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.113200.1674850843980693606
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 12:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Xnzfkh6y;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30RKKgJf053636
	for <meta-arago@lists.yoctoproject.org>; Fri, 27 Jan 2023 14:20:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674850842;
	bh=KKku1QFfLCHNJHfuQm5zWM/1oUIN33j8akBnDwO5pBU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Xnzfkh6yuIKEpAkIktj8mBamSS5kBNNppBRCa/A3j7aeWP44iEB/cQ5Itw7C1is13
	 qFFA0DCnf6RWPppjLCPyC+zl3UmFSwupmPMiBmw07gcVuhLtwTu6gxkoonADbnMGeH
	 wDLJW0VJmuNeDRuKbak6E3TF7yt/4lNPpWIM4wyk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30RKKgK2017103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 27 Jan 2023 14:20:42 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 27
 Jan 2023 14:20:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 27 Jan 2023 14:20:42 -0600
Received: from [10.250.36.129] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30RKKgrS003395;
	Fri, 27 Jan 2023 14:20:42 -0600
Message-ID: <7f2cbb14-159b-46c0-5fc1-401cbe2833a8@ti.com>
Date: Fri, 27 Jan 2023 14:20:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] all: Remove excessive switches based on gpu
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, <denys@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230124231733.2219206-1-rs@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230124231733.2219206-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Jan 2023 20:20:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14195



On 1/24/2023 17:17, Randolph Sapp wrote:
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

*snip*


> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 3d9ebdf3..25b7fccd 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -65,7 +65,7 @@ MATRIX_QT_APPS:append:ti43x = " \
>   "
>   
>   MATRIX_TOUCH_APPS = " \
> -    ${@bb.utils.contains('MACHINE_FEATURES','gpu','matrix-gui-touch-demos','',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','matrix-gui-touch-demos','',d)} \
>   "
>   
>   MATRIX_GPU_DEMOS = " \
> @@ -151,7 +151,7 @@ MATRIX_APPS:append:omap-a15 = "     \
>       matrix-gui-pm-demos-governor    \
>   "
>   
> -#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','gpu',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
> +#    ${@['','matrix-gui-browser-demos'][bb.utils.contains('DISTRO_FEATURES','opengl',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
>   #                                \
>   #
>   
> @@ -184,9 +184,9 @@ RDEPENDS:${PN} = "        \
>       ${MATRIX_APPS}        \
>       ${MATRIX_COMMON_APPS} \
>       ${@bb.utils.contains('MACHINE_FEATURES','touchscreen',"${MATRIX_TOUCH_APPS}",'',d)} \
> -    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GUI}",'',d)} \
> -    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_QT_APPS}",'',d)} \
> -    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GPU_DEMOS}",'',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_GUI}",'',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_QT_APPS}",'',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${MATRIX_GPU_DEMOS}",'',d)} \
>       ${@['',"${MATRIX_OPENCL_APPS}"][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
>   "

This change appears to break for omapl138.  I think it is because that 
platform did not define gpu, but moving to the DISTRO_FEATURE of opengl 
tries to require whatever is in MATRIX_GPU_DEMOS.

But in matrix-gui-3d-demos_2.0.bb the one path through the settings that 
does not provide the kmscube demo is omapl138.

How do we want to handle this?





-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

