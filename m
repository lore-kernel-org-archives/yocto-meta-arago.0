Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4DBC47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 13:54:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.38221.1711547641639801316
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 06:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pCllEmxw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42RDs02q113533
	for <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 08:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711547640;
	bh=kqIbN0KQOl6ZVSGccpnSmwPj/+dLs5Q4hqtQsqOxAgM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=pCllEmxwfctVa7P8ruzYUT3o4se0r+yHB4W9mCzlc3e9czcmyi1L1YldJEjDYLr71
	 w9tf5FPADq9IdIOHFvDDx8rETjrZFa+LqwsBaXPri68uq9UVsMHTU4FEfT6cdLx02t
	 nN6OSeN3aOp3HtC6Q5IyfsTpfiPjoyMzZtJuWbYc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42RDs0Zf007811
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 08:54:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Mar 2024 08:54:00 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Mar 2024 08:54:00 -0500
Received: from [10.249.39.109] ([10.249.39.109])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42RDs042094751;
	Wed, 27 Mar 2024 08:54:00 -0500
Message-ID: <96a22418-08ee-4dfb-a7a6-c27351b85679@ti.com>
Date: Wed, 27 Mar 2024 08:54:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH] meta-arago-test:
 cpuloadgen: Update SRCREV to latest
To: Aniket Limaye <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240327094100.2675069-1-a-limaye@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240327094100.2675069-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 27 Mar 2024 13:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15251



On 3/27/2024 4:41 AM, Aniket Limaye wrote:
> Pulls in multi CPU support (no more limitation to dual-core max).
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
> index 37842ea0..3c463d33 100644
> --- a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
> +++ b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
> @@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/ptitiano/cpuloadgen"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c6c2eb46c569d0cd7884089fea6b4f31"
>   
> -PV = "0.93"
> +PV = "v0.94"

Please remove the v from the PV variable.


>   PR = "r1"
>   
>   BRANCH ?= "master"
> -SRCREV ?= "301d69899d6f4d84f143e0ed86957eea416a27a6"
> +SRCREV ?= "dd2052b581ae7c2e0e06344887885fd6cd66eebb"
>   
>   SRC_URI = "git://github.com/ptitiano/cpuloadgen.git;protocol=https;branch=${BRANCH}"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

