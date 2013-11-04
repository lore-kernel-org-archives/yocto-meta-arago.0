Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9454452972
	for <meta-arago@arago-project.org>;
	Mon,  4 Nov 2013 16:43:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA4GhXBk000423;
	Mon, 4 Nov 2013 10:43:33 -0600
Received: from DFLE73.ent.ti.com ([128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA4GhXa7032483;
	Mon, 4 Nov 2013 10:43:33 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 4 Nov 2013 10:43:33 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Vanderpool Josh
	<Joshua.Vanderpool@raymondcorp.com>
Thread-Topic: [meta-arago] wpa-supplicant failure
Thread-Index: Ac7ZeIHx2OirDY54TVWg/k9zV6EWzwANdGiAAAyIlGA=
Date: Mon, 4 Nov 2013 16:43:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C591028@DFLE08.ent.ti.com>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA0132E@USNYGRMBX4.raymondcorp.local>
	<20131104163639.GR24696@edge>
In-Reply-To: <20131104163639.GR24696@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: wpa-supplicant failure
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
X-List-Received-Date: Mon, 04 Nov 2013 16:43:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Wifi/Wilink 6 doesn't currently work with a newer kernel.

Josh,

The branding  for amsdk is really only useful if you're interested in the 3=
.2 kernel which is the last productized kernel for am335x. I would recommen=
d using amsdk/amsdk-06.00.00.00-config.txt when using oe-layersetup for rig=
ht now if you're interested in using Wilink 6/8. There are a few things bro=
ken while am335x is switching to the newer 3.12 kernel but things will be g=
etting better of the next few months and will be the next productized kerne=
l for am335x.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, November 04, 2013 10:37 AM
> To: Vanderpool Josh
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] wpa-supplicant failure
>=20
> On Mon, Nov 04, 2013 at 04:11:41PM +0000, Vanderpool Josh wrote:
> > I am using the instructions from http://arago-
> project.org/wiki/index.php/Setting_Up_Build_Environment
> > And using the branding-amsdk.inc with some items added from the
>=20
> Any specific reason for branding-amsdk?
>=20
>=20
> > arago-prefs.inc to include qt5 and the wifi items.
>=20
> http://arago-project.org/git/?p=3Dmeta-
> arago.git;a=3Dcommitdiff;h=3Decc685fdbb24a30a6956ddd9463a68d80304f291
>=20
> --
> Denys
>=20
>=20
> > Build Configuration:
> > BB_VERSION        =3D "1.18.0"
> > BUILD_SYS         =3D "x86_64-linux"
> > NATIVELSBSTRING   =3D "Ubuntu-12.04"
> > TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> > MACHINE           =3D "am335x-evm"
> > DISTRO            =3D "arago"
> > DISTRO_VERSION    =3D "2013.10"
> > TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortex=
a8"
> > TARGET_FPU        =3D "vfp-neon"
> > meta-arago-distro
> > meta-arago-extras =3D
> "master:370c6ed8e738eb3066160f133897a14eb3af1955"
> > meta-qt5          =3D "master:a6753fa646f714bd0a794d270bd77e951d8204ac"
> > toolchain-layer
> > meta-networking
> > meta-ruby
> > meta-oe           =3D "dylan:a108b2203a997634f87ac687e81712badaf3c546"
> > meta-ti           =3D "dylan:7e054d1277cfe3b8d59725930cd42177cef1d9f0"
> > meta-linaro-toolchain =3D
> "dylan:c9f78d6eff14ada3f2bc960e81883b27a10afecc"
> > meta              =3D "dylan:3549f5f203363302256848bb33c05c4fd4871948"
> >
> >
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | ../src/drivers/driver_nl80211.c:19:31: fatal error: netlink/genl/genl=
.h: No
> such file or directory
> > | compilation terminated.
> > | make: *** [../src/drivers/driver_nl80211.o] Error 1
> > | ERROR: Function failed: do_compile (see /home/joshua/tisdk/build/arag=
o-
> tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-3.2-oe-linux-
> gnueabi/wpa-supplicant/r5.sp4.01-
> r6b+gitrAUTOINC+7190ff7dbd43243290b626068ded0d61c5019050-
> arago0/temp/log.do_compile.33324 for further information)
> > ERROR: Task 1257 (/home/joshua/tisdk/sources/meta-arago/meta-arago-
> extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_r5.sp4.01.bb,
> do_compile) failed with exit code '1'
> >
> > Josh Vanderpool
> > Electrical Engineer
> > Control Systems
> > ________________________________
> > The Raymond Corporation
> > 20 South Canal Street
> > Greene, New York 13778-0130
> > Phone: 607-656-2617
> > Fax: 607-656-4845
> >
> joshua.vanderpool@raymondcorp.com<mailto:joshua.vanderpool@raymondc
> orp.com>
> > http://www.raymondcorp.com<http://www.raymondcorp.com/>
> >
> >
> >
> > Confidentiality Notice:
> >
> > The preceding e-mail message (including any attachments) contains
> information that may be confidential, protected by applicable legal privi=
leges, or
> constitute non-public information. It is intended to be conveyed only to =
the
> designated recipient(s). If you are not an intended recipient of this mes=
sage,
> please notify the sender by replying to this message and then delete it f=
rom your
> system. Use, dissemination, distribution or reproduction of this message =
by
> unintended recipients is
> > not authorized and may be unlawful.
> >
> >
>=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

