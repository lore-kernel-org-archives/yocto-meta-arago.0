Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9063D529F8
	for <meta-arago@arago-project.org>;
	Mon, 19 Jan 2015 22:29:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0JMT2cP004412
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 16:29:02 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0JMT2OG015882
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 16:29:02 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Mon, 19 Jan 2015 16:29:02 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago-prefs: Use older versions of
	packages to remove additional GPLv3 licenses
Thread-Index: AQHQNDNlLDuwpalLiUiTVpsYZ7WJapzIaEGA//+dzTA=
Date: Mon, 19 Jan 2015 22:29:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7D1E1D@DFLE08.ent.ti.com>
References: <1421704849-9661-1-git-send-email-fcooper@ti.com>
	<20150119221948.GM16771@edge>
In-Reply-To: <20150119221948.GM16771@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-prefs: Use older versions of packages to remove additional GPLv3 licenses
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
X-List-Received-Date: Mon, 19 Jan 2015 22:29:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, January 19, 2015 4:20 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] arago-prefs: Use older versions of
> packages to remove additional GPLv3 licenses
>=20
> On Mon, Jan 19, 2015 at 04:00:49PM -0600, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * Perf tool from the kernel was pulling in elfutils and m4 which by def=
ault
> have
> >   GPLv3 licenses.
> > * Set elfutils and m4 to an older version which uses a GPLv2 license.
>=20
> Thanks! This is indeed a better solution to creating a separate packagegr=
oup
> we discussed, especially since we don't really care for elfutils and m4 s=
pecific
> versions...
[Franklin] Yeah that would have been my last resort but I'm glad we can go =
with this simpler approach.=20
>=20
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../conf/distro/include/arago-prefs.inc            |    2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > index 94bb9da..3421a7d 100644
> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > @@ -111,6 +111,8 @@ PREFERRED_VERSION_crda =3D "1.1.3"
> >  PREFERRED_VERSION_obex =3D "0.34"
> >  PREFERRED_VERSION_bash =3D "3.2.48"
> >  PREFERRED_VERSION_gettext =3D "0.16.1"
> > +PREFERRED_VERSION_elfutils =3D "0.148"
> > +PREFERRED_VERSION_m4 =3D "1.4.9"
> >
> >  PREFERRED_PROVIDER_wpa-supplicant =3D "wpa-supplicant"
> >  PREFERRED_PROVIDER_wpa-supplicant_ti33x =3D "wpa-supplicant-wl18xx"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

