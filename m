Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF56C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 20:49:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3014.1664398178489710594
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 13:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 69F0540D40;
	Wed, 28 Sep 2022 20:49:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwRYwSNDemea; Wed, 28 Sep 2022 20:49:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4413440D3B;
	Wed, 28 Sep 2022 20:49:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B0EA174A13; Wed, 28 Sep 2022 16:49:33 -0400 (EDT)
Date: Wed, 28 Sep 2022 16:49:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH] oe-layer-setup.sh:
 restore number of threads to max
Message-ID: <20220928204933.GY18429@denix.org>
References: <20220928204354.25876-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928204354.25876-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Sep 2022 20:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14047

On Wed, Sep 28, 2022 at 03:43:54PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are no longer using VMs for building and so should not need
> to reduce the number of threads down by 75%.

I would recommend dropping those lines altogether - these days bitbake 
defaults to max number of threads/processes on its own.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  oe-layertool-setup.sh | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index e404290..1ea31c3 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -770,9 +770,8 @@ EOM
>  
>      # set the number of threads
>      threads=`cat /proc/cpuinfo | grep -c processor`
> -    tnum=`expr \( ${threads} + 1 \) \* 75 / 100`
> -    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${tnum}\"/" $confdir/local.conf
> -    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${tnum}\"/" $confdir/local.conf
> +    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${threads}\"/" $confdir/local.conf
> +    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${threads}\"/" $confdir/local.conf
>  
>      # Find if old DL_DIR was set
>      if [ -e $confdir/local.conf.bak ]
> -- 
> 2.17.1

