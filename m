Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA353C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 22:57:11 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4157.1664405829361781662
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 15:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cKtZziAX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28SMv5bD003023;
	Wed, 28 Sep 2022 17:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664405825;
	bh=NG5lUU//EMEzo5FDoaq0B9euX+asR2qNpYGeHBh+eJ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cKtZziAXSg4IE63UfLFYLn53dG649DW/8OM7v76wYNVzqH1e/6gUbzglNtUtm8+6D
	 fVeLvOY8rmM2xP+nHzjPNzPFwcSOy2ofZtpZCL4+9kkL+KAEzOUzktWX+IUf44pXKy
	 BH33uAFbuMYo/MaSMTGTvmRuWq7qunAMkuLKwdh8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28SMv5tq015604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Sep 2022 17:57:05 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 28
 Sep 2022 17:57:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 28 Sep 2022 17:57:05 -0500
Received: from [10.250.37.187] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28SMv5nK019593;
	Wed, 28 Sep 2022 17:57:05 -0500
Message-ID: <f2f1a97c-ccf6-c65c-9b0a-9481a396cd8a@ti.com>
Date: Wed, 28 Sep 2022 17:57:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH] oe-layer-setup.sh:
 restore number of threads to max
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20220928204354.25876-1-reatmon@ti.com>
 <20220928204933.GY18429@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220928204933.GY18429@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Sep 2022 22:57:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14048



On 9/28/2022 15:49, Denys Dmytriyenko wrote:
> On Wed, Sep 28, 2022 at 03:43:54PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> We are no longer using VMs for building and so should not need
>> to reduce the number of threads down by 75%.
> 
> I would recommend dropping those lines altogether - these days bitbake
> defaults to max number of threads/processes on its own.

Even better.  I'll make that change.


>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   oe-layertool-setup.sh | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>> index e404290..1ea31c3 100755
>> --- a/oe-layertool-setup.sh
>> +++ b/oe-layertool-setup.sh
>> @@ -770,9 +770,8 @@ EOM
>>   
>>       # set the number of threads
>>       threads=`cat /proc/cpuinfo | grep -c processor`
>> -    tnum=`expr \( ${threads} + 1 \) \* 75 / 100`
>> -    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${tnum}\"/" $confdir/local.conf
>> -    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${tnum}\"/" $confdir/local.conf
>> +    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?= \"-j ${threads}\"/" $confdir/local.conf
>> +    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?= \"${threads}\"/" $confdir/local.conf
>>   
>>       # Find if old DL_DIR was set
>>       if [ -e $confdir/local.conf.bak ]
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

