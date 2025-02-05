Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BF8C02196
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:56:00 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.23729.1738788959248277620
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TALfkCLB;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515Ktt132603337
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 14:55:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738788955;
	bh=OamryKnHSYgkohJahJbPFftc2xZBCSoUKPR1sHI/cG8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TALfkCLB9C2avtAomVVsuIqiXRw5kOV0gbenilIjtEorovxjpW5Iuy7/mqPmR+txH
	 Z1JAxkGI0oEGaMuRgKnlIljTedbi1B36W8APD8So9QiVCLt7hJltmG7OZq6OaEX4DK
	 UsJgdPbQhnZ275b+E3jIMJJF/SSWGE9dycVsyopQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515KttMj031695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 14:55:55 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 14:55:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 14:55:55 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515KttC0120036;
	Wed, 5 Feb 2025 14:55:55 -0600
Message-ID: <57ded635-fa78-4bf4-b671-f40764bb3f32@ti.com>
Date: Wed, 5 Feb 2025 14:55:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/4] meta-arago-extras: Add
 recipe for Arm NN
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250203185953.269693-1-afd@ti.com>
 <20250203185953.269693-3-afd@ti.com> <20250205201248.GO21608@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250205201248.GO21608@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:56:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15824

On 2/5/25 2:12 PM, Denys Dmytriyenko wrote:
> On Mon, Feb 03, 2025 at 12:59:51PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> Arm NN is a performant machine learning inference engine for Linux,
>> accelerating ML on Arm Cortex-A CPUs.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   ...01-Fix-type-casting-for-32bit-builds.patch | 40 +++++++++++
>>   .../recipes-devtools/armnn/armnn_24.11.bb     | 70 +++++++++++++++++++
>>   2 files changed, 110 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-casting-for-32bit-builds.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
> 
> ...
> 
>> diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
>> new file mode 100644
>> index 00000000..e965382a
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
>> @@ -0,0 +1,70 @@
>> +SUMMARY = "ARM Neural Network SDK"
>> +DESCRIPTION = "Linux software and tools to enable machine learning workloads on power-efficient devices"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
>> +
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> 
> This is the default - why do you need to set it explicitly?
> 

Hmm, must have been a leftover from devtools or something, I can remove it.

> 
>> +BRANCH = "branches/armnn_24_11"
>> +SRC_URI = "git://github.com/ARM-software/armnn.git;branch=${BRANCH};protocol=https"
>> +SRC_URI += "file://0001-Fix-type-casting-for-32bit-builds.patch"
>> +
>> +# v24.11
>> +SRCREV = "3ed70c005559d409feff2c578a1a39cf8fec8804"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit cmake
>> +inherit pkgconfig
>> +
>> +DEPENDS = " \
>> +    boost \
>> +    protobuf \
>> +    xxd-native \
>> +    arm-compute-library \
>> +"
>> +
>> +RDEPENDS:${PN} = " \
>> +    arm-compute-library \
>> +    protobuf \
>> +    boost \
> 
> All these are listed in the DEPENDS and will be carried over to RDEPENDS
> automatically, no need to list them explicitly, unless shlib logic is
> completely screwed, in which case you better mention that in the commit log.
> 

For arm-compute-library the shlib logic was completely screwed but I
think that got fixed for this version. Let me run some checks and I'll
drop these if it all works.

Andrew

> 
>> +"
>> +
>> +PACKAGECONFIG += "unit-tests tests ref"
>> +PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', 'neon', '', d)}"
>> +PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'arm', 'neon', '', d)}"
>> +
>> +PACKAGECONFIG[neon] = "-DARMCOMPUTENEON=1, -DARMCOMPUTENEON=0"
>> +PACKAGECONFIG[unit-tests] = "-DBUILD_UNIT_TESTS=1, -DBUILD_UNIT_TESTS=0"
>> +PACKAGECONFIG[tests] = "-DBUILD_TESTS=1, -DBUILD_TESTS=0"
>> +PACKAGECONFIG[ref] = "-DARMNNREF=1, -DARMNNREF=0"
>> +
>> +EXTRA_OECMAKE += " \
>> +    -DHALF_INCLUDE=${STAGING_DIR_TARGET} \
>> +"
>> +
>> +do_install:append() {
>> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>> +
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; then
>> +        install -d ${D}${bindir}/${P}
>> +        find ${B}/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir}/${P} \;
>> +    fi
>> +
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'unit-tests', 'true', 'false', d)}; then
>> +        install -d ${D}${bindir}/${P}
>> +        cp $CP_ARGS ${B}/UnitTests ${D}${bindir}/${P}
>> +    fi
>> +
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'tensorflow-lite', 'false', 'true', d)}; then
>> +        rm -rf ${D}${includedir}/armnnTfLiteParser
>> +    fi
>> +}
>> +
>> +CXXFLAGS += "-Wno-error=array-bounds -Wno-error=deprecated-declarations -Wno-error=nonnull"
>> +
>> +FILES:${PN} += "${libdir}/*"
>> +FILES:${PN}-dev += "${includedir}/* ${libdir}/cmake/armnn/* ${libdir}/pkgconfig/*.pc ${bindir}/*"
>> +
>> +INSANE_SKIP:${PN} = "dev-so"
>> +INSANE_SKIP:${PN}-dev += "buildpaths"
>> -- 
>> 2.39.2

