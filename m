Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24362C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:44:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2170.1698767080162166632
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 08:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 361B440C2A;
	Tue, 31 Oct 2023 15:44:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9AxyKqb5JYh; Tue, 31 Oct 2023 15:44:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD21440C24;
	Tue, 31 Oct 2023 15:44:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E3E1E163D2C; Tue, 31 Oct 2023 11:44:34 -0400 (EDT)
Date: Tue, 31 Oct 2023 11:44:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-sw-manifest:
 Add code to not fail on tar error
Message-ID: <20231031154434.GF2408@denix.org>
References: <20231031140433.14899-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031140433.14899-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 31 Oct 2023 15:44:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14979

On Tue, Oct 31, 2023 at 09:04:32AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> We want to add an image into the core bundle, but that image does not
> have any opkg .control files.  tar apparently errors out if you ask it
> to extract out files but the files are not in the archive, and the
> recipes are setup that if any of the commands in the shell error out,
> then the entire recipe fails.
> 
> Simple fix, add an || (or) condition to the tar command to print a
> message that there were not any control files instead of erroring out.

So, simply bypassing tar error due to missing *.control files still won't 
enable you to properly generate the SW manifest. As those *.control files 
from individual packages are parsed to extract the license information. 
And they are missing because tiny image specifically disables "package 
management" to save on space. Therefore tiny image was not included in 
the bundle, since it doesn't generate the SW manifest.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> index 14d14f08..b9c63610 100644
> --- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> +++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> @@ -405,10 +405,10 @@ sw_manifest_target() {
>          # Only extract tar.gz or tar.bz2 types
>          if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
>          then
> -            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
> +            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No control files found in ${image}"
>          elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
>          then
> -            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
> +            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control || echo "No control files found in ${image}"
>          fi
>      done
>  
> -- 
> 2.17.1

