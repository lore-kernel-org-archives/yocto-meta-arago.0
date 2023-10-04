Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D504E7B61A
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 13:34:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.18499.1696426432645952805
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 06:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cRZXn25E;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 394DXpoV053183
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Oct 2023 08:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696426431;
	bh=MO50Ui7/4690NhDgcdVqmT7X2zA5SzqB8AyP850T+tE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=cRZXn25Ejn5tzfeMZvDx/EtPmgw6nx8FC9XT04vaedL2QFkGafTuD1DnT/SgG3bWT
	 JQd4Fn8O9TW+n+jF4KTw63zLs7H023Fygubg6uKyG99ncR5c9VyOf61cPm85nlSUvW
	 7ACZME962yeyo1EMqPtjFy4aPTTbsKkMxEE4YG/0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 394DXpRp015682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Oct 2023 08:33:51 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 08:33:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 08:33:50 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 394DXoWR094610;
	Wed, 4 Oct 2023 08:33:50 -0500
Message-ID: <e3d6efb9-201f-4423-951f-2ef85bd3be4e@ti.com>
Date: Wed, 4 Oct 2023 08:33:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH] tisdk-bundle: Fix
 generate_sw_manifest_table
Content-Language: en-US
To: Aniket Limaye <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20231004063945.703846-1-a-limaye@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231004063945.703846-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Oct 2023 13:34:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14918



On 10/4/2023 1:39 AM, Aniket Limaye wrote:
> The generated manifest file is expected to strictly have 7 columns,
> delimited by '|' while the License section also sometimes has '|'
> character. Replace this one by 'or' to fix manifest file
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   meta-arago-distro/classes/tisdk-bundle.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> index 1ebdb6fb..d2d31381 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -553,7 +553,7 @@ EOF
>           package="`cat $i | grep Package: | awk {'print $2'}`"
>           version="`cat $i | grep Version: | awk {'print $2'} | cut -f1-2 -d-`"
>           long_version="`cat $i | grep Version: | awk {'print $2'}`"
> -        license="`cat $i | grep License: | cut -d: -f2 `"
> +        license="`cat $i | grep License: | cut -d: -f2 | sed 's/|/or/g' `"
>           architecture="`cat $i | grep Architecture: | awk {'print $2'}`"
>           sources="`cat $i | grep Source: | cut -d ':' -f2-`"
>           location="$package""_""$long_version""_""$architecture"".ipk"

I'm in the middle of modifying all of this code to fix a build issue. 
This section of code is moving to a new file.  I will resubmit a new 
version of this patch with the change made in the new location.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

