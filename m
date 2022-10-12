Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD64CC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 20:42:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2296.1665607358506782745
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 13:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D5CA540DBB;
	Wed, 12 Oct 2022 20:42:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jx9J3yxqHnbJ; Wed, 12 Oct 2022 20:42:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC7BF40DBA;
	Wed, 12 Oct 2022 20:42:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F3723174A38; Wed, 12 Oct 2022 16:42:31 -0400 (EDT)
Date: Wed, 12 Oct 2022 16:42:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] layers: Add langdale to
 LAYERSERIES_COMPAT
Message-ID: <20221012204231.GI22689@denix.org>
References: <20221012201543.4794-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012201543.4794-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Oct 2022 20:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14082

Do you want to merge this to kirkstone as well? Should be master only, I 
think.


On Wed, Oct 12, 2022 at 03:15:43PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/conf/layer.conf | 2 +-
>  meta-arago-extras/conf/layer.conf | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 4e21a517..5de46fc9 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>  BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-distro = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-distro = "kirkstone"
> +LAYERSERIES_COMPAT_meta-arago-distro = "kirkstone langdale"
>  
>  LAYERDEPENDS_meta-arago-distro = " \
>      core \
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index 2132ca18..e2c8119f 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
>  BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-extras = "10"
>  
> -LAYERSERIES_COMPAT_meta-arago-extras = "kirkstone"
> +LAYERSERIES_COMPAT_meta-arago-extras = "kirkstone langdale"
>  
>  # Set a variable to get to the top of the metadata location
>  ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
> -- 
> 2.17.1

