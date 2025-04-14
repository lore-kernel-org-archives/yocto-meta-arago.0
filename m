Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3000C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 12:25:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.48358.1744633525875940283
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 05:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YhG0pokP;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ECPMWv2053403
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 07:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744633522;
	bh=TofoY8TwpZJRmX6tClZveOKneLKWrXcZZcGkQGuWS0o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YhG0pokPc6HW6cAmVVDYGF9hdnrYvg7ueXw2ZBk6iET7WgA6hgR0wcLKPCsPKX2rG
	 085X4+pNqTeYdRoPGXWZHRycDh3abjvAchkm02Xpx5azBeNN4Gkl5Sxgs09RSAAskY
	 0lPMo5AbUiVi9PJZfrlLTb/ooZ+cYgpbQxaVjpC4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ECPME4002114
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 07:25:22 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 07:25:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 07:25:21 -0500
Received: from [10.247.29.124] (ltpw0eb5ja.dhcp.ti.com [10.247.29.124])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ECPLeu098324;
	Mon, 14 Apr 2025 07:25:21 -0500
Message-ID: <f78f6f89-f7df-4011-b28e-c430b0969458@ti.com>
Date: Mon, 14 Apr 2025 07:25:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] hwspinlocktest: Fix build
 against latest kernel
To: Denys Dmytriyenko <denis@denix.org>, <c-shilwant@ti.com>,
        Suman Anna
	<s-anna@ti.com>
CC: <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, Judith Mendez <jm@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>
References: <20250411192050.22024-1-reatmon@ti.com>
 <797859ae-8101-4833-a941-23dac48d8738@ti.com>
 <20250413191155.GM13634@denix.org>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20250413191155.GM13634@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Apr 2025 12:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16169



On 4/13/2025 2:11 PM, Denys Dmytriyenko wrote:
> On Sat, Apr 12, 2025 at 10:30:14PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
>> Hi Praneeth,
>>
>> On 12/04/25 00:50, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> A recent change in the kernel removed a function that this test was
>>> calling.  This patch removes the calls to that function and modifies the
>>> flow to not need it.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>
>> <snip>
>>
>>> +SRC_URI = "\
>>> +    git://github.com/sumananna/omap-hwspinlock-test;protocol=https;branch=master \
>>
>>
>>
>> What's preventing us to move this repository under [0] or [1] ?
>>
>>
>> [0]: https://github.com/TexasInstruments/
>>
>> [1]: https://git.ti.com/cgit/
> 
> + Suman

As discussed here: 
https://lists.yoctoproject.org/g/meta-arago/topic/109054399#msg15583

We want to move away from the personal repo to a maintainable location 
with new owner.


> 
> 
>>
>>
>>> +    file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
>>> +    file://0002-Add-support-for-AM62-SoCs.patch \
>>> +    file://0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch \
>>> +"
>>> +
>>>   SRCREV = "20f15e79a3a0197e06328c252d23aec225de21ed"
>>>   S = "${WORKDIR}/git"

