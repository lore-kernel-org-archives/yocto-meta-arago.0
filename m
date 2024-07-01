Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA010C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 21:29:04 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9338.1719869336933853012
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jul 2024 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mLBTglXD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 461LSobA044978;
	Mon, 1 Jul 2024 16:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719869330;
	bh=R/enqTGsey83O1/NoznSGUHvxaXGz18LUT14PlIujFQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mLBTglXDekOaxlbrWhTsdhkqTTZGqdInqs5S24F5YcX9U40d4KRfSmycn4BAKwYhA
	 mJAP00qoIB/h9c/JVmlKcTKULTo+6Pe9mzkaydsbzc4OuJTwnima1galB0/TV7oXNw
	 3CdX0QT3+am2w7DF8T9HdN/hsgezMj0tlj2+ukqM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 461LSo9q011934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 16:28:50 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 16:28:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 16:28:50 -0500
Received: from [10.250.33.243] ([10.250.33.243])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 461LSoDN097339;
	Mon, 1 Jul 2024 16:28:50 -0500
Message-ID: <9df4e7bd-aaa2-430e-b234-00e81915fac5@ti.com>
Date: Mon, 1 Jul 2024 16:28:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] openssl-perf: Add
 openssl_aes256_encdec.sh script
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240701143728.26618-1-reatmon@ti.com>
 <20240701212113.GL18231@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240701212113.GL18231@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jul 2024 21:29:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15424



On 7/1/2024 4:21 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 01, 2024 at 09:37:28AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> This is an additional openssl script that our testing flow requires.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../recipes-benchmark/openssl-perf/openssl-perf.bb        | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
>> index 02f41f41..d1c51528 100644
>> --- a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
>> +++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
>> @@ -1,5 +1,5 @@
>> -SUMMARY = "Benchmark for checking various OpenSSL performance functions"
>> -HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh"
>> +SUMMARY = "Benchmarks for checking various OpenSSL performance functions"
>> +HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/"
>>   LICENSE = "CC-BY-SA-3.0"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>>   
>> @@ -7,9 +7,11 @@ PV = "1.0"
>>   
>>   SRC_URI = " \
>>       https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=openssl_perf \
>> +    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_aes256_encdec_scripts/openssl_aes256_encdec.sh;name=openssl_aes256_encdec \
>>       https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
>>   "
>>   SRC_URI[openssl_perf.sha256sum] = "1ba5188beb6a1fa69d9f34df12c596ed49907c2b2d2ce2d985a305b9ecbed800"
>> +SRC_URI[openssl_aes256_encdec.sha256sum] = "c63efc35f7c161e02ef6d53b428bfbfce7ea3f2d329c552dbb04f865317eb408"
>>   SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
>>   
>>   S = "${WORKDIR}"
>> @@ -17,7 +19,9 @@ S = "${WORKDIR}"
>>   do_install() {
>>       install -d ${D}${bindir}
>>       install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
>> +    install -m 0755 ${S}/openssl_aes256_encdec.sh ${D}${bindir}/openssl_aes256_encdec.sh
>>   }
>>   
>>   FILES:${PN} = "${bindir}/openssl_perf.sh"
>> +FILES:${PN} = "${bindir}/openssl_aes256_encdec.sh"
> 
> Should be += here to include both files:

Good catch.  I'll fix both patches.


> ERROR: openssl-perf-1.0-r0 do_package: QA Issue: openssl-perf: Files/directories were installed but not shipped in any package:
>    /usr/bin/openssl_perf.sh
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

