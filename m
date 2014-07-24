Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1E90D52A31
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:32:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIWte1028912
	for <meta-arago@arago-project.org>; Thu, 24 Jul 2014 13:32:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIWtxL008238
	for <meta-arago@arago-project.org>; Thu, 24 Jul 2014 13:32:55 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 13:32:55 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 06/11] HACK: matrix-gui: run on top of
	Wayland
Thread-Index: AQHPor0gP4TkImkQi0u8Hs7k2bXKoZuvlVyg
Date: Thu, 24 Jul 2014 18:32:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9C1D@DFLE08.ent.ti.com>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-6-git-send-email-denis@denix.org>
	<20140718191852.GP15788@edge>
In-Reply-To: <20140718191852.GP15788@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 06/11] HACK: matrix-gui: run on top of	Wayland
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
X-List-Received-Date: Thu, 24 Jul 2014 18:32:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I don't mind working on this but for now can we just have two versions of t=
his init script. Qt4 version and Qt5 version then select the version based =
on Qt provider. I don't mind working on consolidating the two but at least =
its not as much of a hack and won't break things for Qt 4 and Qt 5 users no=
w.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, July 18, 2014 3:19 PM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 06/11] HACK: matrix-gui: run on top of
> Wayland
>=20
> On Fri, Jul 18, 2014 at 02:51:57PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> This would require some cleanup - exporting additional env variables shou=
ld
> be fine, but there were some problems with -qws option and chvt, so I had=
 to
> drop them. Of course, if we want to preserve the old behavior, this would
> need to be done conditionally...
>=20
>=20
> > ---
> >  meta-arago-extras/recipes-core/matrix/matrix-gui/init   | 7 +++++--
> >  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb | 2 +-
> >  2 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> > b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> > index dab7dc6..6286028 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> > @@ -2,17 +2,20 @@
> >
> >  matrixgui=3D"/usr/bin/matrix_browser"
> >  ROTATION=3D__MATRIX_ROT__
> > -GUI_OPTS=3D"-qws $ROTATION http://localhost:80/"
> > +GUI_OPTS=3D"http://localhost:80/"
> >  PIDFILE=3D"/var/run/matrix-gui-2.0.pid"
> >
> >  test -x "$matrixgui" || exit 0
> >
> >  export TSLIB_TSDEVICE=3D/dev/input/touchscreen0
> >  export QWS_MOUSE_PROTO=3DAuto
> > +export QT_QPA_PLATFORM=3Dwayland
> > +export XDG_RUNTIME_DIR=3D/run/user/root export
> > +WAYLAND_DISPLAY=3Dwayland-0
> >
> >  case "$1" in
> >    start)
> > -    chvt 4
> > +#    chvt 4
> >
> >      # ARM9 devices get a lot of alignment trap errors with the current
> >      # version of Qt (4.7.2) that we use.  The printing of these
> > messages diff --git
> > a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > index 523cfe1..16f2eeb 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
> >
> >  SECTION =3D "multimedia"
> >
> > -PR =3D "r16"
> > +PR =3D "r17"
> >
> >  INITSCRIPT_NAME =3D "matrix-gui-2.0"
> >  INITSCRIPT_PARAMS =3D "defaults 97"
> > --
> > 2.0.0
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

