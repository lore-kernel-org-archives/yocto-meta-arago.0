Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A994C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:37:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.44230.1721741857745383519
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jul 2024 06:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EOyCXkMN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46NDbbJu040042
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 08:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721741857;
	bh=ZrEPF4IYDBGEJ7GUimHKUOweCnMMSFE9xRjDJnXQ8/0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EOyCXkMNzATl4/RiIeiCD/ScnDvgft1Ez0O7xp22YNQn+kOGEbP78iysWxfI8/LlI
	 c826hhnNKUCb3AQ8TNxqt8AuQuhkUWbpl43b2wKaqnuaYTwuSjXFXj4g7GT0bS1/kA
	 obtQuWN43YhzOQlUlMP6AT29jqqgoStajpxADB2U=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46NDbbj8070311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 08:37:37 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jul 2024 08:37:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jul 2024 08:37:37 -0500
Received: from [10.249.34.79] ([10.249.34.79])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46NDbapq020031;
	Tue, 23 Jul 2024 08:37:36 -0500
Message-ID: <5844bb61-4b9e-409f-9b8c-f5d82936f410@ti.com>
Date: Tue, 23 Jul 2024 08:37:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] Added ffmpeg package to scarthgap
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240722221657.157473-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240722221657.157473-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 13:37:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15465

The subject is a little odd in the wording.  Added is the past tense of 
the verb.  Also, our patches usually include the name of the recipe file 
so that scanning through the list of commits becomes clearer what area 
the patch is touching.  Finally, including the branch name in the commit 
message makes it harder to think of the patch being able to apply to 
other branches.  I think a better subject would be:

packagegroup-arago-tisdk-multimedia: Add ffmpeg package

And as Chirag pointed out, unless a patch is directly targeting issues 
related to a specific branch, we usually include master as well to make 
it clear that the patch can/should be applied to both.

So:

[meta-arago][master/scarthgap][PATCH] ...


Please submit a v2.


On 7/22/2024 5:16 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Added ffmpeg package to scarthgap
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 6571d484..2085ad09 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -8,6 +8,7 @@ inherit packagegroup
>   
>   MULTIMEDIA = " \
>       amsdk-av-files \
> +    ffmpeg \
>       libcamera \
>       libcamera-gst \
>   "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

