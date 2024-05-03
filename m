Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB9CC04FFE
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 01:05:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2394.1714698345768566913
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 May 2024 18:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g62pWYg7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44315dDs120045;
	Thu, 2 May 2024 20:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714698339;
	bh=l+pv8ulygaUmB2pRDEmoQbtGERYoIPmmgoOIv+FL808=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=g62pWYg7I09utP/4455WOtebnaA3KT1vRum9YvTIUEMdyFyUgpO6TRgM8x5U54VtV
	 EI1ttHX4nOZhCOLdmVEcMzpvwIZJfKZKK8n5W1sEccytQqLo2D/yYMOYBOGQQh3Swg
	 qhO1ZKTNWDVmBelRcYkI91Oq34sYCodQjEvKda00=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44315dC2026818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 20:05:39 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 20:05:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 20:05:39 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44315cij010689;
	Thu, 2 May 2024 20:05:38 -0500
Message-ID: <77b06855-588e-4f23-a145-aec8fc80c29a@ti.com>
Date: Thu, 2 May 2024 20:05:38 -0500
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
 <meta-arago@lists.yoctoproject.org>; Fri, 03 May 2024 01:05:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15324



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

Did you do any test builds with this?  I'm getting build errors related 
to the line in the recipe:

EXTRA_OEMESON = "-Dsystem-pybind11=enabled"

Which needs to be removed according to this commit:

https://github.com/tomba/kmsxx/commit/77eedf7574809ce5edf4d4ea6aa55542b3045c02

So I'm not sure how you did a test build that worked...  Can you send a v2?



>   DEPENDS = "drm fmt"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

