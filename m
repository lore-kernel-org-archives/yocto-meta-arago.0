Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16431C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 13:48:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.9983.1647611309052889608
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 06:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nVZwQoHU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IDmOh6095944;
	Fri, 18 Mar 2022 08:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647611304;
	bh=oiUARMPhoqKwiq6g0XY5Go+y5n0zegAbl72t9Nj4Oo8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nVZwQoHUp+xfw34U5j9hHhQxPqC7e1L0LTF4IyHHT7b82YJiZ9u9IJsOb584u5voz
	 UXw4fk+7JH/3Aviw2v7vT0YTlxy3L6Kzd1rch8QgeOs7CdGhr2ZErc0kj8s07mFwdT
	 3qzs3rokeSjuYo6edRtwjzauYNdFaHFeprOtMtwM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IDmO2W098832
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 08:48:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 08:48:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 08:48:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IDmN28002663;
	Fri, 18 Mar 2022 08:48:23 -0500
Date: Fri, 18 Mar 2022 08:48:23 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] images: Build
 tisdk-thinklinux-image with tisdk-core-bundle
Message-ID: <20220318134823.7rzaq2wqcfnkxgv2@animate>
References: <20220314202840.18904-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220314202840.18904-1-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 13:48:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13637

On 15:28-20220314, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add tisdk-thinklinux-image to the list of TARGET_IMAGES for
> tisdk-core-bundle.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> index 9f0e65db..5ce688ef 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> @@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
>  DTB_FILTER_j7 = "j721e"
>  
>  # List of target side images to build for the SDK
> -TARGET_IMAGES = "tisdk-base-image tisdk-default-image"
> +TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image"
>  
>  # dra71 lcard requires an initramfs with modules for NFS boot
>  TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"

Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

