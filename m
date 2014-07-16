Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 65D6B529DD
	for <meta-arago@arago-project.org>;
	Wed, 16 Jul 2014 15:13:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6GFDmiJ003123
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 10:13:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6GFDmEX001720
	for <meta-arago@arago-project.org>; Wed, 16 Jul 2014 10:13:48 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 16 Jul 2014 10:13:48 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/4] linux-ti-staging: update bbappend for
	3.14	version
Thread-Index: AQHPoB/2Y5IKaeU/e0OicvI5DRJBMpuiwdQggABfbID//69ZQA==
Date: Wed, 16 Jul 2014 15:13:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E3676@DFLE08.ent.ti.com>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
	<1405423715-21885-5-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6E34D4@DFLE08.ent.ti.com>
	<20140716150137.GL15788@edge>
In-Reply-To: <20140716150137.GL15788@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/4] linux-ti-staging: update bbappend for 3.14	version
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
X-List-Received-Date: Wed, 16 Jul 2014 15:13:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, July 16, 2014 10:02 AM
> To: Cooper Jr., Franklin
> Cc: Maupin, Chase; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 4/4] linux-ti-staging: update bbappend f=
or
> 3.14 version
>=20
> On Wed, Jul 16, 2014 at 02:30:56PM +0000, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > > Sent: Tuesday, July 15, 2014 6:29 AM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH 4/4] linux-ti-staging: update bbappend
> > > for 3.14 version
> > >
> > > * Update the bbappend for the linux-ti-staging to work with the
> > >   3.14 kernel version.
> > > * Set the kernel to AUTOREV while developing the latest 3.14 kernel
> > >
> > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > ---
> > >  ....12.bbappend =3D> linux-ti-staging_3.14.bbappend} |    2 ++
> > >  1 file changed, 2 insertions(+)
> > >  copy
> > > meta-arago-distro/recipes-kernel/linux/{linux-ti-staging_3.12.bbappe
> > > nd =3D> linux-ti-staging_3.14.bbappend} (94%)
> > >
> > > diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> > > staging_3.12.bbappend
> > > b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> > > staging_3.14.bbappend
> > > similarity index 94%
> > > copy from meta-arago-distro/recipes-kernel/linux/linux-ti-
> > > staging_3.12.bbappend
> > > copy to meta-arago-distro/recipes-kernel/linux/linux-ti-
> > > staging_3.14.bbappend
> > > index 2a6f090..b178b5e 100644
> > > ---
> > > a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.12.bbapp
> > > end
> > > +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.b
> > > +++ bappend
> > > @@ -6,6 +6,8 @@ require copy-defconfig.inc
> > >
> > >  KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> True).partition('+')[2][0:7]}"
> > >
> > [Franklin] PR bump missing.
>=20
> How so?
[Franklin] Sorry missed the fact that this is renaming the recipe. Its fine=
 as is.
>=20
>=20
> > > +SRCREV =3D "${AUTOREV}"
> > > +
> > >  kernel_do_configure_prepend() {
> > >      if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> > >      then
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

