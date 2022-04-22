Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7D1C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:30:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.70.1650655130450331257
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 12:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jkzlHAVm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23MJImKM060279;
	Fri, 22 Apr 2022 14:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650655128;
	bh=TUoB7xoXE1+qgoZyLqSIVmvmkv2LhF4yjvQdX4S3jBg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jkzlHAVmZ993PexgToQiFCYhtIh6pvOkjXcbNLIyIjeB5yunM/llFV6xIKTRWTkKg
	 5W59zGsKS/ywOR4vFwPs/7qdhdOhYJ/WW/likxvUIyg0REg/exjghhdxrZIyym17nH
	 bX+Et1WHZ6IvJCgruHzuK69ztne+uTPgGedapQeM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23MJImSE044060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Apr 2022 14:18:48 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Apr 2022 14:18:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Apr 2022 14:18:48 -0500
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23MJImfi111300;
	Fri, 22 Apr 2022 14:18:48 -0500
Message-ID: <b576e7de-fee6-d7da-cda2-b0887afee2d7@ti.com>
Date: Fri, 22 Apr 2022 14:18:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [meta-arago][master/dunfell][PATCH] arm-benchmarks: Bump SRCREV
 to fix for CPU frequency calculations
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220422184143.20211-1-reatmon@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220422184143.20211-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 22 Apr 2022 19:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13785



On 4/22/2022 1:41 PM, Ryan Eatmon wrote:
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Some description in commitmsg?


> ---
>   .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
> index 5f6279ad..528f5a6e 100644
> --- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
> +++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
> @@ -7,7 +7,7 @@ SECTION = "system"
>   PR = "r13"
>   
>   BRANCH ?= "master"
> -SRCREV = "a3126fd88edd911fff33ace5b813652397bf4cfe"
> +SRCREV = "fefaf9bdd6f36ab0cebaab8dbf34e5beb50f471c"
>   
>   SRC_URI = "git://git.ti.com/apps/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
>   

