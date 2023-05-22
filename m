Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D960C7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 19:38:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1335.1684784299405219050
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 12:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IcsOVxVi;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MJcFoH000703;
	Mon, 22 May 2023 14:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684784295;
	bh=vfv5Fs8UpBNws44kNziZuAEO2IBPN3ca3UUvPYUX0Js=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IcsOVxVitLHEzJrOBBPs20KPHMCs/f9irS+HG3yhMxo7EndY31S3tgNZFSAPcF4Uy
	 kopD+dHHRDkdzQ/OWYR033bQbtoT0EbZs6WPokR1z16E8y6bZzG6dpn7IfHpTpmCHX
	 dMv0gydkx/ibnEAihbQq5Ae7jgD2+wbXcdco553A=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MJcFPx075479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 14:38:15 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 14:38:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 14:38:15 -0500
Received: from [10.250.32.56] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MJcFIv014632;
	Mon, 22 May 2023 14:38:15 -0500
Message-ID: <14e59972-1f38-b1e8-e3ac-da4c05ede009@ti.com>
Date: Mon, 22 May 2023 14:38:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master][PATCH 3/3] all: remove all legacy arago-sdk
 build recipes
Content-Language: en-US
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230522183847.3663294-1-rs@ti.com>
 <20230522183847.3663294-4-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230522183847.3663294-4-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 19:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14437

On 5/22/23 1:38 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Remove all the legacy arago-sdk build recipies, groups, targets, etc.
> All of this can be replaced by using the Yocto Standard SDK build
> target:
> 
> 	bitbake tisdk-default-image -c populate_sdk
> 
> For more info about the SDK build targets see:
> https://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an-sdk-installer
> 
> There's probably still more that can be cleaned up, but I'll leave that
> to the more experienced.
> 

Some documentation around this will need cleaned up next cycle. Plus there are
parts of the Processor/Auto/EdgeAI SDK layers that live on top of this layer
that use some of this, they will have to switch to the Yocto Standard SDK now.

Not a blocker, just a heads up.

Acked-by: Andrew Davis <afd@ti.com>

