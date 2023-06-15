Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7C8EB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 17:47:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.25325.1686851224472637010
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 10:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FIO+Wn1q;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FHl1lB076529;
	Thu, 15 Jun 2023 12:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686851221;
	bh=EPkcfBcvswQuEmNdd+w1tGB7DfLcIKhiQlyikQNrqCo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FIO+Wn1qEmi1GYusKmLq/Dre27UB0GilDjAHxwli2dxr1SHPeu33PiChcUHxf5WN+
	 vFKKyRN3YPSRI5SKFj/A9bOjZLX09p7MgBovNpNo5lYjlt2mLKjGC74LPfS7qVzGJc
	 29km3D5qE0mMvgrPU8uKDnU5lVKsWyVt6p/WO35w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FHl1b3032836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 12:47:01 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 12:47:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 12:47:00 -0500
Received: from [10.249.34.224] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FHl0kN032356;
	Thu, 15 Jun 2023 12:47:00 -0500
Message-ID: <50191ceb-04f6-c4a9-e685-91b86f50f3b0@ti.com>
Date: Thu, 15 Jun 2023 12:47:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] ti-test-extras: add package
 group for large tests
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <rs@ti.com>
CC: <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230615172807.673971-1-rs@ti.com>
 <20230615174500.GC1518@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230615174500.GC1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jun 2023 17:47:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14638



On 6/15/2023 12:45 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 15, 2023 at 12:28:07PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> This is required for images that expect ti-test to be installed but
>> actually use a ramdisk for primary storage. Piglit and the corresponding
>> cts tests are the real problems at the moment so we're moving those
>> first. Other tests may follow.
> 
> Why not make it a single packagegroup recipe producing 2 packages? Other
> packagegroups already doing it - tisdk-matrix, tisdk-addons, tisdk-opencl.

In the longer term, I want to move to this.  But this is an "emergency" 
patch to try and fix a test issue for the CICD flow.  I'll migrate this 
to that new style after we get a promotion.

> 
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   .../recipes-core/images/tisdk-default-image.bb   |  1 +
>>   .../recipes-core/packagegroups/ti-test-extras.bb | 16 ++++++++++++++++
>>   .../recipes-core/packagegroups/ti-test.bb        |  3 ---
>>   3 files changed, 17 insertions(+), 3 deletions(-)
>>   create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> index 3b9747c1..bb825e09 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> @@ -12,6 +12,7 @@ IMAGE_INSTALL += "\
>>       packagegroup-arago-console \
>>       packagegroup-arago-base-tisdk \
>>       ti-test \
>> +    ti-test-extras \
>>       ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
>>       ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
>>       ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-qte','',d)} \
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
>> new file mode 100644
>> index 00000000..6d69b165
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "TI Testing packagegroup for big tests"
>> +LICENSE = "MIT"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +inherit packagegroup
>> +
>> +ARAGO_TEST_EXTRAS = "\
>> +    piglit \
>> +    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
>> +    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
>> +"
>> +
>> +RDEPENDS:${PN} = "\
>> +    ${ARAGO_TEST_EXTRAS} \
>> +"
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>> index 210bc5a9..3e45077b 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>> @@ -38,9 +38,6 @@ ARAGO_TEST = "\
>>       nbench-byte \
>>       stream \
>>       cryptodev-tests \
>> -    piglit \
>> -    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
>> -    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
>>   "
>>   
>>   ARAGO_TEST:append:armv7a = " \
>> -- 
>> 2.41.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

