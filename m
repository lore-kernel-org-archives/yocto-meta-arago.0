Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5006C3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:00:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.29955.1722790818971601993
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 10:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NWdxYF90;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 474H0IXY026879
	for <meta-arago@lists.yoctoproject.org>; Sun, 4 Aug 2024 12:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722790818;
	bh=A7Tx/tz5F5jQ+MjVXcqN71K/ESVDRdNJObwU4jyRHrA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=NWdxYF90jprQo9liaEZ61K3vEW0k+R2KtazXTOdlrfjXmm6jzNqBjXhYDF+fL/6SY
	 2ASc2GRgvcwd3FDTLGNsWGCncfJy7DSsoO3ni8cssZlKJY1Stz3BYkPr0IEYfc1+/Y
	 Ymr/eap7wwYafOPZme02flzbeWEwYeUJ0ke/hstc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 474H0I5F040765
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Sun, 4 Aug 2024 12:00:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 4
 Aug 2024 12:00:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 4 Aug 2024 12:00:18 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 474H0HNr084067;
	Sun, 4 Aug 2024 12:00:17 -0500
Message-ID: <5e2feec4-330e-4b29-bb7a-d453e0edf448@ti.com>
Date: Sun, 4 Aug 2024 12:00:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH v4] Add mpv package
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240801191235.13648-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240801191235.13648-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 04 Aug 2024 17:00:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15481


We lost the "packagegroup-arago-tisdk-multimedia" from the subject...

packagegroup-arago-tisdk-multimedia: Add mpv package


Slow down, and double check each patch revision.


On 8/1/2024 2:12 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> From: Thorsten Lannynd <t-lannynd@ti.com>
> 
> Add mpv package to allow for video playback and streaming of online videos
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> v4: Redo patch on latest scarthgap changes
> 
> v3: Add version number to patch
> 
> v2: Update commit message
> 
>   .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 2085ad09..c6e39aa1 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -11,6 +11,7 @@ MULTIMEDIA = " \
>       ffmpeg \
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

