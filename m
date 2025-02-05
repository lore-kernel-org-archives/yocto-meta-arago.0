Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C243C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:28:00 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.23087.1738787272459810676
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jhRRW8TE;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515KRniv3490230
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 14:27:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738787269;
	bh=UdI8iSOLX/lDtjaWYKfs9kMR1Vk5PXqVqMkX3az0k8k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jhRRW8TE3Ox7pdMOy/lOIyrqUp6NVIxt7QSnD0lbAfqI/lcKcoTe9ZUJvEJOa0/tD
	 I78Tq83t8qJ6dKNBFfHvwpFYlXoPZYk9p70VM60xCG6jsGAUvQmSJ6pu3nEGYtSkl9
	 fVAuL9GHi5znHVnfogVbtMqKUcQkti2NfaBAEN+4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515KRndD017061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 14:27:49 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 14:27:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 14:27:49 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515KRnWi083618;
	Wed, 5 Feb 2025 14:27:49 -0600
Message-ID: <68191b5a-66e9-4d15-91de-542c242cd66d@ti.com>
Date: Wed, 5 Feb 2025 14:27:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 1/4] meta-arago-extras: Add
 recipe for arm-compute-library
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250203185953.269693-1-afd@ti.com>
 <20250203185953.269693-2-afd@ti.com> <20250205200738.GN21608@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250205200738.GN21608@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:28:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15823

On 2/5/25 2:07 PM, Denys Dmytriyenko wrote:
> On Mon, Feb 03, 2025 at 12:59:50PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> The Compute Library is a collection of low-level machine learning
>> functions optimized for Arm. This will be used for ARMNN and
>> other machine learning applications and frameworks.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   ...-indention-in-cmake-generator-script.patch | 130 ++++++++++++
>>   ...ENABLE_NEON-in-code-for-checking-NEO.patch | 114 ++++++++++
>>   ...ENABLE_SVE-in-code-for-checking-SVE-.patch | 197 ++++++++++++++++++
>>   ...rce-files-at-library-definition-time.patch | 167 +++++++++++++++
>>   ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 ++++++++++
>>   ...SVE2-support-to-be-disabled-in-CMake.patch |  91 ++++++++
>>   .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ++++++++
>>   ...ymbol-error-when-building-TensorInfo.patch |  46 ++++
>>   .../arm-compute-library_24.12.bb              |  89 ++++++++
>>   9 files changed, 1032 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-Add-source-files-at-library-definition-time.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
> 
>> diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
>> new file mode 100644
>> index 00000000..383b02fb
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
>> @@ -0,0 +1,89 @@
>> +SUMMARY = "The ARM Computer Vision and Machine Learning library"
>> +DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=35f8944fae972976691f3483b0ac9dba"
>> +
>> +SRC_URI = " \
>> +    git://github.com/ARM-software/ComputeLibrary.git;branch=main;protocol=https \
>> +    file://0001-fix-Fix-indention-in-cmake-generator-script.patch \
>> +    file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch \
>> +    file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch \
>> +    file://0004-Add-source-files-at-library-definition-time.patch \
>> +    file://0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch \
>> +    file://0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch \
>> +    file://0007-Allow-ARMv7-builds-using-CMake.patch \
>> +    file://0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch \
>> +"
>> +SRCREV = "32bcced2af7feea6969dd1d22e58d0718dc488e3"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +# Only compatible with armv7, armv7ve, and aarch64
>> +COMPATIBLE_MACHINE = "(^$)"
>> +COMPATIBLE_MACHINE:aarch64 = "(.*)"
>> +COMPATIBLE_MACHINE:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
>> +COMPATIBLE_MACHINE:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
> 
> Seems excessive...
> 
> Will this work:
> 
> COMPATIBLE_MACHINE = "(armv7a|aarch64)"
> 
> If you do want to specifically check for "neon" being enabled, you can still
> skip armv7ve, as armv7a check will also apply to armv7ve...
> 

I do need to check for NEON specifically like this as there
are armv7a and armv7ve machines with it disabled, and this
will not work for them.

As for skipping the check armv7ve it does seem like that would
work, but I see them checked individually all over core layers
for some reason, so wanted to follow that. For a random example:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb#n47

> 
>> +
>> +inherit cmake
>> +
>> +PACKAGECONFIG ??= "examples tests cppthreads openmp"
>> +
>> +PACKAGECONFIG[Werror] = "-DARM_COMPUTE_WERROR=ON,-DARM_COMPUTE_WERROR=OFF"
>> +PACKAGECONFIG[examples] = "-DARM_COMPUTE_BUILD_EXAMPLES=ON,-DARM_COMPUTE_BUILD_EXAMPLES=OFF"
>> +PACKAGECONFIG[tests] = "-DARM_COMPUTE_BUILD_TESTING=ON,-DARM_COMPUTE_BUILD_TESTING=OFF"
>> +PACKAGECONFIG[cppthreads] = "-DARM_COMPUTE_CPPTHREADS=ON,-DARM_COMPUTE_CPPTHREADS=OFF"
>> +PACKAGECONFIG[openmp] = "-DARM_COMPUTE_OPENMP=ON,-DARM_COMPUTE_OPENMP=OFF"
>> +
>> +EXTRA_OECMAKE:append:aarch64 = " \
>> +	-DARM_COMPUTE_ARCH=armv8-a \
>> +	-DENABLE_NEON=ON \
>> +	-DENABLE_SVE=OFF \
>> +	-DENABLE_SVE2=OFF \
>> +"
>> +EXTRA_OECMAKE:append:arm = " \
> 
> And here, the override should probably be armv7a, not arm? I know you set
> COMPATIBLE_MACHINE above to prevent armv4/v5/v6 from even coming here, but
> still...
> 

Maybe, but that seems overly constraining then, for instance if this
package gains support for additional ARM versions like armv6, then I
would have to change this back to just arm, instead of just relaxing
the COMPATIBLE_MACHINE lines above.

Andrew

> 
>> +	-DARM_COMPUTE_ARCH=armv7-a \
>> +	-DENABLE_NEON=ON \
>> +	-DENABLE_SVE=OFF \
>> +	-DENABLE_SVE2=OFF \
>> +	-DARM_COMPUTE_ENABLE_BF16=OFF \
>> +	-DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=OFF \
>> +"
>> +
>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

