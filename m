Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE56C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 19:41:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16336.1722973280552873649
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Aug 2024 12:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=J9hajQkn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476JfFHF126931;
	Tue, 6 Aug 2024 14:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722973275;
	bh=gxwgLGHRz70W8kYy8vklEgNGkf5gN5aEh1byEM/LY6E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=J9hajQkn6vn8fTUtqEq2zXumONA0TGR3AQGZcEqGXj0mVDQ4tXHlCteY+ywz3MrDW
	 DsFCb4Sic5tDsENaKU2GVx5mQDplZSHsGLFHxKL5kXhNFa9zJGJcmUuR6jSsEexH7D
	 Dwa4a/plEvR7BtL5owgKNWl1xY0nX2DfI498mvZU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476JfFnv037490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Aug 2024 14:41:15 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 14:41:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 14:41:15 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476JfEoe046396;
	Tue, 6 Aug 2024 14:41:15 -0500
Message-ID: <28f9c8db-e954-4bd9-84c1-add896d07ff5@ti.com>
Date: Tue, 6 Aug 2024 14:41:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/scarthgap][PATCH] gcc-cross-canadian: remove
 disabling of buildpaths check
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240806191743.4039774-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240806191743.4039774-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Aug 2024 19:41:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15501



On 8/6/2024 2:17 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> This has been fixed lately in OE-Core master branch and the local
> suppression of the QA check is no longer needed, remove it.

Nice!


> This reverts commit 092178fe74b36c79da16e93cc6cbbc503a915501.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-devtools/gcc/gcc-cross-canadian_%.bbappend        | 4 ----
>   1 file changed, 4 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend
> 
> diff --git a/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend b/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend
> deleted file mode 100644
> index 16df0c26..00000000
> --- a/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Disable the "buildpaths" check while upstream oe-core figures out
> -# how they are going to address it.  This will hopefully be a short
> -# lived patch.
> -INSANE_SKIP:${PN} += "buildpaths"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

