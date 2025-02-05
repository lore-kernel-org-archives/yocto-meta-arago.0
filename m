Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197D6C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 17:17:39 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.17977.1738775855130887368
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 09:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XGReyEnl;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515HHV4I2641376
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 11:17:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738775851;
	bh=FCBgDdiT+QX/JMp/xsY5HJtc4NpSE6VTlMDdZvdOYKI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XGReyEnlazdWgK9UW62iABBIj7BgrDL56zrgZ4mRVTYFlT75iAQ9WcBR+/Ssc2NVh
	 OlB2Bl4yTgD6GenpkQ51KFBn/y0m6z5YIYilrFmgD7195lD0zKMPbFY0cqu2W2gLcz
	 V76TPnA8BWtdTH+L923jo4pG4hKBuaFqFaunyUlk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515HHVLO011641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 11:17:31 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 11:17:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 11:17:31 -0600
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515HHVTT015903;
	Wed, 5 Feb 2025 11:17:31 -0600
Message-ID: <808ebd9a-782c-4ac0-a663-a2dcdf199708@ti.com>
Date: Wed, 5 Feb 2025 11:17:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] kms++: Move to
 meta-arago-test
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250205143526.24695-1-reatmon@ti.com>
 <20250205170250.GK21608@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250205170250.GK21608@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 17:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15808



On 2/5/2025 11:02 AM, Denys Dmytriyenko wrote:
> On Wed, Feb 05, 2025 at 08:35:26AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Since we added kms++ as a dependency to ti-test, we missed that kms++
>> was coming from meta-arago-extras which created a dependency we do not
>> want.  So move it to meta-arago-test.
> 
> Since scarthgap, it is now available from meta-oe as kmsxx, pointing to a
> newer commit:
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb

I will send a followup patch making this change.  Good catch.


> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../recipes-graphics/kms++/kms++_git.bb                           | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>   rename {meta-arago-extras => meta-arago-test}/recipes-graphics/kms++/kms++_git.bb (100%)
>>
>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-test/recipes-graphics/kms++/kms++_git.bb
>> similarity index 100%
>> rename from meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> rename to meta-arago-test/recipes-graphics/kms++/kms++_git.bb
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

