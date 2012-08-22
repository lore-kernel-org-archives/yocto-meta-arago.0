Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5188F52AB3
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 23:13:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MNDeRN013334
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 18:13:40 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MNDecx003484
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 18:13:40 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 22 Aug 2012 18:13:38 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [meta-arago-extras][PATCH] av-examples: Port
	av-examples from Arago
Thread-Index: AQHNgGzqk+EPZ9QJNkWz0qh+1nwNv5dmt2KA//+xyi2AAAAroIAAVo6A//+sU9CAAFbhgP//s5KB
Date: Wed, 22 Aug 2012 23:13:37 +0000
Message-ID: <4CE7533F-B913-47F4-B690-6F24238BD9BE@ti.com>
References: <1345644077-4568-1-git-send-email-fcooper@ti.com>
	<20120822220515.GB8846@denix.org>
	<92A683A2-B3B9-4146-8FC0-5CFC1B0569CE@ti.com>
	<03DB3D5A7C754F418CE076FD17499F235D1A0A7D@DLEE12.ent.ti.com>
	<20120822223543.GJ21025@edge>
	<03DB3D5A7C754F418CE076FD17499F235D1A0AC1@DLEE12.ent.ti.com>,
	<6163682C-AD46-4187-AB3F-3DCAE0B09685@ti.com>
In-Reply-To: <6163682C-AD46-4187-AB3F-3DCAE0B09685@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Prakash,
	Punya" <pprakash@ti.com>
Subject: Re: [meta-arago-extras][PATCH] av-examples: Port av-examples from Arago
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
X-List-Received-Date: Wed, 22 Aug 2012 23:13:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

I talked to Punya and now I have a better understanding what examples this =
repo contains. Can u send a patch that changes the compatible machine to ju=
st omap3?

I will rename the recipe and repo whenever a better name is found once I am=
 back in town.

On Aug 22, 2012, at 5:55 PM, "Cooper Jr., Franklin" <fcooper@ti.com> wrote:

> Maybe dss-examples would be a better name for the recipe and git repo.
>=20
> Are all the examples using the dss or are only some?
>=20
> On Aug 22, 2012, at 5:42 PM, "Prakash, Punya" <pprakash@ti.com> wrote:
>=20
>> I should have probably mentioned that the recipe also includes audio exa=
mples such as audio capture and playback. Av-examples could be misleading s=
ince it can imply multimedia while this is only demonstrating omap3 hardwar=
e features.
>>=20
>> I agree about the generic omap3 SoC.
>>=20
>> Regards,
>> Punya
>>=20
>>=20
>> -----Original Message-----
>> From: Dmytriyenko, Denys=20
>> Sent: Wednesday, August 22, 2012 5:36 PM
>> To: Prakash, Punya
>> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [meta-arago-extras][PATCH] av-examples: Port a=
v-examples from Arago
>>=20
>> On Wed, Aug 22, 2012 at 06:32:24PM -0400, Prakash, Punya wrote:
>>> These examples demonstrate features of the display sub-system - such as=
=20
>>> rotation, color keying et. all. The DSS is supported on AM37x and AM351=
7=20
>>> based platforms only. I do not see why this cannot be added to the=20
>>> Beagleboard, adding it to the SDK is a different discussion.
>>=20
>> Punya,
>>=20
>> I see. Calling them av-examples is slightly misleading then, but that ex=
plains=20
>> the filtering. I guess a more generic "omap3" SoC should be used instead=
 of=20
>> listing every machine in COMAPTIBLE_MACHINES...
>>=20
>> --=20
>> Denys
>>=20
>>> -----Original Message-----
>>> From: Cooper Jr., Franklin=20
>>> Sent: Wednesday, August 22, 2012 5:25 PM
>>> To: Dmytriyenko, Denys
>>> Cc: meta-arago@arago-project.org; Prakash, Punya
>>> Subject: Re: [meta-arago] [meta-arago-extras][PATCH] av-examples: Port =
av-examples from Arago
>>>=20
>>> I believe so. We only include it in those devices SDKs for a reason but=
 I am not sure why it is. Seeing MACHINE being passed to make also make me =
believe its specific to those devices. I know I tried building it for 335x =
and received a bunch of errors.
>>>=20
>>> Punya,
>>> Can you verify that these examples are only for am37 and am35? Is there=
 a reason why beagleboard couldn't be supported? Or will the code run on al=
l of our devices?=20
>>>=20
>>> We can restrict which devices include this app in our SDK but shouldn't=
 exclude other devices from running this app unless there is a reason.
>>>=20
>>> On Aug 22, 2012, at 5:05 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>>>=20
>>>> On Wed, Aug 22, 2012 at 09:01:17AM -0500, Franklin S Cooper Jr wrote:
>>>>> * Add av-examples from Arago
>>>>> * Convert svn repository to git. Update makefiles to create
>>>>> needed directories since git doesn't allow empty directories
>>>>> to be stored.
>>>>>=20
>>>>> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
>>>>> ---
>>>>> .../av-examples/av-examples_1.0.bb                 |   33 +++++++++++=
+++++++++
>>>>> 1 files changed, 33 insertions(+), 0 deletions(-)
>>>>> create mode 100644 meta-arago-extras/recipes-multimedia/av-examples/a=
v-examples_1.0.bb
>>>>>=20
>>>>> diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-exam=
ples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_=
1.0.bb
>>>>> new file mode 100644
>>>>> index 0000000..1025f96
>>>>> --- /dev/null
>>>>> +++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.=
0.bb
>>>>> @@ -0,0 +1,33 @@
>>>>> +DESCRIPTION =3D "Linux Audio Video Example Applications"
>>>>> +HOMEPAGE =3D "https://gforge.ti.com/gf/project/av_examples/"
>>>>> +LICENSE =3D "BSD"
>>>>> +LIC_FILES_CHKSUM :=3D "file://COPYING;md5=3D80ea1ff5788f65d5c5b3206d=
50d4bc6c"
>>>>> +SECTION =3D "system"
>>>>> +PRIORITY =3D "optional"
>>>>> +
>>>>> +PR =3D "r0"
>>>>> +
>>>>> +DEPENDS +=3D "virtual/kernel"
>>>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>> +
>>>>> +COMPATIBLE_MACHINE =3D "(am37x-evm|am3517-evm)"
>>>>=20
>>>> We need to relax our filters for compatible machines. Those are Audio/=
Video=20
>>>> examples - are they really machine specific?
>>>>=20
>>>> --=20
>>>> Denys
>>>>=20
>>>>=20
>>>>> +BRANCH ?=3D "master"
>>>>> +SRCREV =3D "ac75d09d29a805d89c49dd2741b79f3069e97827"
>>>>> +
>>>>> +SRC_URI =3D "git://gitorious.org/av_examples/av_examples.git;protoco=
l=3Dgit;branch=3D${BRANCH}"
>>>>> +
>>>>> +S =3D "${WORKDIR}/git"
>>>>> +
>>>>> +# TODO: Export LDFLAGS from Rules.make to eliminate use of INSANE_SK=
IP which would otherwise lead to discrepancies between host and arago binar=
ies
>>>>> +INSANE_SKIP_${PN} =3D "True"
>>>>> +
>>>>> +do_compile() {
>>>>> +    touch debug
>>>>> +    export CROSS_COMPILE=3D${TARGET_PREFIX}
>>>>> +    make release LINUXKERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}" P=
LATFORM=3D"${MACHINE}"
>>>>> +}
>>>>> +
>>>>> +do_install() {
>>>>> +    make DESTDIR=3D${D} install
>>>>> +}
>>>>> --=20
>>>>> 1.7.0.4
>>>>>=20
>>>>> _______________________________________________
>>>>> meta-arago mailing list
>>>>> meta-arago@arago-project.org
>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>>>=20

