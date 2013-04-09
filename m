Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5ABE252A48
	for <meta-arago@arago-project.org>;
	Tue,  9 Apr 2013 11:01:08 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r39B17j0011946
	for <meta-arago@arago-project.org>; Tue, 9 Apr 2013 06:01:07 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r39B16oW026708
	for <meta-arago@arago-project.org>; Tue, 9 Apr 2013 06:01:07 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 9 Apr 2013 06:01:06 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Rini, Tom" <trini@ti.com>
Thread-Topic: [meta-arago] [PATCH] tisdk-addons: Add parted utility
Thread-Index: AQHONIJaX80g3sam4UOo1Ss59HH5xpjNuejQ
Date: Tue, 9 Apr 2013 11:01:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594D1663@DLEE11.ent.ti.com>
References: <1365170082-1087-1-git-send-email-Chase.Maupin@ti.com>
	<20130408175540.GA15209@denix.org>
In-Reply-To: <20130408175540.GA15209@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-addons: Add parted utility
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
X-List-Received-Date: Tue, 09 Apr 2013 11:01:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I'm OK with trying that.

Tom, will that utility work for your needs?

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
> Sent: Monday, April 08, 2013 12:56 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] tisdk-addons: Add parted
> utility
>=20
> On Fri, Apr 05, 2013 at 08:54:42AM -0500, Chase Maupin wrote:
> > * Add the parted utility to make working with eMMC GPT
> partitions
> >   possible from the Linux system.
>=20
> Since parted is GPLv3, may I suggest GPT fdisk (gdisk) instead,
> which is
> GPLv2? It appears there's no recipe for it yet, but it should it
> relatively
> easy to make, as it's quite portable:
>=20
> http://www.rodsbooks.com/gdisk/index.html
>=20
> --
> Denys
>=20
>=20
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-addons.bb             |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-
> arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
> addons.bb
> > index 0f76f4f..5dade67 100644
> > --- a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > +++ b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install additional utilities/demos for
> SDKs"
> >  LICENSE =3D "MIT"
> > -PR =3D "r5"
> > +PR =3D "r6"
> >
> >  inherit packagegroup
> >
> > @@ -16,6 +16,7 @@ UTILS =3D " \
> >      arm-benchmarks \
> >      dropbear \
> >      openssh-sftp-server \
> > +    parted \
> >  "
> >
> >  # Add PRU examples for am180x-evm devices
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

