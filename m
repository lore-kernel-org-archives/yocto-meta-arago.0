Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 66D4D52AB5
	for <meta-arago@arago-project.org>;
	Fri,  6 Aug 2021 16:50:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 176GodZG021153;
	Fri, 6 Aug 2021 11:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628268639;
	bh=2U6oWHG8tBGR7/os/tsY5EET1N1V8+oPeATxnrovhmY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=MucW7JWqLDDeT8QrWL2goTeSW36hFWZvGxyU5G0n6UBJylSz/qHjz0MY4rkrDSGm/
	gZXya0dHnQaXFABP1QXooTxdi84EYb2lW5VEAFuL2WwdIYYwL277F0TIIyuPeF4X8u
	YOhrArwkPa9/zd4PxRxo4r6xOVNaAqmF9+Jbfk0E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 176Godg0118119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Aug 2021 11:50:39 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 6 Aug 2021 11:50:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 6 Aug 2021 11:50:38 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 176Gocaf021002;
	Fri, 6 Aug 2021 11:50:38 -0500
To: Priya N S <priya.ns@mistralsolutions.com>, <meta-arago@arago-project.org>
References: <20210806114852.60704-1-priya.ns@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <37141086-c8fc-919a-8a7e-73e7edd96926@ti.com>
Date: Fri, 6 Aug 2021 11:50:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210806114852.60704-1-priya.ns@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [oe-layersetup PATCH v2] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Fri, 06 Aug 2021 16:50:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/6/2021 6:48 AM, Priya N S wrote:
> Signed-off-by: Priya N S <priya.ns@ti.com>
> ---
> 
> Hi All,
> Kindly ignore the changes made in the V1 patch and consider the
> V2 patch.
> 
> Changes made in the V2 patch:
> * Added the processor-sdk-07.03.00.005-config for the 07.03
>    release.

Why are we doing this at the time of 8.0 release ? will there be a 8.0 
based config too as a separate patch later?

Anyhow, this patch is a NACK. See review comments below.


> * This corresponds to the 07.03 release for the am335x-evm
>    and am437x-evm platforms.
> 
>   .../processor-sdk-07.03.00.005-config.txt       | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> 
> diff --git a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> new file mode 100644
> index 0000000..09bde9e
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt

Did the convention followed for processor-sdk change?
Ex: I see 106* used for the last part of the release name (may be 
pointing to a build number)
Ref: 
http://arago-project.org/git/projects/oe-layersetup.git?p=projects/oe-layersetup.git;a=commit;h=30111f3c58442c088969a548dcd6c9140c422da8


> @@ -0,0 +1,17 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
> +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
> 

Why commitsha and not a 07.03* tag ?

Nikhil, does this look correct?


+meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
> +meta-aws,https://github.com/aws/meta-aws.git,dunfell,HEAD,layers=

HEAD >> This doesnt look right for the config snapshot. You need to pick 
the exact commitsha used for your release tagged images ( you should see 
that in build-config file)

> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
> +meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dunfell,HEAD,layers=meta-optee

Similar comment as above of meta-aws. HEAD is not correct for release 
snapshot.
By the way, why do you even need meta-linaro layer for psdkl builds?


> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
> 

