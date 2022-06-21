Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE2CC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 15:50:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.45267.1655826650577533087
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 08:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9996F40BE6;
	Tue, 21 Jun 2022 15:50:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuGbrrEtyPFu; Tue, 21 Jun 2022 15:50:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7A60740B86;
	Tue, 21 Jun 2022 15:50:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 92B5A17497E; Tue, 21 Jun 2022 11:50:47 -0400 (EDT)
Date: Tue, 21 Jun 2022 11:50:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][dunfell/master][PATCH] tisdk-bundle: fix
 prebuilt-images U-Boot binary name for HS
Message-ID: <20220621155047.GA9834@denix.org>
References: <20220621153900.27066-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621153900.27066-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jun 2022 15:50:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13913

On Tue, Jun 21, 2022 at 10:39:00AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> HS builds do not generate a -${MACHINE} version of the u-boot.img binary.
> Not sure why we deploy these named this way to begin with, maybe a left-
> over from when we had multiple machines per SDK.. To fix the HS builds
> lets ship the binary named as-is for all platforms.

This could potentially mess up with the way Processor SDK (installer, setup 
scripts, etc.) expects U-boot binary to be called. I.e. the stuff outside of 
CoreSDK and the Yocto build... But I'm not sure, just speculating here.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-bundle.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> index 7e3f4c26..9e961e1b 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -777,9 +777,9 @@ tisdk_image_build () {
>      fi
>  
>      # Copy the U-Boot image if it exists
> -    if [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img ]
> +    if [ -e ${DEPLOY_DIR_IMAGE}/u-boot.img ]
>      then
> -        cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img ${prebuilt_dir}/
> +        cp ${DEPLOY_DIR_IMAGE}/u-boot.img ${prebuilt_dir}/
>      elif [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ]
>      then
>          cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ${prebuilt_dir}/
> -- 
> 2.36.1

