Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9B2E452981
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 21:24:47 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31LOlBD008558
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 16:24:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31LOl0Z027006
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 16:24:47 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 16:24:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/3] tisdk-connectivity: remove drivers
	and	firmware for ti33x
Thread-Index: AQHOLvWQ0NF4rEkDmEu+TrhnSBi++JjB0AvggAAN9hA=
Date: Mon, 1 Apr 2013 21:24:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B4CA4@DLEE11.ent.ti.com>
References: <1364833527-8440-1-git-send-email-Chase.Maupin@ti.com>
	<1364833527-8440-3-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C418FC3@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C418FC3@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] tisdk-connectivity: remove drivers and	firmware for ti33x
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
X-List-Received-Date: Mon, 01 Apr 2013 21:24:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Monday, April 01, 2013 3:29 PM
> To: Maupin, Chase; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 2/3] tisdk-connectivity: remove
> drivers and firmware for ti33x
>=20
> 3.8 kernel is in development (not released) while the 3.2 kernel
> along with the AMSDK will be released shortly.
>=20
> You shouldn't break things for users who have a stable release to
> use for something that won't be released for several months. I
> would recommend creating a testing/integration layer to make
> these kind of changes.

My thought is that the 3.8 kernel is the latest and most in need of testing=
.  If you want to use an older kernel then you can set the preferred provid=
er to the older kernel version.  Going forward we should only be looking at=
 the linux-ti-staging kernel and it is only the current release that is usi=
ng the v3.2 linux-am33x kernel.  Since that release is already being built =
from an integration tree then this would have no impact to that release and=
 instead would enable the work for the future releases today.

That being said I'm open to changing this if that is the concensus.  In tha=
t case we can make another layer and I can put changes like this in there. =
 Ideally this new layer would be short lived until we all transition to the=
 new kernel and bootloader sources.

Thoughts?

>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Monday, April 01, 2013 11:25 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 2/3] tisdk-connectivity: remove
> drivers and
> > firmware for ti33x
> >
> > * Remove the drivers and firmware packages for ti33x until they
> >   have been updated to work with the latest v3.8 kernel.  This
> is
> >   in preparation to switch the default kernel to the v3.8
> kernel.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 +--
> >  .../packagegroup-arago-tisdk-connectivity.bb       |    3 +--
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > arago-tisdk-connectivity-sdk-host.bb b/meta-arago-
> distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-
> host.bb
> > index 0d9b242..1ca6ddd 100644
> > --- a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-
> > tisdk-connectivity-sdk-host.bb
> > +++ b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > arago-tisdk-connectivity-sdk-host.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install wlan and bluetooth sources into
> the SDK"
> >  LICENSE =3D "MIT"
> > -PR =3D "r3"
> > +PR =3D "r4"
> >
> >  inherit packagegroup
> >
> > @@ -17,7 +17,6 @@ CONNECTIVITY_RDEPENDS =3D ""
> >
> >  CONNECTIVITY_RDEPENDS_am37x-evm =3D
> > "${FIRMWARE_AND_DRIVERS_SRC}"
> >  CONNECTIVITY_RDEPENDS_am180x-evm =3D
> > "${FIRMWARE_AND_DRIVERS_SRC}"
> > -CONNECTIVITY_RDEPENDS_ti33x =3D "${FIRMWARE_AND_DRIVERS_SRC}"
> >
> >  RDEPENDS_${PN} =3D "\
> >      ${CONNECTIVITY_RDEPENDS} \
> > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> > index d3b1f46..3902611 100644
> > --- a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-
> > tisdk-connectivity.bb
> > +++ b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > arago-tisdk-connectivity.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install wlan and bluetooth packages
> into the target
> > FS"
> >  LICENSE =3D "MIT"
> > -PR =3D "r5"
> > +PR =3D "r6"
> >
> >  inherit packagegroup
> >
> > @@ -77,7 +77,6 @@ CONNECTIVITY_RDEPENDS_ti33x =3D "\
> >      ${WLAN_COMMON} \
> >      ${BLUETOOTH_STACK} \
> >      ${DEMO_APPS} \
> > -    ${FIRMWARE_AND_DRIVERS} \
> >  "
> >
> >  RDEPENDS_${PN} =3D "\
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

