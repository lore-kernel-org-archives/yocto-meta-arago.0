Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA70C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 17:37:30 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.12564.1647625049034163027
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 10:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IKGiY7ba;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IHbP0p091075;
	Fri, 18 Mar 2022 12:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647625045;
	bh=5fxj1HUDX2b/YkWoX9MRXgGNRMLcOswOoZeOwbDtI3g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IKGiY7ba1DpkieGwYnOT4vEfiua1xAilfAqToVLxXA4SJnRj0EpXlZ3pa+8JhLbXg
	 Kgac1imIOhjJTXMHr6Q2z1jFL1ciKq8fW7dltfkD04LfD9C0qZiEAqBbt2/YNS98Tv
	 bjJtWGOQo6WwN6R6djhQOAe8oYvAvDx4En7iGMXY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IHbPQb067822
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 12:37:25 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 12:37:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 12:37:25 -0500
Received: from [10.249.37.177] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IHbPES122251;
	Fri, 18 Mar 2022 12:37:25 -0500
Message-ID: <0ef8a8f1-cfd3-7e60-8922-fd271ae255b0@ti.com>
Date: Fri, 18 Mar 2022 12:37:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe-layersetup PATCH] configs: Switch github repos from git to
 https
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20220318172714.17656-1-nm@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220318172714.17656-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 17:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13657


What about all of the other configs?


On 3/18/2022 12:27, Nishanth Menon wrote:
> github announced removal of support of unencrypted git:// last
> year[1], However, we still use git:// in many of our configurations.
> Switch them over to https://
> 
> [1] https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> Also interesting is why are'nt we hearing wide-spread "oh oh.. it fails
> to build??" comments?
> 
> $ git clone git://github.com/meta-qt5/meta-qt5.git
> Cloning into 'meta-qt5'...
> fatal: remote error:
>    The unauthenticated git protocol on port 9418 is no longer supported.
> Please see https://github.blog/2021-09-01-improving-git-protocol-security-github/ for more information.
> 
> Also, should we start considering shifting all to https:// ?
> 
>   configs/arago-dunfell-config.txt      | 4 ++--
>   configs/arago-dunfell-next-config.txt | 4 ++--
>   configs/arago-master-config.txt       | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
> index 464b835b7a30..60cc72a8d86f 100644
> --- a/configs/arago-dunfell-config.txt
> +++ b/configs/arago-dunfell-config.txt
> @@ -3,9 +3,9 @@
>   
>   bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
>   meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
> -# meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>   # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>   meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>   meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
> diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
> index 9657a727fda1..e2eb2023fec5 100644
> --- a/configs/arago-dunfell-next-config.txt
> +++ b/configs/arago-dunfell-next-config.txt
> @@ -3,9 +3,9 @@
>   
>   bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
>   meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
> -# meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>   # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>   meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
>   meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
> index e4c6d7f0070e..bd0ccec58e16 100644
> --- a/configs/arago-master-config.txt
> +++ b/configs/arago-master-config.txt
> @@ -3,8 +3,8 @@
>   
>   bitbake,git://git.openembedded.org/bitbake,master,HEAD
>   meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
> -#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>   meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
>   meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=

-- 
Ryan Eatmon
reatmon@ti.com

