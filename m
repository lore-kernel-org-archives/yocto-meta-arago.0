Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DF0C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 15:30:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.16719.1708011035048175331
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 07:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U5TCOSO/;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FFUXCR038265;
	Thu, 15 Feb 2024 09:30:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708011033;
	bh=Znj3UIcoPeirYUZLQLq4IIB+fOiFDXi6mgK8cZi1Ml0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U5TCOSO/yOAo80oa6JSOl/tySWcHNOVbhWPB02rvh92ae41vsE7xGfs1VVso4cPkI
	 Yiepp2kfpURW34DSdsW53erE/Dt065jUa7PPkMr4I8BxVoUMxDb5DQ6UYzpcwiRHBL
	 1A5DVljvvuy9ICKjbOyleOZoWryK66TWdixjdozo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FFUXrN029478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 09:30:33 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 09:30:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 09:30:33 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FFUXxa032555;
	Thu, 15 Feb 2024 09:30:33 -0600
Message-ID: <8ae133bd-393e-4f9b-9623-9ced5ecd9cea@ti.com>
Date: Thu, 15 Feb 2024 09:30:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] oe-layersetup: really
 harmonize the meta-browser line
Content-Language: en-US
To: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <denys@konsulko.com>
CC: <rs@ti.com>
References: <20240215151050.4041-1-detheridge@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240215151050.4041-1-detheridge@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 15:30:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15194


Since I added the master configs yesterday, do you mind updating them as 
well in this patch?


On 2/15/2024 9:10 AM, detheridge@ti.com wrote:
> From: Darren Etheridge <detheridge@ti.com>
> 
> My earlier patch missed adding the layer=meta-chromium onto the
> meta-browser line and builds stop working very quickly.
> We want this to match exactly what we have for
> arago-kirkstone-chromium-config.txt so anybody can uncomment this line
> and do a GPU enabled build of Chromium.
> 
> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ---
>   configs/arago-kirkstone-config.txt      | 2 +-
>   configs/arago-kirkstone-next-config.txt | 2 +-
>   configs/arago-kirkstone-wip-config.txt  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
> index ac9bb4d..eb4565e 100644
> --- a/configs/arago-kirkstone-config.txt
> +++ b/configs/arago-kirkstone-config.txt
> @@ -3,7 +3,7 @@
>   
>   bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
> index 7dd3e3f..1c06748 100644
> --- a/configs/arago-kirkstone-next-config.txt
> +++ b/configs/arago-kirkstone-next-config.txt
> @@ -11,7 +11,7 @@ MOTD: NOTE:
>   
>   bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
> index 19796c4..7df3461 100644
> --- a/configs/arago-kirkstone-wip-config.txt
> +++ b/configs/arago-kirkstone-wip-config.txt
> @@ -3,7 +3,7 @@
>   
>   bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

