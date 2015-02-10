Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5C3BB52A43
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 20:46:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AKkgrI000607;
	Tue, 10 Feb 2015 14:46:42 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AKkfCK027131;
	Tue, 10 Feb 2015 14:46:41 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 14:46:40 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago-image,
	packagegroup-arago-base-tisdk: move psplash to IMAGE_FEATURES,
	sans server
Thread-Index: AQHQRWaNb5nesldtbkaOY6OE7vaZEZzqSZcwgABp54D//6KFMIAAZfWA//+dcyA=
Date: Tue, 10 Feb 2015 20:46:40 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490581119DA@DLEE11.ent.ti.com>
References: <1423595959-23271-1-git-send-email-denis@denix.org>
	<4F9216F96E5DF9428610502835A9F4905811188E@DLEE11.ent.ti.com>
	<20150210200501.GJ13231@edge>
	<4F9216F96E5DF9428610502835A9F49058111931@DLEE11.ent.ti.com>
	<20150210203521.GO13231@edge>
In-Reply-To: <20150210203521.GO13231@edge>
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
X-List-Received-Date: Tue, 10 Feb 2015 20:46:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, February 10, 2015 3:35 PM
> To: Nelson, Sam
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] arago-image, packagegroup-arago-base-
> tisdk: move psplash to IMAGE_FEATURES, sans server
>=20
> On Tue, Feb 10, 2015 at 03:31:32PM -0500, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Tuesday, February 10, 2015 3:05 PM
> > > To: Nelson, Sam
> > > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH] arago-image, packagegroup-arago-bas=
e-
> > > tisdk: move psplash to IMAGE_FEATURES, sans server
> > >
> > > On Tue, Feb 10, 2015 at 07:50:05PM +0000, Nelson, Sam wrote:
> > > > Is this patch based on master? I am having trouble using the patch =
AS IS.
> > >
> > > Ah, indeed. Fixed in v2.
> > >
> > >
> > > > See comments inline.
> > > >
> > > > > -----Original Message-----
> > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > > Sent: Tuesday, February 10, 2015 2:19 PM
> > > > > To: meta-arago@arago-project.org
> > > > > Subject: [meta-arago] [PATCH] arago-image, packagegroup-arago-bas=
e-
> > > tisdk:
> > > > > move psplash to IMAGE_FEATURES, sans server
> > > > >
> > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > >
> > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > ---
> > > > >  meta-arago-distro/recipes-core/images/arago-image.inc           =
       | 2
> +-
> > > > >  meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.=
bb
> | 2
> > > ++
> > > > >  .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb =
       |
> 3
> > > +--
> > > > >  3 files changed, 4 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/meta-arago-distro/recipes-core/images/arago-image.in=
c
> b/meta-
> > > > > arago-distro/recipes-core/images/arago-image.inc
> > > > > index 98af6c3..977ce8f 100644
> > > > > --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> > > > > +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> > > > > @@ -3,7 +3,7 @@
> > > > >  LICENSE =3D "MIT"
> > > > >  LIC_FILES_CHKSUM =3D
> > > > >
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> > > > >
> > > > > -IMAGE_FEATURES +=3D "package-management"
> > > > > +IMAGE_FEATURES +=3D "package-management splash"
> > >
> > > 1. We add standard "splash" feature to IMAGE_FEATURES list for all ou=
r
> > > images.
> > > And image class will pull in psplash by default.
> > >
> > >
> > > > >  # 4KB per 1 inode should be enough
> > > > >  EXTRA_IMAGECMD_ext2.gz +=3D "-i 4096"
> > > > > diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-r=
ootfs-
> > > image.bb
> > > > > b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image=
.bb
> > > > > index e5ce2b5..908325f 100644
> > > > > --- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-
> image.bb
> > > > > +++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-
> image.bb
> > > > > @@ -3,6 +3,8 @@ COMPATIBLE_MACHINE =3D
> > > > > "omap3|omapl138|ti33x|keystone"
> > > > >
> > > > >  require arago-image.inc
> > > > >
> > > > > +SPLASH =3D ""
> > > > > +
> > > > [Sam] I am not sure why is this needed. Appreciate if you clarify.
> > >
> > > 2. For "server" image, we empty SPLASH variable, which is "psplash" b=
y
> default.
> > >
> > >
> > > > >  IMAGE_INSTALL +=3D "\
> > > > >      packagegroup-arago-base \
> > > > >      packagegroup-arago-console \
> > > > > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > > > > arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > > > > core/packagegroups/packagegroup-arago-base-tisdk.bb
> > > > > index 704e840..c291a42 100644
> > > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-
> > > base-
> > > > > tisdk.bb
> > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-
> > > > > base-tisdk.bb
> > > > > @@ -1,6 +1,6 @@
> > > > >  DESCRIPTION =3D "Additional packages beyond console packages sha=
red
> by TI
> > > > > SDKs"
> > > > >  LICENSE =3D "MIT"
> > > > > -PR =3D "r14"
> > > > > +PR =3D "r15"
> > > > >
> > > > >  inherit packagegroup
> > > > >
> > > > > @@ -12,7 +12,6 @@ RDEPENDS_${PN} =3D "\
> > > > >      libpcre \
> > > > >      iptables \
> > > > >      iperf \
> > > > > -    psplash \
> > >
> > > > [Sam] I see psplash getting removed here. Does not this be moved to=
 a
> > > > different package group? ( I don't see any addition to different pa=
ckage
> > > > group).
> > >
> > > 3. We no longer add psplash explicitly in the packagegroup, since ima=
ge
> class
> > > takes care of that for us with the steps above.
> > >
> > [Sam] Ok.
>=20
> > So the idea is, to disable psplash for headless distribution, probably =
need
> > to remove IMAGE_FEATURES_remove =3D "psplash" ?  Does that make sense?
>=20
> Step #2 above.
[Sam] I thought step #2 enable "psplash" as default for server image. That =
is why I was thinking about how to remove for keystone2 server filesystem. =
Am I missing something?
>=20
>=20
> > Also I tried the patch v2, and I see psplash does not seem to be added
> > automatically. Can you cross check this?
>=20
> Which image is that? I've checked the resulting RDEPENDS for our rootfs
> images
> and they look fine.
[Sam] I built tisdk-server-rootfs-image (built for k2hk-evm). I did not see=
 psplash in the file system built.
>=20
>=20
> > >
> > > > >      arago-gpl-notice \
> > > > >      nfs-utils-client \
> > > > >      "
> > > > > --
> > > > > 2.2.0
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

