Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE2FC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 16:10:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.35138.1698941451653191641
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 09:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=aXu5MxTO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A2GAooG025713;
	Thu, 2 Nov 2023 11:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698941450;
	bh=iGl1kV2Fn6VSkwH/46Mwl62E52eQxPyysCT4npOfNJ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aXu5MxTONuC3B2aIJoGBZW6AUNeoiaSCTmbeIWY2J4v4K3riWz33VcTcP0n9a72us
	 qgGDDEW2oynjVbIF0fA+05WLeEnYxykW54pNGUuN7ZWGESLxEwyBLMnj7JveaeMdHG
	 c5r5r0ZRY/PsQh8pLB4UYki5pKXlVvjEM9vPGKcs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A2GAolJ090407
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Nov 2023 11:10:50 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Nov 2023 11:10:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Nov 2023 11:10:50 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A2GAoa5104552;
	Thu, 2 Nov 2023 11:10:50 -0500
Message-ID: <3d6a6699-47d2-4653-aa0d-eee35cfd8286@ti.com>
Date: Thu, 2 Nov 2023 11:10:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master/kirkstone][PATCH]
 packagegroup-arago-initramfs: Add e2fsprogs-mke2fs and dosfstools
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>, <sabiya.d@mistralsolutions.com>
CC: <meta-arago@lists.yoctoproject.org>, Dasnavis Sabiya <sabiya.d@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20231101092855.101794-1-sabiya.d@ti.com>
 <20231101092855.101794-2-sabiya.d@ti.com>
 <1235f399-9ab4-42b3-ba22-e030867c273c@ti.com>
 <CAAyKsAYjtj8MR1HE=VJ40v36LjHywvSaE0qSR4t16r2BFBaWwA@mail.gmail.com>
 <cae9fd73-2287-44a2-8b08-a1a45dfc3bc1@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <cae9fd73-2287-44a2-8b08-a1a45dfc3bc1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 3A2GAooG025713
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Nov 2023 16:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14990



On 11/2/2023 7:05 AM, Chirag Shilwant wrote:
> Sabiya,
>=20
> On 02/11/23 12:26, Dasnavis Sabiya via lists.yoctoproject.org wrote:
>> Hi Ryan,
>>
>> On Wed, Nov 1, 2023 at 7:08=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wr=
ote:
>>>
>>>
>>> On 11/1/2023 4:28 AM, sabiya.d@mistralsolutions.com wrote:
>>>> From: Dasnavis Sabiya <sabiya.d@ti.com>
>>>>
>>>> Add e2fsprogs-mke2fs and dosfstools for mkfs.ext4 and mkfs.vfat
>>>
>>> Right now the only image that is using this package group is the tiny
>>> image.=C2=A0 And part of the goal of the tiny image is to remain as s=
mall as
>>> possible.
>>>
>>> The intent of the tiny image is to support the initial wakeup efforts.
>>> During this time the various hardware settings are not fully known an=
d
>>> so external memory and other things do not work.=C2=A0 The initramfs =
is meant
>>> to provide the bare minimal OS needed to fit into the on-chip SRAM to
>>> figure out those settings.=C2=A0 Once those settings are figured out,=
 we
>>> never go back to the tiny image.
>>>
>>> So what is the need for the mkfs tools in the tiny image?=C2=A0 Why n=
ot use a
>>> bigger image that has these tools in it?
>>>
>> There is a customer requirement to provide production programming
>> solution to use arago-tiny-image to partition and program
>> the boot media like eMMC. We need these utilities to format the eMMC.
>=20
>=20
> This is upstream mailing list. Please keep the TI internal jira-ids awa=
y=20
> from it.
>=20
> Regards,
> Chirag

The purpose of tiny, as stated, is to serve the wakeup efforts of=20
figuring out hardware settings for the kernel/uboot so that we can move=20
to a "real" image that has these kinds of tools.  If there is a customer=20
need, they are free to add their own layer to configure their own=20
package-groups or their own images.

We are not going to accept this patch.


>>>
>>>> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
>>>> ---
>>>> =C2=A0=C2=A0 .../packagegroups/packagegroup-arago-initramfs.bb=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9=20
>>>> +++++++++
>>>> =C2=A0=C2=A0 1 file changed, 9 insertions(+)
>>>>
>>>> diff --git=20
>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-in=
itramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-initramfs.bb
>>>> index 380cc0e3..10412784 100644
>>>> ---=20
>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-in=
itramfs.bb
>>>> +++=20
>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-in=
itramfs.bb
>>>> @@ -1,4 +1,13 @@
>>>>
>>>> =C2=A0=C2=A0 require recipes-core/packagegroups/packagegroup-core-bo=
ot.bb
>>>>
>>>> +ARAGO_FSTOOLS =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 e2fsprogs-mke2fs \
>>>> +=C2=A0=C2=A0=C2=A0 dosfstools \
>>>> +=C2=A0=C2=A0=C2=A0 "
>>>> +
>>>> =C2=A0=C2=A0 RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>>>> +
>>>> +RDEPENDS:${PN}:append =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${ARAGO_FSTOOLS} \
>>>> +=C2=A0=C2=A0=C2=A0 "
>>> --=20
>>> Ryan Eatmon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reatmon@ti.com
>>> -----------------------------------------
>>> Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>> Regards,
>> Dasnavis Sabiya
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#14987):=20
>> https://lists.yoctoproject.org/g/meta-arago/message/14987
>> Mute This Topic: https://lists.yoctoproject.org/mt/102315218/7030289
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
>> [c-shilwant@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

