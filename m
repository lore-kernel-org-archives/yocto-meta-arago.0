Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D120C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 15:22:03 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.68456.1742916118292838306
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 08:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xUxG8TV8;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFLs381286754
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 25 Mar 2025 10:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742916114;
	bh=QNdvBMDAZ1DiP+vncKC56pMQyoGszHIFfhz/T7EfrPo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xUxG8TV85K1w9VBFLEz+5YiMB+ghmor6bgw21ReOEq9vAYmMUkNU1X9nOISP0RGUz
	 VRRFluod5F8I1Jc804ddf4TpnGj/OfGCwi/o1uInwQoX8gaZLtU5VRuPB5oupa1Ac8
	 hcc/YqgB6c3MgjzHAn58+vbDUi8tXVVnges01Ze0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PFLsbA096028;
	Tue, 25 Mar 2025 10:21:54 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Mar 2025 10:21:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Mar 2025 10:21:54 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PFLs6o115871;
	Tue, 25 Mar 2025 10:21:54 -0500
Message-ID: <8e1dcfd0-5160-4d7f-8428-49330d0e27bc@ti.com>
Date: Tue, 25 Mar 2025 10:21:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] meta-arago-demos: layer.conf: Remove
 SIGGEN_EXCLUDERECIPES_ABISAFE
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250320181225.6028-1-reatmon@ti.com>
 <20250324165316.GS23729@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250324165316.GS23729@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Mar 2025 15:22:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16151


Doh!  Copy and paste error.  I'll fix it in the repo before it makes it 
out to prod.


On 3/24/2025 11:53 AM, Denys Dmytriyenko wrote:
> Is it meta-arago-demos as in Subject or meta-arago-distro as in the patch?
> 
> 
> On Thu, Mar 20, 2025 at 01:12:25PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Remove the setting of SIGGEN_EXCLUDERECIPES_ABISAFE as it is no longer needed.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-distro/conf/layer.conf | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
>> index 0bbf9a4e..40629794 100644
>> --- a/meta-arago-distro/conf/layer.conf
>> +++ b/meta-arago-distro/conf/layer.conf
>> @@ -39,11 +39,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>>       weston-init->kbd \
>>   "
>>   
>> -SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>> -    udev \
>> -    eudev \
>> -    weston-conf \
>> -    cryptodev-module \
>> -"
>> -
>>   HOSTTOOLS_NONFATAL += "corkscrew getent socket"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

