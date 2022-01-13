Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2368.1642034650712819816
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 16:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 82B2540C06;
	Thu, 13 Jan 2022 00:44:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8brUrPH3dSje; Thu, 13 Jan 2022 00:44:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5777D40A77;
	Thu, 13 Jan 2022 00:44:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A2E92174719; Wed, 12 Jan 2022 19:44:05 -0500 (EST)
Date: Wed, 12 Jan 2022 19:44:05 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup][PATCH] config: dunfell: restore the oe-core version to HEAD
Message-ID: <20220113004405.GF26229@denix.org>
References: <20220113002033.20330-1-reatmon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220113002033.20330-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Was the corresponding issue already addressed?


On Wed, Jan 12, 2022 at 06:20:33PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Now that the release is past we can point back to the latest code.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  configs/arago-dunfell-config.txt      | 2 +-
>  configs/arago-dunfell-next-config.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
> index e6559fd..464b835 100644
> --- a/configs/arago-dunfell-config.txt
> +++ b/configs/arago-dunfell-config.txt
> @@ -10,7 +10,7 @@ meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>  meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
>  meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> -oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>  # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
>  # use below for OECORELAYERCONF to mark it compatible with dunfell
> diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
> index fdc8e83..9657a72 100644
> --- a/configs/arago-dunfell-next-config.txt
> +++ b/configs/arago-dunfell-next-config.txt
> @@ -10,7 +10,7 @@ meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>  meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
>  meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> -oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>  # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
>  # use below for OECORELAYERCONF to mark it compatible with dunfell
> -- 
> 2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
