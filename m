Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CD5C35278
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3036.1649206236100285032
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 17:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D70440C2C;
	Wed,  6 Apr 2022 00:50:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gFF_c_L5yUv; Wed,  6 Apr 2022 00:50:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F121840AC9;
	Wed,  6 Apr 2022 00:50:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9D26F1748CE; Tue,  5 Apr 2022 20:50:32 -0400 (EDT)
Date: Tue, 5 Apr 2022 20:50:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [tisdk-build-scripts][master][PATCH] Remove build
 of ti-rtos-metadata from configs
Message-ID: <20220406005032.GL23554@denix.org>
References: <20220406002751.14241-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406002751.14241-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13773

On Tue, Apr 05, 2022 at 07:27:51PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The ti-rtos-metadata recipe has been defunct since a commit to
> meta-ti in July 2021.  So the call to build the recipe is no
> longer needed.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  configs/farm/arago-dunfell-next.txt | 2 +-
>  configs/farm/arago-dunfell.txt      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/farm/arago-dunfell-next.txt b/configs/farm/arago-dunfell-next.txt
> index 2cf092c..53977a9 100644
> --- a/configs/farm/arago-dunfell-next.txt
> +++ b/configs/farm/arago-dunfell-next.txt
> @@ -78,4 +78,4 @@ BB_GENERATE_MIRROR_TARBALLS="1"
>  
>  # This variable contains the command(s) that bitbake should run. Each command
>  # should be seperated by a semicolon.
> -BITBAKE_COMMAND="ti-rtos-metadata ; -k tisdk-core-bundle tisdk-tiny-image ti-world"
> +BITBAKE_COMMAND="-k tisdk-core-bundle tisdk-tiny-image ti-world"
> diff --git a/configs/farm/arago-dunfell.txt b/configs/farm/arago-dunfell.txt
> index 331ef0f..43b22ba 100644
> --- a/configs/farm/arago-dunfell.txt
> +++ b/configs/farm/arago-dunfell.txt
> @@ -78,4 +78,4 @@ BB_GENERATE_MIRROR_TARBALLS="1"
>  
>  # This variable contains the command(s) that bitbake should run. Each command
>  # should be seperated by a semicolon.
> -BITBAKE_COMMAND="ti-rtos-metadata ; tisdk-core-bundle tisdk-tiny-image ti-world"
> +BITBAKE_COMMAND="tisdk-core-bundle tisdk-tiny-image ti-world"

