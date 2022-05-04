Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E369C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 18:05:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.739.1651687498131015246
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 May 2022 11:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R2pWePgg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244I4s3A103931;
	Wed, 4 May 2022 13:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651687494;
	bh=Bvu4MBwAqoz5I4YDiX517aQIM7DRlmJp5dJjiyGeX+k=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=R2pWePgg+ZtYzOdU7L0VjJhvf2How5rKQgTx+w4/OqISFctgiqz2uT13xGUe3vcti
	 ZzJOZD01HWc0NLi2L07rN5jP4lH49VsUbExLt/PS4La47Xn2zuB75a1T2J+17LVSXJ
	 fN42R9W7lNbLRYTOwz4DyrIrXEcA6FomhJrw5zLs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244I4s0H019894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 13:04:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 13:04:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 13:04:53 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244I4rlF032038;
	Wed, 4 May 2022 13:04:53 -0500
Message-ID: <a8a7ab58-1282-56bf-eabb-063a1dfbaa3b@ti.com>
Date: Wed, 4 May 2022 13:04:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-arago] [oe-layersetup][PATCH] configs: add Kirkstone
 configs for arago, poky and distroless
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
References: <16EB61A5798D3F09.8534@lists.yoctoproject.org>
 <20220504180011.GD9834@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220504180011.GD9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 May 2022 18:05:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13835


Patch applied.


On 5/4/2022 13:00, Denys Dmytriyenko wrote:
> Ping.
> 
> On Mon, May 02, 2022 at 07:50:46PM +0000, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> The following layers have not branched off yet and will be updated later:
>>
>> meta-virtualization
>> meta-ti
>> meta-arago
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   configs/arago-kirkstone-config.txt      | 14 ++++++++++++++
>>   configs/distroless-kirkstone-config.txt |  8 ++++++++
>>   configs/poky-kirkstone-config.txt       | 10 ++++++++++
>>   3 files changed, 32 insertions(+)
>>   create mode 100644 configs/arago-kirkstone-config.txt
>>   create mode 100644 configs/distroless-kirkstone-config.txt
>>   create mode 100644 configs/poky-kirkstone-config.txt
>>
>> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
>> new file mode 100644
>> index 0000000..00c96d6
>> --- /dev/null
>> +++ b/configs/arago-kirkstone-config.txt
>> @@ -0,0 +1,14 @@
>> +# This file takes repo entries in the format
>> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>> +
>> +bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
>> +meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
>> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
>> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
>> +meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>> +meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
>> +oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> +OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
>> diff --git a/configs/distroless-kirkstone-config.txt b/configs/distroless-kirkstone-config.txt
>> new file mode 100644
>> index 0000000..dc9c088
>> --- /dev/null
>> +++ b/configs/distroless-kirkstone-config.txt
>> @@ -0,0 +1,8 @@
>> +# This file takes repo entries in the format
>> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>> +bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
>> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>> +meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
>> +oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> +OECORELOCALCONF=./sample-files/local-v2.conf.sample
>> diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-config.txt
>> new file mode 100644
>> index 0000000..024e1c6
>> --- /dev/null
>> +++ b/configs/poky-kirkstone-config.txt
>> @@ -0,0 +1,10 @@
>> +# This file takes repo entries in the format
>> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>> +
>> +bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
>> +meta-yocto,git://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=meta-poky:meta-yocto-bsp
>> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>> +meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
>> +oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> +OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
>> -- 
>> 2.25.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13834): https://lists.yoctoproject.org/g/meta-arago/message/13834
> Mute This Topic: https://lists.yoctoproject.org/mt/90844272/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

