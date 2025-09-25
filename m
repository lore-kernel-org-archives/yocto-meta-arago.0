Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36B2CAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 19:38:35 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.329.1758829114073494552
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 12:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OFikYDUJ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PJcUuK1993328;
	Thu, 25 Sep 2025 14:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758829110;
	bh=hvS1IjejoCMKzZW9IQKjPWcJPzW9KuhG+flVU83UZ0w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OFikYDUJDcVxMikfTXGezGpSKkI7ZmV383ixkOijXUQet7KA9YBURVI+kiXCdhE21
	 j7hdCav6xBTN30B3Ln6TwEXixu2Z3NmGa4B9eR40FWXU9wOTEU7uyW9FkseT3LA5KR
	 RgE7QVq7e0apoLSBewg1qiwu23W348S5+ITlreq0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PJcULf3783199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 14:38:30 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 14:38:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 14:38:30 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PJcTOv081140;
	Thu, 25 Sep 2025 14:38:29 -0500
Message-ID: <1d9dd520-df9c-4b7a-974d-27b8c0455bc6@ti.com>
Date: Thu, 25 Sep 2025 14:38:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH v2] linux-firmware-arago: correct
 removal of overlapping FW
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250925193019.2938469-1-denis@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250925193019.2938469-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 19:38:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16641

On 9/25/25 2:30 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Use the correct variable, instead of hard-coding /lib/firmware, when
> removing firmware images that overlap with the ones from meta-ti-bsp.
> This way it will work properly even when usrmerge is enabled.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> v2 - separate patches for master and scarthgap
> 
>   .../recipes-kernel/linux-firmware/linux-firmware-arago.inc | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
> index 43c54575..30bf399d 100644
> --- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
> +++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
> @@ -1,6 +1,7 @@
> -PR:append = ".arago2"
> +PR:append = ".arago3"
>   
> +# meta-ti-bsp packages newer versions on these
>   do_install:append() {
> -	rm -rf  ${D}/lib/firmware/ti-connectivity/
> -	rm -rf  ${D}/lib/firmware/cadence/
> +	rm -rf  ${D}${nonarch_base_libdir}/firmware//ti-connectivity/
> +	rm -rf  ${D}${nonarch_base_libdir}/firmware//cadence/

"//" double slash, probably doesn't hurt but does look odd..

Andrew

>   }


