Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D57C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:38:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.235.1651675105510711339
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uxdkehFb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244EcOF5035220
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 May 2022 09:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651675104;
	bh=qRUGwHBlWZzfVUqgnIi2dT/djPGrPzp/2wkofJLZbas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uxdkehFbwGp9yRrPfQ3VT3otNBQE0n/RK7QNWkUfOG2t0E8AsGLomqvDs7FJl4F1o
	 gzTWyva5bthbEJuV+Vf+s1aC0R0ns94g0POGO5miw+mvc1eiYd7aOY0lYHsv3WkUOf
	 CYoVp6SLxHS4U+TLVSMMk9uIprHu1Mw69R66skOg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244EcO7t090749
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 May 2022 09:38:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 09:38:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 09:38:23 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244EcN6q101178;
	Wed, 4 May 2022 09:38:23 -0500
Message-ID: <4b57e078-1041-e902-2e69-192de9e7bd81@ti.com>
Date: Wed, 4 May 2022 09:38:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add
 08.02.00 release config
Content-Language: en-US
To: <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <l-weaver@ti.com>, <yogeshs@ti.com>, <praneeth@ti.com>
References: <20220504123720.10990-1-a-limaye@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220504123720.10990-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 May 2022 14:38:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13833


Patch applied.


On 5/4/2022 7:37, a-limaye@ti.com wrote:
> From: Aniket Limaye <a-limaye@ti.com>
> 
> Add config file for processor-sdk-linux 08.02.00 release
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   .../processor-sdk-linux-08_02_00.txt            | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt
> 
> diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt
> new file mode 100644
> index 0000000..fcfe14c
> --- /dev/null
> +++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt
> @@ -0,0 +1,17 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,1.46,be6ecc160ac4a8d9715257b9b955363cecc081ea
> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
> +meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,08ef8ff32c2e3b26efc5b2cbae775f0d1f15e7eb,layers=
> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
> +meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> +oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
> +meta-aws,https://github.com/aws/meta-aws.git,dunfell,2f72301f5a73279c4d2f12fc6218876629666e06,layers=
> +meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64.conf.sample

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

