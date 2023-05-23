Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA74C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:06:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.467.1684854410223385173
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 May 2023 08:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uoeycVLR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34NF6iga057398;
	Tue, 23 May 2023 10:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684854404;
	bh=JQ/JmQt9dOjRAC3QiTmETNUrsuUc7PthReoOXC3msvc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uoeycVLRd9xwLerK7WpPR4pC6RAAwvC0CEKax0dHCT8IYmAnPjIKF01bOM++9jvHp
	 ICR5UFJSflzSCbVkZBfH6L91jwxUmkvi29ib+fCHFj7b+nSvT8v+OuH0nRwJ3V/xUk
	 5rY+MPLEtg1Y4kAwdhEe1BMXKjSNNiSzBfS890d4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34NF6iSS063986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 May 2023 10:06:44 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 May 2023 10:06:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 May 2023 10:06:43 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34NF6hUx015345;
	Tue, 23 May 2023 10:06:44 -0500
Message-ID: <c4a46592-0af9-3e6f-94c5-28d8c5e2548a@ti.com>
Date: Tue, 23 May 2023 10:06:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [meta-arago][master][PATCH 3/3] all: remove all
 legacy arago-sdk build recipes
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>, Andrew Davis <afd@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230522183847.3663294-1-rs@ti.com>
 <20230522183847.3663294-4-rs@ti.com>
 <14e59972-1f38-b1e8-e3ac-da4c05ede009@ti.com>
 <20230522223329.GX9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230522223329.GX9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 May 2023 15:06:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14450

On 5/22/23 17:33, Denys Dmytriyenko wrote:
> 2. Please stop calling something "the Yocto Standard SDK" - both flows are
> quite standard.

They literally refer to that build target as the Standard SDK, as 
apposed to the Extensible SDK. Info at the linked docs in the patch and 
here for your viewing pleasure. Don't get angry at me for the naming 
convention.

https://docs.yoctoproject.org/sdk-manual/intro.html#esdk-introduction

