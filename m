Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6188C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 19:31:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1181.1684783907651010191
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 12:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rXWYkH00;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MJVhrJ129642;
	Mon, 22 May 2023 14:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684783903;
	bh=3s+MUJgSsCVjLrUYKctlGyfBv99QN4koHhKLhHXYtoo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rXWYkH009g4NwK8IOmcVmBvw6dscKLeX5i/YYAPx2nH6qDgt3PuyIOfD9f7zGez7i
	 7UlNvYnP00hmefP/lLtcllIeALOqmbsmOw6CBk1iv7c96Sy7WQs6qhA5p/QtCXR6dg
	 bUi2AWJCXNOd5GIVZ7NK/yoZrGPd46yF2TqgSXJ8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MJVhf5072463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 14:31:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 14:31:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 14:31:42 -0500
Received: from [10.250.32.56] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MJVguQ009856;
	Mon, 22 May 2023 14:31:42 -0500
Message-ID: <039f06e5-23c3-488a-995b-711575a73814@ti.com>
Date: Mon, 22 May 2023 14:31:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master][PATCH 1/3] all: remove all external
 toolchain stuff
Content-Language: en-US
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230522183847.3663294-1-rs@ti.com>
 <20230522183847.3663294-2-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230522183847.3663294-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 19:31:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14435

On 5/22/23 1:38 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Drop all of the external toolchain stuff. We don't need it anymore now
> that everything can use the internal yocto compiler and multiarch has
> been configured properly in meta-ti.
> 

Another reason was for speeding builds on build farms which could avoid
re-builing the toolchain each time.

These days it is probably not worth the uncertaintay around mismatched
build tools, but at the time this was all neato stuff:

https://elinux.org/images/c/c8/ExternalToolchainsInYocto.pdf

Oh well,

Acked-by: Andrew Davis <afd@ti.com>

