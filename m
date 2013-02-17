Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3540052A15
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 21:46:59 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1HLkwnn010236
	for <meta-arago@arago-project.org>; Sun, 17 Feb 2013 15:46:58 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1HLkwUD026617
	for <meta-arago@arago-project.org>; Sun, 17 Feb 2013 15:46:58 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Sun, 17 Feb 2013 15:46:58 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use
	generic name for kernel sources
Thread-Index: AQHOCy5vy3xZwnV6SUyouIWXc5i6EZh6roeAgAQ8UQCAAAjlAP//ocKxgABmHAD//56mww==
Date: Sun, 17 Feb 2013 21:46:57 +0000
Message-ID: <C0031326-4BF7-4844-80B6-10C6AC86221C@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-12-git-send-email-fcooper@ti.com>
	<20130215034205.GF9154@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C3918EB@DFLE09.ent.ti.com>
	<20130217203524.GA2174@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C393B7E@DFLE09.ent.ti.com>
	<5B708603-AD53-4D90-A882-7A22CF03ED95@ti.com>,
	<20130217213524.GD2174@denix.org>
In-Reply-To: <20130217213524.GD2174@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use generic name for kernel sources
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 21:46:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I meant to his comment of fixing the machines and making the solution more =
robust for the future :)

Sincerely,
Chase Maupin
On Feb 17, 2013, at 3:36 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Sun, Feb 17, 2013 at 09:29:55PM +0000, Maupin, Chase wrote:
>> +1
>=20
> Is that +1 for using this patch as is with :=3D fixed? :)
>=20
> I'm going to fix the remaining machines for now, since I'm already workin=
g on=20
> meta-ti today. BTW, some of those can be removed soon, like hawkboard and=
=20
> omap3-touchbook, as we don't support them at all.
>=20
> --=20
> Denys
>=20
>=20
>> On Feb 17, 2013, at 3:07 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wro=
te:
>>=20
>>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: Dmytriyenko, Denys
>>>> Sent: Sunday, February 17, 2013 2:35 PM
>>>> To: Cooper Jr., Franklin
>>>> Cc: Dmytriyenko, Denys; fcooperjr27@gmail.com; meta-arago@arago-
>>>> project.org
>>>> Subject: Re: [meta-arago] [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Us=
e
>>>> generic name for kernel sources
>>>>=20
>>>> On Fri, Feb 15, 2013 at 03:54:29AM +0000, Cooper Jr., Franklin wrote:
>>>>>=20
>>>>>=20
>>>>>> -----Original Message-----
>>>>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>>>>> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
>>>>>> Sent: Thursday, February 14, 2013 9:42 PM
>>>>>> To: fcooperjr27@gmail.com
>>>>>> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
>>>>>> Subject: Re: [meta-arago] [PATCH 12/18] arago-tisdk-amsdk-sdk-host:
>>>>>> Use generic name for kernel sources
>>>>>>=20
>>>>>> On Mon, Feb 11, 2013 at 06:46:13PM -0600, fcooperjr27@gmail.com
>>>> wrote:
>>>>>>> From: Franklin S. Cooper Jr <fcooper@ti.com>
>>>>>>>=20
>>>>>>> * Use generic name for kernel sources which will allow for any mach=
ine
>>>> to be
>>>>>>> used without modification.
>>>>>>>=20
>>>>>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>>>>>> ---
>>>>>>> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    8 +++-----
>>>>>>> 1 files changed, 3 insertions(+), 5 deletions(-)
>>>>>>>=20
>>>>>>> diff --git
>>>>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>>>>>>> tisd
>>>>>>> k-amsdk-sdk-host.bb
>>>>>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>>>>>>> tisd
>>>>>>> k-amsdk-sdk-host.bb
>>>>>>> index 14626c8..b990235 100644
>>>>>>> ---
>>>>>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>>>>>>> tisd
>>>>>>> k-amsdk-sdk-host.bb
>>>>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar
>>>>>>> +++ ago-
>>>>>>> +++ tisdk-amsdk-sdk-host.bb
>>>>>>> @@ -1,17 +1,15 @@
>>>>>>> DESCRIPTION =3D "Task to install additional scripts and
>>>>>>> applications into the
>>>>>> SDK"
>>>>>>> LICENSE =3D "MIT"
>>>>>>> -PR =3D "r3"
>>>>>>> +PR =3D "r4"
>>>>>>>=20
>>>>>>> inherit packagegroup
>>>>>>>=20
>>>>>>> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>>>>=20
>>>>>>> # Choose the kernel and u-boot recipe sources to use -U-BOOT_SRC =
=3D ""
>>>>>>> -KERNEL_SRC =3D ""
>>>>>>>=20
>>>>>>> -U-BOOT_SRC_am335x-evm =3D "u-boot-src"
>>>>>>> -KERNEL_SRC_am335x-evm =3D "linux-am335x-src"
>>>>>>> +U-BOOT_SRC  =3D "u-boot-src"
>>>>>>> +KERNEL_SRC :=3D "${PREFERRED_PROVIDER_virtual/kernel}-src"
>>>>>>=20
>>>>>> 1. Do you need to use :=3D assignment here?
>>>>> No. I'll fix that.
>>>>>> 2. Should we also consider using existing
>>>>>> PREFERRED_PROVIDER_virtual/bootloader
>>>>>> for u-boot sources here as well?
>>>>> PREFERRED_PROVIDER_virtual/bootloader is a big annoyance that I
>>>>> struggled with. The problem is in meta-arago we define
>>>>> PREFERRED_PROVIDER_virtual/kernel for all platforms so it works well
>>>>> for the kernel. Some platforms don't define that variable so it will
>>>>> fail for those platforms. All of our platforms use u-boot as the ${PN=
}
>>>>> so it was safe to make the assumption.
>>>>=20
>>>> I thought all our platforms in meta-ti had virtual/bootloader set - wh=
ich ones
>>>> are missing?
>>>> On the other hand, I guess we could just drop it altogether...
>>>=20
>>> Machines missing virtual/bootloader being set in machine config file:
>>> Beagleboard <-- the one that caused me problems.
>>> Beaglebone
>>> Hawkboard
>>> Keystone
>>> Omap3-touchbook
>>>=20
>>> I can add virtual/bootloader to all the missing machines in meta-ti and=
 update this recipe to use virtual/bootloader or we can use this recipe as =
is minus the :=3D change.
>>>=20
>>> I would vote for adding virtual/bootloader to all machines in meta-ti s=
ince it will future proof this recipe a bit more if someone later decides t=
o use a bootloader recipe whose ${PN} isn't u-boot.
>>>>=20
>>>> --
>>>> Denys
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>=20

