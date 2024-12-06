Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2CFE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 17:12:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.42855.1733505121748885426
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 09:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yif+u+Xc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: jm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B6HBwLv051378;
	Fri, 6 Dec 2024 11:11:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733505118;
	bh=6jH9sfemWVGA7TPFpFhO1lRpAaDNqFMhbtCy5YWbkSg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yif+u+XctRD+DFOpeVe7+1YKIDRv9OEvFNx8bM1KWhZniwyvWvF2nW4rMjg2MkKUz
	 HvAFdOlrBHm04Y5mfNkhQA9t3jLHeCtS602Py2LhFkvTRA7BiwIaJL9/hF1IvfcHRS
	 Hmz0YX/xsuhYerFYUiIvoG8KoLg6s/Pmd66Fne4w=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6HBwUX110759;
	Fri, 6 Dec 2024 11:11:58 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 11:11:57 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 11:11:57 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6HBvHU097874;
	Fri, 6 Dec 2024 11:11:57 -0600
Message-ID: <7d5d9893-8010-429c-bde2-4bd888464c62@ti.com>
Date: Fri, 6 Dec 2024 11:11:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH] ti-test: Add rng-tools
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri <praneeth@ti.com>
References: <20241205201212.1114249-1-jm@ti.com>
 <20241205203925.GC23825@denix.org> <D642PNR09HV2.14HQW6M4SVQ63@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <D642PNR09HV2.14HQW6M4SVQ63@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Dec 2024 17:12:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15648

Hi Randolph, Denys,

On 12/5/24 3:09 PM, Randolph Sapp wrote:
> On Thu Dec 5, 2024 at 2:39 PM CST, Denys Dmytriyenko wrote:
>> rng-tools were removed back in 2023:
>> https://git.yoctoproject.org/meta-arago/commit/?id=dc19fed1b898cf5abdf50fa04dda7b1d9afd22ca
>>
>> and added back last September to master and scarthgap:
>> https://git.yoctoproject.org/meta-arago/commit/?id=662a5119446e7d47094a68efe8b775b3dda2b4e8
>>
>> I see you are trying to backport that to kirkstone, even though the subject
>> states master...
> 
> Yeah, noticed the tags were a bit off.

Sorry about that, this patch is supposed to be for kirkstone only.

> 
>> Anyway, based on Randolph's comments for the removal, rngd was deprecated
>> and is no longer needed - should testcases be adjusted for the removal of
>> rng-tools?
> 
> I did have a conversation with Judith about this. While I still believe the
> rng-tools service is deprecated and does nothing more than hinder general usage,
> the package itself actually has some useful tools for testing hardware RNG
> devices. I wasn't able to find any similar tools to replace them in my brief
> search.

Right, and since we added for scarthgap, could we also do the same for
kirkstone branch?

~ Judith

> 
>> On Thu, Dec 05, 2024 at 02:12:12PM -0600, Mendez, Judith via lists.yoctoproject.org wrote:
>>> Add rng-tools to the ti-test tool list.
>>>
>>> RNG testcases are failing since they require
>>> rngtest, so add rng-tools to ti-test only.
>>>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>> This patch has been previously sent and merged to scarthgap
>>> branch, but is also required for kirkstone
>>> ---
>>>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> index a80b943b..85398eaf 100644
>>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> @@ -44,6 +44,7 @@ TI_TEST_BASE = "\
>>>       powertop \
>>>       procps \
>>>       pulseaudio-misc \
>>> +    rng-tools \
>>>       rt-tests \
>>>       rwmem \
>>>       smcroute \
>>> -- 
>>> 2.46.0
> 


