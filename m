Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD42C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:18:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.646.1651007902866220492
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AcsG9yiz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QLIJnq019799;
	Tue, 26 Apr 2022 16:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651007899;
	bh=C4YWaiHMjrBSgsMN0Du1fLOk9ONoECdBZnVCbMICYhs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AcsG9yizpZyYP5aWAmvXjH76WDpixzfsqxf8uvPVlGUEfOEd0O6EqtcauWO7Du/hX
	 6bw1y/LzGZctIJVTtsKdiFUaIJDqilNLekMQHnRpEkGE6eRFd6Pyz+fH4jbYJIPN+x
	 IUQ6PO97W4c+qhRiJJsHGvj/zvaMySiL3d9MC2to=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QLIJCY091690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 16:18:19 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 16:18:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 16:18:18 -0500
Received: from [10.250.34.159] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QLIIiV039103;
	Tue, 26 Apr 2022 16:18:18 -0500
Message-ID: <7e090a33-d9e9-111d-026d-ce31688dc013@ti.com>
Date: Tue, 26 Apr 2022 16:18:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][oe-layersetup PATCH 2/6] Add layers for split
 meta-ti master branch
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-2-afd@ti.com> <20220426210924.GD9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220426210924.GD9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13806

On 4/26/22 4:09 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 26, 2022 at 03:02:47PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> The latest master meta-ti split into two layers, add new layers here.
> 
> Can you swap the order of layers in meta-ti?
> Other repos usually have the main repo listed first.
> 


That changes the order they go into to bblayers, don't we want
meta-ti-bsp to be the bottom layer?

Andrew


> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   configs/arago-master-config.txt      | 2 +-
>>   configs/distroless-master-config.txt | 2 +-
>>   configs/poky-master-config.txt       | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
>> index bd0ccec..532a145 100644
>> --- a/configs/arago-master-config.txt
>> +++ b/configs/arago-master-config.txt
>> @@ -7,7 +7,7 @@ meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-d
>>   meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>>   meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
>>   meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>> -meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
>> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>>   meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>>   oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
>> index 8211bd5..5c55459 100644
>> --- a/configs/distroless-master-config.txt
>> +++ b/configs/distroless-master-config.txt
>> @@ -1,7 +1,7 @@
>>   # This file takes repo entries in the format
>>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>>   bitbake,git://git.openembedded.org/bitbake,master,HEAD
>> -meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
>> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>>   meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>>   oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
>> index f213411..b395ff8 100644
>> --- a/configs/poky-master-config.txt
>> +++ b/configs/poky-master-config.txt
>> @@ -2,7 +2,7 @@
>>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>>   bitbake,git://git.openembedded.org/bitbake,master,HEAD
>>   poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
>> -meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
>> +meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>>   meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>   OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
>> -- 
>> 2.17.1

