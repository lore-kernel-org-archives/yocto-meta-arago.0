Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB692C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 20:43:29 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.7597.1738097008886390411
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 12:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E5i41g+3;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SKhQw11246134
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 14:43:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738097006;
	bh=/V+jju4VAf9kH4thnXbN5xALBKlCHEK4fA9dSbFyXBI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E5i41g+3sdr9oLGfUAGqRnxJaAxyayS1vZg1Gmiv+iG1U43t7ET7NNb0EePB3ro9n
	 Juw1wjvQSIWFrUT6loL8jyM4EyMsRYOjQ669QYMnqXxE+9eC94Yg2lTIX1wob1vW82
	 oQUE4T5xJBv+22n2FUMBT+E3HSVa13lTyGTSsw08=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50SKhP0l017177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jan 2025 14:43:25 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 14:43:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 14:43:25 -0600
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SKhPMq108540;
	Tue, 28 Jan 2025 14:43:25 -0600
Message-ID: <b5d8f183-3222-44b6-a91d-12f5cb006689@ti.com>
Date: Tue, 28 Jan 2025 14:43:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: scarthgap update
 meta-browser layer sha
To: Denys Dmytriyenko <denis@denix.org>,
        "Etheridge, Darren"
	<detheridge@ti.com>
CC: <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250123201215.2812931-1-detheridge@ti.com>
 <20250123212031.GZ21836@denix.org>
 <681ab15c-d59b-4d9d-9443-ab81dd521090@ti.com>
 <20250128203023.GH21836@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250128203023.GH21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jan 2025 20:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15769



On 1/28/2025 2:30 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 24, 2025 at 01:58:08PM -0600, Etheridge, Darren wrote:
>> On 1/23/2025 3:20 PM, Denys Dmytriyenko wrote:
>>> A more generic question:
>>>
>>> There are now multiple configs with meta-browser and meta-selinux listed:
>>>
>>> * arago-scarthgap: both meta-browser and meta-selinux are disabled
>>> * arago-scarthgap-chromium: meta-browser is enabled, meta-selinux is disabled
>>> * arago-scarthgap-selinux: meta-browser is disabled, meta-selinux is enabled
>>>
>>> Since there are now separate configs, should they be cleaned up and layers
>>> that are disabled or unused removed from them? That way when you need to bump
>>> say meta-browser, you just need to update one config, not all 3.
>>>
>>
>> This whole thing was a compromise because we didn't want to take the
>> hit of building Chromium for every config.  But we did want to give
>> the ability to enable Chromium easily in every config.  So we just
>> comment it out and leave it up to the end user to uncomment it if
>> they want Chromium to get built and burn several hours.  Maybe there
>> is a nicer way to do it, but at the time this is what we came up
>> with that worked for everybody involved.
> 
> Yes, back in Dunfell days this was exactly the case - there was a single main
> config file with meta-browser being commented out (as it also depended on
> deprecated Python2). Before that I kept it at an old commit that still allowed
> Chromium to be built with gcc and didn't require clang (and very long builds).
> 
> Anyway, with Kirkstone and Scarthgap, you now have separate configs for builds
> with meta-browser/Chromium enabled, as well as meta-selinux enabled. My point
> being, since there are separate configus for such builds, why still keep
> commented out references in the main config?
> 
> I.e. people can use arago-scarthgap-chromium config directly to get a build
> with Chromium enabled, instead of manually modifying the main arago-scarthgap
> config in order to enable Chromium...

I think part of the issue is if you use our "locked down" configs with 
the SHAs for each of the layers that each snapshot build produces, then 
you can just uncomment the line and move on.  If it is a separate 
config, then you need to add the chromium line to the locked down 
config.  Does that make sense?



> 
>>> Moreover, why only scarthgap is being updated? Are there any changes to the
>>> master configs?
>>
>> Master points to HEAD of the meta-browser layer,  as such the
>> recipes don't make any sense for master, as they really attempt to
>> enable GPU support on a specific version of Chromium.   If you build
>> master you get whatever the latest Chromium is on the meta-browser
>> layer without any of these tweaks applied.
> 
> Ah, yeah, missed the fact that master configs also have meta-browser pointing
> to the HEAD. Thanks for clarifying this.
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

