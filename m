Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2853CC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 22:53:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.12275.1681771983615998451
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 15:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VFCNumVx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33HMqxfS003283;
	Mon, 17 Apr 2023 17:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681771979;
	bh=b/70pNXLgc4QC+w6Zm5fVK+bwMYxdMYPeIZaAo8/CUQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VFCNumVxFNNEkL6wGoy2o+UNoEV/LU/4+3+YAkoNDvSB97VjsN4QDwQqHWFXV2Squ
	 eo85virdlb+q2hV00uQfoK0epqQ0aj5ftO0Nr+gHIJFqhSyawxIeScP9RIhS8MdQzH
	 NL+RSdiiQJDPpxJFEUWqzKtc5mO0lOc4fUYDStfc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33HMqxIC017368
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Apr 2023 17:52:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 17
 Apr 2023 17:52:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 17 Apr 2023 17:52:59 -0500
Received: from [10.250.33.87] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33HMqw8n058396;
	Mon, 17 Apr 2023 17:52:58 -0500
Message-ID: <ca43165d-5958-0cf9-bac4-527c4bdf94ac@ti.com>
Date: Mon, 17 Apr 2023 17:52:58 -0500
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
 <02df0607-5aad-f70d-62d2-ffdce916201b@ti.com>
 <05fd037d-f77c-f2d7-7e92-ef11cb395e63@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <05fd037d-f77c-f2d7-7e92-ef11cb395e63@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Apr 2023 22:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14318

On 4/17/23 5:43 PM, Randolph Sapp wrote:
> On 4/17/23 17:39, Andrew Davis wrote:
>> On 4/17/23 5:32 PM, Randolph Sapp wrote:
>>> Finally getting around to weston-init issue I highlighted a while back and there's only one real issue preventing us from reusing the base weston-init recipe -- our touchscreen auto-configuration script.
>>>
>>> That script has to have root access to setup and reload udev rules and as we know setuid won't work for shell scripts.
>>>
>>> I propose we rewrite it in something that can use setuid (perl or c or something of the sort). I'm currently looking at perl as there's already quite a few core recipes that rdepend on it.
>>>
>>> Then we just need to inject it into the runWeston script and adjust the two init scripts to point at that.
>>>
>>> Any concerns or objections?
>>
>> Why not just drop out that old touchscreen script, it is a non-standard way of doing
>> this task and should be removed.
>>
>> Andrew
> 
> It's non-standard, but that's because there really isn't a good standard for calibrating touch screens under Weston. AFAIK this is still useful.

https://wiki.st.com/stm32mpu/wiki/How_to_calibrate_the_touchscreen

This seems like the standard ^^

Andrew

