Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBA7C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 18:12:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.15327.1753812753058527861
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 11:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=g+Wler/+;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56TICQMw2577697;
	Tue, 29 Jul 2025 13:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753812746;
	bh=ej4NrgOfyfLnlCr3o6eu4o2VlKu2FwwlChqCmEaqrNA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=g+Wler/+QskheVEk7giPIvVPeXVGA9M4FtbIHGSmDAfcEcTqBJj8hC349iLTSKQH4
	 K89bhxldReBMBjwi19wQF20jHscQuB9Vq9D11ocsuwenrc957IM5cOg7Aeq9qwReGy
	 OpzwzUOf9FKk7yrhet5pzawf7C9z4CqpPD+bc23E=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56TICQEH1987285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 29 Jul 2025 13:12:26 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 29
 Jul 2025 13:12:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 29 Jul 2025 13:12:26 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56TICP6a3844074;
	Tue, 29 Jul 2025 13:12:26 -0500
Message-ID: <2e329593-55e5-40b8-9158-c73f8827f91e@ti.com>
Date: Tue, 29 Jul 2025 13:12:25 -0500
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
 <efcd584f-a46e-41bf-bf08-b705dc492fc6@ti.com>
 <CADL8D3agM=aCyzOZNC8MGn5_-Gc7e38-BmW2BnCsvA1tDtnymQ@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CADL8D3agM=aCyzOZNC8MGn5_-Gc7e38-BmW2BnCsvA1tDtnymQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 56TICQMw2577697
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 18:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16340

On 7/29/25 12:57 PM, Jon Cormier wrote:
> On Tue, Jul 29, 2025 at 1:47=E2=80=AFPM Andrew Davis <afd@ti.com> wrote=
:
>>
>>
>>
>> On 7/29/25 12:26 PM, Jon Cormier wrote:
>>> On Tue, Jul 29, 2025 at 1:23=E2=80=AFPM Jon Cormier via lists.yoctopr=
oject.org
>>> <jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:
>>>>
>>>> On Mon, Jul 28, 2025 at 2:39=E2=80=AFPM Andrew Davis via
>>>> lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
>>>>>
>>>>> This recipe only now exists to add "tisdk-uenv" to tisdk-core-bundl=
e
>>>>> images so uEnv.txt can be packaged into prebuilt-images. We only ne=
ed
>>>>> to package the uEnv.txt as a "prebuilt-image" if some bundled image
>>>>> includes it, no need to manually add this for all images.
>>>> Does this mean the tisdk-base/default images will no longer include
>>>> the example empty uEnv.txt file?
>>> Specifically the wic images.  The other image formats don't include
>>> the boot files.
>>
>> For most images, adding that example uEnv.txt file is done with this
>> code here in arago.conf[0]. So the wic images will still have this
>> file added even after this patchset, for now..
>>
>> I say "for now" as I'm not a fan of how these get added to the images
>> unconditionally in a .conf file, vs added explicitly in the image's .b=
b
>> files.
> This is fair. It does make it tricky to remove the uEnv if a customer
> doesn't want it. Or if they want to replace it with their own recipe.
> Currently are forced to bbappend the ti recipe.
>> Even longer term, U-Boot is moving more towards boot script
>> files (boot.scr), which are more flexible and standard (uEnv.txt is
>> rather TI specific).
> Hmm at least for development, having the config file being text is
> pretty desirable.

boot.scr files are text, you might be getting that confused with the
binary environment files produced by "env save", usually called
<board_name>.env or similar.

The difference between uEnv.txt and boot.scr is that the latter is
run as a series of commands instead of environment variable definitions
like uEnv.txt. The commands can also set env vars just like uEnv.txt
by using 'env set xxx` commands, but also allows much more like
variable evaluation and conditional logic.

Andrew

>>
>> Andrew
>>
>> [0] https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/con=
f/distro/arago.conf#n35
>>
>>>>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>>    .../recipes-core/images/tisdk-core-bundle.inc    |  4 ----
>>>>>    .../packagegroup-arago-tisdk-amsdk-sdk-host.bb   | 16 ----------=
------
>>>>>    2 files changed, 20 deletions(-)
>>>>>    delete mode 100644 meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-amsdk-sdk-host.bb
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundl=
e.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>>>> index 43b1ef5f..5f72e7b0 100644
>>>>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>>>> @@ -33,7 +33,3 @@ TARGET_IMAGES =3D "tisdk-base-image tisdk-default=
-image tisdk-thinlinux-image tisd
>>>>>
>>>>>    TISDK_TOOLCHAIN =3D "meta-toolchain-arago-tisdk"
>>>>>    TOOLCHAIN_SUFFIX =3D "-tisdk"
>>>>> -
>>>>> -IMAGE_INSTALL =3D "\
>>>>> -    packagegroup-arago-tisdk-amsdk-sdk-host \
>>>>> -"
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packag=
egroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
>>>>> deleted file mode 100644
>>>>> index 9562310f..00000000
>>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-tisdk-amsdk-sdk-host.bb
>>>>> +++ /dev/null
>>>>> @@ -1,16 +0,0 @@
>>>>> -SUMMARY =3D "Task to install additional scripts and applications i=
nto the SDK"
>>>>> -LICENSE =3D "MIT"
>>>>> -PR =3D "r30"
>>>>> -
>>>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>> -
>>>>> -inherit packagegroup
>>>>> -
>>>>> -EXTRA_FILES =3D ""
>>>>> -EXTRA_FILES:ti43x =3D "tisdk-uenv"
>>>>> -EXTRA_FILES:omap-a15 =3D "tisdk-uenv"
>>>>> -EXTRA_FILES:k3 =3D "tisdk-uenv"
>>>>> -
>>>>> -RDEPENDS:${PN} =3D "\
>>>>> -    ${EXTRA_FILES} \
>>>>> -"
>>>>> --
>>>>> 2.39.2
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>> --
>>>> Jonathan Cormier
>>>> Senior Software Engineer
>>>>
>>>> Voice:  315.425.4045 x222
>>>>
>>>> http://www.CriticalLink.com
>>>> 6712 Brooklawn Parkway, Syracuse, NY 13211
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#16336): https://lists.yoctoproject.org/g/meta-ar=
ago/message/16336
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/114418842/7902621
>>>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [jcor=
mier@criticallink.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>>
>>>
>>>
>>
>=20
>=20


