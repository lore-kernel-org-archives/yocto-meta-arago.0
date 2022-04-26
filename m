Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63550C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:11:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.524.1651007506731843786
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B5A5D40C24;
	Tue, 26 Apr 2022 21:11:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6LAfT6I9tAd; Tue, 26 Apr 2022 21:11:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9146740A03;
	Tue, 26 Apr 2022 21:11:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 539F81748E1; Tue, 26 Apr 2022 17:11:42 -0400 (EDT)
Date: Tue, 26 Apr 2022 17:11:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup PATCH 3/6] Remove image-prelink
 from sample USER_CLASSES
Message-ID: <20220426211142.GE9834@denix.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426200251.19417-3-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:11:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13804

On Tue, Apr 26, 2022 at 03:02:48PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> Prelinking hasn't worked on ARM in a while so this class was
> removed in the latests core master. Remove it here.

This file is used for both dunfell and master. Maybe this change calls for v3 
of the corresponding sample files?


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  sample-files/local-arago64-v2.conf.sample | 4 +---
>  sample-files/local-poky-v2.conf.sample    | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sample-files/local-arago64-v2.conf.sample b/sample-files/local-arago64-v2.conf.sample
> index 9549e8a..13585cb 100644
> --- a/sample-files/local-arago64-v2.conf.sample
> +++ b/sample-files/local-arago64-v2.conf.sample
> @@ -112,11 +112,9 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>  # enable extra features. Some available options which can be included in this variable 
>  # are:
>  #   - 'buildstats' collect build statistics
> -#   - 'image-prelink' in order to prelink the filesystem image
>  #   - 'image-swab' to perform host system intrusion detection
> -# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>  # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
> -USER_CLASSES ?= "buildstats image-prelink"
> +USER_CLASSES ?= "buildstats"
>  
>  # By default disable interactive patch resolution (tasks will just fail instead):
>  PATCHRESOLVE = "noop"
> diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
> index 5cbe6ef..a958055 100644
> --- a/sample-files/local-poky-v2.conf.sample
> +++ b/sample-files/local-poky-v2.conf.sample
> @@ -109,11 +109,9 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>  # enable extra features. Some available options which can be included in this variable 
>  # are:
>  #   - 'buildstats' collect build statistics
> -#   - 'image-prelink' in order to prelink the filesystem image
>  #   - 'image-swab' to perform host system intrusion detection
> -# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>  # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
> -USER_CLASSES ?= "buildstats image-prelink"
> +USER_CLASSES ?= "buildstats"
>  
>  # By default disable interactive patch resolution (tasks will just fail instead):
>  PATCHRESOLVE = "noop"
> -- 
> 2.17.1

