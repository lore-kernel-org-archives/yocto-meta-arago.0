Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A711EB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 19:48:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7847.1686944919525685058
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 12:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5D40840A3D;
	Fri, 16 Jun 2023 19:48:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWoaCHFW2ARq; Fri, 16 Jun 2023 19:48:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B8F6409AE;
	Fri, 16 Jun 2023 19:48:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 32780163AF5; Fri, 16 Jun 2023 15:48:34 -0400 (EDT)
Date: Fri, 16 Jun 2023 15:48:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, g-gupta@ti.com
Subject: Re: [oe-layersetup PATCH] configs: Update Kirkstone config for
 sysrepo
Message-ID: <20230616194834.GG1518@denix.org>
References: <20230616084538.10530-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616084538.10530-1-r-gunasekaran@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jun 2023 19:48:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14645

On Fri, Jun 16, 2023 at 02:15:38PM +0530, Ravi Gunasekaran wrote:
> NETCONF/YANG is implemented through netopeer2/sysrepo.
> A Yocto project for sysrepo is available in public domain[1].
> 
> [1] is compatible only with Yocto Honister branch. So update
> the config with [2] which is fork of [1] for Kirkstone.
> 
> [1] - https://github.com/sartura/meta-sysrepo
> [2] - https://github.com/ravig07/meta-sysrepo

So, you are bumping many of the recipes in that layer, plus updating to the 
new override syntax and setting compatibility with kirkstone. The PR has been 
setting open since May 4 w/o any comments, so it's probably safe to assume the 
layer is abandoned. Why not move the recipes to an active layer? At least to 
meta-arago, or even better work on upstreaming them to meta-openembedded?

Regardless, the changes for kirkstone appear to be safe to langdale and 
mickledore - that would allow including the change in master builds too.


> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
> I have sent a Pull Request for [2]. Once it gets merged, then the URI
> in the config.txt can be replaced with it.
> 
>  configs/arago-kirkstone-config.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
> index c2524a4..e80ab80 100644
> --- a/configs/arago-kirkstone-config.txt
> +++ b/configs/arago-kirkstone-config.txt
> @@ -10,6 +10,7 @@ meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,
>  meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
>  meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
>  oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
> +meta-sysrepo,https://github.com/ravig07/meta-sysrepo,kirkstone,HEAD,layers=
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>  OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
>  BITBAKE_INCLUSIVE_VARS=yes
> -- 
> 2.17.1

