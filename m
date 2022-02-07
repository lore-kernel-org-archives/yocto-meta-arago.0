Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.1522.1644265126354472741
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 12:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=HcsmBsrB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 217KIeXJ026650;
	Mon, 7 Feb 2022 14:18:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644265120;
	bh=7klSe2ajToFTpSgUC/DoapzoTvbzwNGY1WZwbjoGNYE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HcsmBsrB052jIKQsZFLZgCD2tgqvGp+N7il3PJDhZbUQAIjLEhLljaTrhhqQ8LyRt
	 Mad0T6URKeoCUhyn8d1P0S7Ah+NQC3JCCZz7+z2jij4xNzaKBmsycMGBB8GzccBx6U
	 ZeQ/lLLsb1h6D2LOTufpI7b7+R2bcHWJwsDNukfQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 217KIeX1074715
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 14:18:40 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 14:18:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 14:18:39 -0600
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 217KId9G023397;
	Mon, 7 Feb 2022 14:18:39 -0600
Message-ID: <c0307a96-7b9d-52d5-d02e-d6149696db19@ti.com>
Date: Mon, 7 Feb 2022 14:18:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [meta-arago][master/dunfell][PATCH v2] ltp-ddt: Bump to 08.02.00.001 release
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Yogesh Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220207180541.28964-1-reatmon@ti.com>
 <20220207180637.GU26229@denix.org>
 <377472ec-779d-b612-2d6d-e34650821f11@ti.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <377472ec-779d-b612-2d6d-e34650821f11@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 217KIeXJ026650
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Ryan,

On 2/7/2022 12:07 PM, Ryan Eatmon wrote:
>=20
> The hash changed.=C2=A0 Last minute request.
>=20
>=20
> On 2/7/2022 12:06, Denys Dmytriyenko wrote:
>> What's the difference since v1?
>>
>> On Mon, Feb 07, 2022 at 12:05:41PM -0600, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> Updated the ltp-ddt version for 08.02.00.001

add some key details here.
looking at ltp-ddt project, the key change is adding
j721s2-evm support

>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---

good to capture here!
Changes in V2: <what changed>


>>> =C2=A0 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb=
 | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb=20
>>> b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
>>> index e9431796..34f4533b 100644
>>> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
>>> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
>>> @@ -14,7 +14,7 @@ PE =3D "1"
>>> =C2=A0 PR =3D "r5"
>>> =C2=A0 PV_append =3D "+git${SRCPV}"
>>> -SRCREV =3D "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
>>> +SRCREV =3D "f0cfba630340c4efa114285ea7a6d896861dd9c7"
>>> =C2=A0 BRANCH ?=3D "master"
>>> =C2=A0 SRC_URI_remove =3D=20
>>> "git://github.com/linux-test-project/ltp.git;protocol=3Dhttps;branch=3D=
master"=20
>>>
>>> --=20
>>> 2.17.1
>=20
