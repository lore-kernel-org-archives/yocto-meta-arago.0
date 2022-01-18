Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.14089.1642520249305795135
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 07:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Bs9MUaBd;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20IFbSdB039172
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Jan 2022 09:37:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1642520248;
	bh=10ACUVqekNKmF9+F+uFDW86i1j1OVPwd8Sth5CMCDsc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Bs9MUaBdWZ0HpZD22TdTwzBGli3ELanhqHHSLhDrR9+/9AnKvKyFJpo1tUIpYPeXK
	 0EphNZT7LnIb3sXNFw5NiVjYvvxWvPzibriuahkNWVFfCaGmBGWfCZpOtXt1q8VrQf
	 9rl8l28lwDs9qF/n1KVr/FXKkwssQeOEmYF8Tk9c=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20IFbSB2067336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Jan 2022 09:37:28 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 18
 Jan 2022 09:37:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 18 Jan 2022 09:37:27 -0600
Received: from [10.249.38.90] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20IFbR5l080063;
	Tue, 18 Jan 2022 09:37:27 -0600
Message-ID: <6248c781-bd38-0390-9329-c62618c5a506@ti.com>
Date: Tue, 18 Jan 2022 09:37:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [meta-arago][oe-layersetup PATCH] processor-sdk: Add 08.01.00.39 release config
To: Aparna M <a-m1@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
References: <20220117145922.24026-1-a-m1@ti.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20220117145922.24026-1-a-m1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/2022 8:59 AM, Aparna M wrote:
> Add 08.01.00.39 release config
> 
> Signed-off-by: Aparna M <a-m1@ti.com>

Reviewed-by: Yogesh Siraswar <yogeshs@ti.com>

> ---
>   .../processor-sdk-08.01.00.39-config.txt          | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
> 
> diff --git a/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt b/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
> new file mode 100644
> index 0000000..cc67eb2
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
> @@ -0,0 +1,15 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.46,c2a3bda3a29e12472ef7862e424ea1552fab2959
> +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,9d1705ba257f95702fb010c6ed3aba384b1019ba,layers=
> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> 
