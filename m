Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D52ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 22:08:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.52.1663366131680283138
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 15:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aw8VK//F;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28GM8mYm087358;
	Fri, 16 Sep 2022 17:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663366128;
	bh=QRA5haSoyOmrTN2/YPEau/msHvxGP4SRdYnij9+DPSU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=aw8VK//FP3i5k7LIy00k6qYDJ/RKNkfb2ZZYhZqDSLzolQlVMNhri3z8t1eECd3Ha
	 4tY+YPV+SkOYDtvaB6v7adeAfWPZ9UzzvLAQejMosxt+yI6CO8814gFccvpjWNYGZA
	 hSMmRwhh9K+Pn0tGItGFA8QcH/+AxmHWBJoyDly4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28GM8mDL009428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Sep 2022 17:08:48 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 16
 Sep 2022 17:08:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 16 Sep 2022 17:08:48 -0500
Received: from [10.249.39.108] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28GM8m4t046800;
	Fri, 16 Sep 2022 17:08:48 -0500
Message-ID: <a42313a1-8da4-c69e-f578-b98d5e17d528@ti.com>
Date: Fri, 16 Sep 2022 17:08:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [meta-arago][dunfell][PATCH] ltp-ddt: RC Auto-Merger:
 08.04.01.004
Content-Language: en-US
To: LCPD Automation Script <lcpdbld@list.ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <1663348276-6237-1-git-send-email-lcpdbld@list.ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1663348276-6237-1-git-send-email-lcpdbld@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Sep 2022 22:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14038


Ignore this patch.  There were issues with the script and this patch is 
incomplete.

On 9/16/2022 12:11, LCPD Automation Script wrote:
> Updated the value(s) for:
>    SRCREV
> 
> Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
> ---
>   meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> index bad1d7f..62818cb 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> @@ -14,7 +14,7 @@ PE = "1"
>   PR = "r7"
>   PV_append = "+git${SRCPV}"
>   
> -SRCREV = "b79e1ec3e4f5501891fdf307548a9d6616b00bd0"
> +SRCREV = "aadce9266cafe526e815c5c11f9a04eeb9d9fedf"
>   BRANCH ?= "master"
>   
>   SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

