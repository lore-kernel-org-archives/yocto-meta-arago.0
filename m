Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDD9CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:14:13 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.17912.1758636847221835339
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 07:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Xe2mvO1d;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NEE4LZ1019231;
	Tue, 23 Sep 2025 09:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758636844;
	bh=UHqS8Gfsp2ln2SSbUtSQ6R8c9/sFlN9j2OxqOtwWneQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Xe2mvO1dGCsGaX+dx0wSmU+Ln5mTLWhTjQqO+0jm0ZA09MJcOt0EZ1T9xclpJ2NWE
	 BNLa3L8rb3w5720CvZOff+R2yezCrNfBppTt9zsPqDjyisX5JmVJPB5PhkKH5hKpMl
	 lJcZ7+rgOrQh7lqFEOfKwE3BYcAOKRJwjWnMyL8A=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NEE4YG1134668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 09:14:04 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 09:14:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 09:14:04 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NEE46J161522;
	Tue, 23 Sep 2025 09:14:04 -0500
Message-ID: <e4aaca79-0ef3-4097-b13a-b5addef8b430@ti.com>
Date: Tue, 23 Sep 2025 09:14:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] bt-ti: Restrict bt-ti
 packages to legacy platforms only
To: Yogesh Hegde <y-hegde@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Prudhvi Veeramachaneni <prudhvi@ti.com>
References: <20250923121539.i7bx4zt7krbzmc7v@yogi-work-pc>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250923121539.i7bx4zt7krbzmc7v@yogi-work-pc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Sep 2025 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16615


The subject should be:

packagegroup-arago-tisdk-connectivity: Restrict bt-ti to legacy platforms


On 9/23/2025 7:15 AM, Yogesh Hegde wrote:
> The bt-enable and bt-fw packages are only applicable for AM33X, AM43X and AM57XX
> legacy platforms, but was being included for all machines. While the
> bt-enable script performs noop for unsupported machines, it still adds
> unnecessary overhead to boot time and generates log noise.
> 
> Restrict the bt-enable and bt-fw packages to only be included for the
> specific machine overrides (ti33x, ti43x, am57xx) that actually require
> Bluetooth support.
> 
> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
> ---
>   .../packagegroup-arago-tisdk-connectivity.bb       | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 5a91357b..5eeeaa01 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -49,7 +49,19 @@ BT_COMMON = "\
>       linux-firmware-ibt-18 \
>   "
>   
> -BT_TI = "\
> +BT_TI = ""
> +
> +BT_TI:append:ti33x = "\
> +    bt-enable \
> +    bt-fw \
> +"
> +
> +BT_TI:append:ti43x = "\
> +    bt-enable \
> +    bt-fw \
> +"
> +
> +BT_TI:append:am57xx = "\
>       bt-enable \
>       bt-fw \
>   "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

