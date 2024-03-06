Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6FDC54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 03:05:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3677.1709694312069673414
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 19:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vsh8spop;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 426356V0052472;
	Tue, 5 Mar 2024 21:05:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709694306;
	bh=PjwGatwRlHZC8Nu2ScIrzbZLqlbDHmZFERTjxaqAFoI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vsh8spop0LhFc8v8ubx/BIxS22d+xU8rAfvd+j8iBP7W0L66+I/HPwFJqnBTTvOfN
	 Y89RMa32OjXli51M2PDPdQiiWaN+tMtoxU4ioBEt5uXFI5LS/NEacpsGytXNULOWz0
	 FvMQMzar8JSKj18cCUzC5FO1iVybBrupkSXzKZY0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4263560P006956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 21:05:06 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 21:05:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 21:05:06 -0600
Received: from [10.249.32.68] ([10.249.32.68])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 426356l7019232;
	Tue, 5 Mar 2024 21:05:06 -0600
Message-ID: <440863c1-1899-43c8-b3cc-90f7380b9a50@ti.com>
Date: Tue, 5 Mar 2024 21:05:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] websocketd: Add GOPROXY variable
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240305230707.24641-1-reatmon@ti.com>
 <20240306001702.GJ6072@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240306001702.GJ6072@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Mar 2024 03:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15227



On 3/5/2024 6:17 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 05, 2024 at 05:07:07PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> As of go v1.21, GOPROXY is required to be set to something other than
> 
> Other than what?

Oops.  I had other stuff typed there and removed it, but failed to go 
back and make the sentence coherent...  I'll fix it tomorrow.

>> or you get the following error:
>>
>> go: github.com/gorilla/websocket@v1.4.0: GOPROXY list is not the empty string, but contains no entries
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../recipes-devtools/websocketd/websocketd_0.4.1.bb             | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
>> index 66475726..207cd38a 100644
>> --- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
>> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
>> @@ -7,6 +7,8 @@ inherit go-mod
>>   
>>   GO_IMPORT = "github.com/joewalnes/websocketd"
>>   
>> +export GOPROXY = "https://proxy.golang.org,direct"
>> +
>>   SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master"
>>   SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
>>   
>> -- 
>> 2.17.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15226): https://lists.yoctoproject.org/g/meta-arago/message/15226
> Mute This Topic: https://lists.yoctoproject.org/mt/104756208/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

