Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6CC9F52A5A
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 20:32:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16KWiQ3009104
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 14:32:44 -0600
Received: from DLEE51.ent.ti.com (dlee51.ent.ti.com [157.170.170.85])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16KWhmS032266
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 14:32:43 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE51.ent.ti.com ([fe80::240e:6c25:3382:183d%26]) with mapi id
	14.03.0224.002; Fri, 6 Feb 2015 14:32:43 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
	include file
Thread-Index: AQHQQj8YvW/PGHmOS0CGJsOXRJXBeJzkbKUA//+mGfA=
Date: Fri, 6 Feb 2015 20:32:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7FB1BB@DFLE08.ent.ti.com>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
	<20150206185948.GA12366@edge>
	<4F9216F96E5DF9428610502835A9F4905811091D@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905811091D@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] branding-mcsdk: Adding MCSDK branding include file
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
X-List-Received-Date: Fri, 06 Feb 2015 20:32:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Friday, February 06, 2015 1:51 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
> include file
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, February 06, 2015 2:00 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK
> > branding include file
> >
> > On Fri, Feb 06, 2015 at 01:54:56PM -0500, Sam Nelson wrote:
> > > - To control preferred version and providers for MCSDK
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  .../conf/distro/include/branding-mcsdk.inc         |   20
> > ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >  create mode 100644 meta-arago-distro/conf/distro/include/branding-
> > mcsdk.inc
> > >
> > > diff --git
> > > a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > new file mode 100644
> > > index 0000000..d023b67
> > > --- /dev/null
> > > +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > @@ -0,0 +1,20 @@
> > > +# MCSDK branding configuration
> > > +
> > > +# Use the MCSDK supported versions
> > > +PREFERRED_VERSION_libnl =3D "3.2.24"
> > > +
> > > +DISTRO_FEATURES +=3D "x11 opengl"
> >
> > I assume x11 is to make Java happy? I don't think you have x11 env...
> >
> [Sam] Yes it was to make Java happy.
[Franklin] I thought I remembered that the mcsdk were meant for headless de=
vices.
If so I would recommend taking a look at the discussion here:
https://github.com/woglinde/meta-java/issues/45

Pulling in x11 and gtk seems painful especially since you're not using it.
Anyway it's something to look into if it is indeed meant for headless devic=
es.
But its ur branding file so my above comments aren't meant to block this pa=
tch from being accepted.
> >
> > > +# Java preferences.
> > > +#PREFERRED_VERSION_openjdk-7-jre =3D "25b30-2.3.12"
> > > +PREFERRED_VERSION_icedtea7-native =3D "2.1.3"
> > > +PREFERRED_PROVIDER_openjdk-7-jre =3D "openjdk-7-jre"
> > > +
> > > +PREFERRED_PROVIDER_virtual/java-initial =3D "cacao-initial"
> > > +
> > > +PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
> > > +PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
> > > +
> > > +PREFERRED_PROVIDER_jpeg-native =3D "jpeg-native"
> > > +#PREFERRED_PROVIDER_jpeg-native =3D "libjpeg-turbo-native"
> > > +PREFERRED_PROVIDER_glibc-gconv-iso8859-1 =3D "nativesdk-eglibc-local=
e"
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

