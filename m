Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3799C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 22:11:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.31310.1656627068046566732
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 15:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MRbajh/w;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UMB4Fs058854;
	Thu, 30 Jun 2022 17:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656627064;
	bh=JOxIph8W3KkRfyn4mCirvG4fL44OdA6Zg30Mc2ZPjL0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MRbajh/wedGHUCYdZkwnDfWNoPHDz6LFvorh46ujp09uL+/C99n7oMa/3jWGH7dAf
	 7aVOyRQTmtT8yrpQXI0GhD8NS7RDAt7K+TM/1SU6qvzRI/YzZC+mKEop0USyjVLBFn
	 3QaxjPLcLx/oy7HTD+Dx38sz8nld4IZWrqkXFXhI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UMB4VS090514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 17:11:04 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 17:11:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 17:11:04 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UMB4aW112475;
	Thu, 30 Jun 2022 17:11:04 -0500
Message-ID: <8321ce08-c1cc-d489-f588-fe25a82059f0@ti.com>
Date: Thu, 30 Jun 2022 17:11:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks build
 flag to enable GST_TRACERS
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <a-limaye@ti.com>, "Bajjuri, Praneeth" <praneeth@ti.com>,
        "meta-arago@lists.yoctoproject.org"
 <meta-arago@lists.yoctoproject.org>,
        "Mantena, Prasanth" <p-mantena@ti.com>,
        "prashanth.ka@pathpartnertech.com"
	<prashanth.ka@pathpartnertech.com>,
        "R, Karthik" <karthik.ramanan@ti.com>,
        "Weaver, Lucas" <l-weaver@ti.com>
References: <20220629105304.15355-1-a-limaye@ti.com>
 <2ff910d2-0865-4418-3d66-6bcf8a2efb12@ti.com>
 <3188ef5fecbe458d8d04c4b2348147c2@ti.com> <20220630172553.GX18692@denix.org>
 <faf3ba53-a4ca-1826-bac7-eac13540a81e@ti.com>
 <20220630212001.GZ18692@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220630212001.GZ18692@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 22:11:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13933


Aniket,

I like the last option that Denys proposed.  Adding it to the list in:

meta-arago-distro/conf/distro/arago.conf


That feels like the cleanest way of doing this.  Do you have enough to 
make that change and submit a new patch?



On 6/30/2022 16:20, Denys Dmytriyenko wrote:
> Correct. It could be a bbappend in meta-arago-distro, like the original patch,
> or it could be just added into meta-arago-distro/conf/distro/arago.conf like
> existing PACKAGECONFIG modifications there in lines 107-150:
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/arago.conf#n107
> 
> 
> On Thu, Jun 30, 2022 at 04:15:02PM -0500, Ryan Eatmon wrote:
>>
>> So you're saying it should be in meta-arago-distro?
>>
>>
>>
>> On 6/30/2022 12:25, Denys Dmytriyenko wrote:
>>> This is distro-specific configuration and should not be done in distro-agnostic meta-arago-extras layer.
>>>
>>>
>>> On Thu, Jun 30, 2022 at 11:58:09AM +0000, Aniket Limaye via lists.yoctoproject.org wrote:
>>>> +Karthik
>>>>
>>>> Praneeth,
>>>>
>>>> This is not specific to codec. This can be used for profiling latencies and such for any GStreamer elements.
>>>> It should not impact performance either. It just prints latency logs if an environment variable is set, similar to GST_DEBUG.
>>>>
>>>>
>>>> -----Original Message-----
>>>> From: Bajjuri, Praneeth <praneeth@ti.com>
>>>> Sent: Thursday, June 30, 2022 3:29 PM
>>>> To: Limaye, Aniket <a-limaye@ti.com>; meta-arago@lists.yoctoproject.org; Mantena, Prasanth <p-mantena@ti.com>; prashanth.ka@pathpartnertech.com
>>>> Cc: Eatmon, Ryan <reatmon@ti.com>; Weaver, Lucas <l-weaver@ti.com>
>>>> Subject: Re: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks build flag to enable GST_TRACERS
>>>>
>>>> Prashanth,Prasanth,
>>>>
>>>> Please review.
>>>>
>>>> On 6/29/2022 4:23 PM, Aniket Limaye wrote:
>>>>> Enables GST_TRACERS : an optional utility for profiling gstreamer applications
>>>>
>>>> Aniket,
>>>>
>>>> 1. What is the impact of this with codec performance?
>>>> 2. Why is this optional utility need to enabled?
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>>>> ---
>>>>>    .../gstreamer/gstreamer1.0_1.16.%.bbappend                   | 5 +++++
>>>>>    1 file changed, 5 insertions(+)
>>>>>    create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
>>>>>
>>>>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
>>>>> new file mode 100644
>>>>> index 00000000..d7bdaa04
>>>>> --- /dev/null
>>>>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
>>>>> @@ -0,0 +1,5 @@
>>>>> +
>>>>> +PACKAGECONFIG_append = " tracer-hooks"
>>>>> +
>>>>> +PR_append = ".arago0"
>>>>> +

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

