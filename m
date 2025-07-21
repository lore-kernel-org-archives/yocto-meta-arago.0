Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2161C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 17:00:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.46620.1753117195004921461
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 09:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Avt5bF3W;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LGxpkf847122;
	Mon, 21 Jul 2025 11:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753117191;
	bh=+d2dPfnbw7AVWDIwiG6ZOhMuLM40AmW5zRS6x40BtXw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Avt5bF3WMiJByGOjr32GsALeOba0gLE67ibWO3MbXjjXapoNT/cYdJa0kYZ1LgIT4
	 iZXCWi7M0rywzyWWwNCyxp6pOByAvLBPezO3v3E3HCkNCSFg2WChOrwfT60gE9NBCY
	 D2fnH4B/r1l5vYKx8dmZPF7xRUWudKj7yyo8ySIg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LGxpr8415871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 11:59:51 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 11:59:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 11:59:50 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LGxoG33857112;
	Mon, 21 Jul 2025 11:59:50 -0500
Message-ID: <615ab95d-1c24-418d-945a-632be3cf0d69@ti.com>
Date: Mon, 21 Jul 2025 11:59:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] dma-heap-tests: Update SRCREV to fix
 CMake 4.0 issue
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250721145146.21181-1-reatmon@ti.com>
 <20250721162454.GG24899@denix.org>
 <185452545FA11369.534@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <185452545FA11369.534@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 56LGxpkf847122
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Jul 2025 17:00:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16318


Oh I see.  He moved files around.  I'm going to do another patch to the=20
upstream repo to pull the license out into it's own file that won't have=20
this again down the road.


On 7/21/2025 11:51 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> Sigh... Andrew changed the lic file...=C2=A0 Ok.=C2=A0 I'll do a more f=
ormal=20
> update and send a v2.
>=20
>=20
> On 7/21/2025 11:24 AM, Denys Dmytriyenko wrote:
>> ERROR: dma-heap-tests-1.0-r0 do_populate_lic: QA Issue:=20
>> dma-heap-tests: LIC_FILES_CHKSUM points to an invalid file:=20
>> .../dma-heap-tests-1.0/src/heap_test_fixture.cpp [license-checksum]
>>
>>
>> On Mon, Jul 21, 2025 at 09:51:46AM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb | =
2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git=20
>>> a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb=20
>>> b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
>>> index 69f95391..c0eeaaaa 100644
>>> --- a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
>>> +++ b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
>>> @@ -7,7 +7,7 @@ PV =3D "1.0"
>>> =C2=A0 BRANCH =3D "master"
>>> =C2=A0 SRC_URI =3D=20
>>> "git://github.com/glneo/dma-heap-tests.git;protocol=3Dhttps;branch=3D=
${BRANCH}"
>>> -SRCREV =3D "334fc8ec8056badc9c6667e6f1328705cb973ab4"
>>> +SRCREV =3D "ead2ea8a9c3b81e97324da44c76cd9295e6c5efc"
>>> =C2=A0 DEPENDS =3D "googletest"
>>> --=20
>>> 2.17.1
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

