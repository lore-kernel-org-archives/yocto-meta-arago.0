Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE9EC2BD09
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 01:40:52 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.914.1720057246683021943
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 Jul 2024 18:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KZQaMn1s;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4641egYo007376;
	Wed, 3 Jul 2024 20:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720057242;
	bh=z5li+NEUM1B/V4SXncDRL5HCx/VUjb1YeNVCzrmxBu0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KZQaMn1sVKsW1BqjxsjUvl2MSFoUxAqInV1EK0AR5yH5JcCgIT1e4Dch5LR9rUg2F
	 6Gbn7f6HFGM7YSik59DBA/uAiOCTlTDN5RPUNm7nATpoXLvahGu19QysUPNds1X3LX
	 0wk5jBag+9XPWVZnhWZ5lv1LKECd3yFlpUybMlz0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4641egtK003112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2024 20:40:42 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 Jul 2024 20:40:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 Jul 2024 20:40:41 -0500
Received: from [10.250.34.47] ([10.250.34.47])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4641efQE016139;
	Wed, 3 Jul 2024 20:40:41 -0500
Message-ID: <182eac05-6ae0-4ef1-b779-e67742e8fd7f@ti.com>
Date: Wed, 3 Jul 2024 20:40:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] weston: adjust bbappend for minor
 version bump
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240702195208.39626-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240702195208.39626-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 Jul 2024 01:40:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15429



On 7/2/2024 2:52 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Make bbappend less strict to apply against minor version bumps, such as 3.0.1
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../wayland/{weston_13.0.0.bbappend => weston_13.0.%.bbappend}    | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta-arago-distro/recipes-graphics/wayland/{weston_13.0.0.bbappend => weston_13.0.%.bbappend} (100%)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend
> similarity index 100%
> rename from meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bbappend
> rename to meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend

Any good reason to not put this on scarthgap as well?  Just to keep them 
in sync?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

