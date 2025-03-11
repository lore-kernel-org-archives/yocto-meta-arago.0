Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8470AC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 16:54:02 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.15019.1741712039023752010
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 09:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ep0CotYz;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGrt0G773637
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 11:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741712035;
	bh=KnVHoCoJwrKV3NC/40HnIqCWY1Zkp6dgMzDlRSvn/VI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ep0CotYzGhlB0uU8rDHd5hSNszqzguLhjfz2oCh44dIYdDDDs4JeT+e/5UryU2TyK
	 RbVsZp1bgq7BFBYM4w3In7eLXIE9Znnfg6D6RmX00iA6uTI8WcT911Ssm2cpi0bZzw
	 gnto0nwHoO9fCtp7MRzLrLJA+DEqYjqnx2t5n+Ik=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGrtFx127929
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 11:53:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 11:53:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 11:53:55 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BGrt7L108223;
	Tue, 11 Mar 2025 11:53:55 -0500
Message-ID: <5c018763-c1d0-4b69-bb48-a49b8156b0e4@ti.com>
Date: Tue, 11 Mar 2025 11:53:55 -0500
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
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 16:54:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15974



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

Thanks!  I was going to look into this today.


> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../recipes-connectivity/open62541/open62541-arago.inc           | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
> index 3d72f0e9..745c88a1 100644
> --- a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
> +++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
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

