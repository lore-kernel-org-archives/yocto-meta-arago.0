Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 37B5A529B7
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 19:51:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16JpMdh005024
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 13:51:22 -0600
Received: from DLEE51.ent.ti.com (dlee51.ent.ti.com [157.170.170.85])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16JpLUa008315
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 13:51:21 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE51.ent.ti.com ([fe80::240e:6c25:3382:183d%26]) with mapi id
	14.03.0224.002; Fri, 6 Feb 2015 13:51:21 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
	include file
Thread-Index: AQHQQj5oxV3jcGOO7EiH0WzU8m+KOpzkXkAA//+puWA=
Date: Fri, 6 Feb 2015 19:51:20 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905811091D@DLEE11.ent.ti.com>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
	<20150206185948.GA12366@edge>
In-Reply-To: <20150206185948.GA12366@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Fri, 06 Feb 2015 19:51:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, February 06, 2015 2:00 PM
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
>=20
> I assume x11 is to make Java happy? I don't think you have x11 env...
>=20
[Sam] Yes it was to make Java happy.
>=20
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
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

