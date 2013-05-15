Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 24B2252976
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 20:00:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4FK0hgp000502
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 15:00:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4FK0hl6028071
	for <meta-arago@arago-project.org>; Wed, 15 May 2013 15:00:43 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 15 May 2013 15:00:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Zhang, Hao" <hzhang@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-tisdk-matrix: remove
	ethernet menu from common apps
Thread-Index: AQHOUZtGbC6p8b62uEqvtHq+QX8tI5kG6EuAgAAA7ID//7zkUA==
Date: Wed, 15 May 2013 20:00:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C46865E@DFLE08.ent.ti.com>
References: <1368642748-30517-1-git-send-email-hzhang@ti.com>
	<20130515183733.GB20048@edge>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B6743@DLEE09.ent.ti.com>
	<20130515184459.GD20048@edge>
In-Reply-To: <20130515184459.GD20048@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-tisdk-matrix: remove ethernet menu from common apps
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
X-List-Received-Date: Wed, 15 May 2013 20:00:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looking at the script and description these apps are meant to use the secon=
d Ethernet port that only the am335x sk board exposes.=20

So his originally patch is fine.

Another possible solution is to remove matrix-gui-submenus-ethernet since m=
atrix-gui-submenus-ethernet    already RDEPENDS on that package.

This patch is missing a brief commit message explaining why this package is=
 being moved/removed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Wednesday, May 15, 2013 1:45 PM
> To: Zhang, Hao
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] packagegroup-arago-tisdk-matrix: remove
> ethernet menu from common apps
>=20
> Chase, Franklin,
>=20
> This component is coming from Sitara Apps - what is so special in Etherne=
t
> demos that they only run on ti33x? Can we make them more generic?
>=20
> --
> Denys
>=20
>=20
> On Wed, May 15, 2013 at 02:41:43PM -0400, Zhang, Hao wrote:
> > Yes, we do, but the Ethernet demo description says it's ti33x specific =
demo,
> > I tried it on KS2 evm and it's not working.
> >
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, May 15, 2013 2:38 PM
> > To: Zhang, Hao
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] packagegroup-arago-tisdk-matrix: remo=
ve
> ethernet menu from common apps
> >
> > Don't you have ethernet on Keystone?
> >
> > On Wed, May 15, 2013 at 02:32:28PM -0400, hzhang@ti.com wrote:
> > > From: Hao Zhang <hzhang@ti.com>
> > >
> > > ---
> > >  .../packagegroup-arago-tisdk-matrix.bb             |    4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-
> arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > > index dda72af..2b40f98 100755
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-
> tisdk-matrix.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-matrix.bb
> > > @@ -1,6 +1,6 @@
> > >  DESCRIPTION =3D "Task to include Matrix v2"
> > >  LICENSE =3D "MIT"
> > > -PR =3D "r15"
> > > +PR =3D "r16"
> > >
> > >  inherit packagegroup
> > >
> > > @@ -22,7 +22,6 @@ MATRIX_COMMON_APPS =3D "              \
> > >      matrix-gui-oprofile-demos       \
> > >      matrix-gui-settings-demos       \
> > >      matrix-gui-usb-demos            \
> > > -    matrix-gui-submenus-ethernet    \
> > >  "
> > >
> > >  MATRIX_QT_APPS =3D "                  \
> > > @@ -47,6 +46,7 @@ MATRIX_APPS_append_omap3 =3D "        \
> > >  "
> > >
> > >  MATRIX_APPS_append_ti33x =3D "        \
> > > +    matrix-gui-submenus-ethernet    \
> >
> > So, what about other machines besides ti33x?
> >
> >
> > >      matrix-gui-ethernet-demos       \
> > >
> ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)}
> \
> > >      matrix-gui-multimedia-demos     \
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

