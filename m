Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344F4C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 22:54:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.118.1714517683134142336
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 15:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gHxERi3A;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43UMsbah055245;
	Tue, 30 Apr 2024 17:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714517677;
	bh=9Cfkfxiz0hZeJNzedi2QlFxCYB79xXSG5E738hFq+eU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gHxERi3APwX7lEEsoGQ2nRh0lEmoXCfS0UU8dOOC1FAZMmylhpkaiXIMqi4mx8kZu
	 Z4ShAzWaEmhCwUplSq3sgD0V95EACt2WwF2pbXRF8j/Ho3+777rT1jVw83zjlIvktY
	 OLl+mI2N1K2+EKwWPcE7SV6g7MuKGDaQNumSR5gg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43UMsbmN066485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 17:54:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 17:54:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 17:54:37 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43UMsbp7082131;
	Tue, 30 Apr 2024 17:54:37 -0500
Message-ID: <da9dde0d-8555-46ba-83db-3e76f5c8f477@ti.com>
Date: Tue, 30 Apr 2024 17:54:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH] kms++: update to the latest
 and bump version
To: Jayesh Choudhary <j-choudhary@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <denis@denix.org>
CC: <devarsht@ti.com>, <tomi.valkeinen@ideasonboard.com>, <a-limaye@ti.com>
References: <20240430094003.196209-1-j-choudhary@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240430094003.196209-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Apr 2024 22:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15318


Is this supposed to be for kirkstone?  Or did you mean scarthgap?


On 4/30/2024 4:40 AM, Jayesh Choudhary wrote:
> ltp-ddt scripts are using latest dmabuf utilities but the current
> source code does not have that support in kms++.
> Bump up the SRCREV to take into account the latest dmabuf changes.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> index 2c0abaa7..bae03683 100644
> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> @@ -3,12 +3,12 @@ HOMEPAGE = "https://github.com/tomba/kmsxx"
>   LICENSE = "MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
>   
> -PV = "2.1"
> +PV = "2.2"
>   PR = "r1"
>   
>   BRANCH = "master"
>   SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
> +SRCREV = "9ae90ce75478e49844cf984562db0dc1a074462f"
>   
>   DEPENDS = "drm fmt"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

