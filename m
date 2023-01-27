Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBC7C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:39:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.110207.1674844745709661441
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OO6i+vVV;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30RId0ET033103;
	Fri, 27 Jan 2023 12:39:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674844740;
	bh=a03Bmj0Vv2KEw61mYAGNx1t0zk7UfgJxLpRXX7P2nMc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OO6i+vVVoAwZcJ1GWHJJHZogIHTprIvNXJR8Au0eU/YIr8sEOPvISlCW16P6HKRgh
	 alSckrEGIX4hDGorMRLQTWnIz3t2/qbgZVIWKY6XeZz58HcDSdGyyl68mwkH5Pq2gw
	 CEpTI0DxQgrMqsqkNB0xJRWCKxeOIUAT0ddyvzaw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30RId0LY045448
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Jan 2023 12:39:00 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 27
 Jan 2023 12:39:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 27 Jan 2023 12:39:00 -0600
Received: from [10.250.32.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30RIcxCA058748;
	Fri, 27 Jan 2023 12:38:59 -0600
Message-ID: <d655d5eb-c380-7deb-45c3-a3e78c03a688@ti.com>
Date: Fri, 27 Jan 2023 12:38:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arago] [PATCH] all: Remove excessive switches based on gpu
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <rs@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230124231733.2219206-1-rs@ti.com>
 <20230126205801.GE22689@denix.org> <D1D4PR.W8OT1AZZ313H@ti.com>
 <46352935-21d8-680c-776b-580bdc333ce6@ti.com>
 <0c318fc9-17b6-7a33-714a-64acb12b48de@ti.com>
 <173E3C7B75F9B49E.686@lists.yoctoproject.org>
 <20230127181324.GH22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230127181324.GH22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:39:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14194

On 1/27/23 12:13 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 27, 2023 at 01:03:04PM -0500, Denys Dmytriyenko wrote:
>> On Fri, Jan 27, 2023 at 10:52:34AM -0600, Ryan Eatmon wrote:
>>>
>>>
>>> On 1/27/2023 9:52, Andrew Davis wrote:
>>>> On 1/26/23 6:51 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>>>> On Thu, Jan 26 2023 at 03:58:01 PM -0500, Denys Dmytriyenko
>>>>> <denis@denix.org> wrote:
>>>>>> I'm realizing now that simply depending on "opengl"
>>>>>> DISTRO_FEATURES won't be
>>>>>> enough, unfortunately.
>>>>>>
>>>>>> The issue is that DISTRO_FEATURES are set by the distro globally for all
>>>>>> machines, whether with accelerated graphics, display w/o acceleration or
>>>>>> completely headless. E.g. when building for J7200, "opengl"
>>>>>> will be set, but
>>>>>> none of the graphics packages should be built or installed
>>>>>> into the image.
>>>>>>
>>>>>> So, some sort of check for MACHINE_FEATURES or PREFERRED_PROVIDER (less
>>>>>> elegant) would still be needed in some places...
>>>>>
>>>>> Arguably that's a package group / distro target issue. I believe
>>>>> when a user selects the default image with all features enabled
>>>>> for J721E and J721S2 the package selection should be equivalent
>>>>> (or at least as equivalent as possible with the stuff going on
>>>>> now in meta-ti) to align with the distro features selected. I
>>>>> believe the solution to this is to add a headless target/image
>>>>> that removes Qt, GTK, etc. from the selected package groups and
>>>>> to suggest the use of that instead if users want a truly
>>>>> headless distro.
>>>>>
>>>>>
>>>>
>>>> Agree here, I believe this was the solution we came up with in
>>>> our call the other day.
>>>>
>>>> I'd go as far as suggesting we drop the "default" image and try to match
>>>> Ubuntu naming here. Have 3 images: Desktop, Server, and IoT. (IoT is
>>>> a rebranded tisdk-thinlinux-image). User selects the one that matches
>>>> their usecase, no need to force them into one bucket automatically based
>>>> on their hardware.
>>>>
>>>> Andrew
>>>
>>>
>>> That level of renaming will likely require a broader audience.  I
>>> agree that it would be clearer naming to follow what other
>>> distributions do and not invent our own names.
>>
>> Agree. As I mentioned on the call yesterday, last round of image (re-)naming
>> took quite a while and lots of effort to get everyone on the product side
>> aligned and agree...
> 
> BTW, you should still be able to find the corresponding internal Confluence
> page with that activity and related discussions.
> 

Sure, I'll can go look for that at some point, but for now I'll just take
your word for it.

> 
>> Moreover, images is just part of the problem - some thought needs to be put
>> into how the devkit is produced (and or named) and the top-level SDK product
>> bundle, which combines all images, devkit and docs/manifests.
> 

So this is a core point, this (meta-ti/meta-arago) are community projects. I know
who sponsors them and signs our paychecks, but we do all this out in the open for a
reason. We would like community support; and if we go against the grain to appease
the BUs (Business Units for those following along at home) then we might lose some
of that benefit.

The BUs have their own OE layers that, although they have external facing mirrors,
they do all their development internally and all their decisions can be made to
to serve the BUs' goals. Not saying let's go intentionally make their life difficult
or not consider them at all, but let's also not tangle up Arago solely to make the
TI internal repos easier to manage.

Andrew

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14193): https://lists.yoctoproject.org/g/meta-arago/message/14193
> Mute This Topic: https://lists.yoctoproject.org/mt/96510217/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

