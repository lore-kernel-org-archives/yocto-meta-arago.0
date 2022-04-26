Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFEBC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:29:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.692.1651008597157103710
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=r4Tbc7Wz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QLTsvY072422;
	Tue, 26 Apr 2022 16:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651008594;
	bh=jvndna9Ow/trFrNu4etLpGblf5CdJijqd70gdkaHTwg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=r4Tbc7Wz/uHXcc83qx4TInZVYFFs9lkaAGTCnyyiC4LaXa4JVmSVaBKf1VHyU8SWv
	 RIZUfr+BST0Mm722QwpYYTEBKCG8EY5LAu58isTVKAjwfn90Up/3cuniecPnvSE6XD
	 Oi6UmfLpZwAiWl4brG86PWYtYu0ezqeUvaU/TZ9E=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QLTsQe043431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 16:29:54 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 16:29:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 16:29:53 -0500
Received: from [10.250.34.159] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QLTrYZ024531;
	Tue, 26 Apr 2022 16:29:53 -0500
Message-ID: <d23f31d1-94c6-9de3-89f7-c88a0809f093@ti.com>
Date: Tue, 26 Apr 2022 16:29:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][oe-layersetup PATCH 6/6] Build Poky using meta-yocto
 instead of combined poky repo
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-6-afd@ti.com> <20220426211834.GG9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220426211834.GG9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:29:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13812

On 4/26/22 4:18 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 26, 2022 at 03:02:51PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> The Poky repo contains meta-yocto plus extra bits needed for an
>> all-in-one build, but since we already pull in tools with this
>> script like bitbake and oe-core, lets use those and save some
>> space/bandwidth.
> 
> There are other nuances of "flattened" Poky repo (commits are different,
> plus some other minor bits and pieces). The only overhead is to clone Bitbake
> twice (not OE-Core), which is neglectable and allows building the true Poky,
> instead of OE-Core + meta-yocto/meta-poky... :)
> 


Could you let me know what the other "minor bits and pieces" we are concerned
about losing here? It seems the "flattened" Poky repo is an automatic merge of
Bitbake + OE-Core + meta-yocto/meta-poky + some random scripts we don't care about
since we do the same thing here in oe-layersetup.

If we want "true" Poky, then we just clone flattened Poky and don't need
oe-layersetup at all here.

Andrew


> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   configs/poky-master-config.txt | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
>> index b395ff8..a541501 100644
>> --- a/configs/poky-master-config.txt
>> +++ b/configs/poky-master-config.txt
>> @@ -1,8 +1,10 @@
>>   # This file takes repo entries in the format
>>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>> +
>>   bitbake,git://git.openembedded.org/bitbake,master,HEAD
>> -poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
>> +meta-yocto,git://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
>>   meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
>>   meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>> +oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
>>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>   OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
>> -- 
>> 2.17.1

