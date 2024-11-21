Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC309D743C9
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 17:35:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4482.1732210531257545074
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 09:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cguTHL76;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ALHZR05120107;
	Thu, 21 Nov 2024 11:35:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732210528;
	bh=Njsf+cH+rywdGZyQdU9Dy4u93MU36ereppq87UxXfpE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cguTHL76odhOHgSunNXyHkQiAE3agG3KFQUgAbrMGTVeD7vYAbKuFhNg6/hw0GzSs
	 ir7rNopXQJXw4TL26soV/JtI/x+EVH9AKoatieHVNY4TCfFPw+QXIlstllHCADF01O
	 OicEQbs3rAEhm9ZL6GaH6bDqPpzlfJRBslUgD+Ro=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALHZRg9081078;
	Thu, 21 Nov 2024 11:35:27 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Nov 2024 11:35:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Nov 2024 11:35:27 -0600
Received: from [10.249.33.223] ([10.249.33.223])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALHZRNg002654;
	Thu, 21 Nov 2024 11:35:27 -0600
Message-ID: <c086b98d-536b-4ca8-b001-75dd091f5fb6@ti.com>
Date: Thu, 21 Nov 2024 11:35:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] README: yocto-check-layer
 clean up
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20241121150039.6119-1-reatmon@ti.com>
 <20241121170456.GX20070@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241121170456.GX20070@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Nov 2024 17:35:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15627



On 11/21/2024 11:04 AM, Denys Dmytriyenko wrote:
> On Thu, Nov 21, 2024 at 09:00:39AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Cleaning up the wording to pass the yocto-check-layer checks.
> 
> Hmm, that's strange - meta-ti layers have the same wording and there are no
> issues. Also, the new wording kind of implies that only pull requests are
> accepted, which is not true.

So fun fact, the missing word was "patch".  That's what the check was 
looking for.  That's why I just copied what meta-ti had since we knew it 
passed.


> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-demos/README  | 6 +++++-
>>   meta-arago-distro/README | 6 +++++-
>>   meta-arago-extras/README | 6 +++++-
>>   meta-arago-test/README   | 6 +++++-
>>   4 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-arago-demos/README b/meta-arago-demos/README
>> index bb586c14..d10b0c1e 100644
>> --- a/meta-arago-demos/README
>> +++ b/meta-arago-demos/README
>> @@ -27,7 +27,11 @@ URI: https://github.com/meta-qt5/meta-qt5
>>   branch: master
>>   revision: HEAD
>>   
>> -Send pull requests to meta-arago@lists.yoctoproject.org
>> +Send pull requests, patches, comments or questions to:
>> +meta-arago@lists.yoctoproject.org
>> +
>> +Please note - meta-arago mailing list requires subscription for posting:
>> +https://lists.yoctoproject.org/g/meta-arago
>>   
>>   Layer maintainers:
>>   Ryan Eatmon <reatmon@ti.com>
>> diff --git a/meta-arago-distro/README b/meta-arago-distro/README
>> index 49e9d9e1..50fa7ede 100644
>> --- a/meta-arago-distro/README
>> +++ b/meta-arago-distro/README
>> @@ -32,7 +32,11 @@ branch: master
>>   revision: HEAD
>>   layers: meta-arago-extras
>>   
>> -Send pull requests to meta-arago@lists.yoctoproject.org
>> +Send pull requests, patches, comments or questions to:
>> +meta-arago@lists.yoctoproject.org
>> +
>> +Please note - meta-arago mailing list requires subscription for posting:
>> +https://lists.yoctoproject.org/g/meta-arago
>>   
>>   Layer maintainers:
>>   Ryan Eatmon <reatmon@ti.com>
>> diff --git a/meta-arago-extras/README b/meta-arago-extras/README
>> index 5b6e8a15..c703a813 100644
>> --- a/meta-arago-extras/README
>> +++ b/meta-arago-extras/README
>> @@ -27,7 +27,11 @@ URI: https://github.com/meta-qt5/meta-qt5
>>   branch: master
>>   revision: HEAD
>>   
>> -Send pull requests to meta-arago@lists.yoctoproject.org
>> +Send pull requests, patches, comments or questions to:
>> +meta-arago@lists.yoctoproject.org
>> +
>> +Please note - meta-arago mailing list requires subscription for posting:
>> +https://lists.yoctoproject.org/g/meta-arago
>>   
>>   Layer maintainers:
>>   Ryan Eatmon <reatmon@ti.com>
>> diff --git a/meta-arago-test/README b/meta-arago-test/README
>> index 8f1f9993..16a36d62 100644
>> --- a/meta-arago-test/README
>> +++ b/meta-arago-test/README
>> @@ -23,7 +23,11 @@ branch: master
>>   revision: HEAD
>>   layers: meta-oe, meta-networking, meta-python
>>   
>> -Send pull requests to meta-arago@lists.yoctoproject.org
>> +Send pull requests, patches, comments or questions to:
>> +meta-arago@lists.yoctoproject.org
>> +
>> +Please note - meta-arago mailing list requires subscription for posting:
>> +https://lists.yoctoproject.org/g/meta-arago
>>   
>>   Layer maintainers:
>>   Ryan Eatmon <reatmon@ti.com>
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

