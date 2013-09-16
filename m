Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id AE84952990
	for <meta-arago@arago-project.org>;
	Mon, 16 Sep 2013 20:05:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8GK5ltg021749;
	Mon, 16 Sep 2013 15:05:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8GK5lfb001398;
	Mon, 16 Sep 2013 15:05:47 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 16 Sep 2013 15:05:47 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-ti] [PATCH] ti-pru-sw-edma-driver: let
	module.bbclass package modules automatically
Thread-Index: AQHOr169NmbGmsERu0m5zT+kvP0/yZnIxkeQgABacID//6/CoA==
Date: Mon, 16 Sep 2013 20:05:46 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C552673@DFLE08.ent.ti.com>
References: <1378952413-6388-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C5525D9@DFLE08.ent.ti.com>
	<20130916194913.GB19671@edge>
In-Reply-To: <20130916194913.GB19671@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-ti] [PATCH] ti-pru-sw-edma-driver: let module.bbclass package modules automatically
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
X-List-Received-Date: Mon, 16 Sep 2013 20:05:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, September 16, 2013 2:49 PM
> To: Cooper Jr., Franklin
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-ti] [PATCH] ti-pru-sw-edma-driver: let
> module.bbclass package modules automatically
>=20
> I thought that was already done. There's RDEPENDS on ti-ocf-crypto-module=
 in
> crypto packagegroup and ti-pru-sw-examples RDEPENDS on ti-pru-sw-edma-
> driver.
[Franklin] Ok I was confused by the commit message. I thought it meant a ne=
w package was being generated which would require some additional changes.
>=20
> --
> Denys
>=20
>=20
> On Mon, Sep 16, 2013 at 07:39:32PM +0000, Cooper Jr., Franklin wrote:
> > Base on this patch and a similar patch for ocf-crypto-module are their
> > patches that need to be added in meta-arago to make sure the kernel mod=
ules
> > are included in the file system?
> >
> > > -----Original Message-----
> > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > > Sent: Wednesday, September 11, 2013 9:20 PM
> > > To: meta-ti@yoctoproject.org
> > > Subject: [meta-ti] [PATCH] ti-pru-sw-edma-driver: let module.bbclass
> package
> > > modules automatically
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > The new method is to automatically package modules into kernel-module=
-
> > > <modname> and make the custom name depend on the standard unified
> one.
> > > Messing with FILES_${PN} usually causes problems, so avoid it and let
> > > module.bbclass do it's magic.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recip=
es-
> > > bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> > > index c7fdfd1..1a418d7 100644
> > > --- a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> > > +++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
> > > @@ -7,7 +7,7 @@ COMPATIBLE_MACHINE =3D "omapl138"
> > >
> > >  INHIBIT_PACKAGE_STRIP =3D "1"
> > >
> > > -MACHINE_KERNEL_PR_append =3D "a+svnr${SRCPV}"
> > > +MACHINE_KERNEL_PR_append =3D "b+svnr${SRCPV}"
> > >  PR =3D "${MACHINE_KERNEL_PR}"
> > >
> > >  SRC_URI =3D
> > >
> "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;protocol=3Dhttps;user=3Da=
nonym
> > > ous;pswd=3D''"
> > > @@ -28,5 +28,3 @@ do_install () {
> > >          install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers=
/pru
> > >          install -m 0755 ${S}/edmautils.ko
> > > ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/
> > >  }
> > > -
> > > -FILES_${PN} =3D
> > > "/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/edmautils.ko"
> > > --
> > > 1.8.3.2
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

