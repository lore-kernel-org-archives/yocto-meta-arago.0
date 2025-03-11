Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9660CC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 17:16:32 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.15428.1741713387190439790
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 10:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gDqz+X18;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BHGO5d1356476
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 12:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741713384;
	bh=1ojr4j9gSwB4WC3Org8t5M/OKCuSn7uUtuaXKTMNLGY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gDqz+X18e7OfINtxaa9PosQIlDkwTiy9xKdNN7ArdGXyUihTtKMXIsi7XzIExlm/a
	 7rYl7/iWvbyw7dqpsafTZhk0q+pXMk4P2VUUFFN6qXEz8Emk0Ge0X9pVCcK8mYTdB8
	 6QxpAZxclRByUoU+lNBx1yrlMl8MtESD78dwPXPQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BHGOqU058755
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 12:16:24 -0500
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 12:16:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Tue, 11 Mar
 2025 12:16:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 12:16:23 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BHGNfd071404;
	Tue, 11 Mar 2025 12:16:23 -0500
Message-ID: <334aacd2-5edf-45e4-91b2-44ef9c3c07a7@ti.com>
Date: Tue, 11 Mar 2025 12:16:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/scarthgap][PATCH] open62541: fix examples
 binaries packaging
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250311165146.3713480-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250311165146.3713480-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 17:16:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15975



On 3/11/2025 11:51 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Recent update in upstream meta-oe changed FILES list to only include
> libraries, which is correct when no examples are built. Our bbappend
> enables building examples and those are placed into own directory.
> But there are 2 exceptions where ua_client and ua_server are placed
> under ${bindir} and now those trigger a QA error about unpackaged
> files. While these 2 files should probably go along with other example
> binaries, for now restore the previous behavior of packaging them
> into ${bindir} in case some downstream usage expects them there.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-connectivity/open62541/open62541-arago.inc           | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
> index 3d72f0e9..745c88a1 100644
> --- a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
> +++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc

Ah.  I see you are making this change against master-wip.  master and 
scarthgap do not have that change yet as it is still cooking.  I'm going 
to send a v2 to move this patch over to the .bbappend so that we can 
pick this up right now and then rebase master-wip on top of it.


> @@ -28,6 +28,7 @@ do_install:append() {
>   }
>   
>   PACKAGES =+ "${PN}-examples ${PN}-tests"
> +FILES:${PN} += "${bindir}"
>   FILES:${PN}-dev += "${libdir}/cmake/* ${datadir}/${BPN}/tools"
>   FILES:${PN}-examples += "${datadir}/${BPN}/examples"
>   FILES:${PN}-tests += "${datadir}/${BPN}/tests"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

