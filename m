Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB57C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:30:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.75858.1722537015390270212
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 11:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SMuD58r2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 471IUFiI094123
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722537015;
	bh=i/fqwuKJELP2vEyMxIKmPWzbABj8qY0BGe5VawIVzBM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=SMuD58r2bcvXLTQCwmo9Wg1mz5+BxACw1cjzhKoltu4/WbgTaTJm/diq85WffH3+3
	 E0MC1chE2q4ZJq10SGDkv1ZNUqWJezJB8dMBjBTPfeX1r0s2T3TtcDwujdwcZK7uq+
	 1WK7JnYvwbgv7+GXtAYGMH+ZCV+k6XIJ4O9BPFXs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 471IUEkI050562
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 1 Aug 2024 13:30:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Aug 2024 13:30:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Aug 2024 13:30:14 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 471IUEtM003258;
	Thu, 1 Aug 2024 13:30:14 -0500
Message-ID: <fdfbd39f-f72b-471e-9651-d7086d9e46a6@ti.com>
Date: Thu, 1 Aug 2024 13:30:14 -0500
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
 <meta-arago@lists.yoctoproject.org>; Thu, 01 Aug 2024 18:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15478



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

This does apply.  Your current patch does not include your recent ffmpeg 
patch which has been in production on scarthgap since Saturday.  Make 
sure you always rebase your patches on top of the latest changes before 
you submit in order to reduce the strain on the maintainers who have to 
figure out how to apply your patch.  Many will not take the time and 
just reject the patch.

I myself will sometimes reject (like this case), and other times I'll 
just fix up the patch while applying depending on the circumstances of 
why the patch does not apply and what mood I'm in that day.


>   MULTIMEDIA:omapl138 = ""

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

