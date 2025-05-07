Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA521C3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 22:29:28 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2294.1746656961159526794
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 May 2025 15:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UiMoljpB;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547MTIis934009
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 17:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746656958;
	bh=e0TmWDxbh+tWlOX85of/FdD5vR2EIM/Lul/XJ3nP68Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UiMoljpBSlf2twEWFP9Mj3PlXycgfwhvAbudA/3+ExPZLrK8enw2gVUMxaU8HMH3g
	 wqTZ5+qRL34MV6WBjETzGaT1/o92E53VeDPpAzPfxEMxHceMdKXOqLc4oQVTvkAqQ0
	 T7OfY/7DXUUDJYRy6War40AEm4HmwFGyR8skfJno=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547MTIJQ014977
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 17:29:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 17:29:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 17:29:18 -0500
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547MTIEx080248;
	Wed, 7 May 2025 17:29:18 -0500
Message-ID: <51b0566e-5b14-4d62-9388-258f3e6cad68@ti.com>
Date: Wed, 7 May 2025 17:29:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-layersetup][PATCHv2 00/16] Sacrifice your first born to the
 linter
To: PRC Automation <automated_prc_response@ti.com>,
        Randolph Sapp
	<res.sapp@gmail.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230614034507.598391-1-res.sapp@gmail.com>
 <20250507221606.C917EABF56@fllvdckhpci078.itg.ti.com>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20250507221606.C917EABF56@fllvdckhpci078.itg.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 May 2025 22:29:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16188

On 5/7/25 17:16, PRC Automation wrote:
> oe-layersetup / na / 20230614034507.598391-1-res.sapp
> 
> PRC Results: FAIL
> 
> -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>    apply-patch: FAIL
> -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Summary:
> - Patch Series: [oe-layersetup][PATCHv2 00/16] Sacrifice your first born to the linter
> - Submitter: From: Randolph Sapp <res.sapp@gmail.com>
> - Date: Date: Tue, 13 Jun 2023 22:44:51 -0500
> - Num Patches: 16
> - Mailing List (public inbox) Commit SHA: 5a49bf112d3685aeb2f6e7b0a0c6f5b45e440e23
> 
> Applied to:
> - Repository:
> - Base Branch:
> - Commit Author:
> - Commit Subject:
> - Commit SHA:
> 
> Patches
> ----------------------------------------
> FAIL - [oe-layersetup][PATCHv2 01/16] oe-layertool-setup: split logic and/or expressions
>      fatal: not a git repository (or any parent up to mount point /scratch)
>      Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
> 
> 
> 

How far back are you going with this test?

