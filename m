Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30F3C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 14:19:12 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.19772.1667485144834279635
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Nov 2022 07:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MPVfF7nb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A3EJ4R8105028
	for <meta-arago@lists.yoctoproject.org>; Thu, 3 Nov 2022 09:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667485144;
	bh=90Fy8q0ACU94pwN2wuCgnk6tUx7BAXAFQXH1QHsHkhk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=MPVfF7nbhhCk5IKKwpBW9k29dEV5hycq8TPLzaBzg8x2nsZBNdCeiO4yY6R3Mxdx4
	 OzIlisf1izH2wdd8wRqX53Dh7L5tdBzgRcS1aOb9/p5aa3Gr3UjGUqm3a+2GaBf0GH
	 yezXRuSIc0GNFcKdbdGAiA1gpIMPcH1fQeBe9AXo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A3EJ3ff105727
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 3 Nov 2022 09:19:04 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 3 Nov
 2022 09:19:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 3 Nov 2022 09:19:02 -0500
Received: from [10.249.37.255] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A3EJ27p060414;
	Thu, 3 Nov 2022 09:19:02 -0500
Message-ID: <6afd31f6-ee95-bcb2-5d9c-ae5b3e802bbf@ti.com>
Date: Thu, 3 Nov 2022 09:19:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [meta-arago][PATCH dunfell] irqbalance: Update to v1.8.0
Content-Language: en-US
To: <vigneshr@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <171D08FE46790359.20882@lists.yoctoproject.org>
 <c72ebc8b-99a7-c3f7-7214-37091c385775@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <c72ebc8b-99a7-c3f7-7214-37091c385775@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Nov 2022 14:19:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14095



On 11/3/2022 2:43, Vignesh Raghavendra via lists.yoctoproject.org wrote:
> 
> 
> On 11/10/22 7:38 pm, Vignesh Raghavendra via lists.yoctoproject.org wrote:
>> irqbalance has fixes for ARM64 systems especially for when CONFIG_NUMA
>> is disabled, hence upgrade to v1.8.0 to take advantage of IRQ load
>> balancing on K3 SoCs
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>   .../recipes-extended/irqbalance/irqbalance_git.bbappend       | 4 ++++
>>   1 file changed, 4 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
>> new file mode 100644
>> index 000000000000..e87a65d65f47
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
>> @@ -0,0 +1,4 @@
>> +SRCREV = "99ae256d02b35778b406e598beedc8d827cdac18"
>> +PV = "1.8.0"
>> +
>> +PR_append = ".arago3"
> 
> Gentle ping?

This was merged and is in dunfell now.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14094): https://lists.yoctoproject.org/g/meta-arago/message/14094
> Mute This Topic: https://lists.yoctoproject.org/mt/94259289/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

