Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9C2EC52972
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 18:11:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7QIBg1V029386;
	Tue, 26 Aug 2014 13:11:42 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7QIBglS016569;
	Tue, 26 Aug 2014 13:11:42 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 26 Aug 2014 13:11:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-*-graphics: add weston
	packages	globally
Thread-Index: AQHPwUBBZ7wl+af9aEuO9uNQY2gvc5vi/qrAgABty4D//8JWQA==
Date: Tue, 26 Aug 2014 18:11:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C705E8F@DFLE08.ent.ti.com>
References: <1409065964-13484-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C705A61@DFLE08.ent.ti.com>
	<20140826164832.GD17427@edge>
In-Reply-To: <20140826164832.GD17427@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-*-graphics: add weston packages	globally
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
X-List-Received-Date: Tue, 26 Aug 2014 18:11:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 26, 2014 11:49 AM
> To: Cooper Jr., Franklin
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] packagegroup-*-graphics: add weston
> packages globally
>=20
> On Tue, Aug 26, 2014 at 03:16:49PM +0000, Cooper Jr., Franklin wrote:
> > Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> >
> > FYI I made a similar change locally and Mesa (mesa-gl I think) was
> > getting pulled in when building am57x-evm for some reason.
>=20
> I'm testing a fix for that.
>=20
>=20
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > Sent: Tuesday, August 26, 2014 10:13 AM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH] packagegroup-*-graphics: add weston
> > > packages globally
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > As long as Weston compositor runs on top of either DRM or fbdev,
> > > should not depend on SGX libs
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../packagegroups/packagegroup-arago-tisdk-graphics.bb        | 11
> ++++++--
> > > ---
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > arago-tisdk-graphics.bb b/meta-arago-distro/recipes-
> > > core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> > > index 1439638..d730799 100644
> > > ---
> > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > > tisdk-graphics.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > arago-ti
> > > +++ sdk-graphics.bb
> > > @@ -1,6 +1,6 @@
> > >  DESCRIPTION =3D "Task to install graphics binaries"
> > >  LICENSE =3D "MIT"
> > > -PR =3D "r5"
> > > +PR =3D "r6"
> > >
> > >  inherit packagegroup
> > >
> > > @@ -16,15 +16,16 @@ GRAPHICS_SDK =3D "\
> > >      omap3-sgx-modules \
> > >  "
> > >
> > > -GRAPHICS_RDEPENDS =3D ""
> > > -
> > > -GRAPHICS_RDEPENDS_ti33x =3D "\
> > > -    ${GRAPHICS_SDK} \
> > > +GRAPHICS_RDEPENDS =3D "\
> > >      weston \
> > >      weston-init \
> > >      weston-examples \
> > >  "
> > >
> > > +GRAPHICS_RDEPENDS_ti33x =3D "\
> > > +    ${GRAPHICS_SDK} \
> > > +"
> > > +
[Franklin] ^ shouldn't this be something like GRAPHICS_RDEPENDS_append_ti33=
x? Same thing for ti43x and omap-a15
> > >  GRAPHICS_RDEPENDS_ti43x =3D "\
> > >      ${GRAPHICS_SDK} \
> > >  "
> > > --
> > > 2.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

