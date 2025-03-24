Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B7FC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:53:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.44671.1742835201119204202
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 09:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 388F540BD4;
	Mon, 24 Mar 2025 16:53:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VQV5WWe3oWH; Mon, 24 Mar 2025 16:53:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0DCD140A46;
	Mon, 24 Mar 2025 16:53:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7107C1643B6; Mon, 24 Mar 2025 12:53:16 -0400 (EDT)
Date: Mon, 24 Mar 2025 12:53:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] meta-arago-demos: layer.conf:
 Remove SIGGEN_EXCLUDERECIPES_ABISAFE
Message-ID: <20250324165316.GS23729@denix.org>
References: <20250320181225.6028-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320181225.6028-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Mar 2025 16:53:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16147

Is it meta-arago-demos as in Subject or meta-arago-distro as in the patch?


On Thu, Mar 20, 2025 at 01:12:25PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Remove the setting of SIGGEN_EXCLUDERECIPES_ABISAFE as it is no longer needed.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/conf/layer.conf | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 0bbf9a4e..40629794 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -39,11 +39,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>      weston-init->kbd \
>  "
>  
> -SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> -    udev \
> -    eudev \
> -    weston-conf \
> -    cryptodev-module \
> -"
> -
>  HOSTTOOLS_NONFATAL += "corkscrew getent socket"
> -- 
> 2.17.1

