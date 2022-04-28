Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C29C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 16:05:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.12552.1651161910137785209
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 09:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=q6oppSwy;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SG58LW051309
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 11:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651161908;
	bh=5fILLAvIHB92mU5sp4y8rBHMwtxxepRKzSeV1+gVgq0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=q6oppSwyD7O1NXfDIntNIcnGRXzsyztA2NlBI8ts43QuiLeHexxKt9aBBRf5i2R+K
	 6t9HdN9uYYsMReMlVgKdLqEYI4FKBFrmejWyxG5Oa6XngNgPjdq8Ya3ooIiVhk4aqb
	 Nwv+yn+mOFnYyjZSCKI9V7uNQzz1bWgPOX8T/Lps=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SG580i038846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 11:05:08 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 11:05:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 11:05:07 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SG57Ga014854;
	Thu, 28 Apr 2022 11:05:07 -0500
Message-ID: <0ec92933-b09d-dd03-16fa-a8210ccd33c4@ti.com>
Date: Thu, 28 Apr 2022 11:05:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] configs:
 processor-sdk: Add AM64x 8.2.0.17 config
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <a-m1@ti.com>
References: <20220428145917.3764-1-devarsht@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220428145917.3764-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 16:05:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13820


Patch applied.


On 4/28/2022 9:59, Devarsh Thakkar wrote:
> Add 8.2.0.17 AM64 config which is a version update
> on 8.2 to update DDR configuration for acheiving
> 1600 MT/s on AM64 SK.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   .../processor-sdk-08.02.00.17-config.txt          | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100755 configs/processor-sdk/processor-sdk-08.02.00.17-config.txt
> 
> diff --git a/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt
> new file mode 100755
> index 0000000..f074bdc
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt
> @@ -0,0 +1,15 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
> +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,d92e20cbcd624d8d94213f48b467706bc837f38c,layers=
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

