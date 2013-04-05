Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EB84B52A3B
	for <meta-arago@arago-project.org>;
	Fri,  5 Apr 2013 18:39:40 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r35IdeTU027183
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 13:39:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35IdeGX013061
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 13:39:40 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 5 Apr 2013 13:39:40 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago-prefs: update graphics preferred
	version
Thread-Index: AQHOMiv9rW3vwvQXnki8DGz90vwV2ZjH9VnA
Date: Fri, 5 Apr 2013 18:39:38 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594C602F@DLEE11.ent.ti.com>
References: <1365186645-29898-1-git-send-email-Chase.Maupin@ti.com>
	<20130405183254.GC10072@edge>
In-Reply-To: <20130405183254.GC10072@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-prefs: update graphics preferred version
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
X-List-Received-Date: Fri, 05 Apr 2013 18:39:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Patch was sent to meta-ti to add it :)

But I should probably not leave the old version commented out.  Still, I fi=
gured this needs adaptation based on your "branding" patches.


Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, April 05, 2013 1:33 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] arago-prefs: update graphics
> preferred version
>=20
> On Fri, Apr 05, 2013 at 01:30:45PM -0500, Chase Maupin wrote:
> > * Update the preferred version of the TI graphics components to
> >   the version that will support the later v3.8 kernels as well.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../conf/distro/include/arago-prefs.inc            |    6
> ++++--
> >  1 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-distro/conf/distro/include/arago-
> prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > index d858a52..853844a 100644
> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > @@ -7,8 +7,10 @@ PREFERRED_VERSION_wpa-supplicant =3D "2.0-devel-
> ti"
> >  PREFERRED_VERSION_hostap-daemon =3D "2.0-devel-ti"
> >
> >  # Use v4.08.00.01 of the Graphics SDK
> > -PREFERRED_VERSION_omap3-sgx-modules =3D "4.08.00.01"
> > -PREFERRED_VERSION_libgles-omap3 =3D "4.08.00.01"
> > +#PREFERRED_VERSION_omap3-sgx-modules =3D "4.08.00.01"
> > +#PREFERRED_VERSION_libgles-omap3 =3D "4.08.00.01"
> > +PREFERRED_VERSION_omap3-sgx-modules =3D "4.09.00.01"
> > +PREFERRED_VERSION_libgles-omap3 =3D "4.09.00.01"
>=20
> There is no such version neither in meta-ti nor in meta-arago :)
>=20
>=20
> >  ARAGO_QT_PROVIDER =3D
> "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-
> gles','qt4-embedded',d)}"
> >
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

