Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3687C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 17:10:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.18871.1700068236591863144
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 09:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PfL/VrMC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AFHAZGH090279;
	Wed, 15 Nov 2023 11:10:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700068235;
	bh=TPsMj3cP/nYQ6+XqHLgF6sho2b4DSdetiNZa0sah1pc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PfL/VrMCTZGPQh/rqzra+ngMVOsAUcDtjy1YANBJY3TDFJ4yLql5T3dMnaEhxC12s
	 PrBTMjIEDCQa5mcItDcaMLpLOGP0PtxZe4o6UsVuSNEPP8JDTIekMaQAZ+sQesvHTy
	 DEc840tkeOXE1UtsNk+8s2iBRx0m0s0hMZAYFvf8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AFHAZ0H109591
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Nov 2023 11:10:35 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 Nov 2023 11:10:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 Nov 2023 11:10:35 -0600
Received: from [10.250.33.185] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AFHAYYh065883;
	Wed, 15 Nov 2023 11:10:35 -0600
Message-ID: <9754608b-eb56-4c3e-ab3e-df640d66fda2@ti.com>
Date: Wed, 15 Nov 2023 11:10:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][krikstone][PATCH 2/2] images: Add support to pack
 the gc320 device libraries
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sinthu Raja <sinthu.raja@ti.com>
References: <20231115110033.4746-1-sinthu.raja@ti.com>
 <20231115110033.4746-3-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231115110033.4746-3-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Nov 2023 17:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15013

On 11/15/23 5:00 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The gc320 driver requires the supporting device libraries to render the
> frames. Add support to install the ti-gc320-libs-dev into the final
> package
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 33ed0f57..baad409a 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -31,6 +31,7 @@ IMAGE_INSTALL += "\
>       ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
>       ti-analytics \
>       ti-demos \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \

This is already pulled in through packagegroup-arago-tisdk-graphics -> ti-gc320-tests -> ti-gc320-libs

Andrew

>       ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
>       packagegroup-arago-tisdk-sysrepo \
>   "

