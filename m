Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E8AF652A75
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 16:25:59 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MGPxet012484
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 11:25:59 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MGPxRh025682
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 11:25:59 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 22 Aug 2012 11:25:58 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] qt4-embedded build issue
Thread-Index: Ac2ADEg+W+tvtyGUTzGun262X7eyzAAnyjuA//+uvLU=
Date: Wed, 22 Aug 2012 16:25:58 +0000
Message-ID: <E7F12388-2736-4202-984F-B55D82CE1769@ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C2A7E8F@DFLE09.ent.ti.com>,
	<20120822161648.GB21025@edge>
In-Reply-To: <20120822161648.GB21025@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: qt4-embedded build issue
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
X-List-Received-Date: Wed, 22 Aug 2012 16:26:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ahh yeah I added the usually thumb option on my setup. I believe I added it=
 via the CFLAGS in EXTRA_OEMAKE

On Aug 22, 2012, at 11:16 AM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Wed, Aug 22, 2012 at 02:17:29AM +0000, Cooper Jr., Franklin wrote:
>> Bitbaking qt4-embedded seems to build correctly but resulted in many lib=
raries not being built and a lot of broken sym links.  Looking into the do_=
compile.log I realized that for libQtGuiE I received this error:
>>=20
>> /home/franklin/toolchain/gcc-linaro-arm-linux-gnueabi-2012.03-20120326_l=
inux/bin/../lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/b=
in/ld: .obj/release-shared-emb-arm/qgrayraster.o: relocation R_ARM_THM_MOVW=
_ABS_NC against `a local symbol' can not be used when making a shared objec=
t; recompile with -fPIC
>> .obj/release-shared-emb-arm/qgrayraster.o: could not read symbols: Bad v=
alue
>> collect2: ld returned 1 exit status
>> make[1]: [../../lib/libQtGuiE.so.4.8.0] Error 1 (ignored)
>>=20
>> QtGuiE is needed by several other libraries which is why a lot of the ot=
her libraries were not being built. Based on the suggestion of the error an=
d posts such as this http://industriousone.com/topic/issue-placement-fpic-l=
inux I tried to add -fPIC to either CFLAGS or CXXFLAGS. But then I receive =
an error saying PIC was an invalid option. It seems that fPIC was an option=
 for older versions of gcc but the external linaro toolchain being used doe=
sn't contain this option. Any suggestions on how to fix this?
>>=20
>> FYI building qt4embedded using the built in toolchain doesn't experience=
 this issue.
>=20
> Strangely, my build of qt4-embedded simply fails with very descriptive=20
> and now familiar error:
>=20
> | {standard input}: Assembler messages:
> | {standard input}:49: Error: Thumb does not support negative register in=
dexing -- `ldrb r0,[r4,-r12]'
> | {standard input}:104: Error: thumb conditional instruction should be in=
 IT block -- `vmuleq.f32 s5,s26,s2'
> | {standard input}:105: Error: thumb conditional instruction should be in=
 IT block -- `vdiveq.f32 s5,s5,s3'
> | {standard input}:106: Error: thumb conditional instruction should be in=
 IT block -- `vdivne.f32 s5,s2,s3'
> | {standard input}:115: Error: thumb conditional instruction should be in=
 IT block -- `vdiveq.f32 s5,s2,s3'
>=20
> --=20
> Denys

