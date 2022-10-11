Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DFAC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 19:26:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.11973.1665516373657930337
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 12:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 21DB740D58;
	Tue, 11 Oct 2022 19:26:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Qz_S7Wrp566; Tue, 11 Oct 2022 19:26:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF4E640D1F;
	Tue, 11 Oct 2022 19:26:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E0F54174A1B; Tue, 11 Oct 2022 15:26:08 -0400 (EDT)
Date: Tue, 11 Oct 2022 15:26:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v2] meta-arago: Use new
 J7 SoC names over specific board names
Message-ID: <20221011192608.GD22689@denix.org>
References: <20221011175804.27214-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011175804.27214-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 19:26:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14080

On Tue, Oct 11, 2022 at 12:58:04PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Now that we have SoC names, we can avoid adding features based on the
> board name. We expect folks to create their own boards based on these
> SoCs, and so using the TI made EVM board name everywhere adds extra churn
> when adding a new board. Plus it is more correct for most of these
> features as they depend on the SoC, not on the EVM board.
> 
> One other thing we do here is to not use the generic "j7" name,
> the current and future J7 devices are far to feature diverse
> to group at this level. Grouping like that will lead to the wrong
> things getting enabled as new J7 SoCs are added.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> 
> Changes from v1:
>  - Dropped ti-analytics.bb change
>  - Reworked ti-test.bb change to only include J721e
> 
>  meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb  | 3 +--
>  meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 4 +++-
>  .../packagegroup-arago-tisdk-addons-sdk-host.bb             | 6 +-----
>  meta-arago-distro/recipes-core/packagegroups/ti-test.bb     | 2 +-
>  .../ti-tisdk-makefile/Makefile_sysfw-image                  | 6 ++----
>  .../gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend      | 6 +-----
>  6 files changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> index ec4e0344..b49548a6 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
> @@ -12,8 +12,7 @@ DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
>  
>  DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin"
>  DEPLOY_IMAGES_NAME:append:am65xx = " sysfw.itb"
> -DEPLOY_IMAGES_NAME:append:j721e-evm = " sysfw.itb"
> -DEPLOY_IMAGES_NAME:append:j721e-hs-evm = " sysfw.itb"
> +DEPLOY_IMAGES_NAME:append:j721e = " sysfw.itb"
>  DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
>  
>  ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> index 3c31ba18..296eef7a 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> @@ -24,7 +24,9 @@ DTB_FILTER:am57xx-hs-evm = "${DTB_FILTER:am57xx-evm}"
>  DTB_FILTER:ti43x = "am43"
>  DTB_FILTER:omapl138 = "da850"
>  DTB_FILTER:am65xx = "am65"
> -DTB_FILTER:j7 = "j721e"
> +DTB_FILTER:j721e = "j721e"
> +DTB_FILTER:j7200 = "j7200"
> +DTB_FILTER:j721s2 = "j721s2"
>  
>  # List of target side images to build for the SDK
>  TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image tisdk-bootstrap-image"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index d79d2756..78fa44bc 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -37,11 +37,7 @@ UTILS:append:k3 = " \
>      trusted-firmware-a-source \
>  "
>  
> -UTILS:append:j721e-evm = " \
> -    pru-icss-source \
> -"
> -
> -UTILS:append:j721e-hs-evm = " \
> +UTILS:append:j721e = " \
>      pru-icss-source \
>  "
>  
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> index 3e76a527..2934827a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> @@ -80,7 +80,7 @@ ARAGO_TI_TEST:append:k3 = " \
>      k3conf \
>  "
>  
> -ARAGO_TI_TEST:append:j7 = " \
> +ARAGO_TI_TEST:append:j721e = " \
>      ufs-utils \
>  "
>  
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> index cee03bc2..09918cbc 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
> @@ -7,10 +7,8 @@ PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
>  SYSFW_CONFIG = evm
>  
>  SYSFW_SOC_$(PLATFORM) = NULL
> -SYSFW_SOC_am65xx-evm = am65x
> -SYSFW_SOC_am65xx-hs-evm = am65x
> -SYSFW_SOC_j721e-evm = j721e
> -SYSFW_SOC_j721e-hs-evm = j721e
> +SYSFW_SOC_am65xx = am65x
> +SYSFW_SOC_j721e = j721e
>  SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
>  
>  SYSFW_PREFIX = ti-sci-firmware
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
> index de9f1c7d..5cc57460 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
> @@ -28,11 +28,7 @@ SRC_URI:append:am65xx = " \
>      ${GSTDRM_WAYLANDSINK_PATCHES} \
>  "
>  
> -SRC_URI:append:j721e-evm = " \
> -    ${GSTDRM_WAYLANDSINK_PATCHES} \
> -"
> -
> -SRC_URI:append:j721e-hs-evm = " \
> +SRC_URI:append:j721e = " \
>      ${GSTDRM_WAYLANDSINK_PATCHES} \
>  "
>  
> -- 
> 2.37.3

