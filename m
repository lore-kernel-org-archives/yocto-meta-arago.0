Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 67CE6529B3
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 16:30:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AGUwOo012024
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:30:58 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGUvg3027563
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:30:57 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 10:30:57 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
	psplash	conditional with splash feature
Thread-Index: AQHQRUznhfw48FDGlk6EVb9m4bMh7pzqEZ+A
Date: Tue, 10 Feb 2015 16:30:57 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058111635@DLEE11.ent.ti.com>
References: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7FE138@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7FE138@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-arago-base-tisdk: Make psplash	conditional with splash feature
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
X-List-Received-Date: Tue, 10 Feb 2015 16:30:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Tuesday, February 10, 2015 11:16 AM
> To: Nelson, Sam; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
> psplash conditional with splash feature
>=20
> Splash is not a distro feature we use so this will essentially remove it =
from all
> devices.
>=20
> You can either put this in a packagegroup that isn't included for headles=
s
> filesystems. But pick one that makes sense.
> You can conditional include or not include psplash depending on machines.
> You can use machine features and check for touchscreen. Although some kin=
d
> of generic "display" machine feature would be better. But it currently do=
esn't
> exist.
> Or you can add splash as a distro feature for the various branding files
> excluding yours.
[Sam] Do you see any issues using the "IMAGE_FEATURES" instead? Core-image-=
base include splash by default ( so all products will include psplash). And=
 I am thinking of removing it for Keystone using branding file and can be d=
one for any other headless distribution similarly.

>=20
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > Sent: Tuesday, February 10, 2015 10:01 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make pspla=
sh
> > conditional with splash feature
> >
> > - This is meant to avoid error message with headless distribution
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-base-tisdk.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-base-tisdk.bb
> > index 7652622..7b71aa4 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > base-tisdk.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > base-tisdk.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Additional packages beyond console packages shared by=
 TI
> > SDKs"
> >  LICENSE =3D "MIT"
> > -PR =3D "r15"
> > +PR =3D "r16"
> >
> >  inherit packagegroup
> >
> > @@ -12,7 +12,7 @@ RDEPENDS_${PN} =3D "\
> >      libpcre \
> >      iptables \
> >      iperf \
> > -    psplash \
> > +    ${@base_contains('DISTRO_FEATURES', 'splash', 'psplash', '',d)} \
> >      arago-gpl-notice \
> >      arago-feed-config \
> >      nfs-utils-client \
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

