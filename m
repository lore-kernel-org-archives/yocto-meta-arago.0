Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5602CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:19:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.18184.1758637184379710349
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 07:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=tgPfISYJ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NEJgv51492093;
	Tue, 23 Sep 2025 09:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758637182;
	bh=d1mLI8LCgnj0e0jlU2zfhtH0v0EbxAreoBohG17DWzE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tgPfISYJ90ykIqsw2Z5YExewRfNNmQcgJgP01fK+OYP0gGquGVKZ0azkLfqhoDknp
	 eHxBF2Wnj4Hy0iMzsSMqXOnEQYlScfB2I76kXc7GgfZ2INebcBdi5Tg8uwDynUX1zw
	 Uztx830ONGhjnc79F0PI0Yn6AOJAGhd5xAOOanNQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NEJfLL2030643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 09:19:42 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 09:19:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 09:19:41 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NEJfjN167438;
	Tue, 23 Sep 2025 09:19:41 -0500
Message-ID: <b1bdfc24-3498-45dd-9b06-0164d7f1e180@ti.com>
Date: Tue, 23 Sep 2025 09:19:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] bt-ti: Restrict bt-ti
 packages to legacy platforms only
To: Yogesh Hegde <y-hegde@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Prudhvi Veeramachaneni <prudhvi@ti.com>
References: <20250923121539.i7bx4zt7krbzmc7v@yogi-work-pc>
 <1867EEE526850244.23856@lists.yoctoproject.org>
 <1867EEF6EB68CB9F.18262@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1867EEF6EB68CB9F.18262@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 58NEJgv51492093
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Sep 2025 14:19:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16617



On 9/23/2025 9:15 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 9/23/2025 9:14 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>> The subject should be:
>>
>> packagegroup-arago-tisdk-connectivity: Restrict bt-ti to legacy platfo=
rms
>=20
>=20
> Or even better:
>=20
> packagegroup-arago-tisdk-connectivity: Restrict BT_TI to legacy platfor=
ms
>=20
>=20
>>
>> On 9/23/2025 7:15 AM, Yogesh Hegde wrote:
>>> The bt-enable and bt-fw packages are only applicable for AM33X, AM43X=
=20
>>> and AM57XX
>>> legacy platforms, but was being included for all machines. While the
>>> bt-enable script performs noop for unsupported machines, it still add=
s
>>> unnecessary overhead to boot time and generates log noise.
>>>
>>> Restrict the bt-enable and bt-fw packages to only be included for the
>>> specific machine overrides (ti33x, ti43x, am57xx) that actually requi=
re
>>> Bluetooth support.
>>>
>>> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
>>> ---
>>> =C2=A0 .../packagegroup-arago-tisdk-connectivity.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 14 +++++++++++++-
>>> =C2=A0 1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git=20
>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/package=
group-arago-tisdk-connectivity.bb
>>> index 5a91357b..5eeeaa01 100644
>>> ---=20
>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
>>> +++=20
>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
>>> @@ -49,7 +49,19 @@ BT_COMMON =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-firmware-ibt-18 \
>>> =C2=A0 "
>>> -BT_TI =3D "\
>>> +BT_TI =3D ""
>>> +
>>> +BT_TI:append:ti33x =3D "\
>>> +=C2=A0=C2=A0=C2=A0 bt-enable \
>>> +=C2=A0=C2=A0=C2=A0 bt-fw \
>>> +"
>>> +
>>> +BT_TI:append:ti43x =3D "\
>>> +=C2=A0=C2=A0=C2=A0 bt-enable \
>>> +=C2=A0=C2=A0=C2=A0 bt-fw \
>>> +"
>>> +
>>> +BT_TI:append:am57xx =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bt-enable \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bt-fw \
>>> =C2=A0 "
>>

I really should stop replying so quickly...

In thinking about it a little longer, I think this change is a little=20
too wordy.  A better change would be:

CONNECTIVITY_RDEPENDS =3D " \
     htop \
     iptables \
     iproute2 \
     iproute2-tc \
     iproute2-devlink \
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
"

CONNECTIVITY_RDEPENDS:append:ti33x =3D " ${BT_TI}"
CONNECTIVITY_RDEPENDS:append:ti43x =3D " ${BT_TI}"
CONNECTIVITY_RDEPENDS:append:am57xx =3D " ${BT_TI}"

That way we still have a single variable to list the packages, just use=20
the override to add the variable to the big list.  We won't be repeating=20
the package list over and over.


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

