Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F83C77B78
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 22:02:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.17368.1682200945473248679
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 15:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LPnZDCRv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33MM2IuM047885;
	Sat, 22 Apr 2023 17:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682200938;
	bh=4B7Z4ieXYnZclqRGk77fQ0gme7SWt3jyhGtN/2FFq3A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LPnZDCRvEpVu82ZFtnrzzTqtDBKcvr19nbVH6D6FrrOe6dfNnSvkR4Rerg6i0XNJ5
	 eRWiwstzRDQmBqO48Gg1lg/C1VmCnuY5slS3HN0XaS78Di5HDxFJD6uOjV2bumTi5c
	 StWgecv7hwpT5lKjWVI7bW3qRwAD7Q73zDrEf5qg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33MM2I1k105575
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 22 Apr 2023 17:02:18 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 22
 Apr 2023 17:02:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 22 Apr 2023 17:02:17 -0500
Received: from [10.249.32.24] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33MM2HaN015739;
	Sat, 22 Apr 2023 17:02:17 -0500
Message-ID: <0093b920-61ea-1579-1ffa-9187c49ee636@ti.com>
Date: Sat, 22 Apr 2023 17:02:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arago][master/kirkstone][PATCH 2/2] ltp-ddt: Add support
 for version 20230127
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230422165917.24845-1-reatmon@ti.com>
 <20230422165917.24845-3-reatmon@ti.com> <20230422215536.GC9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230422215536.GC9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Apr 2023 22:02:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14331



On 4/22/2023 16:55, Denys Dmytriyenko wrote:
> On Sat, Apr 22, 2023 at 11:59:17AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The internal testing team would like to move to this version as the
>> basis for our internal ltp-ddt.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../ltp-ddt/ltp-ddt_20230127.bb               | 47 +++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>>
>> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>> new file mode 100644
>> index 00000000..52e2f611
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>> @@ -0,0 +1,47 @@
>> +FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
>> +FILESEXTRAPATHS:prepend := "${ARAGOBASE}/meta-arago-extras/recipes-extended/ltp/ltp:"
>> +
>> +require recipes-extended/ltp/ltp_${PV}.bb
>> +
>> +SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
>> +HOMEPAGE = "https://git.ti.com/cgit/test-automation/ltp-ddt/"
>> +
>> +PROVIDES += "ltp"
>> +
>> +DEPENDS += "alsa-lib"
>> +
>> +PE = "1"
>> +PR = "r7"
>> +PV:append = "+git${SRCPV}"
>> +
>> +SRCREV = "7f2fc4b7c972f2f188836c739a7175fad2f2b288"
>> +BRANCH ?= "master"
>> +
>> +SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
>> +SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
> 
> Here :prepend does have a trailing space, good.
> 
>> +SRC_URI:append = "https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h"
> 
> But here :append doesn't have one - could cause issues.

Roger that.


> 
>> +SRC_URI[rpmsg_rpc.sha256sum] = "cd237f40a37520a1f2df19fbfeefd00c0a5ad68efeaba9ba0fba60ca16ea09be"
>> +
>> +export prefix = "/opt/ltp"
>> +export exec_prefix = "/opt/ltp"
>> +
>> +EXTRA_OEMAKE:append = " \
>> +    KERNEL_USR_INC=${WORKDIR} \
>> +    ALSA_INCPATH=${STAGING_INCDIR} \
>> +    ALSA_LIBPATH=${STAGING_LIBDIR} \
>> +"
>> +
>> +RDEPENDS:${PN} += "\
>> +    acl \
>> +    at \
>> +    pm-qa \
>> +    serialcheck \
>> +    memtester \
>> +"
>> +
>> +do_install:prepend() {
>> +	# Upstream ltp recipe wants to remove this test case in do_install
>> +	install -d ${D}${prefix}/runtest/
>> +	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
>> +}
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

