Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F24FCAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 12:23:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.15995.1758889411450512294
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 05:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=PTTykmgz;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58QCNUW11656881
	for <meta-arago@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758889410;
	bh=1g4EPZmaXqIyuZHoRRTr5s+K9T46O62Rrsvly+4nvGo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PTTykmgzOkzoFG/vxQY8qrji1XaVAT+FPG5lXKU+LT6ESAmSxZzAQLumck2MLDOJm
	 yOAwfX0i3deyhhD+ZnKdDcFo5kwOeFg8TY2OFYAMlfJRkXjCmaIdVpqFCXsX2GPXRR
	 894z554UNG346RPtcMvqrcGEweEWJECpeVLe21JY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58QCNUWT3975038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:23:30 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 26
 Sep 2025 07:23:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 07:23:30 -0500
Received: from [10.24.72.117] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.117])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58QCNR781273942;
	Fri, 26 Sep 2025 07:23:28 -0500
Message-ID: <81cb8e22-91f3-4b35-80ad-831a5dd72c36@ti.com>
Date: Fri, 26 Sep 2025 17:53:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] meta-arago-test: hwspinlocktest: Update SRCREV
 to latest
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Judith Mendez <jm@ti.com>
CC: Paresh Bhagat <p-bhagat@ti.com>, <v-singh1@ti.com>, Khasim <khasim@ti.com>
References: <20250924172610.8166-1-p-bhagat@ti.com>
 <5643e2aa-3d0a-46bd-a296-b86bc75f879c@ti.com>
 <71b60350-3558-40dd-95f8-ede22eb4b269@ti.com>
 <3ca3c6cc-d91d-40b2-824e-f4d0e92672c4@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <3ca3c6cc-d91d-40b2-824e-f4d0e92672c4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58QCNUW11656881
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 26 Sep 2025 12:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16647


On 25/09/25 00:50, Bajjuri, Praneeth wrote:
>
>
> On 9/24/2025 2:19 PM, Ryan Eatmon wrote:
>>
>> Sending again, forgot to reply to all...
>>
>>
>> On 9/24/2025 12:37 PM, Chirag Shilwant wrote:
>>> Hi Ryan,
>>>
>>> On 24/09/25 22:56, Paresh Bhagat wrote:
>>>> Pulls in AM62D SoC support.
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


>>>>
>>>> ---
>>>> .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb | 2 +-
>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/=20
>>>> hwspinlocktest_0.1.bb=20
>>>> b/meta-arago-test/recipes-kernel/hwspinlocktest/ hwspinlocktest_0.1.=
bb
>>>> index 39171041..6dec53e7 100644
>>>> ---=20
>>>> a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.b=
b
>>>> +++=20
>>>> b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.b=
b
>>>> @@ -10,7 +10,7 @@ SRC_URI =3D "\
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Fix-Makefile-for-to-build=
-with-yocto.patch \
>>>> =C2=A0 "
>>>> -SRCREV =3D "a8297c7a2ca9e127929095045228dd4761121d56"
>>>> +SRCREV =3D "1d154fbe5b56ef81045763f574c2098a35d6a8b8"
>>>
>>>
>>> Can we add this recipe as well under CI/CD Auto-Merger for Auto=20
>>> SRCREV updates [0] ?
>>>
>>> [0] - https://git.ti.com/cgit/arago-project/meta-arago/commit/?=20
>>> h=3Dscarthgap&id=3D96f3c5b8e2efec96de9db131992e56272becc174
>>
>> Is this something that is going to be changing often enough that it=20
>> warrants that level of integration?=C2=A0 Or are we just being a littl=
e=20
>> lazy and not wanting to send a patch?=C2=A0 We don't tend to do the au=
to=20
>> promotion for very many packages.=C2=A0 Just the big ones.
>
> Not expecting this repo to change regularly. Dont need CI/CD=20
> auto-merge flow for this recipe.


Okay, then this patch on scarthgap is good to go


--
Chirag


>
>
>
>>
>>>
>>> Chirag
>>>
>>>
>>>> =C2=A0 S =3D "${WORKDIR}/git"
>>

