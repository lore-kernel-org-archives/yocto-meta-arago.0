Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8409C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 18:17:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.141635.1692123461363186763
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 11:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=J9KDNeFj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37FIHe5k058484
	for <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 13:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692123460;
	bh=gnuq3Pd1XnjDtWLIpVz+bk+koonjMN+/4O90G9DKKqg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=J9KDNeFjcs2vUhyxyVe5Pr/UtVpToezGtv1lF+YSgjeqGMRUBy8+g8GA9YE7pileA
	 bUphcDbA6e6Eu4HGNiBYovGzbsqOEaQ49PcJSssXh9fqQdIb2qLj2wyydfnyvEjfav
	 4BG/huEQiT0zYgvEjMvGOQt4Yqvz17ZaPfFsak7g=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37FIHeHF027074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 13:17:40 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 13:17:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 13:17:39 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37FIHdA8052884
	for <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 13:17:39 -0500
Message-ID: <5d82bfb3-4111-495d-9678-e179dd1afcde@ti.com>
Date: Tue, 15 Aug 2023 13:17:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [oe-layersetup][PATCH] configs:
 kirkstone+: add meta-clang preemptively
Content-Language: en-US, en-US-large
To: <meta-arago@lists.yoctoproject.org>
References: <177BA10AF505EDF3.8497@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <177BA10AF505EDF3.8497@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 18:17:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14843

On 8/15/23 13:11, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Preempt some of the layer changes that are coming that will have
> explicit dependencies on meta-clang.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   configs/arago-kirkstone-config.txt      | 1 +
>   configs/arago-kirkstone-next-config.txt | 1 +
>   configs/arago-kirkstone-wip-config.txt  | 1 +
>   configs/arago-master-config.txt         | 1 +
>   configs/arago-master-next-config.txt    | 1 +
>   configs/arago-master-wip-config.txt     | 1 +
>   configs/poky-kirkstone-config.txt       | 1 +
>   configs/poky-master-config.txt          | 1 +
>   configs/poky-master-wip-config.txt      | 1 +
>   9 files changed, 9 insertions(+)
> 
> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
> index c2524a4..39ddeb4 100644
> --- a/configs/arago-kirkstone-config.txt
> +++ b/configs/arago-kirkstone-config.txt
> @@ -9,6 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
> index fe0a97b..bc90869 100644
> --- a/configs/arago-kirkstone-next-config.txt
> +++ b/configs/arago-kirkstone-next-config.txt
> @@ -17,6 +17,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
> index b8a97f0..a560f41 100644
> --- a/configs/arago-kirkstone-wip-config.txt
> +++ b/configs/arago-kirkstone-wip-config.txt
> @@ -9,6 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index 7822511..e5aa236 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -9,6 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
> index 74e8d78..748b39c 100644
> --- a/configs/arago-master-next-config.txt
> +++ b/configs/arago-master-next-config.txt
> @@ -17,6 +17,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
> index 71ab716..b588c0e 100644
> --- a/configs/arago-master-wip-config.txt
> +++ b/configs/arago-master-wip-config.txt
> @@ -9,6 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-config.txt
> index dc94b1d..4d5378d 100644
> --- a/configs/poky-kirkstone-config.txt
> +++ b/configs/poky-kirkstone-config.txt
> @@ -5,6 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
>   meta-yocto,https://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=meta-poky:meta-yocto-bsp
>   meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-extras
>   
> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
> index 5cb0383..03a3c83 100644
> --- a/configs/poky-master-config.txt
> +++ b/configs/poky-master-config.txt
> @@ -5,6 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
>   meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-extras
>   
> diff --git a/configs/poky-master-wip-config.txt b/configs/poky-master-wip-config.txt
> index 3fa74bf..3766244 100644
> --- a/configs/poky-master-wip-config.txt
> +++ b/configs/poky-master-wip-config.txt
> @@ -5,6 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
>   meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-extras
>   

Let me know if I shouldn't touch the poky configs. Just applied this to 
everything we'll be testing because, while I don't expect any issues 
with known build targets, I don't want surprises before we get into it.

Anything using meta-arago will need clang in the future due to browser 
requirements and some other tweaks.

