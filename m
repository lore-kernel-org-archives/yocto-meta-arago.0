Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4BFC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 17:05:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.38503.1701882346758431235
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 09:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kKCT8Neq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6H5jNP109539;
	Wed, 6 Dec 2023 11:05:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701882345;
	bh=RE1t0xrhrMISXVG8NWPprYWqC5ydfL4r6W0tx81DG0A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kKCT8NeqPSvyPvNL6usDBMhlPKkyTMplmq2dPQk+GjOrNVcr8etD5jAENtWZp9Sjm
	 YPA2GNjMylTH+CUmeoUa7MctWQGFJg4U77MuqQ4yejz9IW1K2w4YwhpEXXNm3vz+Tk
	 1KenS9WRBPKpBCd9FygZSmmLPsAUbksFAzBXpg1c=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6H5jEx125683
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 11:05:45 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 11:05:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 11:05:45 -0600
Received: from [10.249.36.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6H5imH051164;
	Wed, 6 Dec 2023 11:05:44 -0600
Message-ID: <209ea78e-8d7d-4f49-91f8-5cb76048289f@ti.com>
Date: Wed, 6 Dec 2023 11:05:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][krikstone][PATCH RFC 3/4] ti-test: Remove OAMP-DRM
 test
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <praneeth@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <u-kumar1@ti.com>,
        Sinthu Raja
	<sinthu.raja@ti.com>
References: <20231206143618.27770-1-sinthu.raja@ti.com>
 <20231206143618.27770-4-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231206143618.27770-4-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 17:05:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15046

On 12/6/23 8:36 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The omapdrm test is outdated and the required test cases shall be executed
> using the GST commands. Disable the same until the omapdrm test is updated.
> 

The omapdrmtest has been broken/unmaintained for a long time, it isn't going
to be updated, just remove the recipe here too.

Andrew

> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index cf720c03..9a6dc67a 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -87,15 +87,12 @@ TI_TEST_TI_TOOLS:append:ti43x = " \
>       switch-config \
>   "
>   
> -NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
> -
>   TI_TEST_TI_TOOLS:append:omap-a15 = " \
>       omapconf \
>       pru-icss \
>       switch-config \
>       ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
>           ti-ipc-test \
> -	    ${NOT_MAINLINE_MMIP_DEPS} \
>       ", d)} \
>   "
>   

