Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5101EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 18:26:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4524.1688063175317758908
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 11:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fZ6ZOz7s;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35TIQB12110990;
	Thu, 29 Jun 2023 13:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688063171;
	bh=i60yTYHPCuyGBXNkjqmyYtYyC2VDSiaZrLUh39vG0oY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fZ6ZOz7si+xAAUqov79A7flGCn06dec8j+J6JSQevaBeBm7yTnaPlY5baeGJZ3Whl
	 9ia6dW+mQ0WQRvA0ae7yPuChW+Io0cKub77XXGVUT3QMldDUvsxNKHQJtZ0qcmQ9Ou
	 R1gm7IXoCG664rJT6yUhCiv/PuYSs4hDXQEDe9fY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35TIQALA001405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Jun 2023 13:26:10 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Jun 2023 13:26:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Jun 2023 13:26:10 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35TIQABE130379;
	Thu, 29 Jun 2023 13:26:10 -0500
Message-ID: <c33f642a-acb0-9b9c-f51c-7a793daf6925@ti.com>
Date: Thu, 29 Jun 2023 13:26:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago] [master][PATCH] arago-prefs: pin down mbedtls
 version for open62541
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230629182244.3533996-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230629182244.3533996-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 18:26:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14738



On 6/29/2023 1:22 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Our patched version of open62541 uses entropy_poll.h header from mbedtls
> that is no longer being exported by version 3.x, pin to version 2.x for
> now.


Competing patches...  which one will win?


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

