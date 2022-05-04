Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684AEC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 18:00:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.672.1651687213178862965
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 May 2022 11:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB27E40C24
	for <meta-arago@lists.yoctoproject.org>;
 Wed,  4 May 2022 18:00:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wg4mJJJ-a-Mr for <meta-arago@lists.yoctoproject.org>;
	Wed,  4 May 2022 18:00:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C76CF40A3D
	for <meta-arago@lists.yoctoproject.org>;
 Wed,  4 May 2022 18:00:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8D93A174919; Wed,  4 May 2022 14:00:11 -0400 (EDT)
Date: Wed, 4 May 2022 14:00:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [oe-layersetup][PATCH] configs: add Kirkstone
 configs for arago, poky and distroless
Message-ID: <20220504180011.GD9834@denix.org>
References: <16EB61A5798D3F09.8534@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16EB61A5798D3F09.8534@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 May 2022 18:00:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13834

Ping.

On Mon, May 02, 2022 at 07:50:46PM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> The following layers have not branched off yet and will be updated later:
> 
> meta-virtualization
> meta-ti
> meta-arago
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  configs/arago-kirkstone-config.txt      | 14 ++++++++++++++
>  configs/distroless-kirkstone-config.txt |  8 ++++++++
>  configs/poky-kirkstone-config.txt       | 10 ++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 configs/arago-kirkstone-config.txt
>  create mode 100644 configs/distroless-kirkstone-config.txt
>  create mode 100644 configs/poky-kirkstone-config.txt
> 
> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
> new file mode 100644
> index 0000000..00c96d6
> --- /dev/null
> +++ b/configs/arago-kirkstone-config.txt
> @@ -0,0 +1,14 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
> +meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
> +meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/distroless-kirkstone-config.txt b/configs/distroless-kirkstone-config.txt
> new file mode 100644
> index 0000000..dc9c088
> --- /dev/null
> +++ b/configs/distroless-kirkstone-config.txt
> @@ -0,0 +1,8 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
> +meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-v2.conf.sample
> diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-config.txt
> new file mode 100644
> index 0000000..024e1c6
> --- /dev/null
> +++ b/configs/poky-kirkstone-config.txt
> @@ -0,0 +1,10 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
> +meta-yocto,git://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=meta-poky:meta-yocto-bsp
> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
> +meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
> -- 
> 2.25.1

