Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2F2C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 05:23:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.13122.1713244998296640775
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 22:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IXA1RGZi;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43G5NFQJ035725;
	Tue, 16 Apr 2024 00:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713244995;
	bh=JjKrFmoBBZjXzn9FNhzj1/K0Bmllgy+4Mf1GfQdXU0g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IXA1RGZiWXXBEB+W8zZ1NLh+3QTw2zMS1d3bWj/ey9IrvwyGEvpeOIiycOH2haihU
	 YaJNBJE216OtNPWO1RGZXC8IC+BFAY6feM9MsXr62QelB7uR/qYHjdggLzOzP2US0e
	 7Ye3r9+5C/skdiKyIMEe/Cq7Gg2FIX8gT8o3dDiw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43G5NF0Z026619
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 00:23:15 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 00:23:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Apr 2024 00:23:14 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43G5NC8b030862;
	Tue, 16 Apr 2024 00:23:13 -0500
Message-ID: <7fb114e0-1b08-4a98-ab71-af45067779f0@ti.com>
Date: Tue, 16 Apr 2024 10:53:12 +0530
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
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240415195912.GE28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 05:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15286

Hi Denys,

On 16/04/24 01:29, Denys Dmytriyenko wrote:
> As dbus is dual-licensed, back in the day it was required to choose which one
> is used when distributing the package with Arago and TI-SDK, hence:
>
> https://git.yoctoproject.org/meta-arago/commit/?id=3fa4af20ea823b91448ad03a8ef5da053890dc12
>
> Not sure if that's still the case though...


Yes, I see the dbus recipe is still dual licensed [1]. I thought the 
bbappend in arago was to ensure
that we have the appropriate SPDX license identifiers as earlier oe-core 
used a different format. Btw, can you help me understand why picking 
asingle license is essential...for software manifests?

[1]: 
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/dbus/dbus_1.14.10.bb?h=scarthgap#n8 



>
>
> On Mon, Apr 15, 2024 at 11:25:42AM +0530, Chirag Shilwant wrote:
>> dbus recipe from oe-core:meta already has the appropriate
>> SPDX license identifiers [1]. Hence, remove this bbappend.
>>
>> [1]: https://git.openembedded.org/openembedded-core/plain/meta/recipes-core/dbus/dbus_1.14.10.bb?h=scarthgap
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/dbus/dbus_%.bbappend | 3 ---
>>   1 file changed, 3 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
>> deleted file mode 100644
>> index da612c59..00000000
>> --- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -PR:append = ".arago1"
>> -
>> -LICENSE = "GPL-2.0-or-later"
>> -- 
>> 2.34.1

