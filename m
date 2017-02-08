Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1EE5352A85
	for <meta-arago@arago-project.org>;
	Wed,  8 Feb 2017 20:25:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v18KPVgT001581
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 14:25:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v18KPQLY013614
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 14:25:26 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Wed, 8 Feb 2017 14:25:25 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/krogoth][patch] ti-tisdk-makefile: add
	am572x-idk-pru-excl-uio.dtb to linux-dtbs
Thread-Index: AQHSgJlM4HlhyqTggUGonwCNzoQ78KFcmxkAgALu5dCAAGaYgP//n+NQ
Date: Wed, 8 Feb 2017 20:25:25 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905854EA47@DLEE11.ent.ti.com>
References: <1486399437-29605-1-git-send-email-h-gou@ti.com>
	<20170206165135.GE25590@edge>
	<2E957F12D11D904590FA9AF86D366BD926CD32DC@DLEE08.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F4905854E974@DLEE11.ent.ti.com>
	<20170208200449.GA2612@edge>
In-Reply-To: <20170208200449.GA2612@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/krogoth][patch] ti-tisdk-makefile: add am572x-idk-pru-excl-uio.dtb to linux-dtbs
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
X-List-Received-Date: Wed, 08 Feb 2017 20:25:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok. I misunderstood.
Yes. It makes sense make this addition in makefile conditional with ENABLE_=
TI_UIO_DEVICES.

Hongmei,
See reference in=20
meta-ti/recipes-kernel/linux/ti-uio.inc

KERNEL_DEVICETREE_append_am57xx-evm =3D "${@base_conditional("ENABLE_TI_UIO=
_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb", "", d)}"


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 08, 2017 3:05 PM
> To: Nelson, Sam
> Cc: Gou, Hongmei; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/krogoth][patch] ti-tisdk-makefile: add
> am572x-idk-pru-excl-uio.dtb to linux-dtbs
>=20
> Right, but my point was that the corresponding dtb will not even be insta=
lled
> when uio is not enabled with ENABLE_TI_UIO_DEVICES
>=20
>=20
> On Wed, Feb 08, 2017 at 03:00:09PM -0500, Nelson, Sam wrote:
> > My understanding is just the device tree source compilation should NOT
> depend on the UIO enabled in kernel.
> > So I don't expect it to fail.
> >
> > > -----Original Message-----
> > > From: Gou, Hongmei
> > > Sent: Monday, February 06, 2017 12:10 PM
> > > To: Dmytriyenko, Denys; Nelson, Sam
> > > Cc: meta-arago@arago-project.org
> > > Subject: RE: [meta-arago] [morty/krogoth][patch] ti-tisdk-makefile: a=
dd
> > > am572x-idk-pru-excl-uio.dtb to linux-dtbs
> > >
> > > Looping in Sam for this question...
> > >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Monday, February 06, 2017 11:52 AM
> > > > To: Gou, Hongmei
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [morty/krogoth][patch] ti-tisdk-makefile:
> > > > add am572x-idk-pru-excl-uio.dtb to linux-dtbs
> > > >
> > > > Will this fail if UIO is not enabled?
> > > >
> > > >
> > > > On Mon, Feb 06, 2017 at 11:43:57AM -0500, Hongmei Gou wrote:
> > > > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > > > ---
> > > > >  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb    =
      | 4 ++-
> -
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git
> > > > > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-make=
fil
> > > > > e_
> > > > > 1.0.bb
> > > > > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-make=
fil
> > > > > e_
> > > > > 1.0.bb
> > > > > index 8cc0758..c27bba6 100644
> > > > > ---
> > > > > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-make=
fil
> > > > > e_
> > > > > 1.0.bb
> > > > > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-=
mak
> > > > > +++ ef
> > > > > +++ ile_1.0.bb
> > > > > @@ -50,7 +50,7 @@ SRC_URI =3D "\
> > > > >      file://Makefile_barcode-roi \
> > > > >  "
> > > > >
> > > > > -PR =3D "r77"
> > > > > +PR =3D "r78"
> > > > >
> > > > >  MAKEFILES_MATRIX_GUI =3D "matrix-gui-browser \
> > > > >                          refresh-screen \ @@ -188,7 +188,7 @@
> > > > > KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-
> evm.dtb
> > > > > am437x-gp-evm-hd  KERNEL_DEVICETREE_beaglebone =3D "am335x-
> > > > bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
> > > > >  KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> > > > >  KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb dra7-evm-lcd-
> lg.dtb
> > > > dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-
> lcd-
> > > > lg.dtb dra72-evm-lcd-osd.dtb"
> > > > > -KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb
> am57xx-
> > > > beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-
> > > > idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-
> osd.dtb"
> > > > > +KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb
> am57xx-
> > > > beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-
> > > > idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dt=
b
> > > > am572x-idk-pru-excl-uio.dtb"
> > > > >  KERNEL_DEVICETREE_k2hk-evm =3D "keystone-k2hk-evm.dtb"
> > > > >  KERNEL_DEVICETREE_k2e =3D "keystone-k2e-evm.dtb"
> > > > >  KERNEL_DEVICETREE_k2g =3D "keystone-k2g-evm.dtb"
> > > > > --
> > > > > 1.9.1
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

