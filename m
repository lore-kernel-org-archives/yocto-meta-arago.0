Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 746F85209B
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2017 17:10:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v16HABUI016128
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 11:10:11 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16HA6OD002569
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 11:10:06 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 6 Feb 2017 11:10:05 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-arago] [morty/krogoth][patch] ti-tisdk-makefile: add
	am572x-idk-pru-excl-uio.dtb to linux-dtbs
Thread-Index: AQHSgJlHxzqR68Lj2UOwGQG9BP0+QaFcNkxA
Date: Mon, 6 Feb 2017 17:10:04 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926CD32DC@DLEE08.ent.ti.com>
References: <1486399437-29605-1-git-send-email-h-gou@ti.com>
	<20170206165135.GE25590@edge>
In-Reply-To: <20170206165135.GE25590@edge>
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
X-List-Received-Date: Mon, 06 Feb 2017 17:10:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looping in Sam for this question...

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, February 06, 2017 11:52 AM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/krogoth][patch] ti-tisdk-makefile: add
> am572x-idk-pru-excl-uio.dtb to linux-dtbs
>=20
> Will this fail if UIO is not enabled?
>=20
>=20
> On Mon, Feb 06, 2017 at 11:43:57AM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          =
| 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > index 8cc0758..c27bba6 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef
> > +++ ile_1.0.bb
> > @@ -50,7 +50,7 @@ SRC_URI =3D "\
> >      file://Makefile_barcode-roi \
> >  "
> >
> > -PR =3D "r77"
> > +PR =3D "r78"
> >
> >  MAKEFILES_MATRIX_GUI =3D "matrix-gui-browser \
> >                          refresh-screen \ @@ -188,7 +188,7 @@
> > KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb
> > am437x-gp-evm-hd  KERNEL_DEVICETREE_beaglebone =3D "am335x-
> bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
> >  KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> >  KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb dra7-evm-lcd-lg.dtb
> dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-lcd-
> lg.dtb dra72-evm-lcd-osd.dtb"
> > -KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb am57xx-
> beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-
> idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb"
> > +KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb am57xx-
> beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-
> idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb
> am572x-idk-pru-excl-uio.dtb"
> >  KERNEL_DEVICETREE_k2hk-evm =3D "keystone-k2hk-evm.dtb"
> >  KERNEL_DEVICETREE_k2e =3D "keystone-k2e-evm.dtb"
> >  KERNEL_DEVICETREE_k2g =3D "keystone-k2g-evm.dtb"
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

