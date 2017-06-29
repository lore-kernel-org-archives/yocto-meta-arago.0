Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id BE2E9529AD
	for <meta-arago@arago-project.org>;
	Thu, 29 Jun 2017 13:13:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5TDDdd4015921
	for <meta-arago@arago-project.org>; Thu, 29 Jun 2017 08:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498742019;
	bh=iZzdbH5ExHhogUxktEIPnJmNIWlsPcoGGAlh+CO8sO0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Tkp+nEBN+moGVAHUWPLOtkj2MfQkS0TBysrffDBG2gLcvQIVQgQJ+ZT+c2Cqzc/P1
	Qrpk5Y0YPG19H7CjVB9MPRKGPmBBN4zIZI3cr42rXqo9sFzfhVa6PSaVwkoxepJGz2
	yIrFe9FBmpUGNjDTeEsQOZab9UzDK1UyQ3e8KOGI=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5TDDdI4014637
	for <meta-arago@arago-project.org>; Thu, 29 Jun 2017 08:13:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Jun 2017 08:13:38 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5TDDcBP016450	for
	<meta-arago@arago-project.org>; Thu, 29 Jun 2017 08:13:39 -0500
To: <meta-arago@arago-project.org>
References: <1498660006-6423-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <9dd3fcf8-5d46-9243-78d0-a69ef8d11ff3@ti.com>
Date: Thu, 29 Jun 2017 09:13:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1498660006-6423-1-git-send-email-j-stiffler@ti.com>
Subject: Re: [oe-layersetup][PATCH] processor-sdk-04.00.00.04: add Processor SDK 4.0.0.4 release config
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
X-List-Received-Date: Thu, 29 Jun 2017 13:13:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

NAK


Got a last minute fix...


On 6/28/2017 10:26 AM, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   configs/processor-sdk/processor-sdk-04.00.00.04-config.txt | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
>
> diff --git a/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt b/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
> new file mode 100644
> index 0000000..40cff1b
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
> @@ -0,0 +1,14 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
> +meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,88ef95c93d1a1e8c02e1e75d19dbd4b6107a07fd,layers=
> +meta-arago,git://arago-project.org/git/meta-arago.git,morty,b727bf8fce8e9cb5a6b5d5b48c45f0088e67eb53,layers=meta-arago-distro:meta-arago-extras
> +meta-browser,git://github.com/OSSystems/meta-browser.git,master,880a7bd1d3b9a1b2003f5b0620350f03158bbd43,layers=
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
> +meta-ti,git://arago-project.org/git/meta-ti.git,morty,41d6fdc0fe5ea6054616cfccda13baac3ff33791,layers=
> +meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
> +oe-core,git://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample


