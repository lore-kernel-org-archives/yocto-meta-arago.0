Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29389E7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 19:53:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.13172.1734810772734190406
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 21 Dec 2024 11:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fr6GOycS;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BLJqn2D631783
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Dec 2024 13:52:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734810769;
	bh=6gIeHgHllOW8sQKZp/5PR899ljsz/XVenfunT6xI1Vg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fr6GOycSOJwIm9cwNHFckWn+7+V41Qefluy3PBBFenxi7t8fXxQtA799yTc59APDh
	 nH9YvaecQ5zJEssMAQESyO75rhtpZFz1Jus0mxDgWINtzcHqXb0YCDQP1jnllDa51p
	 F/k6mulXFBreMolTTX2YKbx2f3Wib51BsvvbxVvE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BLJqnZh018856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 21 Dec 2024 13:52:49 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 21
 Dec 2024 13:52:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 21 Dec 2024 13:52:48 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BLJqmQL127344;
	Sat, 21 Dec 2024 13:52:48 -0600
Message-ID: <15f48f85-0696-47a3-97da-7d344b2855d1@ti.com>
Date: Sat, 21 Dec 2024 13:52:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 1/2] flatbuffers: Remove
 this recipe
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20241220164910.318809-1-afd@ti.com>
 <20241220164910.318809-2-afd@ti.com> <20241220175239.GL23825@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241220175239.GL23825@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 21 Dec 2024 19:53:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15683

On 12/20/24 11:52 AM, Denys Dmytriyenko wrote:
> On Fri, Dec 20, 2024 at 10:49:09AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> This was used for TFlite and ARMNN before it was included in meta-oe.
>> A newer better maintained version of this is in meta-oe now.
> 
> This was already merged?
> https://git.yoctoproject.org/meta-arago/commit/?id=5b89c02419ba9dc6a2025019f55f46f4f12ea052
> 

Was merged to master, didn't realize it would be needed here on scarthgap.
Probably should have made this patch [scarthgap] only, but the second
patch in this series can go into both scarthgap/master.

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../flatbuffers/flatbuffers_1.11.0.bb         | 34 -------------------
>>   1 file changed, 34 deletions(-)
>>   delete mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
>>
>> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
>> deleted file mode 100644
>> index 7f7b8b99..00000000
>> --- a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -SUMMARY = "Memory Efficient Serialization Library"
>> -HOMEPAGE = "https://github.com/google/flatbuffers"
>> -SECTION = "console/tools"
>> -LICENSE = "Apache-2.0"
>> -
>> -PACKAGE_BEFORE_PN = "${PN}-compiler"
>> -
>> -RDEPENDS:${PN}-compiler = "${PN}"
>> -RDEPENDS:${PN}-dev += "${PN}-compiler"
>> -
>> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
>> -
>> -SRCREV = "bf9eb67ab9371755c6bcece13cadc7693bcbf264"
>> -
>> -SRC_URI = "git://github.com/google/flatbuffers.git;protocol=https;branch=master"
>> -
>> -# Make sure C++11 is used, required for example for GCC 4.9
>> -CXXFLAGS += "-std=c++11"
>> -BUILD_CXXFLAGS += "-std=c++11"
>> -
>> -# BUILD_TYPE=Release is required, otherwise flatc is not installed
>> -EXTRA_OECMAKE += "\
>> -    -DCMAKE_BUILD_TYPE=Release \
>> -    -DFLATBUFFERS_BUILD_TESTS=OFF \
>> -    -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
>> -"
>> -
>> -inherit cmake
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -FILES:${PN}-compiler = "${bindir}"
>> -
>> -BBCLASSEXTEND = "native nativesdk"
>> -- 
>> 2.39.2

