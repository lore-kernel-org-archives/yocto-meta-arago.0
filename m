Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40084EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 19:59:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.34423.1688673537947313176
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 12:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZmzKb5Mu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 366Jwp9I014354;
	Thu, 6 Jul 2023 14:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688673531;
	bh=aJvseDklFG8hGOO82NExDyu02o22eUC7ClBJ3hd7UJ8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZmzKb5MuxrujOHqO3bce7tFKILUvx6ql8JPCV77wPv+Sc1ucJPT+6rx+suozmYRrW
	 HAUefl4I4WqA6SX56K3a7h+jGy9cXSwU+FEHo5MhjheY5MfCydeyfcHRbI9jDWP6py
	 2KntiDSiRrBoxUqEYQm3rJRTAxUatST1B6h292QU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 366Jwp0f012334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jul 2023 14:58:51 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jul 2023 14:58:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jul 2023 14:58:51 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 366JwpVW125551;
	Thu, 6 Jul 2023 14:58:51 -0500
Message-ID: <55ecfdc8-372f-ecd6-5d47-b0bc0ccb97cb@ti.com>
Date: Thu, 6 Jul 2023 14:58:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago] [master][PATCH] arago-prefs: pin down mbedtls
 version for open62541
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230629182244.3533996-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230629182244.3533996-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 19:59:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14776


You patch gets to live on Kirkstone... they backported the mbedtls 
change to the kirkstone branch and broke our builds.  My patch works for 
master because there is a newer version of open 62541 on master, but 
fails for kirkstone.  So your patch is on deck...


On 6/29/2023 1:22 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Our patched version of open62541 uses entropy_poll.h header from mbedtls
> that is no longer being exported by version 3.x, pin to version 2.x for
> now.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 34c3c539..60d7838c 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -10,6 +10,10 @@ PREFERRED_PROVIDER_virtual/kernel:append = "${ARAGO_KERNEL_SUFFIX}"
>   
>   PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
>   
> +# open62541 requires entropy_poll.h which is not provided by mbedtls 3.x
> +PREFERRED_VERSION_mbedtls = "2.%"
> +PREFERRED_VERSION_nativesdk-mbedtls = "2.%"
> +
>   # Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
>   # application that does not have a GPLv3 license
>   PREFERRED_VERSION_crda = "3.18"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

