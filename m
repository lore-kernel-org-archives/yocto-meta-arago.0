Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C694C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:09:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.536.1651007368824079041
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1F38440C24;
	Tue, 26 Apr 2022 21:09:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eElymyYercb7; Tue, 26 Apr 2022 21:09:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 00B1140A03;
	Tue, 26 Apr 2022 21:09:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C65181748E1; Tue, 26 Apr 2022 17:09:24 -0400 (EDT)
Date: Tue, 26 Apr 2022 17:09:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup PATCH 2/6] Add layers for split
 meta-ti master branch
Message-ID: <20220426210924.GD9834@denix.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426200251.19417-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:09:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13803

On Tue, Apr 26, 2022 at 03:02:47PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> The latest master meta-ti split into two layers, add new layers here.

Can you swap the order of layers in meta-ti?
Other repos usually have the main repo listed first.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  configs/arago-master-config.txt      | 2 +-
>  configs/distroless-master-config.txt | 2 +-
>  configs/poky-master-config.txt       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index bd0ccec..532a145 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -7,7 +7,7 @@ meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-d
>  meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>  meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> -meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>  meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
> index 8211bd5..5c55459 100644
> --- a/configs/distroless-master-config.txt
> +++ b/configs/distroless-master-config.txt
> @@ -1,7 +1,7 @@
>  # This file takes repo entries in the format
>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>  bitbake,git://git.openembedded.org/bitbake,master,HEAD
> -meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>  meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>  oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
> index f213411..b395ff8 100644
> --- a/configs/poky-master-config.txt
> +++ b/configs/poky-master-config.txt
> @@ -2,7 +2,7 @@
>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>  bitbake,git://git.openembedded.org/bitbake,master,HEAD
>  poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> -meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>  meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>  OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
> -- 
> 2.17.1

