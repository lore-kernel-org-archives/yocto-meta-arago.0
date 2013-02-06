Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3DBF952A04
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 04:08:03 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r16481Qt017251
	for <meta-arago@arago-project.org>; Tue, 5 Feb 2013 22:08:01 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r16481xW020647
	for <meta-arago@arago-project.org>; Tue, 5 Feb 2013 22:08:01 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 5 Feb 2013 22:08:01 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new native
	x11	package name.
Thread-Index: AQHOBB2K0U7Wnq/8iE+D+9FaZ0X9U5hsNhag
Date: Wed, 6 Feb 2013 04:08:00 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C38741D@DFLE09.ent.ti.com>
References: <1360117678-4395-1-git-send-email-fcooper@ti.com>
	<1360117678-4395-2-git-send-email-fcooper@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EDB9@DLEE09.ent.ti.com>
	<20130206035242.GA1341@denix.org>
In-Reply-To: <20130206035242.GA1341@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/4] nativesdk-qt4-tools: Use new native	x11	package name.
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
X-List-Received-Date: Wed, 06 Feb 2013 04:08:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In oe-core nativesdk-qt4-tools.inc=20
DEPENDS =3D "zlib-nativesdk dbus-nativesdk libx11-nativesdk qt4-native"

So I needed to  make sure that libx11-nativesdk was filtered out because I =
was getting an build error saying nothing provided libx11-nativesdk because=
 x11 is not part of the distro feature.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, February 05, 2013 9:53 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new native=
 x11
> package name.
>=20
> On Wed, Feb 06, 2013 at 03:39:17AM +0000, Dmytriyenko, Denys wrote:
> > Didn't I push this already? I remember fixing this particular one few d=
ays
> ago...
>=20
> Ok, sorry, I didn't notice you were changing it back...
>=20
> I did change it from libx11-nativesdk to nativesdk-libx11, because that's=
 how
> BBCLASSEXTEND=3Dnativesdk calls its packages now. Why are you changing it
> back?
>=20
> --
> Denys
>=20
>=20
> > -----Original Message-----
> > From: fcooperjr27@gmail.com [fcooperjr27@gmail.com]
> > Received: Tuesday, 05 Feb 2013, 20:28
> > To: meta-arago@arago-project.org [meta-arago@arago-project.org]
> > CC: Cooper Jr., Franklin [fcooper@ti.com]
> > Subject: [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new native x=
11
> package name.
> >
> > From: Franklin S. Cooper Jr <fcooper@ti.com>
> >
> > * Nativesdk-libx11 has now been renamed to libx11-nativesdk.
> > * This ensure the x11 package is filtered out which prevents parsing/bu=
ild
> >   errors due to x11 not being a distro feature.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../qt4/nativesdk-qt4-tools_4.8.3.bbappend         |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-
> tools_4.8.3.bbappend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-
> tools_4.8.3.bbappend
> > index 6296fbe..312571e 100644
> > --- a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappe=
nd
> > +++ b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappe=
nd
> > @@ -1,7 +1,7 @@
> > -PR_append =3D "-arago2"
> > +PR_append =3D "-arago3"
> >
> >  # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
> >  # For our distribution purposes we only use LGPLv2.1
> >  LICENSE =3D "LGPLv2.1"
> >
> > -DEPENDS :=3D "${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}"
> > +DEPENDS :=3D "${@oe_filter_out('libx11-nativesdk', '${DEPENDS}', d)}"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

