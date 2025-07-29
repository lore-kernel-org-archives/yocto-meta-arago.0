Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43AAC83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 17:48:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.14590.1753811280671621943
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 10:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Xo2/JNTC;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56THlwqh3053473;
	Tue, 29 Jul 2025 12:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753811278;
	bh=q3Lokk+sdJrA99w53MctSePGnEEiitfFAxgs8XuCkPw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Xo2/JNTCShkO2OlxbPGZIzYW/bhfthjjP5fiU+i/V0DMkxP+db+HZdbVcHEC/BEbG
	 IlDY4euwBTta2QO9LwNujyCMpcI05/3Ionc6WM7KPIao2Rs5axS/2xQ5w+sVv7pGbV
	 staZH7OFFxSdduhKpnM9H0dCAKkHKhxbzeu9csm0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56THlwhM2919053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 29 Jul 2025 12:47:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 29
 Jul 2025 12:47:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 29 Jul 2025 12:47:58 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56THlwst3811781;
	Tue, 29 Jul 2025 12:47:58 -0500
Message-ID: <efcd584f-a46e-41bf-bf08-b705dc492fc6@ti.com>
Date: Tue, 29 Jul 2025 12:47:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/2]
 packagegroup-arago-tisdk-amsdk-sdk-host: Remove this recipe
To: Jon Cormier <jcormier@criticallink.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250728183922.580652-1-afd@ti.com>
 <20250728183922.580652-2-afd@ti.com>
 <1856C8B7ECE2833E.21808@lists.yoctoproject.org>
 <CADL8D3bcdi28+yXCfnz1_Z_ExtAJjCpOHQSdyK9-vyhyhYdEYg@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CADL8D3bcdi28+yXCfnz1_Z_ExtAJjCpOHQSdyK9-vyhyhYdEYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 56THlwqh3053473
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 17:48:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16338



On 7/29/25 12:26 PM, Jon Cormier wrote:
> On Tue, Jul 29, 2025 at 1:23=E2=80=AFPM Jon Cormier via lists.yoctoproj=
ect.org
> <jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
>>
>> On Mon, Jul 28, 2025 at 2:39=E2=80=AFPM Andrew Davis via
>> lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
>>>
>>> This recipe only now exists to add "tisdk-uenv" to tisdk-core-bundle
>>> images so uEnv.txt can be packaged into prebuilt-images. We only need
>>> to package the uEnv.txt as a "prebuilt-image" if some bundled image
>>> includes it, no need to manually add this for all images.
>> Does this mean the tisdk-base/default images will no longer include
>> the example empty uEnv.txt file?
> Specifically the wic images.  The other image formats don't include
> the boot files.

For most images, adding that example uEnv.txt file is done with this
code here in arago.conf[0]. So the wic images will still have this
file added even after this patchset, for now..

I say "for now" as I'm not a fan of how these get added to the images
unconditionally in a .conf file, vs added explicitly in the image's .bb
files. Even longer term, U-Boot is moving more towards boot script
files (boot.scr), which are more flexible and standard (uEnv.txt is
rather TI specific).

Andrew

[0] https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/d=
istro/arago.conf#n35

>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>   .../recipes-core/images/tisdk-core-bundle.inc    |  4 ----
>>>   .../packagegroup-arago-tisdk-amsdk-sdk-host.bb   | 16 -------------=
---
>>>   2 files changed, 20 deletions(-)
>>>   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-tisdk-amsdk-sdk-host.bb
>>>
>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.=
inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>> index 43b1ef5f..5f72e7b0 100644
>>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>> @@ -33,7 +33,3 @@ TARGET_IMAGES =3D "tisdk-base-image tisdk-default-i=
mage tisdk-thinlinux-image tisd
>>>
>>>   TISDK_TOOLCHAIN =3D "meta-toolchain-arago-tisdk"
>>>   TOOLCHAIN_SUFFIX =3D "-tisdk"
>>> -
>>> -IMAGE_INSTALL =3D "\
>>> -    packagegroup-arago-tisdk-amsdk-sdk-host \
>>> -"
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packageg=
roups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
>>> deleted file mode 100644
>>> index 9562310f..00000000
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-amsdk-sdk-host.bb
>>> +++ /dev/null
>>> @@ -1,16 +0,0 @@
>>> -SUMMARY =3D "Task to install additional scripts and applications int=
o the SDK"
>>> -LICENSE =3D "MIT"
>>> -PR =3D "r30"
>>> -
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> -inherit packagegroup
>>> -
>>> -EXTRA_FILES =3D ""
>>> -EXTRA_FILES:ti43x =3D "tisdk-uenv"
>>> -EXTRA_FILES:omap-a15 =3D "tisdk-uenv"
>>> -EXTRA_FILES:k3 =3D "tisdk-uenv"
>>> -
>>> -RDEPENDS:${PN} =3D "\
>>> -    ${EXTRA_FILES} \
>>> -"
>>> --
>>> 2.39.2
>>>
>>>
>>>
>>>
>>>
>>>
>>
>>
>> --
>> Jonathan Cormier
>> Senior Software Engineer
>>
>> Voice:  315.425.4045 x222
>>
>> http://www.CriticalLink.com
>> 6712 Brooklawn Parkway, Syracuse, NY 13211
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16336): https://lists.yoctoproject.org/g/meta-arag=
o/message/16336
>> Mute This Topic: https://lists.yoctoproject.org/mt/114418842/7902621
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [jcormi=
er@criticallink.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>=20
>=20


