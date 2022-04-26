Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE04C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:14:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.552.1651007667778270746
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D490440BD6;
	Tue, 26 Apr 2022 21:14:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkrdlCbyQtvX; Tue, 26 Apr 2022 21:14:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADC5240A03;
	Tue, 26 Apr 2022 21:14:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 74B7E1748E1; Tue, 26 Apr 2022 17:14:23 -0400 (EDT)
Date: Tue, 26 Apr 2022 17:14:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup PATCH 5/6] Build Poky in a
 directory named poky-tmp vs arago-tmp
Message-ID: <20220426211423.GF9834@denix.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-5-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426200251.19417-5-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:14:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13805

On Tue, Apr 26, 2022 at 03:02:50PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> This also allows us to keep version of both should we need.

I'm fine with the change, although it's really a NOOP, as TMPDIR gets replaced 
by tisdk-build-scripts, Jenkins jobs and even a distro config... But for 
consistency, it's fine.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  sample-files/local-poky-v2.conf.sample | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
> index a958055..4bd0563 100644
> --- a/sample-files/local-poky-v2.conf.sample
> +++ b/sample-files/local-poky-v2.conf.sample
> @@ -48,7 +48,7 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
>  # where BitBake should place its temporary files and output. Keep in mind that
>  # this includes the extraction and compilation of many applications and the toolchain
>  # which can use Gigabytes of hard disk space.
> -TMPDIR = "${OEBASE}/build/arago-tmp"
> +TMPDIR = "${OEBASE}/build/poky-tmp"
>  
>  #
>  # Machine Selection
> -- 
> 2.17.1

