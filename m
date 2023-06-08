Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1007AC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 21:56:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6655.1686261359987904351
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 14:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 313CB40C62;
	Thu,  8 Jun 2023 21:55:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYusbqbGkMIa; Thu,  8 Jun 2023 21:55:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D004840AE9;
	Thu,  8 Jun 2023 21:55:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 000D01639CE; Thu,  8 Jun 2023 17:55:03 -0400 (EDT)
Date: Thu, 8 Jun 2023 17:55:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	khasim@ti.com, c-shilwant@ti.com, s-adivi@ti.com, g-gupta@ti.com
Subject: Re: [meta-arago] [kirkstone][PATCH v3] meta-arago-distro: Add
 recipe for jailhouse image and new branding processor-sdk-extras
Message-ID: <20230608215503.GG9226@denix.org>
References: <20230608164958.357880-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608164958.357880-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 21:56:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14563

On Thu, Jun 08, 2023 at 10:19:58PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
> Add a recipe to build and package jailhouse image for am62xx-evm. new
> image will be named as tisdk-jailhouse-image. jailhouse recipe will
> also package overlay used for jailhouse.
> 
> Add a new branding processor-sdk-extras to change preferred_providers for
> uboot and kernel to u-boot-ti-extras and ti-linux-extras. For jailhouse build
> for am62xx-evm, user will have to add ARAGO_BRAND = "processor-sdk-extras" to
> change preferred_providers and MACHINE_FEATURES:append = " jailhouse" to
> switch to jailhouse branches to local.conf. And then start a jailhouse build
> with MACHINE=am62xx-evm bitbake -k tisdk-jailhouse-image.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../include/branding-processor-sdk-extras.inc      |  5 +++++
>  .../recipes-core/images/tisdk-jailhouse-image.bb   | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk-extras.inc
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk-extras.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk-extras.inc
> new file mode 100644
> index 00000000..a9d9f5be
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk-extras.inc
> @@ -0,0 +1,5 @@
> +PREFERRED_PROVIDER_virtual/kernel = "linux-ti-extras"
> +
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-extras"
> +
> +PREFERRED_PROVIDER_u-boot = "u-boot-ti-extras"
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

This won't get packaged into kernel-devicetree from here.


> +export IMAGE_BASENAME = "tisdk-jailhouse-image"
> +
> +WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
> -- 
> 2.34.1
> 

