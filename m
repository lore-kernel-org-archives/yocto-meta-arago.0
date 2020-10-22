Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id EB864529A4
	for <meta-arago@arago-project.org>;
	Thu, 22 Oct 2020 12:33:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09MCTxjo090759;
	Thu, 22 Oct 2020 07:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603369799;
	bh=tuL0Pxs3qoLk/Z/D/WijjqZYLUBCa+usVcrmig02sYg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ttl56spRBuu5h8CqKhyLrnTtTkzbJFuxVRg1o9i4cXcG4WRgsQtR+Lz0Yl3G/D+Ws
	ab19o1iUxcJiam1nhM3kXhJ/7Er0qOy5Ycs3lhQRsAFzoJTTzrLcQKNkJXHKhsazHs
	gFpU4oukFhapKBvThJOZlduCqE9RxMZa5BLOMcIA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09MCTxkV031266
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Oct 2020 07:29:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 22 Oct 2020 07:29:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 22 Oct 2020 07:29:58 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09MCTwBi036228;
	Thu, 22 Oct 2020 07:29:58 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1603328662-36316-1-git-send-email-denis@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <1b3cad3a-a464-d384-7bd7-c1686edd9bea@ti.com>
Date: Thu, 22 Oct 2020 07:29:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1603328662-36316-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [oe-layersetup][PATCH] distroless/poky-master: drop meta-oe and meta-python layers, add meta-arm-toolchain
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2020 12:33:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello

On 10/21/20 8:04 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> There have been dependencies on meta-python and meta-oe from optee recipes in
> meta-arm, but those got moved to oe-core some time ago and the corresponding
> layers are no longer needed.
>
> Also, meta-arm gained extra dependency by trusted-firmware-m for baremetal
> toolchain from meta-arm-toolchain, so add that layer too.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   configs/distroless-master-config.txt | 3 +--
>   configs/poky-master-config.txt       | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
> index 0c26f7a..c8c400c 100644
> --- a/configs/distroless-master-config.txt
> +++ b/configs/distroless-master-config.txt
> @@ -1,9 +1,8 @@
>   # This file takes repo entries in the format
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   bitbake,git://git.openembedded.org/bitbake,master,HEAD
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-python:meta-oe
>   meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
> -meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm
> +meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>   oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local.conf.sample
> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
> index 1298a05..1dc261f 100644
> --- a/configs/poky-master-config.txt
> +++ b/configs/poky-master-config.txt
> @@ -2,8 +2,7 @@
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   bitbake,git://git.openembedded.org/bitbake,master,HEAD
>   poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> -meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-python:meta-oe
>   meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
> -meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm
> +meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-poky.conf.sample

Applied


