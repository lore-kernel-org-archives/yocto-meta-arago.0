Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12021C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 17:35:24 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.20190.1741282514507714576
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 09:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=NPFTlcFv;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526HZEZh139736
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Mar 2025 11:35:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741282514;
	bh=Xhu/iKSBctAYA+tmxMTT/YFlmOJFiLEMhdGhdtodUpU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=NPFTlcFvsg36n2OS+++lq7NM7uYNJ3D58dqyH5OK+WM8EfjV6OS0pENHqE6B/ybld
	 WQxI1m2jGd5IJ7d5zHJTeYt8QhIxsQzd7mb3reOfUq8Y1of/rni6UwCf5PqUA5adX0
	 owoJDQghiJxp0PTw7E3urh2ivEMWywvvhRA+BNyQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526HZECG057837
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Mar 2025 11:35:14 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 11:35:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 11:35:13 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526HZDWA049368;
	Thu, 6 Mar 2025 11:35:13 -0600
Message-ID: <6c0b1077-e996-41bb-8061-24fee82da4f4@ti.com>
Date: Thu, 6 Mar 2025 11:35:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] ti-gc320-tests: Add
 RDEPENDS ti-gc320-libs-dev
To: Antonios Christidis <a-christidis@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250306000441.408976-1-a-christidis@ti.com>
 <86cd4026-810e-49e1-8fc3-145014c14e2e@ti.com>
 <d8de6c4a-ab46-4dfc-b8a8-5db25df59cf1@ti.com>
 <84408d91-3248-4366-b440-3d715badf112@ti.com>
 <b643b122-8bfd-42fb-82d8-d67631a477e8@ti.com>
 <c6965134-98fb-4ce6-9086-e7760e2df38f@ti.com>
 <a5f7d349-1af1-40e9-ab75-00a64a81c7e3@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <a5f7d349-1af1-40e9-ab75-00a64a81c7e3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 526HZEZh139736
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 17:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15954

On 3/6/25 11:29 AM, Antonios Christidis wrote:
>=20
> On 3/6/25 11:25 AM, Andrew Davis wrote:
>> On 3/6/25 11:09 AM, Antonios Christidis wrote:
>>>
>>> On 3/6/25 10:57 AM, Andrew Davis wrote:
>>>> On 3/6/25 10:03 AM, Antonios Christidis wrote:
>>>>>
>>>>> On 3/6/25 7:32 AM, Andrew Davis wrote:
>>>>>> On 3/5/25 6:04 PM, a-christidis@ti.com wrote:
>>>>>>> From: Antonios Christidis <a-christidis@ti.com>
>>>>>>>
>>>>>>> Include the package ti-gc320-libs-dev as a runtime dependency.
>>>>>>>
>>>>>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>>>>>> ---
>>>>>>>
>>>>>>> v2:
>>>>>>> - Added dev-deps on INSANE_SKIP
>>>>>>>
>>>>>>> =C2=A0 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 3 ++-
>>>>>>> =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti=
-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-t=
ests/ti-gc320-tests_5.0.11.p7.bb
>>>>>>> index f9b9685f..14278d76 100644
>>>>>>> --- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-=
tests_5.0.11.p7.bb
>>>>>>> +++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-=
tests_5.0.11.p7.bb
>>>>>>> @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
>>>>>>> =C2=A0 LIC_FILES_CHKSUM =3D "file://dra7x-sdk-ti-gc320-tests_mani=
fest.html;md5=3D22a001855467f373c47f45de5330e3c9"
>>>>>>> =C2=A0 =C2=A0 DEPENDS =3D "ti-gc320-libs"
>>>>>>> +RDEPENDS:${PN}:append =3D " ti-gc320-libs-dev"
>>>>>>
>>>>>> This should be detected and set for you based on DEPENDS. You don'=
t
>>>>>> need any change here.
>>>>>>
>>>>>> Andrew
>>>>>>
>>>>> The way DEPENDS is setup it will not include ti-gc320-libs-dev pack=
age in the fs.
>>>>>
>>>>> =C2=A0=C2=A0The contents of the -dev package are required at runtim=
e for the gc320 tests.
>>>>>
>>>>
>>>> Why? What is going into the dev package that is needed by the tests?
>>>>
>>>> Andrew
>>>>
>>> libGAL.so symb link.
>>
>> If users of this library are meant to dlopen() that file, then add it =
to the
>> regular ti-gc320-libs package.
>>
>> Andrew
>>
> I did that in [1]. However, Denys let me know symb link should go in th=
e -dev package.
>=20

For header files I'd agree, and usually for .so files. But in this case i=
f
the users of this need this file (as in it is not just used for compiling=
)
then it can go in the base package. We do this for instance with GStreame=
r
plugins[0].

Another option is to fix up the tests so they link with libGAL the normal=
 way..

Andrew

[0] https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipe=
s-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb?h=3Dscarthga=
p#n32

> [1] =3D https://patchwork.yoctoproject.org/project/ti/patch/20250212201=
830.2090247-3-a-christidis@ti.com/
>=20
>=20
>>>
>>> ~ Antonios
>>>
>>>>>>> =C2=A0 =C2=A0 BRANCH =3D "ti-${PV}"
>>>>>>> =C2=A0 @@ -32,5 +33,5 @@ do_install() {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>>>>>> =C2=A0 }
>>>>>>> =C2=A0 -INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir"
>>>>>>> +INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir dev-deps=
"
>>>>>>> =C2=A0 INSANE_SKIP:${PN}-dbg +=3D "libdir"

