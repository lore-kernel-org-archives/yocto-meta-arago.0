Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9BA8D529D9
	for <meta-arago@arago-project.org>;
	Tue, 16 Dec 2014 17:16:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBGHG5E7006621
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 11:16:05 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBGHG32Q029992
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 11:16:04 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 16 Dec 2014 11:16:04 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/3] ti-tisdk-makefile: Remove dual camera
	demo and make t-stat Qt 4 only
Thread-Index: AQHQGVNJlIWk+F3lnEyzH4TAlyKGepyS2WsA//+bqwA=
Date: Tue, 16 Dec 2014 17:16:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7B7619@DFLE08.ent.ti.com>
References: <1418749862-2529-1-git-send-email-fcooper@ti.com>
	<1418749862-2529-3-git-send-email-fcooper@ti.com>
	<20141216171426.GD29971@edge>
In-Reply-To: <20141216171426.GD29971@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/3] ti-tisdk-makefile: Remove dual camera demo and make t-stat Qt 4 only
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
X-List-Received-Date: Tue, 16 Dec 2014 17:16:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, December 16, 2014 11:14 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/3] ti-tisdk-makefile: Remove dual
> camera demo and make t-stat Qt 4 only
>=20
> On Tue, Dec 16, 2014 at 11:11:02AM -0600, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * Dual camera demo does not currently work on the 3.14 kernel. So disab=
le
> for
> >   now.
> > * T-stat needs to be tweaked to work again on Qt 5.4. Remove for now.
>=20
> Have you looked at what got broken with Qt 5.4? It used to work with 5.2.=
..
[Franklin] Not yet. Its on my list but I rather remove it until I have a ch=
ance to check it out.
>=20
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > index 0077223..e371307 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_
> > 1.0.bb
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef
> > +++ ile_1.0.bb
> > @@ -36,7 +36,7 @@ SRC_URI =3D "\
> >      file://Makefile_cryptodev \
> >  "
> >
> > -PR =3D "r35"
> > +PR =3D "r36"
> >
> >  MAKEFILES_COMMON =3D "linux \
> >                      matrix-gui \
> > @@ -44,7 +44,7 @@ MAKEFILES_COMMON =3D "linux \
> >                      am-sysinfo \
> >                      matrix-gui-browser \
> >                      refresh-screen \
> > -                    qt-tstat \
> > +                    ${@base_conditional('QT_PROVIDER', 'qt5', '',
> > + 'qt-tstat', d)} \
> >                      oprofile-example \  "
> >  MAKEFILES =3D ""
> > @@ -75,8 +75,6 @@ MAKEFILES_append_ti43x =3D " u-boot-spl \
> >                             ti-crypto-examples \
> >                             linux-dtbs \
> >                             wireless \
> > -                           dual-camera-demo \
> > -                           image-gallery \
> >                             cryptodev \  "
> >
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

