Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B27C369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 14:27:13 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.50777.1744640833142291311
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 07:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=mKJtVDFr;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EER8ti2177376
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 09:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744640828;
	bh=6aPTkf2Ao8o/L88EMKYyCucLOe0eky8hzPwxvt0ZFxU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mKJtVDFry2r/iAQne5EVQ003APY2hL2jBFrDWfjpvqt88g+am88tAnQDlEC7/VvI7
	 7Cxh88vu2m8yVgnPJONpJu3BS3GTAMdaW5moaJjU3bKJXcqbdBj3HgETFgY04OnLAj
	 VTogHnV1T7Vibx6ZgJc7VK//gGzgNZuFVRSLE2Jg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EER8Ps026747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 09:27:08 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 09:27:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 09:27:08 -0500
Received: from [10.249.33.29] ([10.249.33.29])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EER8mX001920;
	Mon, 14 Apr 2025 09:27:08 -0500
Message-ID: <2cd4b86f-f17d-4346-8907-2c8732f06301@ti.com>
Date: Mon, 14 Apr 2025 09:27:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] hwspinlocktest: Fix build
 against latest kernel
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, <c-shilwant@ti.com>,
        Suman Anna <s-anna@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, Judith Mendez <jm@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>
References: <20250411192050.22024-1-reatmon@ti.com>
 <797859ae-8101-4833-a941-23dac48d8738@ti.com>
 <20250413191155.GM13634@denix.org>
 <f78f6f89-f7df-4011-b28e-c430b0969458@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <f78f6f89-f7df-4011-b28e-c430b0969458@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 53EER8ti2177376
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Apr 2025 14:27:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16170



On 4/14/2025 7:25 AM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 4/13/2025 2:11 PM, Denys Dmytriyenko wrote:
>> On Sat, Apr 12, 2025 at 10:30:14PM +0530, Chirag Shilwant via=20
>> lists.yoctoproject.org wrote:
>>> Hi Praneeth,
>>>
>>> On 12/04/25 00:50, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> A recent change in the kernel removed a function that this test was
>>>> calling.=C2=A0 This patch removes the calls to that function and mod=
ifies=20
>>>> the
>>>> flow to not need it.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>
>>> <snip>
>>>
>>>> +SRC_URI =3D "\
>>>> +   =20
>>>> git://github.com/sumananna/omap-hwspinlock-test;protocol=3Dhttps;bra=
nch=3Dmaster \
>>>
>>>
>>>
>>> What's preventing us to move this repository under [0] or [1] ?
>>>
>>>
>>> [0]: https://github.com/TexasInstruments/
>>>
>>> [1]: https://git.ti.com/cgit/
>>
>> + Suman
>=20
> As discussed here:=20
> https://lists.yoctoproject.org/g/meta-arago/topic/109054399#msg15583
>=20
> We want to move away from the personal repo to a maintainable location=20
> with new owner.

And as soon as you all make that decision and make that happen, I'm more=20
than happy to submit patches the new project.\

In the meantime... I need to get builds back up and working.


>=20
>>
>>
>>>
>>>
>>>> +=C2=A0=C2=A0=C2=A0 file://0001-Fix-Makefile-for-to-build-with-yocto=
.patch \
>>>> +=C2=A0=C2=A0=C2=A0 file://0002-Add-support-for-AM62-SoCs.patch \
>>>> +   =20
>>>> file://0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.pat=
ch \
>>>> +"
>>>> +
>>>> =C2=A0 SRCREV =3D "20f15e79a3a0197e06328c252d23aec225de21ed"
>>>> =C2=A0 S =3D "${WORKDIR}/git"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

