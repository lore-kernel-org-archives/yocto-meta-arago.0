Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 5F58152A78
	for <meta-arago@arago-project.org>;
	Thu, 26 Aug 2021 20:12:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17QKCQgM057421;
	Thu, 26 Aug 2021 15:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1630008746;
	bh=48zibN6U38EnJmJtgR/Ab8ApPLEPrwcAEgX+YUc8Pnw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=JBVQ4GX+pP/VdWgcqvr5XGLAIV3iAXnac7Rg5PQfFSVelDUkKclzpLTm5zKm79qMO
	kACKjSwxEDZfCRXyD0mIKV5U0sijBcEiFtc2D6vryOkDYuPY0sH3gHaXZntWbvR9P1
	uknagpYVxRHvuH+wztaSOCn43QbQYQKHiuXPMKyk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17QKCQgX067133
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Aug 2021 15:12:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14;
	Thu, 26 Aug 2021 15:12:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
	Frontend Transport; Thu, 26 Aug 2021 15:12:26 -0500
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17QKCQXL111273;
	Thu, 26 Aug 2021 15:12:26 -0500
To: Priya N S <priya.ns@mistralsolutions.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
References: <20210826103155.72744-1-priya.ns@ti.com>
From: Praneeth Bajjuri <praneeth@ti.com>
Message-ID: <286a52f6-7554-c817-903e-cb412e427567@ti.com>
Date: Thu, 26 Aug 2021 15:12:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826103155.72744-1-priya.ns@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "N S, Priya" <priya.ns@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>
Subject: Re: [oe-layersetup PATCH v3] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Thu, 26 Aug 2021 20:12:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/26/21 5:31 AM, Priya N S wrote:
> Signed-off-by: Priya N S <priya.ns@ti.com>
> ---
> 
> Hi All,
> 
> This patch adds the processor-sdk-07.03.00.005-config for the AM335x
> and AM437x 07.03 release.
> 
> Changes made in the V3 patch:
> * This corresponds to the 07.03 release for the am335x-evm and
>    am437x-evm platforms.
> * The meta-linaro meta-layer is removed because the meta-optee needed
>    for the build is moved to meta-arm from the dunfell.

any version change log should be below
---

please correct the commit message about "Changes made in the V3 patch:"


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

this doesnt seems to be latest commit from 
https://git.ti.com/cgit/processor-sdk/meta-processor-sdk/log/?h=dunfell 
it looks atleast 27 patches behind. Please provide the reason for this 
difference.

Can you also start using tags for meta-processor-sdk.

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

