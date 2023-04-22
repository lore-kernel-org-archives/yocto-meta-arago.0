Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88508C77B78
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 22:53:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.17899.1682203975943126604
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 15:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hPRfF9c0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33MMqoLI058044;
	Sat, 22 Apr 2023 17:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682203970;
	bh=8QrAQanAZnr5+xE1BM76Fwzm+IoCNj19UwfVaaBrGQA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hPRfF9c0XMxISNL6WJqm4dN5YelmGq7Ew93SH8lVFPV/psKErA7NXaA81pGpiKLHT
	 KamUpjBTi8h9mnbwG7lvPeg7cJUjxn+3rTBz/depu9JHBc1X+GiPdJBsqHl0boZw6l
	 OthUxIwNtQtl5vXl8tAaT67OYaSFfDXa/p7Qmk9E=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33MMqohJ003748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 22 Apr 2023 17:52:50 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 22
 Apr 2023 17:52:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 22 Apr 2023 17:52:49 -0500
Received: from [10.249.32.24] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33MMqn6G065658;
	Sat, 22 Apr 2023 17:52:49 -0500
Message-ID: <dfb323f8-72a0-ca09-50d8-93af57c8e40f@ti.com>
Date: Sat, 22 Apr 2023 17:52:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v2 2/2] ltp-ddt: Add support
 for version 20230127
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230422220722.10360-1-reatmon@ti.com>
 <20230422220722.10360-3-reatmon@ti.com> <20230422221834.GE9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230422221834.GE9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Apr 2023 22:53:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14336



On 4/22/2023 17:18, Denys Dmytriyenko wrote:
> On Sat, Apr 22, 2023 at 05:07:22PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The internal testing team would like to move to this version as the
>> basis for our internal ltp-ddt.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Add missing space on :append line.
>>
>>   .../ltp-ddt/ltp-ddt_20230127.bb               | 47 +++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>>
>> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>> new file mode 100644
>> index 00000000..10b93a87
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
>> +
>> +SRC_URI:append = "https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h "
> 
> Gulp. While both :prepend and :append need to ensure whitespaces are
> explicitly added to separate entries in the list, those are needed at
> different places. It is tailing space for :prepend and leading space
> for :append, of course. Or use += here to be safe...

Yeah...  It's been a long week and I'm rushing.  I was only using append 
because two lines above used prepend and I was trying to be consistent. 
v3 incoming.

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

