Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C134C74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 16:37:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.77797.1679589461440720262
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Mar 2023 09:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6DEAF40C06;
	Thu, 23 Mar 2023 16:37:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 203bptkYALYq; Thu, 23 Mar 2023 16:37:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56FDE40A0B;
	Thu, 23 Mar 2023 16:37:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 737DE1637DC; Thu, 23 Mar 2023 12:37:05 -0400 (EDT)
Date: Thu, 23 Mar 2023 12:37:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: nm@ti.com
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH V2 1/2]
 sample-files: gitconfig.sample: Stop using git:// urls
Message-ID: <20230323163705.GP18050@denix.org>
References: <20230323135026.1842186-1-nm@ti.com>
 <20230323135026.1842186-2-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323135026.1842186-2-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Mar 2023 16:37:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14279

On Thu, Mar 23, 2023 at 08:50:25AM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> We did this in meta-ti and meta-arago but didn't propagate back into
> oe-layersetup yet so I'll give it a go. git:// is no longer functional
> proxies over on latest git versions (example: poky crops container for
> ubuntu 22.04[1]), also git:// is highly susceptible to man-in-the-middle
> attacks[2]. Dump git:// in favor of https.

Looks good to me, thanks.


> [1] https://hub.docker.com/r/crops/poky/tags 22.04
> [2] https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> New patch in the series.
> 
>  sample-files/gitconfig.sample | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/sample-files/gitconfig.sample b/sample-files/gitconfig.sample
> index 2d06bdcd80b9..14533650a781 100644
> --- a/sample-files/gitconfig.sample
> +++ b/sample-files/gitconfig.sample
> @@ -3,14 +3,17 @@
>  # See https://git-scm.com/docs/git-config for further information
>  # To debug, use GIT_CURL_VERBOSE=1 GIT_TRACE=1
>  
> -[url "git://git.yoctoproject.org/meta-arago"]
> +[url "https://git.yoctoproject.org/meta-arago"]
>  	insteadOf = git://arago-project.org/git/meta-arago
>  	insteadOf = http://arago-project.org/git/meta-arago
> +	insteadOf = git://git.yoctoproject.org/meta-arago
>  
> -[url "git://git.yoctoproject.org/meta-ti"]
> +[url "https://git.yoctoproject.org/meta-ti"]
>  	insteadOf = git://arago-project.org/git/meta-ti
>  	insteadOf = http://arago-project.org/git/meta-ti
> +	insteadOf = git://git.yoctoproject.org/meta-ti
>  
> -[url "git://git.ti.com/arago-project/oe-layersetup"]
> +[url "https://git.ti.com/arago-project/oe-layersetup"]
>  	insteadOf = git://arago-project.org/git/projects/oe-layersetup
>  	insteadOf = http://arago-project.org/git/projects/oe-layersetup
> +	insteadOf = git://git.ti.com/arago-project/oe-layersetup
> -- 
> 2.40.0

