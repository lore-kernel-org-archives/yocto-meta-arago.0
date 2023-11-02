Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5568FC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 16:21:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.35880.1698942075161538807
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 09:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=EmN6omg2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A2GLEbS027943;
	Thu, 2 Nov 2023 11:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698942074;
	bh=uHoHyTXBpo2ZjxPeRsq0AAofQa4OfFNFlvPD0ojGEF0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EmN6omg2y5zO9+CR8ol1mRug3eDlw58cvkfWeR8q9cppFdKwCmuLBxMo+v4j3ke8P
	 fiUNGn/e8x+WdT7j3pnFxVwUR0nMXg1Z8tcBH23OJI2ojEp+pbmzEq6/Lt/VRFBcyA
	 IQEuYIz9idL7UyOBH94Qf+Ir8CYadHBNdEr9U+cA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A2GLECZ127182
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Nov 2023 11:21:14 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Nov 2023 11:21:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Nov 2023 11:21:14 -0500
Received: from [10.250.32.70] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A2GLDk0030334;
	Thu, 2 Nov 2023 11:21:13 -0500
Message-ID: <1932776e-f481-4bab-bc56-2e9fd1560802@ti.com>
Date: Thu, 2 Nov 2023 11:21:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH]
 packagegroup-arago-initramfs: Add e2fsprogs-mke2fs and dosfstools
Content-Language: en-US
To: <reatmon@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        <sabiya.d@mistralsolutions.com>
CC: <meta-arago@lists.yoctoproject.org>, Dasnavis Sabiya <sabiya.d@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20231101092855.101794-1-sabiya.d@ti.com>
 <20231101092855.101794-2-sabiya.d@ti.com>
 <1235f399-9ab4-42b3-ba22-e030867c273c@ti.com>
 <CAAyKsAYjtj8MR1HE=VJ40v36LjHywvSaE0qSR4t16r2BFBaWwA@mail.gmail.com>
 <cae9fd73-2287-44a2-8b08-a1a45dfc3bc1@ti.com>
 <3d6a6699-47d2-4653-aa0d-eee35cfd8286@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <3d6a6699-47d2-4653-aa0d-eee35cfd8286@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 3A2GLEbS027943
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Nov 2023 16:21:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14991

On 11/2/23 11:10 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 11/2/2023 7:05 AM, Chirag Shilwant wrote:
>> Sabiya,
>>
>> On 02/11/23 12:26, Dasnavis Sabiya via lists.yoctoproject.org wrote:
>>> Hi Ryan,
>>>
>>> On Wed, Nov 1, 2023 at 7:08=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> w=
rote:
>>>>
>>>>
>>>> On 11/1/2023 4:28 AM, sabiya.d@mistralsolutions.com wrote:
>>>>> From: Dasnavis Sabiya <sabiya.d@ti.com>
>>>>>
>>>>> Add e2fsprogs-mke2fs and dosfstools for mkfs.ext4 and mkfs.vfat
>>>>
>>>> Right now the only image that is using this package group is the tin=
y
>>>> image.=C2=A0 And part of the goal of the tiny image is to remain as =
small as
>>>> possible.
>>>>
>>>> The intent of the tiny image is to support the initial wakeup effort=
s.
>>>> During this time the various hardware settings are not fully known a=
nd
>>>> so external memory and other things do not work.=C2=A0 The initramfs=
 is meant
>>>> to provide the bare minimal OS needed to fit into the on-chip SRAM t=
o
>>>> figure out those settings.=C2=A0 Once those settings are figured out=
, we
>>>> never go back to the tiny image.
>>>>
>>>> So what is the need for the mkfs tools in the tiny image?=C2=A0 Why =
not use a
>>>> bigger image that has these tools in it?
>>>>
>>> There is a customer requirement to provide production programming
>>> solution to use arago-tiny-image to partition and program
>>> the boot media like eMMC. We need these utilities to format the eMMC.
>>
>>
>> This is upstream mailing list. Please keep the TI internal jira-ids aw=
ay from it.
>>
>> Regards,
>> Chirag
>=20
> The purpose of tiny, as stated, is to serve the wakeup efforts of figur=
ing out hardware settings for the kernel/uboot so that we can move to a "=
real" image that has these kinds of tools.=C2=A0 If there is a customer n=
eed, they are free to add their own layer to configure their own package-=
groups or their own images.
>=20
> We are not going to accept this patch.
>=20
>=20

Also if a customer wants to flash their board we usually recommend doing
that from U-Boot[0]. Which can be easily network/DFU/JTAG booted and alre=
ady
can create partitions and flash filesystem images. Booting all the way
into some minimal Linux and manually creating the filesystem during a
flashing/production flow sounds flawed to begin with so we shouldn't
encourage it with an image like this.

Andrew

[0] https://www.ti.com/lit/an/spracy5/spracy5.pdf

>>>>
>>>>> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 .../packagegroups/packagegroup-arago-initramfs.bb=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
>>>>> =C2=A0=C2=A0 1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-arago-initramfs.bb
>>>>> index 380cc0e3..10412784 100644
>>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-initramfs.bb
>>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-initramfs.bb
>>>>> @@ -1,4 +1,13 @@
>>>>>
>>>>> =C2=A0=C2=A0 require recipes-core/packagegroups/packagegroup-core-b=
oot.bb
>>>>>
>>>>> +ARAGO_FSTOOLS =3D "\
>>>>> +=C2=A0=C2=A0=C2=A0 e2fsprogs-mke2fs \
>>>>> +=C2=A0=C2=A0=C2=A0 dosfstools \
>>>>> +=C2=A0=C2=A0=C2=A0 "
>>>>> +
>>>>> =C2=A0=C2=A0 RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>>>>> +
>>>>> +RDEPENDS:${PN}:append =3D "\
>>>>> +=C2=A0=C2=A0=C2=A0 ${ARAGO_FSTOOLS} \
>>>>> +=C2=A0=C2=A0=C2=A0 "
>>>> --=20
>>>> Ryan Eatmon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reatmon@ti.com
>>>> -----------------------------------------
>>>> Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>>> Regards,
>>> Dasnavis Sabiya
>>>
>>>
>>>
>>>
>>>
>=20

