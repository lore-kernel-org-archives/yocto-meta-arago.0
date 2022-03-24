Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09245C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:16:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.10596.1648127808201684707
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=I1O0FQ0r;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODGkmv065111;
	Thu, 24 Mar 2022 08:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648127806;
	bh=Q9MVb0+WkzVR71JCNNFOuj1Cwg568jKG5aTRlcsPtG8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=I1O0FQ0rEGv0Y67fX1cs+MEHt8WIINWmxlJ9drueQGq6DOEXcZKB74Ivc6Ad95dFM
	 nYJcMc59NzjmlE0smdtS38xb1s6wIPpzjB6kFn+NzLbjB+QywXLf0dQY/xzh39PUNI
	 Vy4Mbis8msGijiokOX1U1rNaRhDgXD77opv4nKD0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODGkvv123610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:16:46 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:16:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:16:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODGjWn073540;
	Thu, 24 Mar 2022 08:16:45 -0500
Date: Thu, 24 Mar 2022 08:16:45 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH v2] images: Build
 tisdk-thinlinux-image with tisdk-core-bundle
Message-ID: <20220324131645.gihsiax25ecqvu45@washbowl>
References: <20220323153451.15543-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220323153451.15543-1-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:16:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13736

On 10:34-20220323, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add tisdk-thinlinux-image to the list of TARGET_IMAGES for
> tisdk-core-bundle.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> 
> -
> v2 - Fix typos in commit message.

you want to move this to diffstat section (below the cut line: ---)

Otherwise:

Reviewed-by: Nishanth Menon <nm@ti.com>

> 
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
> -- 
> 2.17.1

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

