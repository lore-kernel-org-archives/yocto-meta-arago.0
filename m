Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B9FC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 05:25:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13145.1713245144758799415
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 22:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VQ9tySuI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43G5Pg5j010786;
	Tue, 16 Apr 2024 00:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713245142;
	bh=oE9Q69GdZYLfioeBXs8VOFsrLmizQh4Oz64LCen0CSw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VQ9tySuI+4sEDBmSUELu8lETCBLK67MI0E6TmocW+tAgaGXCzARM2P73MhiENFuzP
	 R5aFXRYqULS3QOPcE+KNEsXEPgqi1R4alqD3oOMPmAG1ScVdbi2oJxMD/qB1PCYMKn
	 7GIJw0fjgqsqQrOfxMCD5j5jGIgtEREP5O19qpx8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43G5Pg7M025957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 00:25:42 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 00:25:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Apr 2024 00:25:41 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43G5Pd7q034993;
	Tue, 16 Apr 2024 00:25:40 -0500
Message-ID: <5d9c4555-e2a2-442d-8cec-8c7b2cfb3103@ti.com>
Date: Tue, 16 Apr 2024 10:55:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-graphics: freetype:
 Remove redundant bbappend
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Gyan
 Gupta <g-gupta@ti.com>
References: <20240415094331.3535927-1-c-shilwant@ti.com>
 <20240415200039.GF28791@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240415200039.GF28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 05:25:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15287

Hi Denys,

On 16/04/24 01:30, Denys Dmytriyenko wrote:
> Same comment as with dbus.

freetype as well seems to have multiple licenses [1]

[1]: 
https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/freetype/freetype_2.13.2.bb?h=scarthgap#n10 



>
>
> On Mon, Apr 15, 2024 at 03:13:31PM +0530, Chirag Shilwant wrote:
>> freetype recipe from oe-core:meta already has the appropriate
>> SPDX license identifiers [1]. Hence, remove this bbappend.
>>
>> [1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/freetype/freetype_2.13.2.bb?h=scarthgap#n10
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   .../recipes-graphics/freetype/freetype_%.bbappend              | 3 ---
>>   1 file changed, 3 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
>> deleted file mode 100644
>> index 860a0797..00000000
>> --- a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -PR:append = ".arago0"
>> -
>> -LICENSE = "GPL-2.0-or-later"
>> -- 
>> 2.34.1
>>

