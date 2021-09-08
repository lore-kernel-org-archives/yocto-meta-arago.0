Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 1598952994
	for <meta-arago@arago-project.org>;
	Wed,  8 Sep 2021 15:41:08 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 188FfclO001378;
	Wed, 8 Sep 2021 10:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1631115698;
	bh=hnaUig82gFLu4/TWtM7BLcrJTVms2lHSoet3+Qc7lJg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=a2gecmvY+rzpngnXiiaL+F9nK9XW1GgkNxenaaPl9mvc7HG9VjOg3R14NwgK2MKNa
	tCBdnTkmzFp1SanK/We1psUd9Hl0rvseVAxoM6lrBjY9zmP8CvBy1H0Rg8PqtvoTOd
	glyhNpQ/xXhLsPidJf6UwhWIz5hMmKOqdzxUuVDA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 188FfcFh112962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Sep 2021 10:41:38 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14;
	Wed, 8 Sep 2021 10:41:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
	Frontend Transport; Wed, 8 Sep 2021 10:41:38 -0500
Received: from [10.250.34.224] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 188Ffb50110677;
	Wed, 8 Sep 2021 10:41:37 -0500
To: Priya N S <priya.ns@mistralsolutions.com>, <meta-arago@arago-project.org>
References: <20210907102637.81528-1-priya.ns@ti.com>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <6b3635b8-729b-688d-cf91-535cb0790a9d@ti.com>
Date: Wed, 8 Sep 2021 10:41:37 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907102637.81528-1-priya.ns@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [oe-layersetup PATCH v4] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Wed, 08 Sep 2021 15:41:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Applied to master.

Thanks
Yogesh

On 9/7/2021 5:26 AM, Priya N S wrote:
> Add config file for processor-sdk 07.03.00.005 release
> 
> Signed-off-by: Priya N S <priya.ns@ti.com>
> ---
> 
> Hi All,
> 
> This patch adds the processor-sdk-07.03.00.005-config for the AM335x
> and AM437x 07.03 release.
> 
> Changes made in the v4 patch:
> * Updated the commit message with the description of the patch.
> 
> v3:
> http://arago-project.org/pipermail/meta-arago/2021-August/013309.html
> 
> v2:
> http://arago-project.org/pipermail/meta-arago/2021-August/013290.html
> 
> v1:
> http://arago-project.org/pipermail/meta-arago/2021-August/013289.html
> 
>   .../processor-sdk-07.03.00.005-config.txt          | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> 
> diff --git a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> new file mode 100644
> index 0000000..548e759
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> @@ -0,0 +1,14 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
> +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
> +meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
> 

