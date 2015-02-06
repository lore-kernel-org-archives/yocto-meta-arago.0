Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D9C18529B7
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 19:50:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16Joonr004734
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 13:50:50 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16JomKH007899
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 13:50:49 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Fri, 6 Feb 2015 13:50:48 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
	include	file
Thread-Index: AQHQQj8JhCyHayoywU26LsRQ/4/lKZzkBgPQ
Date: Fri, 6 Feb 2015 19:50:47 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058110908@DLEE11.ent.ti.com>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7FAE76@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7FAE76@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] branding-mcsdk: Adding MCSDK branding include	file
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
X-List-Received-Date: Fri, 06 Feb 2015 19:50:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Friday, February 06, 2015 2:00 PM
> To: Nelson, Sam; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
> include file
>=20
> Why do u still need the commented PREFERRED_VERSIONs ur branding file?
>=20
[Sam] Sorry. The commented lines can be removed. I will send updated patch.
> Also what issue are you seeing that is preventing you from using libjpeg-
> turbo-native?
[Sam]  Not sure of issues with libjpeg-turbo-native it was just a choice we=
 were experimenting. Currently , we have everything working with
jpeg-native and going with this for now.
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > Sent: Friday, February 06, 2015 12:55 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
> > include file
> >
> > - To control preferred version and providers for MCSDK
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../conf/distro/include/branding-mcsdk.inc         |   20
> ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-arago-distro/conf/distro/include/branding-
> > mcsdk.inc
> >
> > diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> b/meta-
> > arago-distro/conf/distro/include/branding-mcsdk.inc
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
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

