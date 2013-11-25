Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C92A45298F
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 16:39:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPGdroh008335
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 10:39:53 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPGdqPk032078
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 10:39:53 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 25 Nov 2013 10:39:52 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/7] packagegroup-arago-qt5: Create Qt5
	target package group
Thread-Index: AQHO6fYkjqb1fcfTgEqzl1Nv+3Rq/Jo2hPWAgAADgoD//5yGwA==
Date: Mon, 25 Nov 2013 16:39:52 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5C28B4@DFLE08.ent.ti.com>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
	<1385398442-24668-2-git-send-email-fcooper@ti.com>
	<20131125161943.GH690@edge> <20131125163217.GJ690@edge>
In-Reply-To: <20131125163217.GJ690@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/7] packagegroup-arago-qt5: Create Qt5 target package group
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
X-List-Received-Date: Mon, 25 Nov 2013 16:39:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, November 25, 2013 10:32 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/7] packagegroup-arago-qt5: Create Qt5
> target package group
>=20
> And BTW, here I was hoping to be able to use (and extend if necessary) al=
l those
> variables I started defining QT_RDEPENDS_* so we won't need to create a n=
ew
> Qt5-specific packagegroup...
>=20
> So, I was toying with this idea, but wasn't yet sure if it would be easie=
r to read
> and maintain instead of the new packagegroup AND all the conditionals
> elsewhere...
[Franklin] I tried to reuse packagegroups as much as possible but  this pac=
kagegroup was so different that it looked ugly to combine both Qt 4 and Qt =
5 in a single recipe. All my other patches I did reuse packagegroups so I t=
hink this was the only exception.
>=20
>=20
> On Mon, Nov 25, 2013 at 11:19:43AM -0500, Denys Dmytriyenko wrote:
> > On Mon, Nov 25, 2013 at 10:53:57AM -0600, Franklin S. Cooper Jr wrote:
> > > * Create package group that by default includes essential Qt 5 plugin=
s.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  .../packagegroups/packagegroup-arago-qt5.bb        |   33
> ++++++++++++++++++++
> > >  1 files changed, 33 insertions(+), 0 deletions(-)  create mode
> > > 100644
> > > meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.
> > > bb
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt
> > > 5.bb
> > > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt
> > > 5.bb
> > > new file mode 100644
> > > index 0000000..57d9a6c
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag
> > > +++ o-qt5.bb
> > > @@ -0,0 +1,33 @@
> > > +DESCRIPTION =3D "Task to add Qt 5 embedded related packages"
> > > +LICENSE =3D "MIT"
> > > +PR =3D "r0"
> > > +
> > > +inherit packagegroup
> > > +
> > > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > +
> > > +QT_SGX_SUPPORT =3D "\
> > > +    qt3d \
> > > +    qt3d-qmlplugins \
> > > +"
> > > +
> > > +RDEPENDS_${PN} =3D "\
> > > +    qtbase \
> > > +    qtbase-plugins \
> > > +    qtbase-fonts \
> > > +    qtbase-fonts-pfa \
> > > +    qtbase-fonts-pfb \
> > > +    qtbase-fonts-qpf \
> > > +    qtbase-fonts-ttf-dejavu \
> > > +    qtbase-fonts-ttf-vera \
> >
> > Please drop the specific fonts - qtbase-fonts pulls all the individual
> > fonts already.
> >
> >
> > > +    qtwebkit-qmlplugins \
> > > +    qtwebkit \
> > > +    qtdeclarative \
> > > +    qtdeclarative-qmlplugins \
> > > +    qtjsbackend \
> > > +    qtlocation \
> > > +    qtsvg \
> > > +    qtsvg-plugins \
> > > +
> > >
> +${@base_contains('MACHINE_FEATURES','sgx','${QT_SGX_SUPPORT}','',d)} \ "
> > > +
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

