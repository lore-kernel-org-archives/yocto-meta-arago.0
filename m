Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C163C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 23:15:02 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.523.1737760500647176741
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 15:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BpOFIY9w;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50ONEv3l1432198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 17:14:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737760497;
	bh=EH4iXZc1+LTrRve7xdnopL+vFyr/+dEmOjijUB9Dhwo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BpOFIY9wcmX8UjAMqQ56dv9mfdsoi3hOad1lfkHL0pPiYSl+08bg4u/dPf+zYx5++
	 mvuYm6wQWPqMJzC0BXtaM7sSr9vz5uJgBeMMhn+5bIsu4XsT94Kmv0hymv0DHdHL8k
	 1VB5ZKdqnCzwEaGEaxJ2jXUik3Y8mTb5HZXm2u74=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50ONEvMH025332
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 17:14:57 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 17:14:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 17:14:56 -0600
Received: from [10.250.37.153] ([10.250.37.153])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50ONEuNi055123;
	Fri, 24 Jan 2025 17:14:56 -0600
Message-ID: <155132d0-4953-448e-a42b-c8d52211d1c5@ti.com>
Date: Fri, 24 Jan 2025 17:14:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][discussion] Qt package groups and config
 locations
To: Randolph Sapp <rs@ti.com>, <denis@denix.org>, <afd@ti.com>,
        <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <D7AMZ4EPPP5M.2NTHC4Y4JP2H7@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <D7AMZ4EPPP5M.2NTHC4Y4JP2H7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Jan 2025 23:15:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15763



On 1/24/2025 3:54 PM, Randolph Sapp wrote:
> Hey,
> 
> Asking for some general advice before I submit the next series. Cleaning up
> meta-qt* package groups and everything there is a bit of a logistical argument
> to be made.
> 
> We now have an official requirement tracking Qt6 enablement which means more
> automated testing. At the same time I do not think meta-arago should be
> inherently dependent on a layer as heavy as meta-qt*. I'm planning on making a
> series of isolated package groups and configs that can be toggled through a
> distro feature.
> 
> Where do we think this should belong? The distro layer or the extras layer? I'm
> leaning toward the distro layer as these are ultimately distro specific configs,
> but I can understand that some may believe this is inherently "extra" content.
> Regardless, the test layer will need to be updated to point to this.
> 
> Maybe it should be a generic "software" layer? I don't like splitting things
> unnecessarily, but this is a weird example where we need certain features
> enabled for both testing and release, but it doesn't really make sense to
> duplicate it. No clue. Any opinions?

Could it be argued that these are demos?  And maybe should be in 
meta-arago-demos?

What all software are we talking about being dependent on qt6?


> Regards,
> Randolph

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

