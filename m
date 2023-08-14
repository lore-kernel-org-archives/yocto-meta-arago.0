Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33754C04A94
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 18:32:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.115518.1692037954278852857
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 11:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=al2EBRZC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37EIWU7U003260;
	Mon, 14 Aug 2023 13:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692037950;
	bh=Fq4RbwW82rS9UOhDWWAzcjeQBkC5v9iA5JrepsPfjlA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=al2EBRZCMVRgF5wZ+iZZzzol0jNkmRkN/7HtH8qECglLcY4ClbBIc1pnh8raUW7y+
	 fquayURINaTjsgq4ChtIC880cRxMaghG1sj7TnRlusZqAIrC4dTrRoOJ0FkKsnMzIZ
	 4f5Slby159oaiFSNEboYglu5gVJTzN5AILvH1+iE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37EIWUHj070542
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Aug 2023 13:32:30 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Aug 2023 13:32:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Aug 2023 13:32:30 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37EIWUYE087791;
	Mon, 14 Aug 2023 13:32:30 -0500
Message-ID: <877b3779-1600-de17-a88f-4f7f0678f8cf@ti.com>
Date: Mon, 14 Aug 2023 13:32:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] mstpd: Add FILES variable
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230812131654.25185-1-reatmon@ti.com>
 <20230814181056.GG3359@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230814181056.GG3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Aug 2023 18:32:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14840



On 8/14/2023 1:10 PM, Denys Dmytriyenko wrote:
> On Sat, Aug 12, 2023 at 08:16:54AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Bring this recipe into compliance with the latest standards.  Add
>> missing FILES and update hardcoded /sbin path to $base_sbindir.
> 
> Well, you don't have to touch FILES, as the defaults here seem to cover
> everything just fine. Plus, you are adding to the defaults, not replacing
> them, so that's a no-op.
> 
> Changing hardcoded /sbin to ${base_sbindir} is all you need here.

That would explain why when I added /sbin/* to the FILES a bunch of 
other errors popped up!  I changed the default.  That was confusing me a 
bit.  I'll get this fixed for a v2.  Thanks!

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
>> index a410f584..be75b1c5 100644
>> --- a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
>> +++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
>> @@ -17,7 +17,15 @@ RDEPENDS:${PN} = "python3-core"
>>   
>>   inherit autotools
>>   
>> -EXTRA_OECONF = "--sbindir=/sbin"
>> +EXTRA_OECONF = "--sbindir=${base_sbindir}"
>> +
>> +FILES:${PN} += " \
>> +    ${base_sbindir}/mstp* \
>> +    ${base_sbindir}/bridge-stp \
>> +    ${libexecdir}/mstpctl-utils/* \
>> +    ${sysconfdir}/bridge-stp.conf \
>> +    ${sysconfdir}/bash_completion.d/mstpctl \
>> +"
> 
> So, the defaults already have ${base_sbindir}/* ${libexecdir}/* and
> ${sysconfdir} and will scoop up everything the recipe installs in those
> directories.
> 
> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n331
> 
> 
>>   do_configure:prepend() {
>>   	 sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/utils/ifquery
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

