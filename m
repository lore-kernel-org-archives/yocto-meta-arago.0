Return-Path: <y-abhilashchandra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DB9C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 08:17:04 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10259.1739348216355788770
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 00:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gkIwHsHR;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: y-abhilashchandra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51C8GqIa490616
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 02:16:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739348212;
	bh=kzm1DAW/KibiFNz2U+26T2m6rA80CR9OxahKn5E4T3Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gkIwHsHRw3sIaQUB86dMj0iGKRAcuhZWUuXeZKey40YT3F0KLTxfi1+G0M0teG3ML
	 AaHfuZJofxCD1lNqomMw+yxxtvEn1/lVgw4UkMgt9X2R/qe/D3GV6z7X5E9l2wA6L6
	 z3XO0iczsfyymfBYW68qFeofqljP7iBnJbf+CxAk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51C8GqVk045143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 02:16:52 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 02:16:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 02:16:52 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51C8Gn3d122106;
	Wed, 12 Feb 2025 02:16:49 -0600
Message-ID: <f5658e67-238d-4532-ac69-d99755808300@ti.com>
Date: Wed, 12 Feb 2025 13:46:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras:
 v4l-utils: Add recipe for v1.28.1
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>
References: <20250211075813.970579-1-y-abhilashchandra@ti.com>
 <20250211205111.GU21608@denix.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250211205111.GU21608@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Feb 2025 08:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15840



On 12/02/25 02:21, Denys Dmytriyenko wrote:
> On Tue, Feb 11, 2025 at 01:28:13PM +0530, Yemike Abhilash Chandra via lists.yoctoproject.org wrote:
>> An older recipe of v4l-utils (v1.26.1) is present in the meta-oe layer
>> for scarthgap.
>>
>> TI's 6.12 based kernel has backported multistream routing APIs from
>> upstream kernel, which requires v4l-utils to be the latest released
>> version (v1.28.1).
>>
>> Thus we override the recipe in this layer to the latest release of
>> v4l-utils.
> 
> There are few issues with this...
> 
> Do you really need to override the entire recipe? The old .bbappend was
> applying a patch already - can you add a new patch to that and bump SRCREV?
> 

We are not only updating the SRCREV, but also moving to a newer branch
(stable-1.28), which is why we considered overriding the entire recipe.
This approach aligns with how we have handled previously, including
6.1 timeline, where we followed a similar process.[1]

Given that the original recipe package still references an older version,
do you suggest that we update the branch in the existing .bbappend,
even though the base recipe remains on an older version?

Please let me know if you want me to do that way.

[1]: https://lore.kernel.org/all/20230525104036.2050245-1-j-luthra@ti.com/

Thanks,
Yemike Abhilash Chandra

> If you do need to override the entire recipe, then you first need to clearly
> articulate your reason in the commit log - wanting a newer commit isn't such
> a reason
> 
> Then you need to do it in 2 steps/patches - first you copy over the existing
> recipe verbatim w/o any modifications, and in a separate step make your
> modifications
> 
> Also, having own copy of an upstream recipe requires special attention to not
> violate the Yocto Project Compatible guidelines. I've explained this recently
> in another thread here on the list
> 

