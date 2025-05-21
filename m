Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5035C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 15:06:12 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1420.1747839971083879083
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 May 2025 08:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fvHmRWIb;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54LF67fT327460;
	Wed, 21 May 2025 10:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747839967;
	bh=aL0fMSZC3T0VfHUar2S4+PGWaHZr9DKgfAcGEjryXuk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fvHmRWIbFgNKGfvLK//mnmVA8irXKDUOwhZfwKRKEiOCK8LXW/nOg2JU3huPQJw+2
	 62PC/eQ3vMTJxHPE+4meVDlXGDTujzV/HrecqnOy2qcgna3dCupt3yWuqDdFQq7RWi
	 SS0dJoRnKSy/lMETfxdit5aYy0jmHf3wHNJxY5iU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54LF67ui2810469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 21 May 2025 10:06:07 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 10:06:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 10:06:07 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54LF670r123104;
	Wed, 21 May 2025 10:06:07 -0500
Message-ID: <42ebb1a4-7ecd-4817-90b7-75cb6ed4d9e8@ti.com>
Date: Wed, 21 May 2025 10:06:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 5/9] nativesdk-buildtools-perl-dummy:
 Wrap the bbappend in a compliant manner
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250519170055.22364-1-reatmon@ti.com>
 <20250519170055.22364-6-reatmon@ti.com> <20250520214834.GB18383@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250520214834.GB18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 May 2025 15:06:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16235


I'd say new patches for this and the other one.  But let me get these 
patches all promoted to master and released to make it easier.


On 5/20/2025 4:48 PM, Denys Dmytriyenko wrote:
> Since this has been taken upstream, it can be dropped from master altogether.
> Let me know if you need a spearate patch for this.
> 
> https://git.openembedded.org/openembedded-core/commit/?id=2b1ec442cf8c0d5753376e52bca5f8da5350848c
> 
> 
> On Mon, May 19, 2025 at 12:00:51PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Wrap the bbappend in a yocto-check-layer compliant manner so that only
>> if you are building this recipe under meta-arago-distro with the arago
>> DISTRO_OVERRIDE would the bbappend apply.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ...pend => nativesdk-buildtools-perl-dummy-arago.inc} |  0
>>   .../meta/nativesdk-buildtools-perl-dummy.bbappend     | 11 ++++-------
>>   2 files changed, 4 insertions(+), 7 deletions(-)
>>   copy meta-arago-extras/recipes-core/meta/{nativesdk-buildtools-perl-dummy.bbappend => nativesdk-buildtools-perl-dummy-arago.inc} (100%)
>>
>> diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy-arago.inc
>> similarity index 100%
>> copy from meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
>> copy to meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy-arago.inc
>> diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
>> index b9d40d6e..f88196f5 100644
>> --- a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
>> +++ b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
>> @@ -1,7 +1,4 @@
>> -DUMMYPROVIDES += "\
>> -    nativesdk-perl-dev \
>> -    nativesdk-perl-module-feature \
>> -    nativesdk-perl-module-file-spec-unix \
>> -    nativesdk-perl-module-integer \
>> -    nativesdk-perl-module-symbol \
>> -"
>> +NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO = ""
>> +NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO:arago = "nativesdk-buildtools-perl-dummy-arago.inc"
>> +
>> +require ${NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO}
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

