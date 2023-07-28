Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C369EB64DD
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 21:09:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.43021.1690578568313560720
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 14:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A0ED40C98;
	Fri, 28 Jul 2023 21:09:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCFSzMEYC-qs; Fri, 28 Jul 2023 21:09:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3939940C8A;
	Fri, 28 Jul 2023 21:09:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5104D163C11; Fri, 28 Jul 2023 17:09:22 -0400 (EDT)
Date: Fri, 28 Jul 2023 17:09:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, afd@ti.com, nm@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCH 4/5]
 packagegroup-arago-boot: add a new group for all-around useful packages
Message-ID: <20230728210922.GU1518@denix.org>
References: <20230728002032.853330-1-rs@ti.com>
 <20230728002032.853330-5-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728002032.853330-5-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jul 2023 21:09:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14814

"boot" packagegroup is usually used to list mandatory components required to 
boot the target.

"base" is where you list a minimal set of additional components that are often 
useful, but the target can still boot without.

And one can argue that performance util like irqbalance doesn't fit either of 
the above. While is probably fine to be included in all default images except 
tiny. Come to think of it, "addons" was a perfect place for it...


On Thu, Jul 27, 2023 at 07:20:31PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add a new package group for performance or QoL tools that all images
> should inherit and add the first example of a package that should belong
> here.
> 
> Irqbalance is a good example. It helps reduce irq response delays on
> most if not all of our platforms and is only problematic for users
> attempting to reduce jitter specifically through the use of irq pinning,
> in which case it can be easily disabled.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../recipes-core/images/arago-image.inc         |  1 +
>  .../packagegroups/packagegroup-arago-boot.bb    | 17 +++++++++++++++++
>  .../packagegroup-arago-tisdk-addons.bb          |  1 -
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index d00c1f70..0421dca3 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -11,6 +11,7 @@ EXTRA_IMAGECMD:ext2.gz += "-i 4096"
>  
>  IMAGE_INSTALL = " \
>  	packagegroup-core-boot \
> +	packagegroup-arago-boot \
>  	${VIRTUAL-RUNTIME_initramfs} \
>  	${CORE_IMAGE_EXTRA_INSTALL} \
>  "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb
> new file mode 100644
> index 00000000..c9b87a45
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boot.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Tools or utilities that all images should inherit"
> +DESCRIPTION = "These are packages that lead to general performance or QoL improvements on our platforms that should be inherited by all images. The idea is to keep this group as small as possible moving forward for compatibility with things like the tisdk-tiny-image build target."
> +LICENSE = "MIT"
> +PR = "r0"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +# packages that lead to general performance improvements
> +PERFORMANCE_UTILS = " \
> +    irqbalance \
> +"
> +
> +RDEPENDS:${PN} = "\
> +    ${PERFORMANCE_UTILS} \
> +"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index c678460d..a9b71fd1 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -50,7 +50,6 @@ UTILS:append:omap-a15 = " mmc-utils \
>  
>  UTILS:append:k3 = " mmc-utils \
>                      switch-config \
> -                    irqbalance \
>                      ti-rpmsg-char \
>                      ti-rpmsg-char-examples \
>                      statcol \
> -- 
> 2.41.0

