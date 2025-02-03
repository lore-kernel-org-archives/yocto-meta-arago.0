Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B253C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 06:45:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.82342.1738565108495311000
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 02 Feb 2025 22:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=i/IFNdzt;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5136j4Ag2145203
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 00:45:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738565104;
	bh=c0PHXU8ZJRLwKvtfyYCFRKGlMCJs1+bGvgs1ayNcQQE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=i/IFNdztPWGIscloPzCjLJWpRYK3JiZ4ktLb67gagdNCyTV4zPTl+CKvkeBpyUePt
	 AU2GXzeDX01d3YBMcN3YTjezVJE9/r58LpsS0nkPYcYQPY+IaCc5GuQ5jFwqxW1Gfy
	 FtJ3ZQtFIxueVN05tgi8hpjXkmbjuUqSNUpIRu4M=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5136j4sP118628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 00:45:04 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 00:45:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 00:45:04 -0600
Received: from [172.24.25.255] (lt5cd112gt3k.dhcp.ti.com [172.24.25.255])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5136j2dW028660;
	Mon, 3 Feb 2025 00:45:02 -0600
Message-ID: <99ec7d2c-2f74-44aa-8727-1b74e0f73687@ti.com>
Date: Mon, 3 Feb 2025 12:15:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] ti-test: Add mcrc64 test application
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>
References: <20250130100105.507586-1-a-limaye@ti.com>
 <20250131153813.GL21836@denix.org>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <20250131153813.GL21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Feb 2025 06:45:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15788



On 1/31/2025 9:08 PM, Denys Dmytriyenko wrote:
> On Thu, Jan 30, 2025 at 03:30:48PM +0530, Aniket Limaye via lists.yoctoproject.org wrote:
>> From: Udit Kumar <u-kumar1@ti.com>
>>
>> Add mcrc64 test application recipe.
>> This application is documented at[0].
>>
>> [0]: https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-j722s/10_01_00_04/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/MCRC64.html
>>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
>> ---
>>   .../recipes-core/packagegroups/ti-test.bb     |   1 +
>>   .../recipes-kernel/mcrc64/files/mcrc64.c      | 114 ++++++++++++++++++
>>   .../recipes-kernel/mcrc64/mcrc64.bb           |  19 +++
>>   3 files changed, 134 insertions(+)
>>   create mode 100644 meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
>>   create mode 100644 meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
> 
> ...
> 
>> diff --git a/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
>> new file mode 100644
>> index 00000000..b0352585
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION = "Application to test MCRC64 driver"
> 
> SUMMARY

Ahhh I missed that.
Will send a v2

Regards,
Aniket

> 
> 
>> +
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://mcrc64.c;beginline=1;endline=33;md5=070547e79367134fcfdf7fdb5e3ef7e3"
>> +
>> +SRC_URI = "file://mcrc64.c"
>> +
>> +S = "${WORKDIR}/sources"
>> +UNPACKDIR = "${S}"
>> +
>> +do_compile() {
>> +	${CC} ${CFLAGS} ${LDFLAGS} ${UNPACKDIR}/mcrc64.c -o mcrc64
>> +}
>> +
>> +
>> +do_install() {
>> +	install -d ${D}${bindir}
>> +	install -m 0755 mcrc64 ${D}${bindir}
>> +}
>> -- 
>> 2.48.1


