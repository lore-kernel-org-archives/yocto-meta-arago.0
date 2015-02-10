Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AD60D52A59
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 20:56:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AKuVwO009572;
	Tue, 10 Feb 2015 14:56:31 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AKuUXA000996;
	Tue, 10 Feb 2015 14:56:30 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 14:56:30 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago-image,
	packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES,
	sans server
Thread-Index: AQHQRWaNb5nesldtbkaOY6OE7vaZEZzqSZcwgABp54D//6KFMIAAZfWA//+dcyCAAGc3gP//nECg
Date: Tue, 10 Feb 2015 20:56:30 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058111A20@DLEE11.ent.ti.com>
References: <1423595959-23271-1-git-send-email-denis@denix.org>
	<4F9216F96E5DF9428610502835A9F4905811188E@DLEE11.ent.ti.com>
	<20150210200501.GJ13231@edge>
	<4F9216F96E5DF9428610502835A9F49058111931@DLEE11.ent.ti.com>
	<20150210203521.GO13231@edge>
	<4F9216F96E5DF9428610502835A9F490581119DA@DLEE11.ent.ti.com>
	<20150210205203.GP13231@edge>
In-Reply-To: <20150210205203.GP13231@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-image, packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES, sans server
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
X-List-Received-Date: Tue, 10 Feb 2015 20:56:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, February 10, 2015 3:52 PM
> To: Nelson, Sam
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] arago-image, packagegroup-arago-base-
> tisdk: move psplash to IMAGE_FEATURES, sans server
>=20
> On Tue, Feb 10, 2015 at 03:46:40PM -0500, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Tuesday, February 10, 2015 3:35 PM
> > > To: Nelson, Sam
> > > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH] arago-image, packagegroup-arago-bas=
e-
> > > tisdk: move psplash to IMAGE_FEATURES, sans server
> > >
> > > On Tue, Feb 10, 2015 at 03:31:32PM -0500, Nelson, Sam wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Tuesday, February 10, 2015 3:05 PM
> > > > > To: Nelson, Sam
> > > > > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [PATCH] arago-image, packagegroup-arago=
-
> base-
> > > > > tisdk: move psplash to IMAGE_FEATURES, sans server
> > > > >
> > > > > On Tue, Feb 10, 2015 at 07:50:05PM +0000, Nelson, Sam wrote:
> > > > > > Is this patch based on master? I am having trouble using the pa=
tch AS
> IS.
> > > > >
> > > > > Ah, indeed. Fixed in v2.
> > > > >
> > > > >
> > > > > > See comments inline.
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago=
-
> > > > > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > > > > Sent: Tuesday, February 10, 2015 2:19 PM
> > > > > > > To: meta-arago@arago-project.org
> > > > > > > Subject: [meta-arago] [PATCH] arago-image, packagegroup-arago=
-
> base-
> > > > > tisdk:
> > > > > > > move psplash to IMAGE_FEATURES, sans server
> > > > > > >
> > > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > > >
> > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > > ---
> > > > > > >  meta-arago-distro/recipes-core/images/arago-image.inc       =
           |
> 2
> > > +-
> > > > > > >  meta-arago-distro/recipes-core/images/tisdk-server-rootfs-im=
age.bb
> > > | 2
> > > > > ++
> > > > > > >  .../recipes-core/packagegroups/packagegroup-arago-base-tisdk=
.bb
> |
> > > 3
> > > > > +--
> > > > > > >  3 files changed, 4 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/meta-arago-distro/recipes-core/images/arago-imag=
e.inc
> > > b/meta-
> > > > > > > arago-distro/recipes-core/images/arago-image.inc
> > > > > > > index 98af6c3..977ce8f 100644
> > > > > > > --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> > > > > > > +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> > > > > > > @@ -3,7 +3,7 @@
> > > > > > >  LICENSE =3D "MIT"
> > > > > > >  LIC_FILES_CHKSUM =3D
> > > > > > >
> > > "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> > > > > > >
> > > > > > > -IMAGE_FEATURES +=3D "package-management"
> > > > > > > +IMAGE_FEATURES +=3D "package-management splash"
> > > > >
> > > > > 1. We add standard "splash" feature to IMAGE_FEATURES list for al=
l our
> > > > > images.
> > > > > And image class will pull in psplash by default.
> > > > >
> > > > >
> > > > > > >  # 4KB per 1 inode should be enough
> > > > > > >  EXTRA_IMAGECMD_ext2.gz +=3D "-i 4096"
> > > > > > > diff --git a/meta-arago-distro/recipes-core/images/tisdk-serv=
er-
> rootfs-
> > > > > image.bb
> > > > > > > b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-
> image.bb
> > > > > > > index e5ce2b5..908325f 100644
> > > > > > > --- a/meta-arago-distro/recipes-core/images/tisdk-server-root=
fs-
> > > image.bb
> > > > > > > +++ b/meta-arago-distro/recipes-core/images/tisdk-server-root=
fs-
> > > image.bb
> > > > > > > @@ -3,6 +3,8 @@ COMPATIBLE_MACHINE =3D
> > > > > > > "omap3|omapl138|ti33x|keystone"
> > > > > > >
> > > > > > >  require arago-image.inc
> > > > > > >
> > > > > > > +SPLASH =3D ""
> > > > > > > +
> > > > > > [Sam] I am not sure why is this needed. Appreciate if you clari=
fy.
> > > > >
> > > > > 2. For "server" image, we empty SPLASH variable, which is "psplas=
h" by
> > > default.
[Sam] Ok. Looks like I misunderstood this statement.=20
> > > > >
> > > > >
> > > > > > >  IMAGE_INSTALL +=3D "\
> > > > > > >      packagegroup-arago-base \
> > > > > > >      packagegroup-arago-console \
> > > > > > > diff --git a/meta-arago-distro/recipes-
> > > core/packagegroups/packagegroup-
> > > > > > > arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > > > > > > core/packagegroups/packagegroup-arago-base-tisdk.bb
> > > > > > > index 704e840..c291a42 100644
> > > > > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-
> > > arago-
> > > > > base-
> > > > > > > tisdk.bb
> > > > > > > +++ b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > > arago-
> > > > > > > base-tisdk.bb
> > > > > > > @@ -1,6 +1,6 @@
> > > > > > >  DESCRIPTION =3D "Additional packages beyond console packages
> shared
> > > by TI
> > > > > > > SDKs"
> > > > > > >  LICENSE =3D "MIT"
> > > > > > > -PR =3D "r14"
> > > > > > > +PR =3D "r15"
> > > > > > >
> > > > > > >  inherit packagegroup
> > > > > > >
> > > > > > > @@ -12,7 +12,6 @@ RDEPENDS_${PN} =3D "\
> > > > > > >      libpcre \
> > > > > > >      iptables \
> > > > > > >      iperf \
> > > > > > > -    psplash \
> > > > >
> > > > > > [Sam] I see psplash getting removed here. Does not this be move=
d to a
> > > > > > different package group? ( I don't see any addition to differen=
t
> package
> > > > > > group).
> > > > >
> > > > > 3. We no longer add psplash explicitly in the packagegroup, since=
 image
> > > class
> > > > > takes care of that for us with the steps above.
> > > > >
> > > > [Sam] Ok.
> > >
> > > > So the idea is, to disable psplash for headless distribution, proba=
bly need
> > > > to remove IMAGE_FEATURES_remove =3D "psplash" ?  Does that make
> sense?
> > >
> > > Step #2 above.
>=20
> > [Sam] I thought step #2 enable "psplash" as default for server image. T=
hat
> > is why I was thinking about how to remove for keystone2 server filesyst=
em.
> > Am I missing something?
>=20
> No, psplash is already a default value for "splash" image feature. Hence =
I
> disable it for the server image - isn't it what you needed from the begin=
ning?
>=20
>=20
> > > > Also I tried the patch v2, and I see psplash does not seem to be ad=
ded
> > > > automatically. Can you cross check this?
> > >
> > > Which image is that? I've checked the resulting RDEPENDS for our root=
fs
> > > images
> > > and they look fine.
>=20
> > [Sam] I built tisdk-server-rootfs-image (built for k2hk-evm). I did not=
 see
> > psplash in the file system built.
>=20
> Exactly! Since server image is for headless platforms, there shouldn't be
> psplash running.
[Sam] Makes sense. Thanks.
>=20
>=20
> > > > > > >      arago-gpl-notice \
> > > > > > >      nfs-utils-client \
> > > > > > >      "
> > > > > > > --
> > > > > > > 2.2.0
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > meta-arago mailing list
> > > > > > > meta-arago@arago-project.org
> > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

