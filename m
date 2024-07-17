Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009A3C3DA49
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 00:37:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4913.1721176643403809708
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 17:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BVHBdIEY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46H0bIUJ053896;
	Tue, 16 Jul 2024 19:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721176638;
	bh=JDk7osTLDH4FDxSqjJnZbrodNX0DfvqoDNjp0sVbqCE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BVHBdIEYTc4sju4bFjkl/01o5hNmYK9EJZcU/A3/LdzV0VdUAXJidyvukYq5IJs+i
	 T5UVKnx/cHdzuR/Ji4JKfGgIlrPQ/wanDm/x4s/gGzQIL7aqfG31NsVdgZvDbiLZN4
	 pGACl5Wv3MLz2PvQ6SPtuDW00F2WSO9G7ge+8qM0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46H0bIM4020684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 19:37:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 19:37:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 19:37:18 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46H0bIxp005699;
	Tue, 16 Jul 2024 19:37:18 -0500
Message-ID: <c76949c3-0adb-4937-a9f6-1b7ff4f6b8eb@ti.com>
Date: Tue, 16 Jul 2024 19:37:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] ti-llvm: adopt an LLVM fix for
 buildpaths errors
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240716015013.3051611-1-denis@denix.org>
 <20240716015013.3051611-2-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240716015013.3051611-2-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Jul 2024 00:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15454



On 7/15/2024 8:50 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Make sure llvm-configs doesn't have absolute build paths.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> index 4b990b7f..810c603b 100644
> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> @@ -62,6 +62,11 @@ EXTRA_OECONF += " --enable-targets="host,arm,c6000,msp430" \
>   
>   EXTRA_OEMAKE += "LIBXML2_INC="${LIBXML2_INC}" LIBXML2_LIBS="${LIBXML2_LIBS}""
>   
> +# patch out build host paths for reproducibility
> +do_compile:prepend() {
> +        sed -i -e "s,${WORKDIR},,g" ${LLVM_BUILD_DIR}/tools/llvm-config/Release/BuildVariables.inc
> +}
> +
>   do_compile:class-native() {
>     cd ${LLVM_BUILD_DIR}
>   

I'm getting build errors with this.

native:

sed: can't read 
/scratch/jenkins_builds/arago-master-wip/build/build/arago-tmp-default-glibc/work/x86_64-linux/ti-llvm3.6-native/3.6/llvm-3.6.build/tools/llvm-config/Release/BuildVariables.inc: 
No such file or directory

nativesdk:

sed: can't read 
/scratch/jenkins_builds/arago-master-wip/build/build/arago-tmp-default-glibc/work/x86_64-nativesdk-arago-linux/nativesdk-ti-llvm3.6/3.6/llvm-3.6.build/tools/llvm-config/Release/BuildVariables.inc: 
No such file or directory


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

