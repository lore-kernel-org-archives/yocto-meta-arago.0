Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22975E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 14:44:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.106959.1734533067474722904
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 06:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d5OG6ga0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BIEiQ3Y053013;
	Wed, 18 Dec 2024 08:44:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734533066;
	bh=3hviaNrRiDURSCjOSNLjTpLhg10l5gubPKuDD57+ucQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=d5OG6ga0YCP9pWcP2BmtvI1Mb+QMXkwluPR0X2+WTnw92MmzfuxFzlpCyro4KELO8
	 YkCbTZPbxPuG+fq9RdDSOpOHO+F12kxJfC61wWEkV6zsfst0UTDp26Zg8qPztstb5Y
	 qmoDxLUgI+YX4yKKDVs4RC6y8o2m51tAWcVNvWyw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BIEiQpx054039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Dec 2024 08:44:26 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 08:44:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 08:44:25 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BIEiPwN011327;
	Wed, 18 Dec 2024 08:44:25 -0600
Message-ID: <fc96a26b-5239-4332-b57b-98e0721525bb@ti.com>
Date: Wed, 18 Dec 2024 08:44:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/2] branding: Disable
 missing hardware support in the BSP layer
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20241217210137.46974-1-afd@ti.com>
 <20241217210137.46974-2-afd@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241217210137.46974-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:44:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15669

On 12/17/24 3:01 PM, Andrew Davis wrote:
> Currently MACHINE_FEATURES are disabled based on branding, but the
> branding is not what determines if these are functional, the BSP version
> does. While we do select the BSP version here, what is supported or not
> by a given version is a property of the BSP layer. Disabling missing
> MACHINE_FEATURES for each version should be handled there.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-arago-distro/conf/distro/include/branding-core.inc    | 5 -----
>   meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 4 ----
>   2 files changed, 9 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> index 48fe36e1..3eed685a 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> @@ -7,8 +7,3 @@
>   
>   # Raise priority for sample IPC FW images
>   ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
> -
> -# GC320 support requires out-of-tree drivers not available in until LTS prep is
> -# complete. Disable for now.
> -# Remove gc320 - the driver fails to build with gcc12
> -MACHINE_FEATURES:remove = "gc320"
> diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> index 415eee8d..21e33662 100644
> --- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> @@ -1,5 +1 @@
>   TI_PREFERRED_BSP = "ti-6_12"
> -
> -# GC320 support requires out-of-tree drivers not available in until LTS prep is
> -# complete. Disable for now.
> -MACHINE_FEATURES:remove = "gc320"

This has a equal opposite patch[0] over in meta-ti disabling these in the
BSP layer. That will need to go in first to prevent GC320 support from
being enabled in the meantime (gc320 doesn't build that would cause failures).

[0] https://lists.yoctoproject.org/g/meta-ti/message/18126

Andrew

