Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17E3C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 19:40:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2169.1707939647936971757
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 11:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Lbs8gaPz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: detheridge@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41EJekqT032370;
	Wed, 14 Feb 2024 13:40:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707939646;
	bh=Dkhw/ZjbYIA3DEu35UvXVe4Z7X2Wnmj1nu/CUq4vXws=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Lbs8gaPzmH7V0J5+V+M+dAU+HXublVKTYk1HFu73l/Ic9YLgebglGdpcEQHvhHRJ5
	 BAZEPwGAUEuPeVFckU9ywBXDGUtuj6PUyVqSvwlcftgvqp6UygU8rhYt6v1daxM2MD
	 PtmWVfMx9BZFjORShsacNYo/CjX/wZnG1OCfY7Rw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41EJek0L120059
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 13:40:46 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 13:40:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 13:40:46 -0600
Received: from [128.247.81.107] (lt5cg1254qm7.dhcp.ti.com [128.247.81.107])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41EJekSL104710;
	Wed, 14 Feb 2024 13:40:46 -0600
Message-ID: <5a735fca-585b-4e12-a11b-529c4c9830c4@ti.com>
Date: Wed, 14 Feb 2024 13:40:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH] configs: Add new
 master config for chromium support and clang
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240214193551.11148-1-reatmon@ti.com>
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <20240214193551.11148-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Feb 2024 19:40:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15187



On 2/14/2024 1:35 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> In the spirit of the kirkstone config changes to support clang and
> chromium, update the master configs also.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Darren Etheridge <detheridge@ti.com>

> ---
>   configs/arago-master-chromium-config.txt | 16 ++++++++++++++++
>   configs/arago-master-config.txt          |  4 ++--
>   configs/arago-master-next-config.txt     |  4 ++--
>   configs/arago-master-wip-config.txt      |  4 ++--
>   4 files changed, 22 insertions(+), 6 deletions(-)
>   create mode 100644 configs/arago-master-chromium-config.txt
> 
> diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
> new file mode 100644
> index 0000000..94dfc53
> --- /dev/null
> +++ b/configs/arago-master-chromium-config.txt
> @@ -0,0 +1,16 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,master,HEAD
> +meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> +meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
> +oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=yes
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index 821df1b..ca58dd2 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -3,13 +3,13 @@
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
>   meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> -#meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
> +meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
> index bcaa5cc..74c497e 100644
> --- a/configs/arago-master-next-config.txt
> +++ b/configs/arago-master-next-config.txt
> @@ -11,13 +11,13 @@ MOTD: NOTE:
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
>   meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> -#meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
> +meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
> index 86d4b43..cf70ead 100644
> --- a/configs/arago-master-wip-config.txt
> +++ b/configs/arago-master-wip-config.txt
> @@ -3,13 +3,13 @@
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
>   meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> -#meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
> +meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample

