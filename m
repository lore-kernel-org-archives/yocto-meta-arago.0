Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386C1C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:13:27 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.14628.1699452803008661204
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 06:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jH3QQI8D;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8EDKAu030104;
	Wed, 8 Nov 2023 08:13:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699452800;
	bh=X4+zmb9v8RLtWLgQaDJRUYcawxu4w6J55qj4XazpR9Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jH3QQI8DNr0KnjpxAIrm3in6fcipZesQpfXy1+3sZjxJLjgDvwQbp3blNO5QHMGnx
	 XW9FvH6v275MZPyWeBiFSrHddHvU8Np3kYAhjdGBRdPCE347YGCsT5mrtxyJBR43Xr
	 X3LLnltQTFXTZHc/NzZQLoGIhhL0K1QbS9WZoLMw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8EDKwG046585
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 08:13:20 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 08:13:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 08:13:20 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8ECRvO047171;
	Wed, 8 Nov 2023 08:13:20 -0600
Message-ID: <26f27cb3-96c1-4316-be7d-fee8e9e59e21@ti.com>
Date: Wed, 8 Nov 2023 08:13:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/kirkstone][PATCH] arago.conf: bump distro
 version
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231108000329.3065800-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231108000329.3065800-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Nov 2023 14:13:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15005



On 11/7/2023 6:03 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> A bit arbitrary, but it seems like a good point in time to bump Arago Distro
> version, since things are relatively stable currently and to coincide with
> the Yocto Project Nanbield release.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Acked-by: Ryan Eatmon <reatmon@ti.com>


> ---
>   meta-arago-distro/conf/distro/arago.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 8232ca27..83b1a18a 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -1,6 +1,6 @@
>   # Name and version of the distribution
>   DISTRO_NAME = "Arago"
> -DISTRO_VERSION = "2023.04"
> +DISTRO_VERSION = "2023.10"
>   DISTRO_FEED_URI ?= "http://lcpd.itg.ti.com"
>   BUILD_VARIANT = "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENABLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
>   TISDK_VERSION ?= "live"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

