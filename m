Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B95C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 16:58:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.14260.1685984278595909310
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 09:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lXA3SvX9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 355Gvqrq122769;
	Mon, 5 Jun 2023 11:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685984272;
	bh=p4ky0tNtiSTSATPr6VeNGHgH5tHbRmbvfuIj/ATwK18=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lXA3SvX944x8YWGnr7ln9H7OjAFH3UwqntDuk0/KXU8NF+QIMKFJJhCZo6WK4nT6+
	 NDdlGX6GD41H89IqTUdrhGa+hz01RqRDmRjmwqvhb+fbK9h35iCjXuTBAaxlpjNRQs
	 gDfGLCnKMUfcNkS23zigSe46EV38LDXLUi5MxW7M=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 355Gvq4G037586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Jun 2023 11:57:52 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Jun 2023 11:57:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Jun 2023 11:57:51 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 355Gvpjm077984;
	Mon, 5 Jun 2023 11:57:51 -0500
Message-ID: <f237479f-5cca-11df-60dd-eb0bfc66da79@ti.com>
Date: Mon, 5 Jun 2023 11:57:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] arago.conf: add opencl
 as a distro feature
To: <rs@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230530214757.3693099-1-rs@ti.com>
 <20230530214757.3693099-2-rs@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230530214757.3693099-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jun 2023 16:58:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14494



On 5/30/2023 4:47 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Rogue devices now have limited support for opencl. Further testing is
> required but this is safe to enable now.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 379b1d44..a6425fae 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -47,7 +47,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
>   
>   # Add additional distro features
>   DISTRO_FEATURES:append = " pam wayland opengl"
> -#DISTRO_FEATURES:append = " opencl"
> +DISTRO_FEATURES:append = " opencl"

This change has opened a can of worms.  A lot of build failures.  Some 
of the dependent recipes were not migrated over from dunfell to 
kirkstone and those dependencies were hidden behind this feature being 
turned off.

If you want to recreate the build failures you can run:

MACHINE=am57xx-evm bitbake -k tisdk-core-bundle tisdk-tiny-image ti-world


We need to either prune out some more older recipes that are depending 
on the missing packages, restore the missing packages and clean them up 
per the kirkstone rules and machine renames, or option C (yet to be 
thought of).

Needless to say, no quick fix for this one.  So I'm holding off 
accepting this patch series.


>   DISTRO_FEATURES:append = " vulkan"
>   DISTRO_FEATURES:append = " opencv"
>   DISTRO_FEATURES:append = " openmp"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

