Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96BBC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 16:38:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.897.1717519116835861293
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 09:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gdIjqwLK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454GcXiE038671;
	Tue, 4 Jun 2024 11:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717519113;
	bh=hqVyBQ+EPIqaCVsOizuk2GUGRlF6A9cHDymtWRw9NIM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gdIjqwLKNVKKTPW4wzt8VzQ//Rj41ozZyYUsHK41fg0nuMIDf+VkeH9QGcWtTLomP
	 UDU8jVgJeozu8W5vIYi5oL9IBW5fiar8ZYx1ISEtOMPVk/FDOx36EGZt+iTd8PO0D0
	 EFvLSqjYBKtrnh6ETkCq0CIe1Q5Phlmu5c0ILShk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454GcXkf076596
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 11:38:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 11:38:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 11:38:32 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454GcWDr110106;
	Tue, 4 Jun 2024 11:38:32 -0500
Message-ID: <08b013f9-1678-43d5-8399-374620a4b0ef@ti.com>
Date: Tue, 4 Jun 2024 11:38:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] arm-ddr-bandwidth: Bandwidth
 script for testing
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240603161039.16176-1-reatmon@ti.com>
 <20240603161039.16176-2-reatmon@ti.com> <20240604160503.GM21287@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240604160503.GM21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Jun 2024 16:38:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15364



On 6/4/2024 11:05 AM, Denys Dmytriyenko wrote:
> On Mon, Jun 03, 2024 at 11:10:39AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> We need to pull a single script in from the matrix-gui packages since
>> they are getting removed.  The runLmDDRBandwidth.sh is required for the
>> ti-test flow.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb    | 23 +++++++++++++++++++
>>   .../recipes-core/packagegroups/ti-test.bb     |  1 +
>>   2 files changed, 24 insertions(+)
>>   create mode 100644 meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
>>
>> diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
>> new file mode 100644
>> index 00000000..fc4aea94
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY = "Benchmark for checking DDR bandwidth"
>> +HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh"
>> +LICENSE = "CC-BY-SA-3.0"
>> +LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> 
> Isn't the default here ^^^ relative to ${S} anyway?

Could be.  I was making a number of changes to get this recipe "right". 
I'll test it and make sure it works without it.  It might be that master 
now requires the UNPACKDIR and when I backported this to scarthgap I 
didn't check that it was not needed.


> 
>> +
>> +PV = "1.0"
>> +
>> +SRC_URI = " \
>> +    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh;name=runLmDDRBandwidth \
>> +    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
>> +"
>> +SRC_URI[runLmDDRBandwidth.sha256sum] = "67997d721b351344d8788200a15bb3640093045bc25f2b5307dd331ebd1556a3"
>> +SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
>> +
>> +S = "${WORKDIR}"
>> +
>> +do_install() {
>> +    install -d ${D}${datadir}/matrix-gui-2.0/apps
>> +    install -m 0644 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh
>> +}
>> +
>> +FILES:${PN} = "${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh"
>> +
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index 4dbd9fca..b71c374b 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -69,6 +69,7 @@ TI_TEST_BASE:append:armv7ve = " \
>>   #    timestamping
>>   TI_TEST_TI_TOOLS = " \
>>       arm-benchmarks \
>> +    arm-ddr-bandwidth \
>>       cpuloadgen \
>>       input-utils \
>>       ltp-ddt \
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

