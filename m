Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3097FE7718D
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 20:05:52 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.13400.1734811545971846396
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 21 Dec 2024 12:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sbR55izU;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BLK5glL632816
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Dec 2024 14:05:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734811543;
	bh=7a20KvIBMy1xxxu0xmVoWSJtlWyf6C2jqs1JS4SuFpw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sbR55izUymwYdLbIeYWHIfrkTpcEOwM5ohV+md51B0bnZDZFh3x/7oPsdFyTId+lq
	 wfpJonwSsa44FYQf8TgGbPV/XQyc6pXwsry9hi8LqFwzu4+8z6KckTmKobWg+ntX3X
	 5tcxBi+k4ZuKn2l5GU/NPunxsp7x7nSolYN/QbzE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BLK5grV102095
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 21 Dec 2024 14:05:42 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 21
 Dec 2024 14:05:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 21 Dec 2024 14:05:42 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BLK5gjS113296;
	Sat, 21 Dec 2024 14:05:42 -0600
Message-ID: <51927f26-1593-49ac-aa22-1409df88f458@ti.com>
Date: Sat, 21 Dec 2024 14:05:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 0/2] Add ARM Compute Library
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20241220164910.318809-1-afd@ti.com>
 <20241220180416.GM23825@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241220180416.GM23825@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 21 Dec 2024 20:05:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15684

On 12/20/24 12:04 PM, Denys Dmytriyenko wrote:
> Andrew,
> 
> We used to have older versions of arm-compute-library and ARMNN in meta-arago,
> but those were unmaintained and removed not long ago...
> 

Looks like ACL and ARMNN were dropped back in 2020, the tensorflow parts finally
got dropped a couple months ago. But these were forks specific to our C7x accel HW.
What I'm doing here is upstream based and works across all devices.

> Just a quick look around, there's a meta-machinelearning layer from Witekio,
> that hasn't been updated for 5.5 years.
> 

Yeah I found that, and a couple other layers when starting this work, but they
all seem to have been abandoned. Would be nice to get a Yocto Project supported
layer for all this ML stuff.

> Also, meta-webos has a bit newer versions of both in rather curiously named
> recipes-upstreamable directory:
> 
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-upstreamable/arm-compute-library/arm-compute-library_22.08.bb
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-upstreamable/armnn/armnn_22.08.bb
> 
> Maybe you can find anything useful there?
> 

These were very useful and the recipes I'm posting took some inspiration
from these. They do seem to be almost upstreamable and I've even seen
some talk from a while ago on IRC on doing that but seems it never
got done, so I'll see what I can do myself on upstreaming these.

Thanks,
Andrew

> 
> 
> On Fri, Dec 20, 2024 at 10:49:08AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> Hello all,
>>
>> This series adds support for arm-compute-library which will be used
>> as the base for several other ARM based ML frameworks and apps.
>>
>> This package will be sent for inclusion in meta-arm as it is ARM
>> produced and supported software. This will be done after the patches
>> here for ACL are taken into the project's upstream. We can drop
>> this out of meta-arago master after that.
>>
>> Thanks,
>> Andrew
>>
>> Andrew Davis (2):
>>    flatbuffers: Remove this recipe
>>    meta-arago-extras: Add recipe for arm-compute-library
>>
>>   ...-indention-in-cmake-generator-script.patch | 130 ++++++++++++
>>   ...ENABLE_NEON-in-code-for-checking-NEO.patch | 114 ++++++++++
>>   ...ENABLE_SVE-in-code-for-checking-SVE-.patch | 197 ++++++++++++++++++
>>   ...rce-files-at-library-definition-time.patch | 167 +++++++++++++++
>>   ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 ++++++++++
>>   ...SVE2-support-to-be-disabled-in-CMake.patch |  91 ++++++++
>>   .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ++++++++
>>   ...ymbol-error-when-building-TensorInfo.patch |  46 ++++
>>   .../arm-compute-library_24.12.bb              |  79 +++++++
>>   .../flatbuffers/flatbuffers_1.11.0.bb         |  34 ---
>>   .../recipes-core/packagegroups/ti-test.bb     |   1 +
>>   11 files changed, 1023 insertions(+), 34 deletions(-)
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-Add-source-files-at-library-definition-time.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
>>   delete mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb

