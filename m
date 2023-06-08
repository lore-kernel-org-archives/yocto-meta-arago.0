Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A0FC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 16:04:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.13442.1686240245411458644
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 09:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xkD5o9+b;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358G44Fb103774
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 11:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686240244;
	bh=ZxUhhdLthhpAMnPCt2NCNAiUDW+57BQHiF+O7mbPmcQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xkD5o9+bjgr7n2b5WVTkTYo5qNW1eZN9h2i6lHazXym4dpZCyoH+QHCD/vQ/xEltZ
	 9+nvcgbftiynefkMIchBwIPOvwlabIqajL7H5V2y6a9DPt3EOleJz8etKAvL7QDybx
	 BYXU6dFmIJYm1C93EDF4dU90NPnzI0bzOTzl45yk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358G44J3125352
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 11:04:04 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 11:04:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 11:04:03 -0500
Received: from [10.250.37.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358G43F9032279;
	Thu, 8 Jun 2023 11:04:03 -0500
Message-ID: <4002a493-fa08-f63e-d826-e60a580f4180@ti.com>
Date: Thu, 8 Jun 2023 11:04:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] receipes-multimedia:
 gstreamer: Add kmssink support
Content-Language: en-US
To: "Brnich, Brandon" <b-brnich@ti.com>,
        "Etheridge, Darren"
	<detheridge@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
CC: "Thakkar, Devarsh" <devarsht@ti.com>
References: <20230522175821.510236-1-b-brnich@ti.com>
 <1d72f6df-5f49-669d-1a50-d395c7b1c544@ti.com>
 <4eb452df9ea8424592a290145ed9805b@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4eb452df9ea8424592a290145ed9805b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 16:04:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14539

On 6/6/23 1:52 PM, Brnich, Brandon wrote:
> Hello Andrew,
> 
>> -----Original Message-----
>> From: Davis, Andrew <afd@ti.com>
>> Sent: Monday, May 22, 2023 2:22 PM
>> To: Brnich, Brandon <b-brnich@ti.com>; Etheridge, Darren
>> <detheridge@ti.com>; meta-arago@lists.yoctoproject.org
>> Cc: Thakkar, Devarsh <devarsht@ti.com>
>> Subject: Re: [meta-arago][master/kirkstone][PATCH] receipes-multimedia:
>> gstreamer: Add kmssink support
>>
>> On 5/22/23 12:58 PM, Brandon Brnich via lists.yoctoproject.org wrote:
>>> Remove the old bbapend files that dealt with old gstreamer version.
>>> These files applied patches to hack gstreamer to work with our
>>> devices. We are no longer carrying these patches into kirkstone. Our
>>> devices should work with the kirkstone packaged gstreamer.
>>>
>>
>> The important part of these patches was GST DRM Allocator support, quick
>> check I see it used by:
>>
>> gstreamer1.0-plugins-vpe
>> gstreamer1.0-plugins-ducati
>>
>> Would be nice to keep multimedia acceleration working on all the non-K3
>> platforms..
>>
>> I'm guessing these could be converted without too much effort to one of
>> these[0] and if so do you have any timelines for that?
> 
> At this point in time, there is no timeline for supporting these old platforms.
> 
> Porting these patches are not trivial as gstreamer structure has changed quite
> significantly since 1.16. For K3 platforms, the GST DRM Allocator is not required.
> 
> Not sure what best course of action is. Is it best to not accept these patches and leave
> the bb append files in the tree where they aren't necessarily hurting anything because
> the revision number is wrong so none of these patches are being applied?
> 
> Should this series be accepted?
> With this, we are optimistic in that someone will eventually update the patches to enable DRM allocation
> on these out of date platforms.
> 

Optimism isn't going to fix gstreamer. No one is going to "eventually" fix this and we
should just be honest with ourselves about that. Just remove them. Make a new patch for that.

Also in a different patch, if you need kmssink, be sure to explain "why" you need it,
do not just describe what your patch does in the commit message.

Andrew

> If dropping ducati and vpe support is chosen, then [0] should be accepted
> because kmssink enablement is required on K3 platforms and since nothing else needs to be
> changed on gst-plugins-bad, arago.conf seems to be the place to do it. Denys also made that remark
> here [1]. I can send in another series to just delete this bbapend as a whole since enablement is not
> needed here.
> 
> Gst-plugins-good will need to stay because there is a patch that will need to be carried here.
> 
> Regardless, this series will need a v2. Just trying to figure out the best way to approach this problem.
> 
> [0] https://lists.yoctoproject.org/g/meta-arago/topic/98990987#14426
> [1] https://lists.yoctoproject.org/g/meta-arago/topic/99070450#14434
> 
>>
>> [0]
>> https://gstreamer.freedesktop.org/documentation/allocators/index.html?gi
>> -language=c
>>
>> Andrew
> 
> Best,
> Brandon

