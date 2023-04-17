Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0969FC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 22:39:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.11748.1681771161857078345
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 15:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gtDWhhpm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33HMdHxw111954;
	Mon, 17 Apr 2023 17:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681771157;
	bh=T40qbzmFFnNCiE0wj/oaO8/NDfkEyS5fElmFd59Gt2s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gtDWhhpm+plAf7Eq5WUwOILBciAjYXoGKDcPHm7oRg69ToBYEfSMiT93REkrZcyNV
	 yi8+ADGS32yfRaw8GtIs6skJubgHxJZzvSxC8nkR2KNRvwSu0dzGgjEqI1fNg82M/F
	 FLF6y5MmZklcxGNNwJ081US64f+xMCuFHJAXrsbI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33HMdHSN007417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Apr 2023 17:39:17 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 17
 Apr 2023 17:39:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 17 Apr 2023 17:39:16 -0500
Received: from [10.250.33.87] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33HMdGco005297;
	Mon, 17 Apr 2023 17:39:16 -0500
Message-ID: <02df0607-5aad-f70d-62d2-ffdce916201b@ti.com>
Date: Mon, 17 Apr 2023 17:39:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [DISCUSSION] Weston-Init and non-root weston
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan
 Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <1241ddde-7f9c-d8ff-2c15-d300f5c5a24a@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1241ddde-7f9c-d8ff-2c15-d300f5c5a24a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Apr 2023 22:39:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14316

On 4/17/23 5:32 PM, Randolph Sapp wrote:
> Finally getting around to weston-init issue I highlighted a while back and there's only one real issue preventing us from reusing the base weston-init recipe -- our touchscreen auto-configuration script.
> 
> That script has to have root access to setup and reload udev rules and as we know setuid won't work for shell scripts.
> 
> I propose we rewrite it in something that can use setuid (perl or c or something of the sort). I'm currently looking at perl as there's already quite a few core recipes that rdepend on it.
> 
> Then we just need to inject it into the runWeston script and adjust the two init scripts to point at that.
> 
> Any concerns or objections?

Why not just drop out that old touchscreen script, it is a non-standard way of doing
this task and should be removed.

Andrew

