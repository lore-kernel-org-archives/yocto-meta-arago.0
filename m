Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB74BCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:19:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.22968.1758741576052775704
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 12:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=auGoQE6E;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58OJJZCh1738822
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 14:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758741575;
	bh=x8aBCXaxfqUNPd6b2NIKnIXlQtf289f9fTnZKbpLivQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=auGoQE6EhxiQuN0LLPwGVbkRH/f3wA/Pr0R6q9q2xqo342r608MXRl8tLie5uykEt
	 x4cRcbfy40mzNnuOsis5IJsj619LT3UgcAtLzxoqLnttXK+Oh0dkxU26xlti5+j4A7
	 TZ0a1udjq2C80KOB83+rLG5fq04/EhAOWq12Dy4I=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58OJJZj32653201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 14:19:35 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 14:19:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 14:19:34 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58OJJYWq2247368;
	Wed, 24 Sep 2025 14:19:34 -0500
Message-ID: <71b60350-3558-40dd-95f8-ede22eb4b269@ti.com>
Date: Wed, 24 Sep 2025 14:19:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] meta-arago-test: hwspinlocktest: Update SRCREV
 to latest
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Judith Mendez <jm@ti.com>
CC: Paresh Bhagat <p-bhagat@ti.com>, <v-singh1@ti.com>,
        Khasim
	<khasim@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
References: <20250924172610.8166-1-p-bhagat@ti.com>
 <5643e2aa-3d0a-46bd-a296-b86bc75f879c@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <5643e2aa-3d0a-46bd-a296-b86bc75f879c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 58OJJZCh1738822
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 19:19:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16626


Sending again, forgot to reply to all...


On 9/24/2025 12:37 PM, Chirag Shilwant wrote:
> Hi Ryan,
>=20
> On 24/09/25 22:56, Paresh Bhagat wrote:
>> Pulls in AM62D SoC support.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> =C2=A0 .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/=20
>> hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/=
=20
>> hwspinlocktest_0.1.bb
>> index 39171041..6dec53e7 100644
>> --- a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1=
.bb
>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1=
.bb
>> @@ -10,7 +10,7 @@ SRC_URI =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Fix-Makefile-for-to-build-w=
ith-yocto.patch \
>> =C2=A0 "
>> -SRCREV =3D "a8297c7a2ca9e127929095045228dd4761121d56"
>> +SRCREV =3D "1d154fbe5b56ef81045763f574c2098a35d6a8b8"
>=20
>=20
> Can we add this recipe as well under CI/CD Auto-Merger for Auto SRCREV=20
> updates [0] ?
>=20
> [0] - https://git.ti.com/cgit/arago-project/meta-arago/commit/?=20
> h=3Dscarthgap&id=3D96f3c5b8e2efec96de9db131992e56272becc174

Is this something that is going to be changing often enough that it=20
warrants that level of integration?  Or are we just being a little lazy=20
and not wanting to send a patch?  We don't tend to do the auto promotion=20
for very many packages.  Just the big ones.

>=20
> Chirag
>=20
>=20
>> =C2=A0 S =3D "${WORKDIR}/git"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


