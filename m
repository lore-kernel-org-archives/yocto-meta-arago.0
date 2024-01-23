Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D27EC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:57:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.14331.1706021874621996532
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 06:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NZK+hXW0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-ravikumar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NEvrre048757
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 08:57:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706021873;
	bh=Oxb9iEF8L5gHDotiUhRt5Dp5L4pFC3wHbVdbLkX0GT8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NZK+hXW0acLT1zLbTwOtRZTUE/bPVDRd/zMoj4bddXO4D1Y5dmdt0i9kabuW1adC0
	 olhz69nVYx12BeOH2/45OtrMBshKOKWX50F6AiUcjazrvYESL5NFJo5llPcsb357Po
	 GRJQUWaFjS/REJj2Z9eJuOWmtYONKPmfBSzjtGEY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NEvr5P017639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 08:57:53 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 08:57:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 08:57:53 -0600
Received: from [10.24.69.154] (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NEvohb128904;
	Tue, 23 Jan 2024 08:57:51 -0600
Message-ID: <8e4503ce-86ba-4afa-b1ca-d94daf59ae19@ti.com>
Date: Tue, 23 Jan 2024 20:27:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2]
 gstreamer1.0-plugins-good: Maintain same set of patches for all machines
To: Devarsh Thakkar <devarsht@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <j-luthra@ti.com>, <denys@ti.com>, <b-brnich@ti.com>,
        <p-mantena@ti.com>
References: <20240122162917.822825-1-r-ravikumar@ti.com>
 <20240122162917.822825-2-r-ravikumar@ti.com>
 <999601af-cb60-0808-0cd5-a6b6cddba6a9@ti.com>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <999601af-cb60-0808-0cd5-a6b6cddba6a9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 14:57:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15082

On 23/01/24 19:56, Devarsh Thakkar wrote:

> Hi Rahul,
>
> Thanks for the patch.
>
> On 22/01/24 21:59, Rahul T R wrote:
>> This will make it easier to maintain and it will be easier if we decide
>> to have TI fork for gstreamer.
>>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> ---
>>   .../gstreamer1.0-plugins-good_1.20.%.bbappend | 19 +------------------
>>   1 file changed, 1 insertion(+), 18 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
>> index e14a3c93..7ad943f6 100644
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
>> @@ -3,25 +3,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>>   SRC_URI:append = " \
>>       file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
>>       file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
>> -"
>> -
>> -SRC_URI:append:j721s2 = " \
>>       file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
> As you are already cleaning it up, could you please also update the indexing
> of the patches,
>
> SRC_URI:append = " \
>      file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
>      file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
>      file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>      file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>      file://0005-gstv4l2object-Increase-min-buffers.patch \
> ?
>
> Regards
> Devarsh
Hi Devarsh,

Thanks for the review !

Sure, Will fix this in v2

Regards
Rahul T R
>>       file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>>   "
>>   
>> -SRC_URI:append:j784s4 = " \
>> -    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>> -    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>> -"
>> -
>> -SRC_URI:append:am62axx = " \
>> -    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>> -    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>> -"
>> -
>> -SRC_URI:append:am62pxx = " \
>> -    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>> -    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>> -"
>> -PR:append = ".arago0"
>> +PR:append = ".arago1"

