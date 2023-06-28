Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5299EEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 04:22:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.8790.1687926137172042694
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 21:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Wy3wege8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35S4MC79063574;
	Tue, 27 Jun 2023 23:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687926132;
	bh=kcElJS0g7Lt90Yw8FSww8YYDWvbQSGOX06W6ekZwn3k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Wy3wege8PiUFkolQtRj+E98RjjAFto1HUAjVv0ol9TyTzFGqXUD12uaMLQqMn5gdT
	 9lLs6EKGo1LutNt0qP/6LpsJS8gSodh/niXuEz0S85zlrQkTYuEmlS+5AGEFRBt3qs
	 My8He2ukvLlXXg3QBbrcT3sjuAgLuMtWjD+weDsQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35S4MCV8044347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 23:22:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 23:22:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 23:22:12 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35S4M9en036060;
	Tue, 27 Jun 2023 23:22:10 -0500
Message-ID: <14804cd7-d828-3aa5-ea6d-6cac08b4213d@ti.com>
Date: Wed, 28 Jun 2023 09:52:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v4 5/8] meta-arago-extras: sysrepo: Add
 libredblack needed for sysrepo
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-6-r-gunasekaran@ti.com>
 <a8c84035-031b-66d2-4ff9-027015d99f0c@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <a8c84035-031b-66d2-4ff9-027015d99f0c@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 35S4MC79063574
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 04:22:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14718

Andrew,

On 6/27/23 8:32 PM, Andrew Davis wrote:
> On 6/27/23 9:42 AM, Ravi Gunasekaran wrote:
>> libredblack is needed to build sysrepo. Add recipe for libredblack.
>>
>> The recipe is taken as-is from the commit 09f73e7 ("update for honiste=
r")
>> from the public repo [1].
>>
>> [1] - https://github.com/sartura/meta-sysrepo
>>
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>>
>> Changes since v3:
>> ----------------
>> No change
>>
>> Changes since v2:
>> ---------------
>> Newly introduced in this series
>>
>> =C2=A0 .../libredblack/libredblack_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++
>> =C2=A0 1 file changed, 21 insertions(+)
>> =C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/libredblac=
k/libredblack_git.bb
>>
>> diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack=
_git.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.b=
b
>> new file mode 100644
>> index 00000000..ea51b618
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY =3D "Library for handling red-black tree searching algorithm"
>> +DESCRIPTION =3D "A library to provide the RedBlack balanced tree sear=
ching and sorting algorithm."
>> +LICENSE =3D "LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde174fb5a92cdbe038c88dc4c4=
316f99"
>> +
>> +SRC_URI =3D "git://github.com/sysrepo/libredblack.git;protocol=3Dhttp=
s"
>> +
>> +PV =3D "1.0+git${SRCPV}"
>> +SRCREV =3D "a399310d99b61eec4d3c0677573ab5dddcf9395d"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +# NOTE: if this software is not capable of being built in a separate =
build directory
>> +# from the source, you should replace autotools with autotools-broken=
sep in the
>> +# inherit line
>=20
> This comment isn't needed.
>=20
> I understand the 1:1 copy from the original repo, but after you should =
have another patch
> that comes back and cleans these up. If they are to live in meta-arago =
they need to be up
> to the standards.

Understood.=20
I have replied to your comment in [2/8]. If my reply is not satisfactory,=
 then while sending
the next version, I will add another patch in the series to remove this "=
Note".
Incase the series is acceptable, then I will send out a separate patch to=
 remove the "Note"

>=20
> Andrew
>=20
>> +inherit python3native autotools
>> +
>> +# Specify any options you want to pass to the configure script using =
EXTRA_OECONF:
>> +EXTRA_OECONF =3D " --without-rbgen "
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"

--=20
Regards,
Ravi

