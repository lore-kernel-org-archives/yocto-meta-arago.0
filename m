Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD9BCDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 09:25:55 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.277850.1697621147603585839
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 02:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qEmGeNlQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-ravikumar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39I9PkoH003828
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 04:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697621146;
	bh=MI6KDaVySmggZ0l8k8CyprXq3L/5wrTSuw7CRp6wSv4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qEmGeNlQ1KOJI7oUGetbgh7Xo8BP9FGRqgEnFRibNXK8bi6MLMMKN2TM3g/XWojoW
	 C/2g4EyuHFbCvQx9RJoyHfSLjGB7/f1KxBSMwaTzU/0OnDtaaXafuR9UTb9GUlQMxI
	 2hotaxZFReAsrtB2NPxVKBroY/goUbxxr9zEvWfA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39I9Pk7k051168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 04:25:46 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Oct 2023 04:25:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Oct 2023 04:25:46 -0500
Received: from [10.24.69.154] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39I9PhhC029864;
	Wed, 18 Oct 2023 04:25:44 -0500
Message-ID: <23546fe4-4fcb-484e-88ec-bd1ce68c3179@ti.com>
Date: Wed, 18 Oct 2023 14:55:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH] gstreamer1.0-plugins-good:
 wave5-codec: Set max buffers same as min buffers
To: Prasanth Mantena <p-mantena@ti.com>, Devarsh Thakkar <devarsht@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        <denys@ti.com>
References: <20231017115119.306574-1-r-ravikumar@ti.com>
 <28e54a94-ce33-4dd3-ec49-9e8c8db01486@ti.com>
 <20231018074948.cnyklhnuuluabrbx@uda0496754>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <20231018074948.cnyklhnuuluabrbx@uda0496754>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 09:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14949


On 18/10/23 13:19, Prasanth Mantena wrote:
> On 13:08-20231018, Devarsh Thakkar wrote:
>> Hi Rahul,
>>
>> On 17/10/23 17:21, Rahul T R wrote:
>>> wave5 codec driver can not work with new buffers allocated post stream
>> I am not aware of such bug in wave5 driver also iiuc it's actually not a wave5
>> driver problem but probably related to v4l2 plugin not able to provide the
>> buffer with same index always to the driver for which the workaround patch
>> 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch was made to maintain 1-to-1
>> between v4l2 buffer indices and buffer.
>>
>> I assume the problem related to the workaround not able to handle 1-to-1 for
>> dynamically allocated buffers post streaming right(if required you can
>> probably check with Prasanth if it would be possible to support this), if
>> that's the case then I would suggest to update commit message likewise.
>>
>>> start. To avoid issues because of this set max_buffers same as min
>>> buffers, so that new buffers are not allocated post stream start
>>>
>>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> With the suggested changes in commit message,
>>
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> Agreed. This is not really a bug in driver. It is on the plugin side,
> where the mapping of buffers with v4l2 indices is not being maintained.
> Please modify the commit message.
>
> With this suggestion,
>
> Reviewed-by: Prasanth Babu Mantena <p-mantena@ti.com>

Hi Devarsh, Prasanth,

Thanks for the review
I have send a v2 addressing the comments

https://lists.yoctoproject.org/g/meta-arago/message/14948

Regards
Rahul T R

>> Regards
>> Devarsh
>>> ---
>>>   .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch      | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
>>> index a1471661..bf73e257 100644
>>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
>>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
>>> @@ -14,9 +14,9 @@ Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>>>   ---
>>>    sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
>>>    sys/v4l2/gstv4l2bufferpool.h |  2 ++
>>> - sys/v4l2/gstv4l2object.c     | 15 ++++++++++++---
>>> + sys/v4l2/gstv4l2object.c     | 16 +++++++++++++---
>>>    sys/v4l2/gstv4l2videodec.c   | 20 ++++++++++++++------
>>> - 4 files changed, 42 insertions(+), 12 deletions(-)
>>> + 4 files changed, 43 insertions(+), 12 deletions(-)
>>>   
>>>   diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
>>>   index d85f036..e6a60dc 100644
>>> @@ -86,7 +86,7 @@ index ee60540..eff1cf2 100644
>>>        own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
>>>   
>>>        /* for the downstream pool, we keep what downstream wants, though ensure
>>> -@@ -5049,8 +5053,13 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
>>> +@@ -5049,8 +5053,14 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
>>>        min = MAX (min, GST_V4L2_MIN_BUFFERS (obj));
>>>   
>>>        /* To import we need the other pool to hold at least own_min */
>>> @@ -95,6 +95,7 @@ index ee60540..eff1cf2 100644
>>>   +    if (obj_pool == pool) {
>>>   +        if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
>>>   +            min = own_min;
>>> ++            max = min;
>>>   +        } else {
>>>   +            min += own_min;
>>>   +        }

