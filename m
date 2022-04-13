Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532ABC49EA4
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7763.1649863682626756738
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 08:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nG2sTIMS;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23DFS05a117761
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Apr 2022 10:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649863680;
	bh=EZXdZyX+yscRSPpnonimlUTb4vVmVw8s5nOlbD2Zmsc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nG2sTIMS5KJ8MDsjMG2wfEP+MJ2/iDhNg4HEnPhwu3Eez83UI2/aJ3QsgZ1NsSFTj
	 S3UxNWlQJngDFwUCK3WnA0nAYG+fHFAQuHEnsMg7oo3qk7ijafN4DKvpuIQmVQ17Rl
	 /D9XzYL02KBVMB+ucyJQBRD/2DQRNwU/cb0SDFPc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23DFS0UL013103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Apr 2022 10:28:00 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 13
 Apr 2022 10:28:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 13 Apr 2022 10:28:00 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23DFS06L130215;
	Wed, 13 Apr 2022 10:28:00 -0500
Message-ID: <ef40e9ee-7c2a-9d0e-ba97-0cf2a94ea4ea@ti.com>
Date: Wed, 13 Apr 2022 10:28:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] configs:
 processor-sdk: Add AM64x 8.2 config
To: Devarsh Thakkar <devarsht@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <a-m1@ti.com>
References: <20220412122040.5108-1-devarsht@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220412122040.5108-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13779


Patch applied.


On 4/12/2022 7:20 AM, Devarsh Thakkar wrote:
> Add 8.2 release config for AM64x.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   .../processor-sdk-08.02.00.14-config.txt          | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 configs/processor-sdk/processor-sdk-08.02.00.14-config.txt
> 
> diff --git a/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt
> new file mode 100644
> index 0000000..313d90c
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt
> @@ -0,0 +1,15 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
> +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,5ad52b6a1e1e5ee7b436dd1c863a4a545d43d2bf,layers=
> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d,layers=
> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago64.conf.sample

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

