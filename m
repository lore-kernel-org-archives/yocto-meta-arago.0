Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2E7C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:18:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.651.1651007918876931143
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 964A340C24;
	Tue, 26 Apr 2022 21:18:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZGTxa-1HvQT; Tue, 26 Apr 2022 21:18:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 73DD040A03;
	Tue, 26 Apr 2022 21:18:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 367B51748E1; Tue, 26 Apr 2022 17:18:34 -0400 (EDT)
Date: Tue, 26 Apr 2022 17:18:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup PATCH 6/6] Build Poky using
 meta-yocto instead of combined poky repo
Message-ID: <20220426211834.GG9834@denix.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-6-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426200251.19417-6-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:18:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13807

On Tue, Apr 26, 2022 at 03:02:51PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> The Poky repo contains meta-yocto plus extra bits needed for an
> all-in-one build, but since we already pull in tools with this
> script like bitbake and oe-core, lets use those and save some
> space/bandwidth.

There are other nuances of "flattened" Poky repo (commits are different, 
plus some other minor bits and pieces). The only overhead is to clone Bitbake 
twice (not OE-Core), which is neglectable and allows building the true Poky, 
instead of OE-Core + meta-yocto/meta-poky... :)


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  configs/poky-master-config.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
> index b395ff8..a541501 100644
> --- a/configs/poky-master-config.txt
> +++ b/configs/poky-master-config.txt
> @@ -1,8 +1,10 @@
>  # This file takes repo entries in the format
>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
>  bitbake,git://git.openembedded.org/bitbake,master,HEAD
> -poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> +meta-yocto,git://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
>  meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>  meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>  OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
> -- 
> 2.17.1

