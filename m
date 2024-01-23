Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A355C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 15:03:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.14502.1706022184858136476
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 07:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NaIOINYd;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-ravikumar@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40NF34sf056046
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 09:03:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706022184;
	bh=2ZXkx2EsqFnTsqQ1L8qfAKBIkZuU0gkns0RmZ8HGoPs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NaIOINYdIBEL4d+hoa9AnqZ69qKK65ooqeJRgrqSB9C6JUmceUxFUWgQL1umGw1bb
	 GqSVmnjSVgqlZaK0HEAdzTJ/imlNrCy+QuySX2xuQvxo1HNRLFsupqTedg6Fy075KL
	 g/O1Ir/uo9DcbWievJ4TLBDceFDNpkRyxF5Q0Wsc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40NF34kT068298
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 09:03:04 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jan 2024 09:03:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jan 2024 09:03:03 -0600
Received: from [10.24.69.154] (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40NF31pt006757;
	Tue, 23 Jan 2024 09:03:01 -0600
Message-ID: <04659a76-06fb-4eef-84c9-ce3efaa08cb8@ti.com>
Date: Tue, 23 Jan 2024 20:33:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH 2/2]
 gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI capture
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <j-luthra@ti.com>, <denys@ti.com>, <b-brnich@ti.com>,
        <p-mantena@ti.com>
References: <20240122162917.822825-1-r-ravikumar@ti.com>
 <20240122162917.822825-3-r-ravikumar@ti.com>
 <000a8c48-7f85-9a32-216a-4cae407c86ee@ti.com>
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <000a8c48-7f85-9a32-216a-4cae407c86ee@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jan 2024 15:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15083

Hi Devarsh,

Thanks for the review !


On 23/01/24 20:05, Devarsh Thakkar wrote:
> Hi Rahul,
>
> Thanks for the patch.
>
> On 22/01/24 21:59, Rahul T R wrote:
>> This is required to avoid the frame drops and increase the tolrence
>> for CSI capture using gsteamer
>>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> ---
>>   ...1-gstv4l2object-Increase-min-buffers.patch | 29 +++++++++++++++++++
>>   .../gstreamer1.0-plugins-good_1.20.%.bbappend |  3 +-
>>   2 files changed, 31 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch
>> new file mode 100644
>> index 00000000..f9ff4faa
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch
>> @@ -0,0 +1,29 @@
>> +From 9c5e0ee19be372c0477a509889d76ceaf97bdc87 Mon Sep 17 00:00:00 2001
>> +From: Rahul T R <r-ravikumar@ti.com>
>> +Date: Tue, 10 Oct 2023 14:42:13 +0530
>> +Subject: [PATCH] gstv4l2object: Increase min buffers for CSI capture
>> +
>> +This will improve the latency and tolerance
>> +of CSI pipeline
>> +
> I can understand the tolerance but how does it increase latency.

Starvation can lead to DMA error and driver will have to trigger drain DMA,
which might lead to some latency

>> +Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> +---
>> + sys/v4l2/gstv4l2object.c | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
>> +index 4ce9fac..9f5a85b 100644
>> +--- a/sys/v4l2/gstv4l2object.c
>> ++++ b/sys/v4l2/gstv4l2object.c
>> +@@ -5172,6 +5172,8 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
>> +      * pool, we'll need what the driver one, and one more, so we can dequeu */
>> +     if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
>> +         own_min = obj->min_buffers + 3;
>> ++    } else if (0 == strcmp(obj->vcap.driver, "j721e-csi2rx")) {
>> ++        own_min = obj->min_buffers + 4;
> Could you please mention in commit message why our csi driver requires extra
> buffers ? Is it due to a hardware limitation ? Also mention the use-case and
> pipeline for which this is helping.

Sure, will add more details

>
> I believe gstreamer has a fail safe flow where it allocates buffer on the fly
> in case there is a starvation, ain't that helping ?

Can you point me to this code, I am not sure why this is not helping
need to analyze the code

> I think it is okay to have this here as short term as we have other patches,
> but from upstream point of view it looks like a hack so let's document the
> reason why we did it here so that it can act as reference.

Agreed, will add more details in the commit

> Also I believe this increases the memory footprint in v4l2 export mode ?
> For already memory constrained platforms such as am62xSIP this may have a
> negative impact. I see some vendors putting in extra env variables to let user
> modify the buffering part.

This does not affect the export mode, min buffers are increased only
for import mode


Regards
Rahul T R

> Regards
> Devarsh
>
>> +     } else {
>> +         own_min = obj->min_buffers + 1;
>> +     }
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
>> index 7ad943f6..bb4fdc09 100644
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
>> @@ -5,6 +5,7 @@ SRC_URI:append = " \
>>       file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
>>       file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
>>       file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>> +    file://0001-gstv4l2object-Increase-min-buffers.patch \
>>   "
>>   
>> -PR:append = ".arago1"
>> +PR:append = ".arago2"

