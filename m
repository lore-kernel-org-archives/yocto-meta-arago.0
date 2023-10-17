Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF45CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:47:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.238512.1697568434072508464
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 11:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rCdi5P9U;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39HIl7U6002477;
	Tue, 17 Oct 2023 13:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697568427;
	bh=sIijtxDNZ4VhcBsiLuJG8i1Njp2YQ1AFoA5n+ejo+Yc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rCdi5P9UCsXQoWH3p3K3SEFhff1YM9UNWM78Ge26n0sgB3q9XH0HU7z8LIs1o6gTy
	 17x+FrJbSLgNcgUf2+X/3IkKVr2xI5iQExZFOOdCNao0XjzLkGsdRMNMwkvB6O7h5l
	 VWC01CmZxNZszNONE/fQakbd1B4CrsGsQghtcrkE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39HIl6tW005637
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Oct 2023 13:47:06 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 13:47:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 13:47:06 -0500
Received: from [128.247.81.1] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39HIl6LZ008609;
	Tue, 17 Oct 2023 13:47:06 -0500
Message-ID: <7e5e8181-8d90-450a-99dd-6db09d02a5db@ti.com>
Date: Tue, 17 Oct 2023 13:47:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH] softap-udhcpd-config:
 Remove this package
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20231016211708.23682-1-afd@ti.com>
 <20231017180340.GL2408@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231017180340.GL2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Oct 2023 18:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14944

On 10/17/23 1:03 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 16, 2023 at 04:17:08PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> 
> BTW, what happened to the "why?" :)
> 

I'm on a bit of a hack and slash mission here is the best "why" :)

Honestly I can't figure out why this was still here to begin with, so that makes it
difficult to explain the "why" it needs removed other than "just because it does".

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> This was part of AM/Sitara SDK OOBE to have WiFi AP configured out of the box
> on supported platforms.
> 
> If it's still relevant, may need to be pushed to the corresponding SDK layer.
> 

There is no way this is still the expected OOBE, I can add it to whatever
SDK layer wants it, but I doubt any will even notice a change.

Andrew

> 
>> ---
>>   .../busybox/softap-udhcpd-config/LICENSE      | 348 ------------------
>>   .../softap-udhcpd-config/omap3/udhcpd.conf    | 114 ------
>>   .../softap-udhcpd-config/omapl138/udhcpd.conf | 114 ------
>>   .../softap-udhcpd-config/ti33x/udhcpd.conf    | 114 ------
>>   .../busybox/softap-udhcpd-config/udhcpd.conf  | 113 ------
>>   .../busybox/softap-udhcpd-config_1.0.bb       |  23 --
>>   .../packagegroup-arago-tisdk-connectivity.bb  |   1 -
>>   7 files changed, 827 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/LICENSE
>>   delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/omap3/udhcpd.conf
>>   delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/omapl138/udhcpd.conf
>>   delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/ti33x/udhcpd.conf
>>   delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/udhcpd.conf
>>   delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb

