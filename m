Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB401C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 22:10:34 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.659.1740521432753859769
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 14:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q+LAmkdv;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51PMAUcs1286787
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 25 Feb 2025 16:10:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740521430;
	bh=ujqolUargK3Rfoj2HtvUE7cCz3BMNRxn/HRzVoQgkYk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Q+LAmkdv9R/3lOKt+yFpmKHOha863Pga3oMMvu8wuzRwxcwo7yoCzXxXnZoZOmCLr
	 sikCRaYkxBbW0dVjmUtUzGGvqgksXg5FPTacsGoxp8PHg2B7RsiBAGnnnAtEthgUVU
	 apSkZQjGNdNs4VVdy/EdA9aFSrLFg1zpLGqzRLZ4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PMAUro070153;
	Tue, 25 Feb 2025 16:10:30 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 16:10:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 16:10:29 -0600
Received: from [10.249.33.110] ([10.249.33.110])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PMATU8024847;
	Tue, 25 Feb 2025 16:10:29 -0600
Message-ID: <60964c20-69a5-4620-a09c-2b017a4aa549@ti.com>
Date: Tue, 25 Feb 2025 16:10:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH v2 0/2] Pick overlays for
 DS90UB954
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <denys@konsulko.com>,
        <c-shilwant@ti.com>
References: <20250225120014.102886-1-y-abhilashchandra@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250225120014.102886-1-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 22:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15915


Wrong mailing list.  You need to send this to meta-ti...


On 2/25/2025 6:00 AM, Yemike Abhilash Chandra wrote:
> DS90UB954-Q1EVM can be used to connect FPDLink-III based sensors to
> TI EVMs. So pick overlays for the same.
> 
> Link: https://www.ti.com/tool/DS90UB954-Q1EVM
> 
> Changelog:
> changes in v2:
> 1. Add an coverletter since this series has multiple patches
> 2. Correct a minor commit title mistake
> 
> v1:https://lore.kernel.org/all/20250225081311.86701-1-y-abhilashchandra@ti.com/
> 
> Yemike Abhilash Chandra (2):
>    conf: machine: j721e-evm: Pick overlays for DS90UB954
>    conf: machine: j721s2/j784s4: Pick overlays for DS90UB954
> 
>   meta-ti-bsp/conf/machine/j721e-evm.conf  | 1 +
>   meta-ti-bsp/conf/machine/j721s2-evm.conf | 1 +
>   meta-ti-bsp/conf/machine/j784s4-evm.conf | 1 +
>   3 files changed, 3 insertions(+)
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

