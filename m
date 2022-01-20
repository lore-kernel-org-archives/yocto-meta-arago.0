Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.3744.1642718348157227527
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 14:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iaptYXtR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20KMd6pd100613
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Jan 2022 16:39:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1642718346;
	bh=t2RVdsNnAC8qwHmFwzVLL8UeTA5mqtbSdssy/C8q7qY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iaptYXtRdfNJv4DoSWFVjUIb4UeE1GHjmq38oASGRRK0hRu9tZZ/6nVU6fRf6RFxR
	 Ug1lIV9ZFDUGbKI9uXrhD+Y8JUS9ayQNlh+Ub0nDrYC8VRxvJfnPpf/viGmT3pmyxE
	 NqkAwKPKbfXoKOs9i4V66E5i01rYA5x4JsRo3KJY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20KMd61Q042945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Jan 2022 16:39:06 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 20
 Jan 2022 16:39:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 20 Jan 2022 16:39:05 -0600
Received: from [10.249.38.90] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20KMd51n111586;
	Thu, 20 Jan 2022 16:39:05 -0600
Message-ID: <9899becc-a519-763f-8f7f-34af8aad6ff0@ti.com>
Date: Thu, 20 Jan 2022 16:39:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add 08.01.00 release config
To: <l-weaver@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <a-limaye@ti.com>, <reatmon@ti.com>
References: <20220120223224.28849-1-l-weaver@ti.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20220120223224.28849-1-l-weaver@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/2022 4:32 PM, l-weaver@ti.com wrote:
> From: Lucas Weaver <l-weaver@ti.com>
> 
> Add config file for processor-sdk-linux 08.01.00 release
> 
> Signed-off-by: Lucas Weaver <l-weaver@ti.com>

Reviewed-by: Yogesh Siraswar <yogeshs@ti.com>

> ---
>   .../processor-sdk-linux-08_01_00.txt            | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
> 
> diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
> new file mode 100644
> index 0000000..5869b67
> --- /dev/null
> +++ b/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
> @@ -0,0 +1,17 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,1.46,f18b65d0b9a6b983d53bde491e1bf2ca56949444
> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
> +meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,f030757ec1e3657a26fdfa75c5148eae6c264580,layers=
> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
> +meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> +oe-core,https://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
> +meta-aws,https://github.com/aws/meta-aws.git,dunfell,2f72301f5a73279c4d2f12fc6218876629666e06,layers=
> +meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64.conf.sample
> 
