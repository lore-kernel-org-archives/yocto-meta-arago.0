Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1515ACDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 05:42:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21230.1697694173102644235
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 22:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 691AC40D75;
	Thu, 19 Oct 2023 05:42:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CScHq8z7UqPa; Thu, 19 Oct 2023 05:42:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2BB3D40D19;
	Thu, 19 Oct 2023 05:42:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CB36C163D0B; Thu, 19 Oct 2023 01:42:42 -0400 (EDT)
Date: Thu, 19 Oct 2023 01:42:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	c-shilwant@ti.com, a-limaye@ti.com, g-gupta@ti.com, khasim@ti.com,
	p-bhagat@ti.com
Subject: Re: [meta-arago][kirkstone][PATCH] tisdk-default-image: Add Matrix
 GUI only for legacy platforms
Message-ID: <20231019054242.GN2408@denix.org>
References: <20231019051056.2055622-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019051056.2055622-1-s-adivi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Oct 2023 05:42:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14954

On Thu, Oct 19, 2023 at 10:40:56AM +0530, Sai Sree Kartheek Adivi wrote:
> Today, only ti33x and ti43x family platforms ship matrix-gui in the SDK.
> It is removed for all other platforms in SDK layers. So add it only for
> required platforms.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../recipes-core/images/tisdk-default-image.bb       | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 787fac95..2c7b2f0c 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -24,8 +24,6 @@ IMAGE_INSTALL += "\
>      ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
>      packagegroup-arago-tisdk-connectivity \
>      packagegroup-arago-tisdk-crypto \
> -    packagegroup-arago-tisdk-matrix \
> -    packagegroup-arago-tisdk-matrix-extra \
>      packagegroup-arago-tisdk-multimedia \
>      packagegroup-arago-tisdk-addons \
>      packagegroup-arago-tisdk-addons-extra \
> @@ -36,6 +34,16 @@ IMAGE_INSTALL += "\
>      packagegroup-arago-tisdk-sysrepo \
>  "
>  
> +IMAGE_INSTALL:append:ti33x = " \
> +    packagegroup-arago-tisdk-matrix \
> +    packagegroup-arago-tisdk-matrix-extra \
> +"
> +
> +IMAGE_INSTALL:append:ti43x = " \
> +    packagegroup-arago-tisdk-matrix \
> +    packagegroup-arago-tisdk-matrix-extra \
> +"

Instead of appending directly to IMAGE_INSTALL, it's better to use an indirect 
variable. Take a look how it's done with CHROMIUM variable in the same recipe.


>  export IMAGE_BASENAME = "tisdk-default-image"
>  
>  # Disable ubi/ubifs as the filesystem requires more space than is
> -- 
> 2.34.1

