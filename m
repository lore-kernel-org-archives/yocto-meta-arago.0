Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F42CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:04:10 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.22603.1758740644296329833
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 12:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gdW/4qFb;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: jm@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58OJ43sD1293463
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 14:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758740643;
	bh=cY9KifMW24jR73MOIEgOQl8lmqmVnop0FWTyDKdWelU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gdW/4qFbfIHn0JXxCAC+Nw+jIFCf0RzgI+qwRbOLHUzcisxYCBmwD9j1bAbo2aFtC
	 CAc09uk0UsS+NaoablvnuB3N0CJStmbWnwQWxsqJlJ2O3EX7mx+y3vnXad4gESyx21
	 PzNU0Px1hVaDak3FzLfhNBbe6qgIqeuI5wWb0/J8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58OJ43hU2974787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 14:04:03 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 14:04:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 14:04:02 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58OJ422v2230218;
	Wed, 24 Sep 2025 14:04:02 -0500
Message-ID: <c5c20af9-e117-4f05-9884-6685e06d9e49@ti.com>
Date: Wed, 24 Sep 2025 14:04:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] meta-arago-test: hwspinlocktest:
 Update SRCREV to latest
To: <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <v-singh1@ti.com>
References: <20250924172610.8166-1-p-bhagat@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250924172610.8166-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 19:04:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16625

Hi Paresh,

On 9/24/25 12:26 PM, Paresh Bhagat via lists.yoctoproject.org wrote:
> Pulls in AM62D SoC support.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> index 39171041..6dec53e7 100644
> --- a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
> @@ -10,7 +10,7 @@ SRC_URI = "\
>       file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
>   "
>   
> -SRCREV = "a8297c7a2ca9e127929095045228dd4761121d56"
> +SRCREV = "1d154fbe5b56ef81045763f574c2098a35d6a8b8"
>   
>   S = "${WORKDIR}/git"
>   


please send to master as well.

~ Judith

