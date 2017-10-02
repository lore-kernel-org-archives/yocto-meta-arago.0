Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E6162529E2
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 15:15:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92FFMVH026632
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 10:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506957322;
	bh=7h/RW9CV9Pa0UR6WnwdHj7rnKnTybCdLuQ/L84Fg37s=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=cageoZ1idyKyOIhrFs/uosEGGv8Dwy1gN05A4eTEO5r41T+tKEoByL6NPnGDSKEKG
	lTHbD1uYqiJkgokPyNKtoYNnhnoaGzVdukddWVnHzul2hTFJDB6Kjv72ULoUGqPaLw
	QzB3k+cZcFPdW2fgld6lKeI3zBRkPPIz+Hv5jsd0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92FFHU7027509
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 10:15:17 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 10:15:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 10:15:17 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92FFGkX030638
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 10:15:17 -0500
To: <meta-arago@arago-project.org>
References: <1506957153-18556-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e9531d84-5691-ab55-ac44-ff3569a8e46c@ti.com>
Date: Mon, 2 Oct 2017 11:15:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506957153-18556-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] processor-sdk-04.01.00.06: add Processor SDK 4.1.0.6 release config
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
X-List-Received-Date: Mon, 02 Oct 2017 15:15:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I forgot the "oe-layersetup" prefix. I will resend.


On 10/2/2017 11:12 AM, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../processor-sdk/processor-sdk-04.01.00.06-config.txt    | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
>
> diff --git a/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt b/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
> new file mode 100644
> index 0000000..2718148
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
> @@ -0,0 +1,15 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
> +meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,2b7f7b00654eb3faaea7c66271ebe508b9ffc019,layers=
> +meta-arago,git://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
> +meta-browser,git://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
> +meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
> +meta-ti,git://git.yoctoproject.org/meta-ti,morty,a18d57af8384ced25996739bb66d197c69efb77b,layers=
> +meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
> +oe-core,git://git.openembedded.org/openembedded-core,morty,e3911133ee9aad7cc3ae89faea80a097f6614fab,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample


