Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EDF4D52972
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 17:41:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s25Hfu8F017646
	for <meta-arago@arago-project.org>; Wed, 5 Mar 2014 11:41:56 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s25HfuZ9027144
	for <meta-arago@arago-project.org>; Wed, 5 Mar 2014 11:41:56 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 5 Mar 2014 11:41:55 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago.conf: Update preferred version of
	binutils to 2.23.1
Thread-Index: AQHPNm2y5y5TZihinE6UglIhKr2fhJrSN5AAgACPrIA=
Date: Wed, 5 Mar 2014 17:41:55 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F4C2B9@DLEE11.ent.ti.com>
References: <1393802295-7212-1-git-send-email-sam.nelson@ti.com>
	<20140305030635.GT22125@edge>
In-Reply-To: <20140305030635.GT22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago.conf: Update preferred version of binutils to 2.23.1
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
X-List-Received-Date: Wed, 05 Mar 2014 17:41:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I guess the arago-prefs.inc or branding-xyz.inc is the right place. Please =
ignore this patch.
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 04, 2014 10:07 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] arago.conf: Update preferred version of
> binutils to 2.23.1
>=20
> What are you strying to fix here? Moreover, arago.conf is not the right p=
lace
> for that...
>=20
>=20
> On Sun, Mar 02, 2014 at 06:18:15PM -0500, Sam Nelson wrote:
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > - 2.23.1 is available in oe-core/meta/recipes-
> devtools/binutils/binutils_2.23.1.bb
> > ---
> > ---
> >  meta-arago-distro/conf/distro/arago.conf |    2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> > index 76254f2..a789e89 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -70,3 +70,5 @@ LICENSE_FLAGS_WHITELIST =3D "commercial_gst-
> ffmpeg"
> >  PACKAGE_ARCH :=3D "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-
> libc-headers}"
> >  # Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS
> variable
> >  PACKAGE_ARCHS +=3D "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-
> libc-headers}"
> > +
> > +PREFERRED_VERSION_binutils =3D "2.23.1"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

