Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B5AC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 19:29:26 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.200.1747337360188049146
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 May 2025 12:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qOBLcryT;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54FJTGPM089520
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 14:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747337356;
	bh=BnedpxtbSU4hZfaDcZdNS9i6P7X1hj2k5SPLp4nk6kg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qOBLcryTIAatrl4CMqmLHJfRP/KfcIjIcqvPK5RGaIAKkNE1foWB+lWN1zGhku/gY
	 +LHu6s1yAbMEyaz8bv0xHf3jFjzo1EGflnqMFY+qfWEqoRWfeSOTNVnuq5QhL0Ku5e
	 9ETLVjwbTH0FMUbtGRGBqERZmdQxgjQPXg6HA5Lk=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54FJTGFT010572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 May 2025 14:29:16 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 May 2025 14:29:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 May 2025 14:29:15 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54FJTF9M107860;
	Thu, 15 May 2025 14:29:15 -0500
Message-ID: <4eac99a3-2e4a-4f5b-a70b-03cf66f820f9@ti.com>
Date: Thu, 15 May 2025 14:29:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Add
 optee-test, strongswan, and libgpiod-tools to image
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250501144357.355212-1-afd@ti.com>
 <20250513172057.GR18383@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250513172057.GR18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 May 2025 19:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16198

On 5/13/25 12:20 PM, Denys Dmytriyenko wrote:
> On Thu, May 01, 2025 at 09:43:57AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> These packages are used by ltp-ddt and the test framework. These are
>> added to the default Arago images, but when doing upstream testing with
>> Poky these packages are missing. Add these to the base testing layer.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-arago-test/recipes-core/packagegroups/ti-test.bb        | 2 ++
>>   meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 1 +
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index c8eaf266..e387b978 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -41,6 +41,7 @@ TI_TEST_BASE = "\
>>       nbench-byte \
>>       netperf \
>>       openntpd \
>> +    optee-test \
> 
> Should this be conditional on whether OPTEE is used for the platform?
> Like it is done here:
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb#n58
> 

Good catch, this does need to be conditional or AM335x (the only plat we have without OP-TEE) will break, will update and resend.

Thanks,
Andrew

> 
>>       pcitest \
>>       perf \
>>       powertop \
>> @@ -53,6 +54,7 @@ TI_TEST_BASE = "\
>>       stream \
>>       stress \
>>       stress-ng \
>> +    strongswan \
>>       tcpdump \
>>       v4l-utils \
>>       yavta \
>> diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
>> index 1950ffe9..2c65e851 100644
>> --- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
>> +++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
>> @@ -33,6 +33,7 @@ RDEPENDS:${PN} += "\
>>       pm-qa \
>>       serialcheck \
>>       memtester \
>> +    libgpiod-tools \
>>   "
>>   
>>   do_install:prepend() {
>> -- 
>> 2.39.2

