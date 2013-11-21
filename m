Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B788852986
	for <meta-arago@arago-project.org>;
	Thu, 21 Nov 2013 12:46:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rALCkhgf031749
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2013 06:46:43 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALCkhXv014576
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2013 06:46:43 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 21 Nov 2013 06:46:43 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 7/7] packagegroup-arago-tisdk-matrix: Add
	additional example application for AM43x
Thread-Index: AQHO5VFYKG3tq4ON4kW0kl7JWO/D4JovhaeAgAAcupA=
Date: Thu, 21 Nov 2013 12:46:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5BB87B@DFLE08.ent.ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
	<1384887728-8628-7-git-send-email-fcooper@ti.com>
	<20131121045508.GJ29952@edge>
In-Reply-To: <20131121045508.GJ29952@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 7/7] packagegroup-arago-tisdk-matrix: Add additional example application for AM43x
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
X-List-Received-Date: Thu, 21 Nov 2013 12:46:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, November 20, 2013 10:55 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 7/7] packagegroup-arago-tisdk-matrix: Ad=
d
> additional example application for AM43x
>=20
> On Tue, Nov 19, 2013 at 01:02:08PM -0600, Franklin S. Cooper Jr wrote:
> > * Add additional example applications for AM43x.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-matrix.bb             |    8 +++++++-
> >  1 files changed, 7 insertions(+), 1 deletions(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-matrix.bb
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-matrix.bb
> > index 95054b2..c3143d3 100644
> > ---
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-matrix.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > +++ tisdk-matrix.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to include Matrix v2"
> >  LICENSE =3D "MIT"
> > -PR =3D "r22"
> > +PR =3D "r23"
> >
> >  inherit packagegroup
> >
> > @@ -72,10 +72,16 @@ MATRIX_APPS_append_ti33x =3D "        \
> >  #    matrix-gui-wifi-direct-demo
> >
> >  MATRIX_APPS_append_ti43x =3D "        \
> > +
> > +
> ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d
> > + )} \
>=20
> So, I just noticed, that in patch #3 of this series, you add SGX libgles
> unconditionally, but here you do check for the proper MACHINE_FEATURE...
>=20
> Should it be one way or another? If you update patch #3 with conditional =
like
> here, the whole series can be pushed even prior to the new SGX in meta-ti=
...
[Franklin] The changes in patch three simply mimics what we have always bee=
n doing right or wrong for other devices. Since the entire recipe is specif=
ic to sgx we move the  conditional check to the packagegroup/image that the=
se recipes are included in. Packagegroup-arago-toolchain-tisdk-target inclu=
des packagegroup-arago-tisdk-graphics conditional based on MACHINE_FEATURE.=
 Likewise tisdk-rootfs-image includes packagegroup-arago-tisdk-graphics con=
ditional based on MACHINE_FEATURE.

As is it should still be fine but you still want it changed I can but I sho=
uld make the change for all the machines as well.

>=20
>=20
> >      matrix-multimedia-demo-aac      \
> >      matrix-multimedia-demo-h264dec  \
> >      matrix-multimedia-demo-mpeg4aacdec \
> >      matrix-multimedia-demo-mpeg4dec \
> > +                                    \
> > +    matrix-gui-generic-pm           \
> > +    matrix-gui-pm-demos-suspend     \
> > +    matrix-gui-clocks               \
> >  "
> >
> >  MATRIX_APPS_append_omap-a15 =3D "     \
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

