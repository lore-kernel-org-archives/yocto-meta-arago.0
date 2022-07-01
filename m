Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265DEC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 17:34:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.41307.1656696883509905406
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 10:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yhxj2u1H;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 261HYaPZ070656;
	Fri, 1 Jul 2022 12:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656696876;
	bh=K0mVinFFc2V6Tbn5fn9cXUjntic8XEuG7grzuL+ZSQM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yhxj2u1HhFKEYL/K94rC1CrfmghX1ojlhD9i5DJiX8pWANh1JGBZyoho08LqkbDaP
	 C57dkXsnvsnb2mN9AoIHVhP883HQAX17yLQAt76rdGY4kkQ56Dmlm/igdukW3JOtBx
	 vnjW7bZBW7Qo28ZxtBDmt13yS+W3unQZywonUyaA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 261HYae9012566
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Jul 2022 12:34:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Jul 2022 12:34:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Jul 2022 12:34:36 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 261HYaN8081481;
	Fri, 1 Jul 2022 12:34:36 -0500
Message-ID: <d52ae773-f324-13e3-8e22-22ae72a530d2@ti.com>
Date: Fri, 1 Jul 2022 12:34:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-arago][master/dunfell][PATCH] conf: machine: j721s2: add
 new dtb for GESI
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220701161237.10497-1-reatmon@ti.com>
 <20220701163042.GA18692@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220701163042.GA18692@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 Jul 2022 17:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13937


You are correct on both counts.  I will fix.


On 7/1/2022 11:30, Denys Dmytriyenko wrote:
> 1. wrong list - should go to meta-ti
> 2. kernel commit says "overlay" - should this be .dtbo, not .dtb?
> 
> 
> On Fri, Jul 01, 2022 at 11:12:37AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The following commits in ti-linux-5.10.y kernel has introduced a new dtb.
>>
>> commit: 9b05b2a89ff ("arm64: dts: ti: Add overlay for GESI to enable main CPSW2G in J721S2")
>>
>> This patch on j721s2 conf is to include the new dtb.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   conf/machine/j721s2-evm.conf | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
>> index e5ed0b73..b224ce7b 100644
>> --- a/conf/machine/j721s2-evm.conf
>> +++ b/conf/machine/j721s2-evm.conf
>> @@ -13,6 +13,7 @@ OPTEE_K3_USART = "0x8"
>>   
>>   KERNEL_DEVICETREE = " \
>>       ti/k3-j721s2-common-proc-board.dtb \
>> +    ti/k3-j721s2-gesi-exp-board.dtb \
>>   "
>>   
>>   UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

