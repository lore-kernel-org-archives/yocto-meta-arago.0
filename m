Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8184C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:22:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.75650.1722536559660955740
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 11:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k7OM18Db;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 471IMdQC004673
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722536559;
	bh=3n1bHx1h31jOLcBlHWK1WYXYEYIWfKtJRv5xqhjdFDE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=k7OM18Dbe7GTbRlM8xcEH4IGcZEYilZU7uZnakh0/rt4Eg4WyoJM/oXjnvyp5N4kp
	 5ntyUS07jBBxJ6MZ3Nktv2BxNOcbd+JzevwkfIdzKkx2/MFhFrHbxiIGyQGiFwXSKa
	 9aGfUVYwGvRnhpOoin1yLKUpK+VG4MjVVPWRmzbA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 471IMdc4020243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:22:39 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Aug 2024 13:22:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Aug 2024 13:22:38 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 471IMctK072961;
	Thu, 1 Aug 2024 13:22:38 -0500
Message-ID: <78ff5717-33ed-448c-8190-251e64b61a42@ti.com>
Date: Thu, 1 Aug 2024 13:22:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH v3]
 packagegroup-arago-tisdk-multimedia: Add mpv package
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240801181807.13201-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240801181807.13201-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Aug 2024 18:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15477


Thank you.


On 8/1/2024 1:18 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> From: Thorsten Lannynd <t-lannynd@ti.com>
> 
> Add mpv package to allow for video playback and streaming of online videos
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> v3: Add version number to patch
> 
> v2: Update commit message
> 
>   .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 6571d484..1ed1b8ab 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -10,6 +10,7 @@ MULTIMEDIA = " \
>       amsdk-av-files \
>       libcamera \
>       libcamera-gst \
> +    mpv \
>   "
>   
>   MULTIMEDIA:omapl138 = ""

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

