Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D26C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 14:22:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12149.1721139734682529754
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 07:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PTUNZefu;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46GEMBZk038256;
	Tue, 16 Jul 2024 09:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721139731;
	bh=nYGDMDz50S/PDmopjCgCTlufN414Hbu66tRxYdrIAlk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PTUNZefuzeU0WQudAwgWY0cA6UjNKfDJs43UMPmV1eRN6aRuEhgpRYtHjPMKxuh3t
	 bhyxSlqo6QNzZsaOLAUE5KbiuPOJpLOAeNniRCkIdCqeNlx+Iwt6IVg1GVGXuwbqdv
	 00Z1uE/2Jms0QprZ67WF7N7dtSLqorOIRNUHmQHU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46GEMBZR070821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 09:22:11 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 09:22:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 09:22:11 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46GEMA7c105861;
	Tue, 16 Jul 2024 09:22:10 -0500
Message-ID: <7d998bc5-8a36-4c0f-b12c-c4dc2e226d68@ti.com>
Date: Tue, 16 Jul 2024 09:22:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] arago.conf: disable buildpaths QA
 errors in meta-qt5
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240716015013.3051611-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240716015013.3051611-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 14:22:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15446



On 7/15/2024 8:50 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> As meta-qt5 is not going to fix the issues causing the errors:
> 
> https://github.com/meta-qt5/meta-qt5/issues/575
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index deaa8c02..716068ba 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -188,3 +188,7 @@ LICENSE_FLAGS_ACCEPTED = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav co
>   
>   # Do not package own copy of perl into devkit, rely on host one
>   ASSUME_PROVIDED += "nativesdk-perl"
> +
> +# https://github.com/meta-qt5/meta-qt5/issues/575
> +ERROR_QA:remove:layer-qt5-layer = "buildpaths"
> +WARN_QA:append:layer-qt5-layer = " buildpaths"

Yeah, I saw that and thought this should be the answer.  Since 
meta-arago is not seeking compatible status this should be acceptable.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

