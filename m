Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7A014529D5
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 14:14:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EEEe6o025316
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 09:14:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EEEes8003091
	for <meta-arago@arago-project.org>; Thu, 14 Aug 2014 09:14:40 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 14 Aug 2014 09:14:40 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] qtwayland - update to 5.4 branch
Thread-Index: AQHPt8f/NKUCnQVzsEq8JL8eVNtpxJvQdO0A//+va+A=
Date: Thu, 14 Aug 2014 14:14:39 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6FB695@DFLE08.ent.ti.com>
References: <1408024773-17838-1-git-send-email-j-stiffler@ti.com>
	<20140814140207.GV23523@edge>
In-Reply-To: <20140814140207.GV23523@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] qtwayland - update to 5.4 branch
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
X-List-Received-Date: Thu, 14 Aug 2014 14:14:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

Although it would be nice to see if we can set QT_MODULE_BRANCH to HEAD. Th=
at should always point to the latest branch I'm guessing.



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, August 14, 2014 9:02 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] qtwayland - update to 5.4 branch
>=20
> Ack
>=20
> On Thu, Aug 14, 2014 at 09:59:32AM -0400, Jacob Stiffler wrote:
> > * The 5.3 branch no longer exists and the SRCREV points to a commit on
> the 5.4 branch.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../recipes-qt/qt5/qtwayland-native_git.bbappend   |    4 ++--
> >  .../recipes-qt/qt5/qtwayland_git.bbappend          |    4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland-
> native_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland-
> native_git.bbappend
> > index 53c1454..64de589 100644
> > --- a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
> > +++ b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
> > @@ -1,3 +1,3 @@
> > -PR_append =3D "-arago0"
> > +PR_append =3D "-arago1"
> >
> > -QT_MODULE_BRANCH =3D "5.3"
> > +QT_MODULE_BRANCH =3D "5.4"
> > diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > index 53c1454..64de589 100644
> > --- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > +++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > @@ -1,3 +1,3 @@
> > -PR_append =3D "-arago0"
> > +PR_append =3D "-arago1"
> >
> > -QT_MODULE_BRANCH =3D "5.3"
> > +QT_MODULE_BRANCH =3D "5.4"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

