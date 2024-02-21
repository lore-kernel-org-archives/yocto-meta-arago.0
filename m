Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50616C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 06:02:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.7181.1708495357025297549
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 22:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ToPvL1kM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41L62Z7M005772;
	Wed, 21 Feb 2024 00:02:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708495355;
	bh=4ipEjsLMMouSkgOAtJ/7baJFpU8tIlNWor0rNx5uD6Y=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=ToPvL1kMlkUEpUSAkvvb7iywYK17d6V0JSCzyK7nxJAtwm26mdr8NBoWrHCKp6JPt
	 YQgx7GO2ZUHnLvrqBBzVikTqhZnQMkASpLqyviRiGGlIQJkPr9kpxGliV3MYqjlfe+
	 +808ADPzE0NMcEkhj8GKTsD4CjA7nedkC4vtIaus=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41L62Zsh001603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Feb 2024 00:02:35 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Feb 2024 00:02:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Feb 2024 00:02:35 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41L62Xxi044106;
	Wed, 21 Feb 2024 00:02:34 -0600
Message-ID: <286d23e8-264c-464a-b598-ea43d596e66d@ti.com>
Date: Wed, 21 Feb 2024 11:32:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] packagegroup-arago-tisdk-addons:
 Disable big-data-ipc-demo
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan
 Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240220151926.16264-1-afd@ti.com>
CC: Gyan Gupta <g-gupta@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240220151926.16264-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Feb 2024 06:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15207

On 20/02/24 20:49, Andrew Davis wrote:
> Temporarily disable big-data-ipc-demo until a fix for missing
> kernel header dma_buf_phys.h is complete.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>
> Changes for v2:
>   - Comment out whole section
>
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 4dec290a..11d10596 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -88,9 +88,9 @@ EXTRA_PACKAGES:omapl138 = " \
>   EXTRA_PACKAGES:append:omap-a15 = " ti-ipc-examples-linux"
>   EXTRA_PACKAGES:append:omapl138 = " ti-ipc-examples-linux"
>   
> -EXTRA_PACKAGES:append:omap-a15 = " \
> -    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)} \
> -"
> +#EXTRA_PACKAGES:append:omap-a15 = " \
> +#    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)} \
> +#"
>   
>   # acontis-atemsys
>   #EXTRA_PACKAGES:append:am335x-evm = " pruss-lld-apps"

