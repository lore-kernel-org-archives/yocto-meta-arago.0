Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 785DD5297F
	for <meta-arago@arago-project.org>;
	Wed, 21 Jan 2015 19:03:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0LJ3scq008178
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 13:03:54 -0600
Received: from DLEE51.ent.ti.com (dlee51.ent.ti.com [157.170.170.85])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LJ3scI002877
	for <meta-arago@arago-project.org>; Wed, 21 Jan 2015 13:03:54 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE51.ent.ti.com ([fe80::240e:6c25:3382:183d%26]) with mapi id
	14.03.0224.002; Wed, 21 Jan 2015 13:03:54 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] nativesdk-qt4-tools: Add -no-pch to
	configure to fix build errors
Thread-Index: AQHQNZd49PbztQojfECU8k02G2UgxpzLT7mA//+e3dA=
Date: Wed, 21 Jan 2015 19:03:53 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7D4B72@DFLE08.ent.ti.com>
References: <1421857781-32763-1-git-send-email-fcooper@ti.com>
	<20150121185044.GC21328@edge>
In-Reply-To: <20150121185044.GC21328@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] nativesdk-qt4-tools: Add -no-pch to configure to fix build errors
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
X-List-Received-Date: Wed, 21 Jan 2015 19:03:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, January 21, 2015 12:51 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] nativesdk-qt4-tools: Add -no-pch to
> configure to fix build errors
>=20
> On Wed, Jan 21, 2015 at 10:29:41AM -0600, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * Nativesdk-qt4-tools has been failing with many errors similar to the =
ones
> >   below :
> >
> >   <long path>/stdc-predef.h:59:1: error: use -Winvalid-pch for more
> information
> >   <long path>/stdc-predef.h:59:1: fatal error:
> >                 .pch/release-static-emb-auto/QtCore: No such file or
> > directory
>=20
> I've seen this issue intermittently, but it usually goes away on a consec=
utive
> clean build.=20
[Franklin] Usually that was the case but lately even consecutive builds did=
n't resolve the issue.
Do you see the same issue with target Qt build as well, or only
> with nativesdk-tools?
[Franklin] Only nativesdk-tools. The qt4-embedded recipe already includes t=
his option.
>=20
>=20
> > * Based on http://qt-project.org/forums/viewthread/26781 and looking at
> the
> >   main Qt 4 recipe this error can be fixed by disabling pch by passing =
-no-pch
> >   to configure.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../qt4/nativesdk-qt4-tools_4.8.5.bbappend         |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
> > b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
> > index 6296fbe..8391cdd 100644
> > ---
> > a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
> > +++ b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbapp
> > +++ end
> > @@ -1,7 +1,9 @@
> > -PR_append =3D "-arago2"
> > +PR_append =3D "-arago3"
> >
> >  # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)  # For our
> > distribution purposes we only use LGPLv2.1  LICENSE =3D "LGPLv2.1"
> >
> >  DEPENDS :=3D "${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}"
> > +
> > +EXTRA_OECONF +=3D " -no-pch"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

