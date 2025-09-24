Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C52CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 17:37:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.20471.1758735465828404932
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 10:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MZZVuvnO;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58OHbj1U1722463
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 12:37:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758735465;
	bh=hd66DktplzxpVoZxIAQKqLm5MalxM0DT0Ug3a45Id3w=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=MZZVuvnOW8gRIsxKgBB7IAJ6X1Vm7uSNJnD3Ox4bKXdnotU+qAkmDq4eFtFByOGR3
	 7eLrevMJhjHyl9wgw9lh1GkenKS3kfReY1bCAlwGTTAOyS64+v+ezcbMPjPPwm9kcV
	 EJjX8n6fj497nU+CDBPL+Ta4jDxujk+N6BtmZGws=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58OHbjq52930507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 12:37:45 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 12:37:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 12:37:44 -0500
Received: from [10.24.72.117] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.117])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58OHbgmj2389704;
	Wed, 24 Sep 2025 12:37:42 -0500
Message-ID: <5643e2aa-3d0a-46bd-a296-b86bc75f879c@ti.com>
Date: Wed, 24 Sep 2025 23:07:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] meta-arago-test: hwspinlocktest: Update SRCREV
 to latest
To: <meta-arago@lists.yoctoproject.org>, Judith Mendez <jm@ti.com>
References: <20250924172610.8166-1-p-bhagat@ti.com>
Content-Language: en-US
CC: Paresh Bhagat <p-bhagat@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <v-singh1@ti.com>, Khasim <khasim@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250924172610.8166-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 17:37:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16624

Hi Ryan,

On 24/09/25 22:56, Paresh Bhagat wrote:
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


Can we add this recipe as well under CI/CD Auto-Merger for Auto SRCREV 
updates [0] ?

[0] - 
https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap&id=96f3c5b8e2efec96de9db131992e56272becc174


Chirag


>   
>   S = "${WORKDIR}/git"
>   

