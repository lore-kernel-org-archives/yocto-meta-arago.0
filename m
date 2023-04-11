Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3057DC7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:09:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.27289.1681247350731734368
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kKK3le7l;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BL96h5019632;
	Tue, 11 Apr 2023 16:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681247346;
	bh=gsq0Ohb0z2RcXY1IaC0PEvylQS5FBiqR37WCqlhRdFY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kKK3le7ltmXJtWGBlxr24UKP/Tl1g09kw+WhIslfx7Z550K9t+9FG4ZKhgq1+OUlo
	 W/IMZB0WFlYI0aLkeE+R9VL/pGEzVBA5het0fHzPpOZGlwLopg5Oxsm7UHFrBB1Nqv
	 EGGWao723KxOj/YbMDiUC+aLZCQ8ngi/VAPG5wF4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BL969h012179
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:09:06 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:09:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:09:06 -0500
Received: from [10.250.33.184] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BL959p026995;
	Tue, 11 Apr 2023 16:09:06 -0500
Message-ID: <1115ba35-b3b7-e6c9-0e29-99336d474dfe@ti.com>
Date: Tue, 11 Apr 2023 16:09:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] linux-libc-headers: Remove
 custom Linux libc headers
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230410204859.30707-1-afd@ti.com>
 <20230411193418.GV9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230411193418.GV9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:09:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14308

On 4/11/23 2:34 PM, Denys Dmytriyenko wrote:
> On Mon, Apr 10, 2023 at 03:48:59PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> We do not need nor want a custom libc as the base for our packages.
>> Using our own Linux UAPI includes creates this situation and will
>> cause issues for packages that make use of the custom kernel headers
>> when moving from kernel to kernel.
>>
>> If we do have some package that does need some custom header then
>> it should be listed in the package itself so this dependency can
>> be tracked correct. This is all described in the base recipe here[0].
>>
>> As recommended, let's not create a custom linux-libc-headers. Remove
>> this recipe and references to specific versions.
>>
>> [0] https://cgit.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc#n7
> 
> Yes, the above recommendation from OE-Core was always there and has been
> enforced for a long time, until there were packages added to Arago and
> TI-SDK requiring TI custom Linux UAPI headers that weren't upstreamed...
> 
> Not sure what's the latest list of such packages in Arago, but I see at
> least "switch-config" is still there. I'd recommend disabling those custom
> packages from the build first, before removing linux-libc-headers - you'll
> get broken builds for either 5.10 or 6.1, which isn't very nice.
> 

big-data-ipc-demo needed a custom UAPI and so I fixed it by depending
on the kernel and using STAGING_KERNEL_DIR directly[0], it is not pretty
but I think it is the closest to "correct" we can get.

If more show up I'll just fix them the same way, I'll go take a look at
switch-config next then.

Andrew

[0] https://lists.yoctoproject.org/g/meta-arago/topic/meta_ti_master_kirkstone_patch/98182004

> But yes, this is the right move going forward - I was hesitant adding this
> hack back in the day and always wanted to remove it, as it would cause
> extra pain during every LTS migration...
> 
> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Acked-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
>> ---
>>   .../conf/distro/include/toolchain-gcc.inc     |  4 ----
>>   .../linux-libc-headers_5.10.bb                | 20 -------------------
>>   2 files changed, 24 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
>>
>> diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>> index 5570594d..1c059a6f 100644
>> --- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>> +++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>> @@ -16,7 +16,6 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
>>   SDKGCCVERSION ?= "11%"
>>   SDKBINUVERSION ?= "2.38%"
>>   SDKGLIBCVERSION ?= "2.35%"
>> -SDKLINUXLIBCVERSION ?= "5.10%"
>>   
>>   PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
>>   PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
>> @@ -25,7 +24,6 @@ PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
>>   PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
>>   PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
>>   PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
>> -PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
>>   PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
>>   PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
>>   PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
>> @@ -35,11 +33,9 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
>>   GCCVERSION ?= "11%"
>>   BINUVERSION ?= "2.38%"
>>   GLIBCVERSION ?= "2.35%"
>> -LINUXLIBCVERSION ?= "5.10%"
>>   
>>   PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>>   PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
>> -PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
>>   PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
>>   PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
>>   PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
>> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
>> deleted file mode 100644
>> index 43493570..00000000
>> --- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> -
>> -PR:append = ".arago0"
>> -
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>> -
>> -BRANCH = "ti-linux-5.10.y"
>> -SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
>> -
>> -KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>> -KERNEL_GIT_PROTOCOL = "https"
>> -SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -# below overrides the multilib list - can be dropped for the next LTS
>> -do_install_armmultilib () {
>> -	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
>> -	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
>> -}
>> -- 
>> 2.39.2
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14307): https://lists.yoctoproject.org/g/meta-arago/message/14307
> Mute This Topic: https://lists.yoctoproject.org/mt/98184756/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/leave/11197283/3619733/932283705/xyzzy [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

