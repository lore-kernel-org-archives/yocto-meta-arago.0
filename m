Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 00CAE529A4
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 21:04:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16L4TaX012616
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 15:04:29 -0600
Received: from DLEE51.ent.ti.com (dlee51.ent.ti.com [157.170.170.85])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16L4SZ5003834
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 15:04:28 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE51.ent.ti.com ([fe80::240e:6c25:3382:183d%26]) with mapi id
	14.03.0224.002; Fri, 6 Feb 2015 15:04:28 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
	include file
Thread-Index: AQHQQj5oxV3jcGOO7EiH0WzU8m+KOpzkd6KA//+i3NA=
Date: Fri, 6 Feb 2015 21:04:27 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058110A2A@DLEE11.ent.ti.com>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
	<20150206203038.GB12366@edge>
In-Reply-To: <20150206203038.GB12366@edge>
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
X-List-Received-Date: Fri, 06 Feb 2015 21:04:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, February 06, 2015 3:31 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
> include file
>=20
> On Fri, Feb 06, 2015 at 01:54:56PM -0500, Sam Nelson wrote:
> > - To control preferred version and providers for MCSDK
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../conf/distro/include/branding-mcsdk.inc         |   20
> ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-arago-distro/conf/distro/include/branding-
> mcsdk.inc
> >
> > diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > new file mode 100644
> > index 0000000..d023b67
> > --- /dev/null
> > +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > @@ -0,0 +1,20 @@
> > +# MCSDK branding configuration
> > +
> > +# Use the MCSDK supported versions
> > +PREFERRED_VERSION_libnl =3D "3.2.24"
> > +
> > +DISTRO_FEATURES +=3D "x11 opengl"
> > +
> > +# Java preferences.
> > +#PREFERRED_VERSION_openjdk-7-jre =3D "25b30-2.3.12"
> > +PREFERRED_VERSION_icedtea7-native =3D "2.1.3"
> > +PREFERRED_PROVIDER_openjdk-7-jre =3D "openjdk-7-jre"
> > +
> > +PREFERRED_PROVIDER_virtual/java-initial =3D "cacao-initial"
> > +
> > +PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
> > +PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
> > +
> > +PREFERRED_PROVIDER_jpeg-native =3D "jpeg-native"
> > +#PREFERRED_PROVIDER_jpeg-native =3D "libjpeg-turbo-native"
> > +PREFERRED_PROVIDER_glibc-gconv-iso8859-1 =3D "nativesdk-eglibc-locale"
>=20
> BTW, I don't think this last line is correct ^^^
[Sam]=20
Are you saying this is not the right option to choose?
I got :
NOTE: multiple providers are available for runtime glibc-gconv-iso8859-1 (e=
glibc-locale, nativesdk-eglibc-locale, external-arago-toolchain)
NOTE: consider defining a PREFERRED_PROVIDER entry to match glibc-gconv-iso=
8859-1
>=20
> --
> Denys

