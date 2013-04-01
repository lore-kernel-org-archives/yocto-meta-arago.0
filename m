Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E3F4352981
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 21:17:04 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31LH3gR027425
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 16:17:03 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31LH3fQ018761
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 16:17:03 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 16:17:03 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] tisdk-connectivity: move ti-wifi-utils
Thread-Index: AQHOLvWOH/N6m0Ass0u2CTUgz5c+LJjB0ZMQgAAMshA=
Date: Mon, 1 Apr 2013 21:17:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594B4C43@DLEE11.ent.ti.com>
References: <1364833527-8440-1-git-send-email-Chase.Maupin@ti.com>
	<1364833527-8440-2-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C418FEB@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C418FEB@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] tisdk-connectivity: move ti-wifi-utils
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
X-List-Received-Date: Mon, 01 Apr 2013 21:17:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Monday, April 01, 2013 3:31 PM
> To: Maupin, Chase; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 1/3] tisdk-connectivity: move
> ti-wifi-utils
>=20
> WLAN_COMMON packages were meant to aid the other software include
> the packagegroup including those in the FIRMWARE_AND_DRIVERS
> section.

Because those packages could still be of use to people using other wifi don=
gles.  That was the assumption I was working under.  Common should not be c=
alled common if it mandates you have wilink components installed too.

>=20
> So if the firmware and drivers aren't being used then why bother
> bringing in the connectivity packagegroup?
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Monday, April 01, 2013 11:25 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 1/3] tisdk-connectivity: move ti-
> wifi-utils
> >
> > * Move the ti-wifi-utils into the drivers and firmware section
> >   because these utilities depend on the drivers and firmware
> being
> >   in place.  Having them in the common section would break
> builds
> >   where those packages were not available.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-connectivity.bb       |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> > index d936f83..d3b1f46 100644
> > --- a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-
> > tisdk-connectivity.bb
> > +++ b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > arago-ti
> > +++ sdk-connectivity.bb
> > @@ -10,7 +10,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >  # These are the packages that all platforms use for WLAN
> support
> > WLAN_COMMON =3D "\
> >      hostap-daemon \
> > -    ti-wifi-utils \
> >      wireless-tools \
> >      htop \
> >      netperf \
> > @@ -31,6 +30,7 @@ WLAN_COMMON =3D "\
> >  "
> >
> >  FIRMWARE_AND_DRIVERS =3D "\
> > +    ti-wifi-utils \
> >      ti-compat-wireless-wl12xx \
> >      ti-compat-bluetooth \
> >      bt-firmware \
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

