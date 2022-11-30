Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E751AC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 22:16:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26926.1669846610073222996
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 14:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=K7JgdG5Y;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMGn6G081299;
	Wed, 30 Nov 2022 16:16:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669846609;
	bh=jETBnDazPf1odO8m1zAbwvRs2TntrdFejhVa5EZJHSU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=K7JgdG5YZ1z6j+ZaI2ebchWQ1v3WfZEcztl5fQ9wnga0zLnHvPLRMdeGqEj2qIk6V
	 0KlwsL2T8j4wN/OoSxBcpqrOKj9WBbsyu8sWyHyVohoXaBQ/oUuwtK/B1sRub1n1o3
	 0bBMb28fcmwEU6uEZGwbzfeIPrCpJCf4bcdu8lDY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AUMGnwh068418
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Nov 2022 16:16:49 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 30
 Nov 2022 16:16:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 30 Nov 2022 16:16:49 -0600
Received: from [10.250.33.225] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMGm53074149;
	Wed, 30 Nov 2022 16:16:48 -0600
Message-ID: <31f04525-c98d-a84e-4157-abc254b9c242@ti.com>
Date: Wed, 30 Nov 2022 16:16:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [meta-arago][master][PATCH 1/2] tisdk-addons: Remove libdrm-kms
 from the dependencies
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <172C7C7B5F77AF0F.27320@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <172C7C7B5F77AF0F.27320@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14121


This was not meant to be a two part patch.. ignore this one...



On 11/30/2022 16:13, Ryan Eatmon via lists.yoctoproject.org wrote:
> KMS support was removed from DRM upstream [1].  If it does not exist,
> then we should not depend on it.
> 
> [1] https://gitlab.freedesktop.org/mesa/drm/-/commit/2b997bb4bb688be00620887c8646ff24ccb9396b
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 07ae8b07..e6368267 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -16,7 +16,6 @@ UTILS = " \
>       oprofile \
>       netkit-ftp \
>       ptpd \
> -    libdrm-kms \
>       strongswan \
>       kexec \
>       kdump \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

