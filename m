Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9AC3B52A50
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 03:54:32 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1F3sVTl025818;
	Thu, 14 Feb 2013 21:54:31 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1F3sVA4022692;
	Thu, 14 Feb 2013 21:54:31 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 14 Feb 2013 21:54:31 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "fcooperjr27@gmail.com"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use
	generic name for kernel sources
Thread-Index: AQHOCLpyChSZ+/34pkSJTs0O5/Umvph6r/iA//+cwfA=
Date: Fri, 15 Feb 2013 03:54:29 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3918EB@DFLE09.ent.ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-12-git-send-email-fcooper@ti.com>
	<20130215034205.GF9154@denix.org>
In-Reply-To: <20130215034205.GF9154@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Fri, 15 Feb 2013 03:54:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, February 14, 2013 9:42 PM
> To: fcooperjr27@gmail.com
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 12/18] arago-tisdk-amsdk-sdk-host: Use
> generic name for kernel sources
>=20
> On Mon, Feb 11, 2013 at 06:46:13PM -0600, fcooperjr27@gmail.com wrote:
> > From: Franklin S. Cooper Jr <fcooper@ti.com>
> >
> > * Use generic name for kernel sources which will allow for any machine =
to be
> >   used without modification.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    8 +++-----
> >  1 files changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-amsdk-sdk-host.bb
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-amsdk-sdk-host.bb
> > index 14626c8..b990235 100644
> > ---
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-amsdk-sdk-host.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > +++ tisdk-amsdk-sdk-host.bb
> > @@ -1,17 +1,15 @@
> >  DESCRIPTION =3D "Task to install additional scripts and applications i=
nto the
> SDK"
> >  LICENSE =3D "MIT"
> > -PR =3D "r3"
> > +PR =3D "r4"
> >
> >  inherit packagegroup
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> >  # Choose the kernel and u-boot recipe sources to use -U-BOOT_SRC =3D "=
"
> > -KERNEL_SRC =3D ""
> >
> > -U-BOOT_SRC_am335x-evm =3D "u-boot-src"
> > -KERNEL_SRC_am335x-evm =3D "linux-am335x-src"
> > +U-BOOT_SRC  =3D "u-boot-src"
> > +KERNEL_SRC :=3D "${PREFERRED_PROVIDER_virtual/kernel}-src"
>=20
> 1. Do you need to use :=3D assignment here?
No. I'll fix that.
> 2. Should we also consider using existing
> PREFERRED_PROVIDER_virtual/bootloader
> for u-boot sources here as well?
PREFERRED_PROVIDER_virtual/bootloader is a big annoyance that I struggled w=
ith. The problem is in meta-arago we define PREFERRED_PROVIDER_virtual/kern=
el for all platforms so it works well for the kernel.
Some platforms don't define that variable so it will fail for those platfor=
ms. All of our platforms use u-boot as the ${PN} so it was safe to make the=
 assumption.
>=20
> --
> Denys
>=20
> >  TOOLS =3D "pinmux-utility"
> >  TOOLS_am37x-evm_append =3D " flash-utility"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

