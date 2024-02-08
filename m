Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEE4C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 19:34:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.5135.1707420851216683859
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 11:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hC4YjRXM;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418JYAIW059593;
	Thu, 8 Feb 2024 13:34:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707420850;
	bh=YHGvG8xWPenDRQJ5EzfHXGCqZD30/qXa5yJ3s1BYqMk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hC4YjRXMt2+jmmW57EXVxZSyl14dP3q/pZDvfCbc21bDK0mDHQUSXVVuoDCgxdTX/
	 O3fx4GzUafkGPkjn1+U6HuZjLrjCxv6x/aER0jQh0DYA+dflQoChz1XeuJPHdx0CVh
	 OPaVL9isd3pz2XvL4OEbY8c+YEOKC/2Zye060PVQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418JYAM3072220
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 13:34:10 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 13:34:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 13:34:09 -0600
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418JY95V111199;
	Thu, 8 Feb 2024 13:34:09 -0600
Message-ID: <c6d4d07a-baef-47dd-ae92-d9b0dabefad2@ti.com>
Date: Thu, 8 Feb 2024 13:34:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] oe-layersetup: configs: add
 meta-clang into the kirkstone configs
Content-Language: en-US, en-US-large
To: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
References: <20240208191412.1382-1-detheridge@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20240208191412.1382-1-detheridge@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 19:34:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15140

On 2/8/24 13:14, detheridge@ti.com wrote:
> From: Darren Etheridge <detheridge@ti.com>
> 
> Add meta-clang into the 3 kirkstone configs.  meta-clang is pinned to
> the kirkstone-clang12 branch because this is what we will be using for
> the chromium v111 browser build.
> 
> We want to pull meta-clang into all kirkstone builds even without
> chromium so that we find any integration problems that clang might
> introduce even before we start doing the much larger chromium builds.
> 
> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ---
>   configs/arago-kirkstone-config.txt      | 2 +-
>   configs/arago-kirkstone-next-config.txt | 2 +-
>   configs/arago-kirkstone-wip-config.txt  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
> index ceb8d74..43a8a0b 100644
> --- a/configs/arago-kirkstone-config.txt
> +++ b/configs/arago-kirkstone-config.txt
> @@ -9,7 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
> index dcf935d..9d173df 100644
> --- a/configs/arago-kirkstone-next-config.txt
> +++ b/configs/arago-kirkstone-next-config.txt
> @@ -17,7 +17,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
> index 9dd72ab..dfe8bd6 100644
> --- a/configs/arago-kirkstone-wip-config.txt
> +++ b/configs/arago-kirkstone-wip-config.txt
> @@ -9,7 +9,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,H
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD,layers=
>   oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample

Just a heads up, not sure if this can be picked up as is because of 
legacy devices having issues with meta-clang. It may not be a problem 
anymore but I remember that was what provoked the initial removal of 
meta-clang back around 9.1. Darren's running some tests.

