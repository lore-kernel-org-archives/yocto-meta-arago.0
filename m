Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45968C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 06:04:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6032.1713333862084789510
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 23:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Pa+B534m;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43H64JAD026463;
	Wed, 17 Apr 2024 01:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713333859;
	bh=OKpDDHMHPVi2ByCs6zY3KBjedNz2+OneJMNY4WEjcXU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Pa+B534m2gDfowslrXncztLl3C8/w619mV/z/MkQxrg41D2KA7bCL8DPbO7beBY3s
	 /RfCg99YIeqmpEbNdxhEJuDP8gBgQ6gae2+4cLv6kUJWplhB1+35NuqiE28RC0dlvY
	 R8Au/Oa/Bg4W4VjAZcN8WITQzbbIXptjSAjgJnus=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43H64IaU021568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 01:04:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 01:04:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 01:04:18 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43H64GWm036250;
	Wed, 17 Apr 2024 01:04:17 -0500
Message-ID: <95872b6f-8f2d-424c-b4af-8dfb99b65d70@ti.com>
Date: Wed, 17 Apr 2024 11:34:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-core: dbus: Remove
 redundant bbappend
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Gyan
 Gupta <g-gupta@ti.com>
References: <20240415055542.3372278-1-c-shilwant@ti.com>
 <20240415195912.GE28791@denix.org>
 <7fb114e0-1b08-4a98-ab71-af45067779f0@ti.com>
 <20240416150541.GH28791@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240416150541.GH28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Apr 2024 06:04:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15295

Hi Denys,

On 16/04/24 20:35, Denys Dmytriyenko wrote:
> On Tue, Apr 16, 2024 at 10:53:12AM +0530, Chirag Shilwant wrote:
>> Hi Denys,
>>
>> On 16/04/24 01:29, Denys Dmytriyenko wrote:
>>> As dbus is dual-licensed, back in the day it was required to choose which one
>>> is used when distributing the package with Arago and TI-SDK, hence:
>>>
>>> https://git.yoctoproject.org/meta-arago/commit/?id=3fa4af20ea823b91448ad03a8ef5da053890dc12
>>>
>>> Not sure if that's still the case though...
>>
>> Yes, I see the dbus recipe is still dual licensed [1]. I thought the
>> bbappend in arago was to ensure
>> that we have the appropriate SPDX license identifiers as earlier
>> oe-core used a different format. Btw, can you help me understand why
>> picking asingle license is essential...for software manifests?
> I don't have all the details, but IIRC back in the day OSRB/Legal preferred
> making such selection in the SDK manifest, clearly statiing which one of the
> options is used by TI and distributed to customers.
>
> Again, whether this is still a concern needs to be confirmed with OSRB/Legal.

I don't think this is still a concern now. If we check the software 
manifest of AM62P
for SDK 9.2 release [1], I see many packages having a multi-license 
format (eg. nativesdk-git)
and we had the approval from OSRB & Legal team before publishing this 
manifest on ti.com

[1]: 
https://dr-download.ti.com/software-development/software-development-kit-sdk/MD-9ti3Ig9hNi/09.02.01.09/software_manifest_yocto.htm 



>
>
>> [1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/dbus/dbus_1.14.10.bb?h=scarthgap#n8
>>
>>
>>> On Mon, Apr 15, 2024 at 11:25:42AM +0530, Chirag Shilwant wrote:
>>>> dbus recipe from oe-core:meta already has the appropriate
>>>> SPDX license identifiers [1]. Hence, remove this bbappend.
>>>>
>>>> [1]: https://git.openembedded.org/openembedded-core/plain/meta/recipes-core/dbus/dbus_1.14.10.bb?h=scarthgap
>>>>
>>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>>> ---
>>>>   meta-arago-distro/recipes-core/dbus/dbus_%.bbappend | 3 ---
>>>>   1 file changed, 3 deletions(-)
>>>>   delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
>>>>
>>>> diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
>>>> deleted file mode 100644
>>>> index da612c59..00000000
>>>> --- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
>>>> +++ /dev/null
>>>> @@ -1,3 +0,0 @@
>>>> -PR:append = ".arago1"
>>>> -
>>>> -LICENSE = "GPL-2.0-or-later"
>>>> -- 
>>>> 2.34.1

