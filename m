Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF27EB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 10:47:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.184118.1692269258566793758
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 03:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XXZmcuwL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37HAlYM8014167;
	Thu, 17 Aug 2023 05:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692269254;
	bh=g+KaM5JYe7AuaZnoAk3V15V1VyO3FcWYyEmmdBaJphM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XXZmcuwLrxKb1j3mV9DbJANA5a4w2XQAqD4OvzfodSb6aQHu0H+Uvr7sXlJsl+KH7
	 IR0Y+CWlFH405NKi+JSvzDzNqCDZfF62Uxp4w5R8QOGirPqjM8GO3FoazMf8QKIA1Y
	 ByI3OEm6rNvLkwQm439UPcV/PHrY7OZa8/q3iPjw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37HAlYrw098093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Aug 2023 05:47:34 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Aug 2023 05:47:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Aug 2023 05:47:33 -0500
Received: from [10.24.68.161] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37HAlVDh077245;
	Thu, 17 Aug 2023 05:47:32 -0500
Message-ID: <87d7fe17-2dd1-f27f-aba0-b8afb5679b8e@ti.com>
Date: Thu, 17 Aug 2023 16:17:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [EXTERNAL] [meta-arago] [kirkstone][PATCH 5/6] meta-arago: remove
 extra plumbing for internal toolchain
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>
References: <20230706212335.1893675-1-denis@denix.org>
 <20230706212335.1893675-6-denis@denix.org>
 <dfefcf02-11bd-75bb-4400-33e7e30463bf@ti.com>
 <20230814192528.GH3359@denix.org>
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20230814192528.GH3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Aug 2023 10:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14855


On 15/08/23 00:55, Denys Dmytriyenko wrote:
> On Fri, Aug 11, 2023 at 05:00:30PM +0530, Aniket Limaye wrote:
>> Hi Denys,
>>
>> This is probably not about this new patch series for the r5f
>> toolchain. I am facing issues with the internal toolchain for A72
>>
>> I was trying out u-boot and linux builds with these new internal
>> toolchains and everything works fine EXCEPT for u-boot-a72 build:
>>
>> I get this error : "aarch64-oe-linux-ld.bfd: cannot find -lgcc: No
>> such file or directory"
>>
>> I narrowed down the error to incorrect Ldir being parsed in the
>> u-boot Makefile here [1] which expects absolute path for the
>> print-libgcc-file-name.
>>
>> The build with the external toolchain works coz that prints the
>> absolute path while the yocto internal toolchain is returning just
>> the filename: ./bin/aarch64-none-linux-gnu-gcc
>> -print-libgcc-file-name #Prints full path to libgcc.a file
>>
>> ./linux-devkit/sysroots/x86_64-arago-linux/usr/bin/aarch64-oe-linux/aarch64-oe-linux-gcc
>> -print-libgcc-file-name #Prints just "libgcc.a". The dirname for
>> this returns "."
>>
>> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2023.04#n895
>>
>> As it stands, I am unable to build u-boot with the internal
>> toolchain. Either something needs to be fixed in the toolchain
>> itself or I am missing some flag / Env variable?
> Aniket,
>
> You need to pass the correct --sysroot to gcc.
>
> And the environment-setup-aarch64-oe-linux script properly sets CC variable
> already with the correct --sysroot of the installed linux-devkit:
>
> $ echo $CC
> aarch64-oe-linux-gcc -mbranch-protection=standard --sysroot=/tmp/sdk/sysroots/aarch64-oe-linux
>
> $ $CC -print-libgcc-file-name
> /tmp/sdk/sysroots/aarch64-oe-linux/usr/lib/aarch64-oe-linux/11.4.0/libgcc.a
>
> You can pass this to the U-boot Makefile:
>
> $ make CC="$CC" <any other vars> <target>
>
> As a reference, u-boot recipe passes at least CROSS_COMPILE, CC and HOSTCC.
>
Explicitly setting CC, with the correct sysroot, when calling make u-boot-a72 worked for me. Thanks for the clarification!

Ryan, we can merge this series now



