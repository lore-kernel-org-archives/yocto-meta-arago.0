Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB7CEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 04:06:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1289.1688011593700693315
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 21:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Zx957a03;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35T46TZa020426;
	Wed, 28 Jun 2023 23:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688011589;
	bh=ON8OPtrWTOkqLWq844HxOZ9O5yjpq13nm3lKsvzkuZo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Zx957a03pXfA8qERPJnJvAvVGou2k+hVpFBrSaHoL3wQt+9Tv7jT2+DBnE8cLsWFU
	 u3oyIfAEOkILkxKSdw7Wg5urkNQ+etGVX3WIxTlNiEH7VI46mE0Wni0wdNVRRylw3s
	 xJjsgR8AnaP3RMKOxzog9pm9RQU3SAQronRtS/MQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35T46TCt013020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Jun 2023 23:06:29 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 23:06:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 23:06:28 -0500
Received: from [10.24.69.79] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35T46Qdl003067;
	Wed, 28 Jun 2023 23:06:27 -0500
Message-ID: <40bd543c-6957-a8e0-dc86-34542de7d9f6@ti.com>
Date: Thu, 29 Jun 2023 09:36:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago] [master/kirkstone][PATCH v4 5/8] meta-arago-extras:
 sysrepo: Add libredblack needed for sysrepo
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-6-r-gunasekaran@ti.com>
 <a8c84035-031b-66d2-4ff9-027015d99f0c@ti.com>
 <14804cd7-d828-3aa5-ea6d-6cac08b4213d@ti.com>
 <bb1fd022-ed27-728d-2db7-59182ae0cbb1@ti.com>
 <176CE44BB5C95250.25798@lists.yoctoproject.org>
 <20230628224729.GX1518@denix.org>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230628224729.GX1518@denix.org>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 35T46TZa020426
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 04:06:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14732



On 6/29/23 4:17 AM, Denys Dmytriyenko wrote:
> On Wed, Jun 28, 2023 at 01:56:06PM -0400, Denys Dmytriyenko wrote:
>> On Wed, Jun 28, 2023 at 10:52:26AM -0500, Ryan Eatmon wrote:
>>>
>>>
>>> On 6/27/2023 11:22 PM, Ravi Gunasekaran wrote:
>>>> Andrew,
>>>>
>>>> On 6/27/23 8:32 PM, Andrew Davis wrote:
>>>>> On 6/27/23 9:42 AM, Ravi Gunasekaran wrote:
>>>>>> libredblack is needed to build sysrepo. Add recipe for libredblack.
>>>>>>
>>>>>> The recipe is taken as-is from the commit 09f73e7 ("update for hon=
ister")
>>>>> >from the public repo [1].
>>>>>>
>>>>>> [1] - https://github.com/sartura/meta-sysrepo
>>>>>>
>>>>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>>>>> ---
>>>>>>
>>>>>> Changes since v3:
>>>>>> ----------------
>>>>>> No change
>>>>>>
>>>>>> Changes since v2:
>>>>>> ---------------
>>>>>> Newly introduced in this series
>>>>>>
>>>>>> =C2=A0 .../libredblack/libredblack_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++
>>>>>> =C2=A0 1 file changed, 21 insertions(+)
>>>>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/libred=
black/libredblack_git.bb
>>>>>>
>>>>>> diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredb=
lack_git.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_g=
it.bb
>>>>>> new file mode 100644
>>>>>> index 00000000..ea51b618
>>>>>> --- /dev/null
>>>>>> +++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_gi=
t.bb
>>>>>> @@ -0,0 +1,21 @@
>>>>>> +SUMMARY =3D "Library for handling red-black tree searching algori=
thm"
>>>>>> +DESCRIPTION =3D "A library to provide the RedBlack balanced tree =
searching and sorting algorithm."
>>>>>> +LICENSE =3D "LGPLv2.1"
>>>>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde174fb5a92cdbe038c88d=
c4c4316f99"
>>>>>> +
>>>>>> +SRC_URI =3D "git://github.com/sysrepo/libredblack.git;protocol=3D=
https"
>>>>>> +
>>>>>> +PV =3D "1.0+git${SRCPV}"
>>>>>> +SRCREV =3D "a399310d99b61eec4d3c0677573ab5dddcf9395d"
>>>>>> +
>>>>>> +S =3D "${WORKDIR}/git"
>>>>>> +
>>>>>> +# NOTE: if this software is not capable of being built in a separ=
ate build directory
>>>>>> +# from the source, you should replace autotools with autotools-br=
okensep in the
>>>>>> +# inherit line
>>>>>
>>>>> This comment isn't needed.
>>>>>
>>>>> I understand the 1:1 copy from the original repo, but after you sho=
uld have another patch
>>>>> that comes back and cleans these up. If they are to live in meta-ar=
ago they need to be up
>>>>> to the standards.
>>>>
>>>> Understood.
>>>> I have replied to your comment in [2/8]. If my reply is not satisfac=
tory, then while sending
>>>> the next version, I will add another patch in the series to remove t=
his "Note".
>>>> Incase the series is acceptable, then I will send out a separate pat=
ch to remove the "Note"
>>>
>>>
>>> What you have is fine for accepting this series.  Just submit a new
>>> patch that cleans it up.
>>
>> +1 here. Good enough for merging, please address remaining comments in=
 the=20
>> follow up patches. Thanks.
>=20
> BTW, one more thing to fix in the follow up updates:
>=20
> WARNING: URL: git://github.com/sysrepo/libredblack.git;protocol=3Dhttps=
 does not=20
> set any branch parameter. The future default branch used by tools and=20
> repositories is uncertain and we will therefore soon require this is se=
t in=20
> all git urls.

Thanks for merging the patches to kirkstone-next.
I will post a follow up series fixing the comments.

--=20
Regards,
Ravi

