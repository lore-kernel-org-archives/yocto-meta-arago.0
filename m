Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D63FC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 18:51:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1923.1741287061667667850
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 10:51:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=fFWatYqW;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526Iovjj155462
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Mar 2025 12:50:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741287057;
	bh=Lt/2vyJ/X2TmfBqpE17btXuHsff4doGS+mtMr8G0q8Y=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=fFWatYqWOJ1jiZ/MyR/ioA6Q0T0B/QZyCEAvD6BMB8+JL27d/NJrxd8axHxrj3AnD
	 QaX3fkg5r9QGCSWfoHZqVUzmvVfdtmVCkyJmsGfzEO0WVfBQZ9iub7RTrjRHEXv2TW
	 PHJlX63vswbw4nJ3J5RSh8+G+yhSQPe0TPFzYR4U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526IovW2073762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Mar 2025 12:50:57 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 12:50:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 12:50:57 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526IouBA130938;
	Thu, 6 Mar 2025 12:50:56 -0600
Message-ID: <ac5f1bdd-15a7-454a-b881-18c129116d4f@ti.com>
Date: Thu, 6 Mar 2025 12:50:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] ti-gc320-tests: Add
 RDEPENDS ti-gc320-libs-dev
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Ryan
 Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <rs@ti.com>
References: <20250306000441.408976-1-a-christidis@ti.com>
 <86cd4026-810e-49e1-8fc3-145014c14e2e@ti.com>
 <d8de6c4a-ab46-4dfc-b8a8-5db25df59cf1@ti.com>
 <84408d91-3248-4366-b440-3d715badf112@ti.com>
 <b643b122-8bfd-42fb-82d8-d67631a477e8@ti.com>
 <c6965134-98fb-4ce6-9086-e7760e2df38f@ti.com>
 <a5f7d349-1af1-40e9-ab75-00a64a81c7e3@ti.com>
 <6c0b1077-e996-41bb-8061-24fee82da4f4@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <6c0b1077-e996-41bb-8061-24fee82da4f4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 526Iovjj155462
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 18:51:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15955


On 3/6/25 11:35 AM, Andrew Davis wrote:
> On 3/6/25 11:29 AM, Antonios Christidis wrote:
>>
>> On 3/6/25 11:25 AM, Andrew Davis wrote:
>>> On 3/6/25 11:09 AM, Antonios Christidis wrote:
>>>>
>>>> On 3/6/25 10:57 AM, Andrew Davis wrote:
>>>>> On 3/6/25 10:03 AM, Antonios Christidis wrote:
>>>>>>
>>>>>> On 3/6/25 7:32 AM, Andrew Davis wrote:
>>>>>>> On 3/5/25 6:04 PM, a-christidis@ti.com wrote:
>>>>>>>> From: Antonios Christidis <a-christidis@ti.com>
>>>>>>>>
>>>>>>>> Include the package ti-gc320-libs-dev as a runtime dependency.
>>>>>>>>
>>>>>>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> v2:
>>>>>>>> - Added dev-deps on INSANE_SKIP
>>>>>>>>
>>>>>>>> =C2=A0 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 3 ++-
>>>>>>>> =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git=20
>>>>>>>> a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tes=
ts_5.0.11.p7.bb=20
>>>>>>>> b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tes=
ts_5.0.11.p7.bb=20
>>>>>>>>
>>>>>>>> index f9b9685f..14278d76 100644
>>>>>>>> ---=20
>>>>>>>> a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tes=
ts_5.0.11.p7.bb
>>>>>>>> +++=20
>>>>>>>> b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tes=
ts_5.0.11.p7.bb
>>>>>>>> @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
>>>>>>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>>>>>>> "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=3D22a00185546=
7f373c47f45de5330e3c9"
>>>>>>>> =C2=A0 =C2=A0 DEPENDS =3D "ti-gc320-libs"
>>>>>>>> +RDEPENDS:${PN}:append =3D " ti-gc320-libs-dev"
>>>>>>>
>>>>>>> This should be detected and set for you based on DEPENDS. You don=
't
>>>>>>> need any change here.
>>>>>>>
>>>>>>> Andrew
>>>>>>>
>>>>>> The way DEPENDS is setup it will not include ti-gc320-libs-dev=20
>>>>>> package in the fs.
>>>>>>
>>>>>> =C2=A0=C2=A0The contents of the -dev package are required at runti=
me for=20
>>>>>> the gc320 tests.
>>>>>>
>>>>>
>>>>> Why? What is going into the dev package that is needed by the tests=
?
>>>>>
>>>>> Andrew
>>>>>
>>>> libGAL.so symb link.
>>>
>>> If users of this library are meant to dlopen() that file, then add=20
>>> it to the
>>> regular ti-gc320-libs package.
>>>
>>> Andrew
>>>
>> I did that in [1]. However, Denys let me know symb link should go in=20
>> the -dev package.
>>
>
> For header files I'd agree, and usually for .so files. But in this=20
> case if
> the users of this need this file (as in it is not just used for=20
> compiling)
> then it can go in the base package. We do this for instance with=20
> GStreamer
> plugins[0].
>
I prefer the above option. Ryan, Denys, Randolph what do you think ?

> Another option is to fix up the tests so they link with libGAL the=20
> normal way..
>
> Andrew
>
> [0]=20
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-=
multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb?h=3Dscarthgap#=
n32
>
>> [1] =3D=20
>> https://patchwork.yoctoproject.org/project/ti/patch/20250212201830.209=
0247-3-a-christidis@ti.com/
>>
>>
>>>>
>>>> ~ Antonios
>>>>
>>>>>>>> =C2=A0 =C2=A0 BRANCH =3D "ti-${PV}"
>>>>>>>> =C2=A0 @@ -32,5 +33,5 @@ do_install() {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>>>>>>> =C2=A0 }
>>>>>>>> =C2=A0 -INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir"
>>>>>>>> +INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir dev-dep=
s"
>>>>>>>> =C2=A0 INSANE_SKIP:${PN}-dbg +=3D "libdir"

