Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D204CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 17:05:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.636.1761152704210764929
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 10:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F8CC40C3E;
	Wed, 22 Oct 2025 17:05:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45oJJ3x5XFHP; Wed, 22 Oct 2025 17:05:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E7FE40BEC;
	Wed, 22 Oct 2025 17:04:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7F20116C1A0; Wed, 22 Oct 2025 13:04:58 -0400 (EDT)
Date: Wed, 22 Oct 2025 13:04:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org, praneeth@ti.com,
	s-jain1@ti.com
Subject: Re: [meta-arago][scarthgap][PATCH 2/2] weston-init-arago: add
 weston-init to the rprovides
Message-ID: <20251022170458.GX3125@denix.org>
References: <20251001183102.357345-1-rs@ti.com>
 <20251001183102.357345-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001183102.357345-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Oct 2025 17:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16696

On Wed, Oct 01, 2025 at 01:31:02PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> I made this conflict with the core version of weston-init, but I forgot
> to say it's actually a runtime provider of the same package to resolve
> any issues with core package groups.
> 
> Fixes: d63830cd ("weston-init: weston-init -> weston-init-arago")
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
> index 033c32f1..395e996e 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
> @@ -65,7 +65,7 @@ FILES:${PN} += "\
>      "
>  
>  CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
> -RPROVIDES:${PN}:append = " virtual-emptty-conf"
> +RPROVIDES:${PN}:append = " virtual-emptty-conf weston-init"

Now you also need an extra PREFERRED_RPROVIDER:

NOTE: Multiple providers are available for runtime weston-init (weston-init, weston-init-arago)
Consider defining a PREFERRED_RPROVIDER entry to match weston-init


>  RCONFLICTS:${PN} += "weston-init"
>  
>  USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,nopasswdlogin weston"
> -- 
> 2.51.0
> 

