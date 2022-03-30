Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56423C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 14:30:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7996.1648650619741742771
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 07:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bjbhyXc2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UE8ljl117504;
	Wed, 30 Mar 2022 09:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648649327;
	bh=Ld2yGVlr2ZCdk5o/aZZ+qwiQWwHvdw0ybBUi38f5DZ8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bjbhyXc2YfBW0Lx7gAAVNbPxEuqSnQa9Nz/fmprzS/0xj1tU8bb5Zv2fi9SEixAJ8
	 LM1LUYoHzzU1uyOC9wjokR9rjRDGHhwQp+bkB9GeYCRYnSvjjJPdLWOROMKhxP53FM
	 xS2zKyj/4THvCpUEJb2Dq2WXRAQQrw2rnEHHdppY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UE8lQR012603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Mar 2022 09:08:47 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 09:08:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 09:08:47 -0500
Received: from [10.247.20.171] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UE8lmQ000989;
	Wed, 30 Mar 2022 09:08:47 -0500
Message-ID: <3e66c7fa-e32a-c3c4-17db-93a2e0e8b3a2@ti.com>
Date: Wed, 30 Mar 2022 09:08:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago] [master][PATCH] DONOTMERGE: weston: overlay version
 9.0.0 locally
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20220329053703.2367559-1-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220329053703.2367559-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Mar 2022 14:30:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13767

On 3/29/22 12:37 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> OE-Core has upgraded weston to 10.0.0, that requires some new Mesa/GBM APIs,
> which currently breaks with SGX and RGX DDK versions provided by meta-ti.
> Until DDKs are upgraded in meta-ti, overlay older weston 9.0.0 directly from
> OE-Core before the upgrade, in order to get graphics stack built.
> 


If this is so we can continue to build-test all the graphics stack components
before our GPU driver support the needed APIs, would it be better to patch
the GPU driver stack with the needed Mesa/GBM APIs as dummies? (just enough
to make the build test work)

Otherwise, building out Weston 9 and all the components on top of that, doesn't
prove out much if we still have to switch to Weston 10 when it's time for kirkstone..

Andrew

