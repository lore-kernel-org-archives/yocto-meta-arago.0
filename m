Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F18EC7EE2F
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 22:31:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.636.1686090682981377098
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 15:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 35D5D40C2C;
	Tue,  6 Jun 2023 22:31:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqINi-rFmiuo; Tue,  6 Jun 2023 22:31:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D651040AE9;
	Tue,  6 Jun 2023 22:31:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8301816394F; Tue,  6 Jun 2023 18:30:27 -0400 (EDT)
Date: Tue, 6 Jun 2023 18:30:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	khasim@ti.com, c-shilwant@ti.com, s-adivi@ti.com, g-gupta@ti.com
Subject: Re: [meta-arago] [kirkstone][PATCH v2] meta-arago-distro: Add
 recipe for jailhouse image and update kernel and u-boot repo for jailhouse
 build.
Message-ID: <20230606223027.GU9226@denix.org>
References: <20230606140237.178008-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606140237.178008-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 22:31:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14505

On Tue, Jun 06, 2023 at 07:32:37PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
> Add a recipe to build and package jailhouse image for am62xx-evm. new image will
> be named as tisdk-jailhouse-image. jailhouse recipe will also package overlay
> used for jailhouse.
> 
> Add functionality to change kernel and u-boot source via MACHINE_FEATURES for
> jailhouse. so if MACHINE_FEATURES:append = " jailhouse" is added to local.conf
> different recipe for kernel (linux-ti-extras) and u-boot (u-boot-ti-extras) will
> be used.
> 
> So for jailhouse build for am62xx-evm user will have to add
> MACHINE_FEATURES:append = " jailhouse" to local.conf and then start a jailhouse
> build with MACHINE=am62xx-evm bitbake -k tisdk-jailhouse-image.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |  7 +++++++
>  .../recipes-core/images/tisdk-jailhouse-image.bb   | 14 ++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 34c3c539..40269b56 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -19,3 +19,10 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
>  #PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
>  #PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
>  #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
> +
> +# change kernel when jailhouse image is build
> +PREFERRED_PROVIDER_virtual/kernel = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','linux-ti-extras','linux-ti-staging',d)}"
> +
> +#Change uboot source when jailhouse image is build
> +PREFERRED_PROVIDER_virtual/bootloader = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','u-boot-ti-extras','u-boot-ti-staging',d)}"
> +PREFERRED_PROVIDER_u-boot = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','u-boot-ti-extras','u-boot-ti-staging',d)}"

This would conflict with all the other places PREFERRED_PROVIDERs are being 
set. In other words, if "jailhouse" in MACHINE_FEATURES is not set, you are 
forcing everyone into "ti-staging" trees, which is not always the case!
What about "bb.org" trees, or "next", or "mainline" or any downstream ones?


> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> new file mode 100644
> index 00000000..af880d30
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> @@ -0,0 +1,14 @@
> +# Produces wic image for jailhouse
> +
> +require recipes-core/images/tisdk-default-image.bb
> +
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
> +IMAGE_INSTALL:append:am62xx-evm = " jailhouse"
> +
> +# Package overlay for jailhouse
> +KERNEL_DEVICETREE:append:am62xx-evm = " ti/k3-am625-base-board-jailhouse.dtbo"
> +
> +export IMAGE_BASENAME = "tisdk-jailhouse-image"
> +
> +WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
> -- 
> 2.34.1

