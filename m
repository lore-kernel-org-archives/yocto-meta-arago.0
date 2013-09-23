Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3E0B7529A0
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2013 14:53:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8NErv7t006294
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 09:53:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NErsKJ016947
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 09:53:57 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 23 Sep 2013 09:53:55 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base
	file	system image
Thread-Index: AQHOs99tTHafF954906JGDI6H9a4fpnKWBrwgAUDzgD//61HsIAAYCaA//+wLGCAAF9XAIAD+B3Q
Date: Mon, 23 Sep 2013 14:53:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55A51B@DFLE08.ent.ti.com>
References: <1379445202-31364-1-git-send-email-fcooper@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E8A07BE@DLEE08.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C553A50@DFLE08.ent.ti.com>
	<20130920193051.GB30673@edge>
	<8F29D6B095ED194EA1980491A5E029710C55817B@DFLE08.ent.ti.com>
	<20130920201855.GD30673@edge>
	<8F29D6B095ED194EA1980491A5E029710C558370@DFLE08.ent.ti.com>
	<20130920211425.GF30673@edge>
In-Reply-To: <20130920211425.GF30673@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] tisdk-rootfs-base-image: Rename base file	system image
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
X-List-Received-Date: Mon, 23 Sep 2013 14:54:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, September 20, 2013 4:14 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename bas=
e
> file system image
>=20
> On Fri, Sep 20, 2013 at 04:55:07PM -0400, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Friday, September 20, 2013 3:19 PM
> > > To: Cooper Jr., Franklin
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image:
> > > Rename base file system image
> > >
> > > On Fri, Sep 20, 2013 at 03:38:06PM -0400, Cooper Jr., Franklin wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Friday, September 20, 2013 2:31 PM
> > > > > To: Cooper Jr., Franklin
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image:
> > > > > Rename base file system image
> > > > >
> > > > > On Tue, Sep 17, 2013 at 04:05:10PM -0400, Cooper Jr., Franklin wr=
ote:
> > > > > >
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Dmytriyenko, Denys
> > > > > > > Sent: Tuesday, September 17, 2013 2:52 PM
> > > > > > > To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > > > > > > Subject: RE: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image=
:
> > > > > > > Rename base file system image
> > > > > > >
> > > > > > > What was the initial reason to start naming rootfs images
> > > > > > > with
> > > > > > > tisdk-rootfs- prefix? I remember it was something forced by
> > > > > > > the SDK
> > > setup...
> > > > > > [Franklin]
> > > > > > This was before my time so I am not sure what the original reas=
oning
> was.
> > > > > >
> > > > > > I do assume there might be instances where some script
> > > > > > somewhere will need to be updated if it refers to the full imag=
e as
> "tisdk-rootfs*"
> > > > >
> > > > > So, I located the change I was talking about:
> > > > > http://arago-project.org/git/?p=3Dmeta-
> > > > >
> arago.git;a=3Dcommitdiff;h=3D91f2be34e301deebbc75c54bbad6a5a27e25bf2
> > > > > c
> > > > >
> > > > > The "tisdk-image class had issues" is a rather vague
> > > > > description, so I'm not sure or don't remember what was the
> > > > > problem that you had to rename the original arago-tisdk-image int=
o
> tisdk-rootfs-image...
> > > > >
> > >
> > > > [Franklin] Ah I remember. The TARGET_IMAGES variable is used in
> > > > two ways in that class. 1 to add a build dependency and 2 to
> > > > reference the image tarball. So the assumption was that the
> > > > recipe/package name was the same as the IMAGE_BASENAME. So the
> > > > recipe and IMAGE_BASENAME
> > > must
> > > > match. Otherwise the image would be built but the class wouldn't
> > > > know what tarball to look for.
> > >
> > > Ah, OK, this is not exactly what I was looking for. Tracing even
> > > further back shows that you added the recipe to have IMAGE_BASENAME =
=3D
> "tisdk-rootfs":
> > >
> > > http://arago-project.org/git/?p=3Dmeta-
> > > arago.git;a=3Dcommitdiff;h=3Df27b1f34aee2c2cbee25a0fb5b21cdb04f16ec4a
> > >
> > > Do you remember the reason for that? This image recipe was in
> > > Classic arago, but there it had the basename matching the recipe
> > > name. Wondering why the change?
>=20
> > [Franklin] I think I was simply trying to match the filesystem tarball
> > with the name used in previous sdks. I am assuming that the SDK
> > backend script that built the sdk renamed those filesystem files.
> > Looking at Sitara AMSDK
> > 05.05.01 (last oe-classic based sdk) the two filesystem tarballs were
> > named base-rootfs-am335x-evm.tar.gz and
> > tisdk-rootfs-am335x-evm.tar.gz. During that time I was focused on just
> > getting the filesystem working and wanted it to look like the output
> > from previous sdks. I don't think I had any other reason.
>=20
> Thanks! Just wanted to check if there was some sort of requirement for th=
at
> name change. If there is not, then we can look for a better names for ful=
l image
> as well as base image.
>=20
> Should we look into unifying the names for other image recipes? Is
> tisdk-rootfs- the best base we can think of?
[Franklin] I think it's important to separate the "arago" images from the "=
sdk" images. I am currently ok with the naming convention we use for our cu=
rrent images minus the one I created this patch for :). But I'm open to sug=
gestions.
>=20
> --
> Denys
>=20
>=20
> > > > > > > -----Original Message-----
> > > > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago=
-
> > > > > > > bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > > > > > > Sent: Tuesday, September 17, 2013 3:13 PM
> > > > > > > To: meta-arago@arago-project.org
> > > > > > > Cc: Cooper Jr., Franklin
> > > > > > > Subject: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Re=
name
> > > base
> > > > > file
> > > > > > > system image
> > > > > > >
> > > > > > > * People are frequently confused by the difference in naming
> between
> > > the
> > > > > > > minimal
> > > > > > >   file system and the larger file system.
> > > > > > > * Rename the minimal file system to mimic the naming conventi=
on of
> the
> > > > > larger
> > > > > > >   file system.
> > > > > > >
> > > > > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > > > > > ---
> > > > > > >  ...e-tisdk-image.bb =3D> tisdk-rootfs-base-image.bb} |    2 =
+-
> > > > > > >  1 files changed, 1 insertions(+), 1 deletions(-)  rename met=
a-arago-
> > > > > > > distro/recipes-core/images/{arago-base-tisdk-image.bb =3D> ti=
sdk-
> rootfs-
> > > > > base-
> > > > > > > image.bb} (87%)
> > > > > > >
> > > > > > > diff --git a/meta-arago-distro/recipes-core/images/arago-base=
-tisdk-
> > > > > image.bb
> > > > > > > b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-
> image.bb
> > > > > > > similarity index 87%
> > > > > > > rename from meta-arago-distro/recipes-core/images/arago-base-
> tisdk-
> > > > > > > image.bb
> > > > > > > rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-=
base-
> > > > > image.bb
> > > > > > > index 2c0e217..a3a9123 100644
> > > > > > > --- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-
> image.bb
> > > > > > > +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base=
-
> > > image.bb
> > > > > > > @@ -12,4 +12,4 @@ IMAGE_INSTALL +=3D "\
> > > > > > >      packagegroup-arago-base-tisdk \
> > > > > > >      "
> > > > > > >
> > > > > > > -export IMAGE_BASENAME =3D "arago-base-tisdk-image"
> > > > > > > +export IMAGE_BASENAME =3D "tisdk-rootfs-base-image"
> > > > > > > --
> > > > > > > 1.7.0.4
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > meta-arago mailing list
> > > > > > > meta-arago@arago-project.org
> > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

