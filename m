Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0B491529BD
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 15:52:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23FqEN8011646;
	Tue, 3 Mar 2015 09:52:14 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23FqD7X000306;
	Tue, 3 Mar 2015 09:52:13 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 3 Mar 2015 09:52:13 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/2] packagegroup-*-qte: update to include
	remaining qt5 modules and dependencies
Thread-Index: AQHQVYrMRqEMBMt7U0qT4i8JGAJPKp0K3JCAgABudwD//53G0A==
Date: Tue, 3 Mar 2015 15:52:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C8335B5@DFLE08.ent.ti.com>
References: <1425370754-22484-1-git-send-email-denis@denix.org>
	<1425370754-22484-2-git-send-email-denis@denix.org>
	<E5C7A8C9-4F73-48AD-8918-20A21CCC71AE@ti.com>
	<20150303154316.GS6052@edge>
In-Reply-To: <20150303154316.GS6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] packagegroup-*-qte: update to include remaining qt5 modules and dependencies
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
X-List-Received-Date: Tue, 03 Mar 2015 15:52:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 03, 2015 9:43 AM
> To: Cooper Jr., Franklin
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/2] packagegroup-*-qte: update to
> include remaining qt5 modules and dependencies
>=20
> On Tue, Mar 03, 2015 at 03:07:53PM +0000, Cooper Jr., Franklin wrote:
> > Are there any dev packages for these packages that you added that
> > should also be added to Linux-devkit?
>=20
> No new modules were added, just extra plugins and examples. All the
> corresponding -dev are already listed.
[Franklin] Alright thanks

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

>=20
>=20
> > > On Mar 3, 2015, at 2:19 AM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > > .../recipes-core/packagegroups/packagegroup-arago-qte.bb     | 11
> ++++++++---
> > > .../packagegroups/packagegroup-arago-tisdk-qte.bb            | 12 +++=
++++-
> ----
> > > 2 files changed, 15 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-
> distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > > index 48fdb01..9618de5 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-qte.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-qte.bb
> > > @@ -1,6 +1,6 @@
> > > DESCRIPTION =3D "Task to add Qt embedded related packages"
> > > LICENSE =3D "MIT"
> > > -PR =3D "r7"
> > > +PR =3D "r8"
> > >
> > > inherit packagegroup
> > >
> > > @@ -29,11 +29,16 @@ QT4_ESSENTIALS =3D "\
> > > QT5_ESSENTIALS =3D "\
> > >     qtbase-plugins \
> > >     qtdeclarative-plugins \
> > > +    qtdeclarative-qmlplugins \
> > >     qtlocation-plugins \
> > > +    qtlocation-qmlplugins \
> > >     qtmultimedia-plugins \
> > > +    qtmultimedia-qmlplugins \
> > >     qtwayland-plugins \
> > > -    qt3d \
> > > -    qtquick1 \
> > > +    qt3d-qmlplugins \
> > > +    qtwebkit-qmlplugins \
> > > +    qtquick1-plugins \
> > > +    qtquick1-qmlplugins \
> > > "
> > >
> > > RDEPENDS_${PN} =3D "\
> > > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-
> distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > > index a95a9cd..495247e 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-qte.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-qte.bb
> > > @@ -1,6 +1,6 @@
> > > DESCRIPTION =3D "Task to add Qt embedded related packages"
> > > LICENSE =3D "MIT"
> > > -PR =3D "r9"
> > > +PR =3D "r10"
> > >
> > > inherit packagegroup
> > >
> > > @@ -14,12 +14,14 @@ QT4_DEMOS =3D "\
> > > "
> > >
> > > QT5_DEMOS =3D "\
> > > -    qtwayland-examples \
> > > -    qtwebkit-examples-examples \
> > > +    qt3d-examples \
> > > +    qtbase-examples \
> > >     qtdeclarative-examples \
> > > +    qtlocation-examples \
> > >     qtmultimedia-examples \
> > > -    qtbase-examples \
> > > -    qt3d-examples \
> > > +    qtscript-examples \
> > > +    qtwayland-examples \
> > > +    qtwebkit-examples-examples \
> > >     qtquick1-examples \
> > > "
> > >
> > > --
> > > 2.2.0
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

