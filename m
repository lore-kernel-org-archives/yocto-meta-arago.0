Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936F1C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:19:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26387.1684253975415830504
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sgfIk3Te;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGJVM0061349;
	Tue, 16 May 2023 11:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684253971;
	bh=IWyCRdbmuJCXngHc1YijhsTWT3N/57eBvVhCfsghGJ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sgfIk3Te6ZibTYeD77IhhoWVCWKTTttY/nFinILllKgZl7H9HuusJa4/VCkxr/1M+
	 Ih9n6QBnyMXCTysY8qKRE8gxl8TLo3nRXBnU6knmhf7x/5uEkWfaD+inUuc94nmT4s
	 tD88qFiIDQQXZn34yAxKEE6pJhQfdpKzSI5uLWog=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGJVEk007139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:19:31 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:19:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:19:29 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGJTZB010052;
	Tue, 16 May 2023 11:19:29 -0500
Message-ID: <93027b9f-da82-550c-1672-020772a701e9@ti.com>
Date: Tue, 16 May 2023 11:19:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] ltp-ddt: Intial LTS
 migration version
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230516143156.1961-1-reatmon@ti.com>
 <20230516160251.GL9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230516160251.GL9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 16:19:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14403



On 5/16/2023 11:02 AM, Denys Dmytriyenko wrote:
> 1. There's no 20231017 version of ltp-ddt in meta-arago:
> 
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-devtools/ltp-ddt

There is on wip/next which after a forced CICD is about to make it 
visiable to kirkstone.

All of these patches build on previous patches that are "Under Review" 
on the next branches.

I'm just sending out the patches so that as soon as CICD promotes it all 
I can get the patches applied to master as well.


> 2. ltp-ddt is based on upstream ltp - while OE-Core/master has version
> 20231017 of ltp, kirkstone has an older 20220121 version:
> 
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp
> 
> So you'd need to overlay ltp 20231017 here:
> 
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-extended/ltp
> 
> 3. Once the upgrade is done, you can remove the old overlayed 20200120 and
> 20210524 versions of ltp
> 
> 
> On Tue, May 16, 2023 at 09:31:55AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> From: LCPD Automation Script <lcpdbld@list.ti.com>
>>
>> As part of the initial LTS migration, move to the latest commits for the
>> various repos.
>>   - ltp-ddt_20230127
>>
>> Going forward all updates will come from the CICD flow.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>> index d56c5b7b..c14ddba7 100644
>> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>> @@ -14,7 +14,7 @@ PE = "1"
>>   PR = "r7"
>>   PV:append = "+git${SRCPV}"
>>   
>> -SRCREV = "7f2fc4b7c972f2f188836c739a7175fad2f2b288"
>> +SRCREV = "41e97da730b9064d9fc5337afb515a8b6f752099"
>>   BRANCH ?= "master"
>>   
>>   SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

