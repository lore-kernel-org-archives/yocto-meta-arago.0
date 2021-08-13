Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 9136552A27
	for <meta-arago@arago-project.org>;
	Fri, 13 Aug 2021 17:03:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17DH3nNK092976;
	Fri, 13 Aug 2021 12:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628874229;
	bh=Gkz+ED9SeMSpVdTs7nluNPEcLCNhCOGVgpSpQ32S85A=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=iqeOCUJ34w7Sqr+2M1q3Teph7vR1S4ygeWmc02I0bj9oLCBOapboPBroEURPoKm+W
	ujZpT/Jv6QcbI2bZJPi87r8vZ3JGCIhoVwdYJbQEN+g/Bwx5aqGZ2K3HnDSdu6pMLb
	/+hy4P3I0CD0g/wS0UMK5p27u2dBOSrRNvhSKymU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17DH3nT5089392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Aug 2021 12:03:49 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 13 Aug 2021 12:03:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 13 Aug 2021 12:03:49 -0500
Received: from [10.250.173.89] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17DH3ksD028697;
	Fri, 13 Aug 2021 12:03:47 -0500
To: <meta-arago@arago-project.org>, <yogeshs@ti.com>, <praneeth@ti.com>
References: <20210809182107.6899-1-nikhil.nd@ti.com>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <059ef067-18fa-7ed7-2a2e-eab17fe4090a@ti.com>
Date: Fri, 13 Aug 2021 22:33:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809182107.6899-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nsekhar@ti.com
Subject: Re: [oe-layersetup PATCH] processor-sdk: Add 08.00.00.21 release config
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
X-List-Received-Date: Fri, 13 Aug 2021 17:03:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Praneeth,

On 09/08/21 11:51 pm, Nikhil Devshatwar wrote:
> Add config file for processor-sdk 08.00.00.21 release
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>

ping on this

Please merge this soon.
AM64 release is out and people will start doing builds.

Regards,
Nikhil D



> ---
>   .../processor-sdk-08.00.00.21-config.txt           | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
> 
> diff --git a/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
> new file mode 100644
> index 0000000..78a921c
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
> @@ -0,0 +1,14 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
> +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,ea2e8505fdf9948c0e2881af9dacb07e801c9037,layers=
> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> 

