Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D462FC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 22:16:26 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1821.1647987385690999224
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 15:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T4MqmFfN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: detheridge@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MMGLZW005437;
	Tue, 22 Mar 2022 17:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647987381;
	bh=PRZDvot7lGKIXVPYMmS1s462H09zg0Xl7sVABiTLzAg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=T4MqmFfNbP6Q0AK/jxlnI891LAa/+8pTLgIleT3WXF+XbF4rpaGI/zE+cV5U1taTH
	 K8kVVjL2fhJVZVKHioV26W8T5Ugz2PADySRqhCxHSWX4MzD1clCpnhgRTOAh9Jk/dt
	 VegbPzsQQnytx/3gypGl0FW6+nqKnsoBNCJ9xqSM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MMGL2m028894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 17:16:21 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 17:16:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 17:16:21 -0500
Received: from [128.247.81.152] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MMGKjK094566;
	Tue, 22 Mar 2022 17:16:20 -0500
Message-ID: <cd27dea1-9d16-38b8-611e-24a554700dbf@ti.com>
Date: Tue, 22 Mar 2022 17:16:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [meta-arago][dunfell][PATCH 2/3] packagegroup-*-graphics: add
 virtual provider for AM62x GPU driver v2
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <nm@ti.com>, <reatmon@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220322193554.24404-1-reatmon@ti.com>
 <20220322193554.24404-3-reatmon@ti.com>
 <20220322204955.kj74x5e6lx4qtghr@borrowing>
 <4adcaba5-e45d-451a-75a5-3cc8d52ce8fc@ti.com>
 <20220322221338.GT23554@denix.org>
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <20220322221338.GT23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 22:16:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13719



On 3/22/2022 5:13 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 22, 2022 at 03:58:04PM -0500, Etheridge, Darren via lists.yoctoproject.org wrote:
>>
>>
>> On 3/22/2022 3:49 PM, Nishanth Menon via lists.yoctoproject.org wrote:
>>> On 14:35-20220322, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> From: Krunal Bhargav <k-bhargav@ti.com>
>>>>
>>>> Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>>   .../conf/distro/include/arago-prefs.inc              | 12 ++++++------
>>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>> index a356c76c..7bc2ba52 100644
>>>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>> @@ -14,12 +14,12 @@ PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
>>>>   PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
>>>>   PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
>>>> -# J7 has a Rogue GPU core
>>>> -PREFERRED_PROVIDER_virtual/egl_j7 = "ti-img-rogue-umlibs"
>>>> -PREFERRED_PROVIDER_virtual/libgles1_j7 = "ti-img-rogue-umlibs"
>>>> -PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
>>>> -PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
>>>> -PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
>>>> +# K3 TI Platforms has a Rogue GPU core
>>>> +PREFERRED_PROVIDER_virtual/egl = "ti-img-rogue-umlibs"
>>>> +PREFERRED_PROVIDER_virtual/libgles1 = "ti-img-rogue-umlibs"
>>>> +PREFERRED_PROVIDER_virtual/libgles2 = "ti-img-rogue-umlibs"
>>>> +PREFERRED_PROVIDER_virtual/libgbm = "ti-img-rogue-umlibs"
>>>> +PREFERRED_PROVIDER_virtual/gpudriver = "ti-img-rogue-driver"
>>>
>>> How does this apply to k3 and leave non-k3 alone? Also, am65x for example is
>>> sgx.
>>>
>>
>> That is a very good point.  This will mess up SGX platforms.   I
>> wish we had k3_ as the prefix for the name here for all the k3
>> platforms.
> 
> There is "k3" defined and you can do _k3 override to address all K3 platforms,
> but again, some are SGX and some are RGX...
> 
> 
>> So I guess the only solution is leave all the _j7 as they were
>>
>> and add:
>> +PREFERRED_PROVIDER_virtual/egl_am62 = "ti-img-rogue-umlibs"
>> +PREFERRED_PROVIDER_virtual/libgles1_am62 = "ti-img-rogue-umlibs"
>> +PREFERRED_PROVIDER_virtual/libgles2_am62 = "ti-img-rogue-umlibs"
>> +PREFERRED_PROVIDER_virtual/libgbm_am62 = "ti-img-rogue-umlibs"
>> +PREFERRED_PROVIDER_virtual/gpudriver_am62 = "ti-img-rogue-driver"
> 
> And there's no "am62" defined, but "am62xx" :)
> 

Isn't it a partial pattern match?   If it is not the _j7 won't work for 
j721s2 either.

> 
>> Is there anything cleverer?
>>
>>>>   # This is required when using keystone devices with graphical support
>>>>   # such as Qt5
>>>> -- 
>>>> 2.17.1
> 

