Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22639C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 15:06:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.41759.1742828778349818626
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 08:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bmonZ4sT;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52OF6Gij991561
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 24 Mar 2025 10:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742828776;
	bh=MW320x+xwTPeJLPsaaABvdMKY0i8XMwYOs9/q5ircps=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=bmonZ4sTgWYzPByPUlDlAI/oDlbQSFsfoj6A7HIj/biOc58l6DPLWXLFCnZPfrvYy
	 S38zLBKfBAW/40lKkadv0K85vbIiHjBBIItlR2Rv9d0X+q70GCOmZy2OFoGXIKu4Fa
	 H20ObZa33l96Yk6m13xnhHBg92f4OikULY6tzUUc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52OF6GJQ029278;
	Mon, 24 Mar 2025 10:06:16 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Mar 2025 10:06:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Mar 2025 10:06:16 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52OF6GQG011637;
	Mon, 24 Mar 2025 10:06:16 -0500
Message-ID: <d8a8a4e5-a127-49ec-a927-de8422adbd1d@ti.com>
Date: Mon, 24 Mar 2025 10:06:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] ti-test: Fix appending of
 TI_TEST_BASE
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <182FC4BFC8DBE37E.22661@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <182FC4BFC8DBE37E.22661@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Mar 2025 15:06:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16146


Forgot to mention.  This v2 is a rewording of the commit message.


On 3/24/2025 9:51 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> The order of the overrides is incorrect for the append setting for
> TI_TEST_BASE.  This results in the value for TI_TEST_BASE being cleared
> and not appended to.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index a5a8838f..a73e2869 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -58,7 +58,7 @@ TI_TEST_BASE = "\
>       yavta \
>   "
>   
> -TI_TEST_BASE:ti-soc:append = " \
> +TI_TEST_BASE:append:ti-soc = " \
>       mtd-utils-ubifs-tests \
>   "
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

