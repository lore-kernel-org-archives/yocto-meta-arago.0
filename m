Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10563E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:32:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20779.1733333527853728876
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 09:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5264D40A2F;
	Wed,  4 Dec 2024 17:32:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GpN2LYzk7Av; Wed,  4 Dec 2024 17:32:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D82F40023;
	Wed,  4 Dec 2024 17:32:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ED7BB1640F2; Wed,  4 Dec 2024 12:32:04 -0500 (EST)
Date: Wed, 4 Dec 2024 12:32:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-arago][master][PATCH] conf: layer.conf: Drop scarthgap
 from LAYERSERIES_COMPAT
Message-ID: <20241204173202.GB23825@denix.org>
References: <20241204151009.3427132-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204151009.3427132-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Dec 2024 17:32:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15641

On Wed, Dec 04, 2024 at 08:40:09PM +0530, Chirag Shilwant wrote:
> After scarthgap release, oe-core switched to use UNPACKDIR instead
> of WORKDIR [1]. Post this change, meta-arago updated all references of
> WORKDIR to UNPACKDIR in master branch.
> 
> Since, UNPACKDIR changes aren't backported to oe-core:scarthgap, we need to
> drop it from LAYERSERIES_COMPAT in meta-arago.
> 
> [1]: https://git.openembedded.org/openembedded-core/commit/?id=e022d62ba917790af2121da57646271ef17c03fa
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arago-demos/conf/layer.conf  | 2 +-
>  meta-arago-distro/conf/layer.conf | 2 +-
>  meta-arago-extras/conf/layer.conf | 2 +-
>  meta-arago-test/conf/layer.conf   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/layer.conf
> index 782c5914..df774b74 100644
> --- a/meta-arago-demos/conf/layer.conf
> +++ b/meta-arago-demos/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-demos"
>  BBFILE_PATTERN_meta-arago-demos := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-demos = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-demos = "scarthgap styhead walnascar"
> +LAYERSERIES_COMPAT_meta-arago-demos = "styhead walnascar"
>  
>  LAYERDEPENDS_meta-arago-demos = " \
>      core \
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index e6e3817f..d097afa0 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>  BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-distro = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-distro = "scarthgap styhead walnascar"
> +LAYERSERIES_COMPAT_meta-arago-distro = "styhead walnascar"
>  
>  LAYERDEPENDS_meta-arago-distro = " \
>      core \
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index b7390e44..7f976657 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
>  BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-extras = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-extras = "scarthgap styhead walnascar"
> +LAYERSERIES_COMPAT_meta-arago-extras = "styhead walnascar"
>  
>  # Set a variable to get to the top of the metadata location
>  ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
> diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
> index da73fb05..1e94c30d 100644
> --- a/meta-arago-test/conf/layer.conf
> +++ b/meta-arago-test/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-test"
>  BBFILE_PATTERN_meta-arago-test := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-test = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-test = "scarthgap styhead walnascar"
> +LAYERSERIES_COMPAT_meta-arago-test = "styhead walnascar"
>  
>  # Set a variable to get to the top of the metadata location
>  TITESTBASE := '${@os.path.normpath("${LAYERDIR}/")}'
> -- 
> 2.34.1
> 

