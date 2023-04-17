Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27987C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 23:08:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12610.1681772895424732647
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 16:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Mfe0T4m9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33HN8BNO118665;
	Mon, 17 Apr 2023 18:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681772891;
	bh=O1NbAboqnWMVBAEAy0Fcv1SXtgUe3+vznHbl/ygOdnk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Mfe0T4m9ay/9y515SDw6o07ye7bB9ebEhOeMAQBT8ykGIC/XAE8S/s5l7Za7+WsKU
	 OrTmQBUI4TNYxN/8uv3R/XpH+h+x9aW+CwqMMVVOoftAldY5pk8jjj/L2KvY4HjUSr
	 ceg5OYWpXQTjTuLHSAH319yDJfcKh9caRP7Gb3sw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33HN8BLH007770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Apr 2023 18:08:11 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 17
 Apr 2023 18:08:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 17 Apr 2023 18:08:11 -0500
Received: from [10.250.33.87] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33HN8AR1074472;
	Mon, 17 Apr 2023 18:08:10 -0500
Message-ID: <94b6af33-a7ed-e5d3-de44-81ca8a58fb2c@ti.com>
Date: Mon, 17 Apr 2023 18:08:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [DISCUSSION] Weston-Init and non-root weston
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan
 Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <1241ddde-7f9c-d8ff-2c15-d300f5c5a24a@ti.com>
 <02df0607-5aad-f70d-62d2-ffdce916201b@ti.com>
 <05fd037d-f77c-f2d7-7e92-ef11cb395e63@ti.com>
 <ca43165d-5958-0cf9-bac4-527c4bdf94ac@ti.com>
 <d47ad5c3-d613-6aec-bb38-390cda358621@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d47ad5c3-d613-6aec-bb38-390cda358621@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Apr 2023 23:08:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14320

On 4/17/23 6:01 PM, Randolph Sapp wrote:
> On 4/17/23 17:52, Andrew Davis wrote:
>> On 4/17/23 5:43 PM, Randolph Sapp wrote:
>>> On 4/17/23 17:39, Andrew Davis wrote:
>>>> On 4/17/23 5:32 PM, Randolph Sapp wrote:
>>>>> Finally getting around to weston-init issue I highlighted a while back and there's only one real issue preventing us from reusing the base weston-init recipe -- our touchscreen auto-configuration script.
>>>>>
>>>>> That script has to have root access to setup and reload udev rules and as we know setuid won't work for shell scripts.
>>>>>
>>>>> I propose we rewrite it in something that can use setuid (perl or c or something of the sort). I'm currently looking at perl as there's already quite a few core recipes that rdepend on it.
>>>>>
>>>>> Then we just need to inject it into the runWeston script and adjust the two init scripts to point at that.
>>>>>
>>>>> Any concerns or objections?
>>>>
>>>> Why not just drop out that old touchscreen script, it is a non-standard way of doing
>>>> this task and should be removed.
>>>>
>>>> Andrew
>>>
>>> It's non-standard, but that's because there really isn't a good standard for calibrating touch screens under Weston. AFAIK this is still useful.
>>
>> https://wiki.st.com/stm32mpu/wiki/How_to_calibrate_the_touchscreen
>>
>> This seems like the standard ^^
>>
>> Andrew
> 
> That does save the config for the user running weston. Currently our script saves and loads the config for all users. This could technically be seen as a regression, but it doesn't seem that bad to me.

Better question than does it provide "any benefit at all": Does the
benefit outweigh the hacky-ness and effort needed to maintain
and document it?..

Andrew

