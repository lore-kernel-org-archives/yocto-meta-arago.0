Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A454C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:09:39 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.75127.1722535778497395953
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 11:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cElFqhia;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 471I9bG8063395
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722535777;
	bh=t1A0Nc0Nqi1UxNtlVOJIoBcMdYfF5x5P6KZFyf3w8s0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=cElFqhiaCHTSlS7ha0ZRGzNso8/Qm486YG8hZm4Q+892qNmfsQDuzl32VbRmk/VaY
	 871pqoeVX6D7k6E3Z19g3/w6ZQyvQNLY/ws/YF/Hj5NgbhFt6tvuo4D/LrtRh/CXls
	 iCMgWpPWzymYLQjFxFKMvcRsX7GUzFzMEG9/F9ww=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 471I9bu7013413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:09:37 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Aug 2024 13:09:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Aug 2024 13:09:37 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 471I9bgF103229;
	Thu, 1 Aug 2024 13:09:37 -0500
Message-ID: <ff77401c-2a69-4ebd-880c-cbbaf0bc4be0@ti.com>
Date: Thu, 1 Aug 2024 13:09:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH]
 packagegroup-arago-tisdk-multimedia: Add mpv package
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240801155113.12804-1-t-lannynd@ti.com>
 <Groupsio.1.20240801155113.12804-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <Groupsio.1.20240801155113.12804-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Aug 2024 18:09:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15475


It is common practice to add a v2, v3, v4, etc... to the subject line 
when sending edits to a patch.  Like this:

[meta-arago][master/scarthgap][PATCH v2] 
packagegroup-arago-tisdk-multimedia: Add mpv package

And then in the patch after the --- to list the different versiosn and 
what all you changed.  Like this:


Add mpv package to allow for video playback and streaming of online videos

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v2: Updated commit message

   .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 +
   1 file changed, 1 insertion(+)


That way the edit comment does not make it into the actual commit 
message, but you can still explain what changed from the previous version.

Please send a v3 and fix the above.


On 8/1/2024 11:18 AM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> [Edited Message Follows]
> [Reason: Updated commit message]
> 
> From: Thorsten Lannynd <t-lannynd@ti.com>
> 
> Add mpv package to allow for video playback and streaming of online videos
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
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

