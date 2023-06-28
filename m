Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8FFEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:52:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.20456.1687967551769489387
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 08:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=D+KzC/yW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35SFqRXp095633;
	Wed, 28 Jun 2023 10:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687967547;
	bh=Q914z895DFiRUtRcRlUakQp/npkho3AqG7xMHDgBVnc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=D+KzC/yWyiil3JULD9ijZc/vBcvsV7Zp9mHy8aq2RWtP5wPmR+JF41oTiCUCl4GVy
	 RcXMPvil/qFjVoGzqFUt1wbJIfVuodlxOrEyeM9WOiPwIR2AZRt0584TJb7cCe78eX
	 RyqKmzoVO9D5bizwgtGAMnisK/04OTYHNyvdiVNo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35SFqRTH082175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Jun 2023 10:52:27 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 10:52:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 10:52:27 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35SFqQWR011159;
	Wed, 28 Jun 2023 10:52:27 -0500
Message-ID: <bb1fd022-ed27-728d-2db7-59182ae0cbb1@ti.com>
Date: Wed, 28 Jun 2023 10:52:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [master/kirkstone][PATCH v4 5/8] meta-arago-extras: sysrepo: Add
 libredblack needed for sysrepo
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>, Andrew Davis <afd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-6-r-gunasekaran@ti.com>
 <a8c84035-031b-66d2-4ff9-027015d99f0c@ti.com>
 <14804cd7-d828-3aa5-ea6d-6cac08b4213d@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <14804cd7-d828-3aa5-ea6d-6cac08b4213d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 35SFqRXp095633
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 15:52:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14726



On 6/27/2023 11:22 PM, Ravi Gunasekaran wrote:
> Andrew,
>=20
> On 6/27/23 8:32 PM, Andrew Davis wrote:
>> On 6/27/23 9:42 AM, Ravi Gunasekaran wrote:
>>> libredblack is needed to build sysrepo. Add recipe for libredblack.
>>>
>>> The recipe is taken as-is from the commit 09f73e7 ("update for honist=
er")
>>> from the public repo [1].
>>>
>>> [1] - https://github.com/sartura/meta-sysrepo
>>>
>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>> ---
>>>
>>> Changes since v3:
>>> ----------------
>>> No change
>>>
>>> Changes since v2:
>>> ---------------
>>> Newly introduced in this series
>>>
>>>  =C2=A0 .../libredblack/libredblack_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++
>>>  =C2=A0 1 file changed, 21 insertions(+)
>>>  =C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/libredbl=
ack/libredblack_git.bb
>>>
>>> diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblac=
k_git.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.=
bb
>>> new file mode 100644
>>> index 00000000..ea51b618
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.b=
b
>>> @@ -0,0 +1,21 @@
>>> +SUMMARY =3D "Library for handling red-black tree searching algorithm=
"
>>> +DESCRIPTION =3D "A library to provide the RedBlack balanced tree sea=
rching and sorting algorithm."
>>> +LICENSE =3D "LGPLv2.1"
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde174fb5a92cdbe038c88dc4c=
4316f99"
>>> +
>>> +SRC_URI =3D "git://github.com/sysrepo/libredblack.git;protocol=3Dhtt=
ps"
>>> +
>>> +PV =3D "1.0+git${SRCPV}"
>>> +SRCREV =3D "a399310d99b61eec4d3c0677573ab5dddcf9395d"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +# NOTE: if this software is not capable of being built in a separate=
 build directory
>>> +# from the source, you should replace autotools with autotools-broke=
nsep in the
>>> +# inherit line
>>
>> This comment isn't needed.
>>
>> I understand the 1:1 copy from the original repo, but after you should=
 have another patch
>> that comes back and cleans these up. If they are to live in meta-arago=
 they need to be up
>> to the standards.
>=20
> Understood.
> I have replied to your comment in [2/8]. If my reply is not satisfactor=
y, then while sending
> the next version, I will add another patch in the series to remove this=
 "Note".
> Incase the series is acceptable, then I will send out a separate patch =
to remove the "Note"


What you have is fine for accepting this series.  Just submit a new=20
patch that cleans it up.


>>
>> Andrew
>>
>>> +inherit python3native autotools
>>> +
>>> +# Specify any options you want to pass to the configure script using=
 EXTRA_OECONF:
>>> +EXTRA_OECONF =3D " --without-rbgen "
>>> +
>>> +BBCLASSEXTEND =3D "native nativesdk"
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

