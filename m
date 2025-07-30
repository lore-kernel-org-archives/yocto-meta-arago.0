Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEC0C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 15:15:22 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.38111.1753888516361322068
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 08:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=igNS8WCH;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56UFFEIg2818181;
	Wed, 30 Jul 2025 10:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753888514;
	bh=SVGI92BxGQpb55UM4fBHyUkLCqJoytXNagIOHSOBpl8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=igNS8WCHBanKSP1ZVAyYGjJ19wxPuj7+/i2+5Bw3L6Tci0XPaxt0Fx4jyr7dE9cXu
	 PYcGw/8fEmf2Xp89SvuM/qkgazla5aq1GKhzN8sNcc7pE9yiLP+jREJhyy2H3rhy1m
	 rd8Hcvh33CQqUIP0QhdqJv+nG3E2pZnqMtM8Ydbk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56UFFEJI3566036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 10:15:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 10:15:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 10:15:14 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56UFFDTC1135452;
	Wed, 30 Jul 2025 10:15:13 -0500
Message-ID: <fead7d66-b4fe-4c1f-bdad-db75a46878fe@ti.com>
Date: Wed, 30 Jul 2025 10:15:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH RESEND] packagegroup-arago: Add
 ti-pka-fw for all K3 platforms
To: Beleswar Padhi <b-padhi@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <u-kumar1@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250730081303.2705939-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250730081303.2705939-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Jul 2025 15:15:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16343

On 7/30/25 3:13 AM, Beleswar Padhi wrote:
> Add PKA firmware package needed by sa2_ul driver for PKA operations
> across all K3 platforms.
> 

Should this go in meta-ti then? Maybe add it to MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS?

Andrew

> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Resending Patch after subscribing to meta-arago list.
> 
>   .../recipes-core/packagegroups/packagegroup-arago-console.bb     | 1 +
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb            | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> index f6ec0a05..66c73746 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> @@ -68,6 +68,7 @@ ARAGO_SDK_PREREQ = "\
>   
>   ARAGO_SDK_PREREQ:append:k3 = "\
>       ti-rtos-echo-test-fw \
> +    ti-pka-fw \
>       "
>   
>   ARAGO_CONSOLE = "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index d9ab3617..08e6050c 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -57,6 +57,7 @@ UTILS:append:k3 = " mmc-utils \
>                       ti-rpmsg-char \
>                       ti-rpmsg-char-examples \
>                       statcol \
> +                    ti-pka-fw \
>   "
>   
>   UTILS:append:k3 = " ti-rtos-echo-test-fw"
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index fb4c3e4c..09262dd8 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -120,6 +120,7 @@ TI_TEST_TI_TOOLS:append:k3 = " \
>       ti-rtos-echo-test-fw \
>       ti-rpmsg-char \
>       ti-rpmsg-char-examples \
> +    ti-pka-fw \
>   "
>   
>   TI_TEST_TI_TOOLS:append:am62xx   = " \


