Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F664C0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 21:20:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.43216.1690579230927877099
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 14:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 327E240C98;
	Fri, 28 Jul 2023 21:20:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6Rqt3lVQofk; Fri, 28 Jul 2023 21:20:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6EAE40C13;
	Fri, 28 Jul 2023 21:20:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A7BB9163C11; Fri, 28 Jul 2023 17:20:25 -0400 (EDT)
Date: Fri, 28 Jul 2023 17:20:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, afd@ti.com, nm@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCH 5/5] arago-tiny-image:
 add packagegroup-arago-boot to IMAGE_INSTALL
Message-ID: <20230728212025.GV1518@denix.org>
References: <20230728002032.853330-1-rs@ti.com>
 <20230728002032.853330-6-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728002032.853330-6-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jul 2023 21:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14815

On Thu, Jul 27, 2023 at 07:20:32PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> This image install override is interesting. Perhaps we should move to
> the separate build target distro configs like pokey uses [1] to avoid

What's "pokey"? It's Poky - https://elinux.org/Poky


> configuration collisions while still allowing for some base image
> templating through include files like arago-image.inc
> 
> [1] https://git.yoctoproject.org/poky/tree/meta-poky/conf/distro/poky-tiny.conf?h=kirkstone

Either way, the above commit log doesn't seem to have anything to do with the 
actual change...


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/arago-tiny-image.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> index 242e763c..77ee9ea2 100644
> --- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> @@ -6,4 +6,5 @@ IMAGE_FEATURES:remove = "splash"
>  
>  IMAGE_INSTALL = " \
>  	packagegroup-arago-sysvinit-boot \
> +	packagegroup-arago-boot \

This include file is shared among tiny and bootstrap images. While addind 
irqbalance and/or other tools might be useful for bootstrapping (?) it is not 
so clear for the tiny image. It was meant to be the very bare minimum and also 
used as initramfs and jailhouse cells.

