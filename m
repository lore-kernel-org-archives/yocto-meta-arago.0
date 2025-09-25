Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08317CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 16:06:24 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.872.1758816376337527537
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 09:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q+PCyTgc;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PG6D7N1469508;
	Thu, 25 Sep 2025 11:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758816373;
	bh=78zuWSiTiPlCRpjtcz6pGcJs+gBGbHA4CMhvRDPDaho=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=q+PCyTgcMvXQqcC3h7QshRkPWHrNvRxb1u45e8fszIML/dydMJI2hQeeH4RLnORrn
	 lRaXlp3ny/8/g0F5v8V8t72DxTkb01fhERlpZ+EmGo4FLBASlPrgu/betvH4gU/tlP
	 udwNfx4GdAcm9NZtjZyXqhBKcN/NTxhjfF2Zg/TQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PG6D582759522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 11:06:13 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 11:06:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 11:06:13 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PG6CUA3756095;
	Thu, 25 Sep 2025 11:06:12 -0500
Message-ID: <9858e36e-3814-449a-99f0-ce51d0e3b2f1@ti.com>
Date: Thu, 25 Sep 2025 11:06:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH v2]
 packagegroup-arago-tisdk-connectivity: Restrict BT_TI to legacy platforms
To: <y-hegde@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Prudhvi Veeramachaneni <prudhvi@ti.com>
References: <20250925074624.ozym2jd6qlxczwtr@yogi-work-pc>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250925074624.ozym2jd6qlxczwtr@yogi-work-pc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 16:06:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16634

On 9/25/25 2:46 AM, Yogesh Hegde via lists.yoctoproject.org wrote:
> The bt-enable and bt-fw packages are only applicable for AM33X, AM43X and AM57XX
> legacy platforms, but was being included for all machines. While the
> bt-enable script performs noop for unsupported machines, it still adds
> unnecessary overhead to boot time and generates log noise.
> 
> Restrict the bt-enable and bt-fw packages to only be included for the
> specific machine overrides (ti33x, ti43x, am57xx) that actually require
> Bluetooth enablement support.

Do these scripts even work anymore? They look to use the old GPIO_SYSFS
to toggle some GPIO bits, we don't enable that in our kernels anymore.

Might be better to just drop these recipes completely.

Andrew

> 
> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
> ---
> v2:
> - Improved the subject as suggested by Ryan
> - Implemented the change to use CONNECTIVITY_RDEPENDS instead of BT_TI
>    variable as suggested by Ryan
> 
>   .../packagegroups/packagegroup-arago-tisdk-connectivity.bb   | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 5a91357b..0a8d4493 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -63,9 +63,12 @@ CONNECTIVITY_RDEPENDS = " \
>       ${WLAN_COMMON} \
>       ${WLAN_TI} \
>       ${BT_COMMON} \
> -    ${BT_TI} \
>   "
>   
> +CONNECTIVITY_RDEPENDS:append:ti33x = " ${BT_TI}"
> +CONNECTIVITY_RDEPENDS:append:ti43x = " ${BT_TI}"
> +CONNECTIVITY_RDEPENDS:append:am57xx = " ${BT_TI}"
> +
>   RDEPENDS:${PN} = "\
>       ${CONNECTIVITY_RDEPENDS} \
>   "


