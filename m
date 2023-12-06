Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB412C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:35:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.34761.1701876942067294398
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 07:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jey85rXU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6FZe3P073712;
	Wed, 6 Dec 2023 09:35:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701876940;
	bh=t1+2fCF3Ljwbah+QEzQOPK0qG4j9cumRa09jVRzkELM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jey85rXUqWdwqbG2HYNyOxiF6PZTlyR0/0x8pOxpIxpA2TiVLkE9w9ALYnQ5jWydm
	 gI3c2y2jd5+J/RfvOR0uHK0reSZIQsDKJpmH4lQptgTHIGqvaz0B0z7Hem+JGDdpl4
	 jdU8ShHvubbBihzuIcj1lJYZ3I/x67NfHt4owcRg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6FZeJ3001935
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 09:35:40 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 09:35:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 09:35:40 -0600
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6FZehp119793;
	Wed, 6 Dec 2023 09:35:40 -0600
Message-ID: <d914ec75-e2e3-46c9-b793-79f143b9c9a9@ti.com>
Date: Wed, 6 Dec 2023 09:35:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][krikstone][PATCH RFC 4/4] branding-core: enable mmip
 for AM57x platform
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>, <denys@konsulko.com>,
        <praneeth@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <u-kumar1@ti.com>,
        Sinthu Raja
	<sinthu.raja@ti.com>
References: <20231206143618.27770-1-sinthu.raja@ti.com>
 <20231206143618.27770-5-sinthu.raja@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231206143618.27770-5-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 15:35:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15041



On 12/6/2023 8:36 AM, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Now that the gstreamer plugins are enabled and ported to 1.20 enable
> the mmip for AM57x platform
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   meta-arago-distro/conf/distro/include/branding-core.inc | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> index 79dadc11..85aa09b6 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> @@ -12,9 +12,6 @@ ALTERNATIVE_PRIORITY:pn-opencl-monitor-ipu = "1"
>   # Raise priority for sample IPC FW images
>   ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
>   
> -# Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
> -MACHINE_FEATURES:remove = "mmip"
> -
>   # GC320 support requires out-of-tree drivers not available in until LTS prep is
>   # complete. Disable for now.
>   MACHINE_FEATURES:remove = "gc320"

This same code is in:

meta-arago-distro/conf/distro/include/branding-ltsprep.inc

Can you make the same change in there as well?



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

