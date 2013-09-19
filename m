Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 680EB52990
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2013 15:14:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8JFE8RW017686
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2013 10:14:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8JFE8BK004798
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2013 10:14:08 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 19 Sep 2013 10:14:08 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [for comments][PATCH] packagegroup-arago-base:
	Create new tisdk package
Thread-Index: AQHOs+cla6vPx4tpmECl70UoinAPJJnKZoXAgAGJIwCAAJZjgIAApEog
Date: Thu, 19 Sep 2013 15:14:07 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5568A7@DFLE08.ent.ti.com>
References: <1379453285-14892-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C553C53@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED10159735181@DLEE11.ent.ti.com>
	<20130919001306.GC27021@edge>
In-Reply-To: <20130919001306.GC27021@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [for comments][PATCH] packagegroup-arago-base: Create new tisdk package
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
X-List-Received-Date: Thu, 19 Sep 2013 15:14:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, September 18, 2013 7:13 PM
> To: Maupin, Chase
> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [for comments][PATCH] packagegroup-arago-base:
> Create new tisdk package
>=20
> Yes, that is the correct understanding - I see it exactly the same. BTW, =
there is
> the RDEPENDS there for the -tisdk packagegroup to depend on the base
> package:
>=20
> > +RDEPENDS_${PN}-tisdk =3D "\
> > +    ${PN} \
> > +    dbus \
>=20
> But I'd have to agree that while this method of overloading the packagegr=
oup is
> technically correct and maybe innovative, I'm not sure it is the most obv=
ious
> one. On the other hand, that is somewhat similar to how the core base
> packagegroup in oe-core (and Classic OE before) is structured and provide=
s all
> the base-acpi, base-alsa, base-bluetooth, base-pci etc. sub-packages depe=
nding
> on DISTRO_FEATURES defined...
>=20
> Either way, we would still have blah-toolchain-host and blah-toolchain-ta=
rget
> packagegroups separate from the main "blah" one. So, I'm on the fence abo=
ut
> which way to go with the packagegroups - one provides less files with sli=
ghtly
> more convoluted syntax, while the other is simple and srtaigtforward, but=
 then
> you may get lost in the number of files... Do you have anything else to c=
onvince
> me one way or another? :)
[Franklin]=20

I do understand that this approach isn't straightforward but packagegroups =
are just another type of "recipe". A lot of traditional recipes have custom=
 packages which briefly causes slight confusion for newcomers but it's done=
 in a lot of places since the only alternative would be to deal with a crap=
 load of files.=20

A quick search shows that the following packagegroups end up doing somethin=
g similar to what I want to do. These packages span oe-core and meta-oe.
Packagegroup-cli-tools.bb
Packagegroup-core-qt.bb
Packagegroup-core-clutter.bb
Packagegroup-core-basic.bb
Packagegroup-core-x11.bb
Packagegroup-base.bb
Packagegroup-elf-standalone-sdk-target.bb
Packagegroup-core-x11-sato.bb
Packagegroup-core-lsb.bb
Packagegroup-self-hosted.bb

So the concept of custom PACKAGES of course isn't new and although not freq=
uently done applying this concept to packagegroups is also not new.

Out of all the fancy logic we sometimes use in recipes I think this would b=
e one of the simplest for users to comprehend :).



>=20
> --
> Denys
>=20
>=20
> On Wed, Sep 18, 2013 at 03:14:52PM +0000, Maupin, Chase wrote:
> > So if I understand you what you want to do is make one package group wi=
th
> > multiple output packages rather than have for example two package group=
s
> > where one includes the other?
> >
> > One thing I see that might be difficult here is that if I look for what
> > builds the packagegroup-arago-multimedia-tisdk package I would need to
> know
> > that it is inside the packagegroup-arago-multimedia group.
> >
> > I assume you will also have to set the RDEPENDS inside the package grou=
p too
> > for the new packages to make sure they pull in the base package.
> >
> > If the overall goal is to allow people to build a file system without S=
DK
> > specifics I think having packagegroups that build on top of each other =
is a
> > cleaner way than overloading the packagegroup recipes.  However, maybe =
I'm
> > misunderstanding here.
> >
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> > >Sent: Tuesday, September 17, 2013 5:20 PM
> > >To: meta-arago@arago-project.org
> > >Subject: Re: [meta-arago] [for comments][PATCH] packagegroup-
> > >arago-base: Create new tisdk package
> > >
> > >So I want to make some changes but would like everyone's feedback.
> > >
> > >Overall the problem I want to solve is simple.
> > >The Sitara SDK (scripts, example applications, etc..) will be
> > >updated for 3.12+ Linux kernel. This will result in older
> > >platforms am18x, am37x, am335x (3.2 kernel) and am3517 being
> > >unable to utilize these changes and some things will end up being
> > >broken. Realistically outside of individuals who want to recreate
> > >a TI SDK this is not a big deal. However, no filesystem image that
> > >includes gstreamer, qt, openssl, wilink, sgx exist without SDK
> > >specific packages. What I want to do is create a new image that
> > >wouldn't include SDK specific packages therefore providing a full
> > >fledge filesystem (supports qt, gstreamer, wilink, etc..) that is
> > >independent of the sdk and will continue to work for older
> > >platforms .
> > >
> > >Other than the obvious required changes I want to update some of
> > >the current packagegroups. The below patch is an example of some
> > >of the changes I want to make.
> > >
> > >Consolidate some packagegroups:
> > >	Ex. Merge packagegroup-arago-gst with packagegroup-arago-
> > >tisdk-multimedia.
> > >For packagegroup's that include SDK specific packages I want to
> > >create a new package ${PN}-tisdk that will include these SDK
> > >specific packages
> > >Due to the above change the majority of packagegroup recipes will
> > >drop "tisdk" from the recipe name.
> > >	Ex packagegroup-arago-tisdk-multimedia.bb will be renamed to
> > >packagegroup-arago-multimedia.bb.
> > >	     packagegroup-arago-multimedia.bb will then include a
> > >new package ${PN}-tisdk.
> > >
> > >This will allow the new non SDK specific image to include
> > >packagegroup-arago-multimedia but the SDK specific image (i.e.
> > >tisdk-rootfs-image) would include packagegroup-arago-multimedia-
> > >tisdk
> > >
> > >The other approach I could take is to create a bunch more
> > >packagegroups but I think our current number of 28 is already good
> > >enough. :)
> > >
> > >Any questions or concerns?
> > >
> > >> -----Original Message-----
> > >> From: Cooper Jr., Franklin
> > >> Sent: Tuesday, September 17, 2013 4:28 PM
> > >> To: meta-arago@arago-project.org
> > >> Cc: Cooper Jr., Franklin
> > >> Subject: [for comments][PATCH] packagegroup-arago-base: Create
> > >new tisdk
> > >> package
> > >>
> > >> * Consolidate packagegroups by creating a new package that will
> > >contain
> > >> packages
> > >>   specific to the tisdk.
> > >>
> > >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > >> ---
> > >>  .../packagegroups/packagegroup-arago-base-tisdk.bb |   20 -----
> > >---------------
> > >>  .../packagegroups/packagegroup-arago-base.bb       |   18
> > >> +++++++++++++++++-
> > >>  2 files changed, 17 insertions(+), 21 deletions(-)  delete mode
> > >100644 meta-
> > >> arago-distro/recipes-core/packagegroups/packagegroup-arago-base-
> > >tisdk.bb
> > >>
> > >> diff --git a/meta-arago-distro/recipes-
> > >core/packagegroups/packagegroup-
> > >> arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > >> core/packagegroups/packagegroup-arago-base-tisdk.bb
> > >> deleted file mode 100644
> > >> index 16b5df1..0000000
> > >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > >arago-
> > >> base-tisdk.bb
> > >> +++ /dev/null
> > >> @@ -1,20 +0,0 @@
> > >> -DESCRIPTION =3D "Additional packages beyond console packages
> > >shared by TI
> > >> SDKs"
> > >> -LICENSE =3D "MIT"
> > >> -PR =3D "r13"
> > >> -
> > >> -inherit packagegroup
> > >> -
> > >> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >> -
> > >> -RDEPENDS_${PN} =3D "\
> > >> -    dbus \
> > >> -    expat \
> > >> -    glib-2.0 \
> > >> -    libxml2 \
> > >> -    libpcre \
> > >> -    iptables \
> > >> -    iperf \
> > >> -    psplash \
> > >> -    arago-gpl-notice \
> > >> -    nfs-utils-client \
> > >> -    "
> > >> diff --git a/meta-arago-distro/recipes-
> > >core/packagegroups/packagegroup-
> > >> arago-base.bb b/meta-arago-distro/recipes-
> > >> core/packagegroups/packagegroup-arago-base.bb
> > >> index fd9cd15..02242c7 100644
> > >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > >arago-
> > >> base.bb
> > >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > >arago-ba
> > >> +++ se.bb
> > >> @@ -1,6 +1,6 @@
> > >>  DESCRIPTION =3D "Basic task to get a device booting"
> > >>  LICENSE =3D "MIT"
> > >> -PR =3D "r3"
> > >> +PR =3D "r4"
> > >>
> > >>  inherit packagegroup
> > >>
> > >> @@ -23,9 +23,25 @@ ARAGO_EXTRA =3D "\
> > >>      tcpdump \
> > >>      "
> > >>
> > >> +PACKAGES +=3D "${PN}-tisdk"
> > >> +
> > >>  # minimal set of packages - needed to boot  RDEPENDS_${PN} =3D "\
> > >>      ${ARAGO_ALSA_BASE} \
> > >>      ${ARAGO_BASE} \
> > >>      ${ARAGO_EXTRA} \
> > >>      "
> > >> +
> > >> +RDEPENDS_${PN}-tisdk =3D "\
> > >> +    ${PN} \
> > >> +    dbus \
> > >> +    expat \
> > >> +    glib-2.0 \
> > >> +    libxml2 \
> > >> +    libpcre \
> > >> +    iptables \
> > >> +    iperf \
> > >> +    psplash \
> > >> +    arago-gpl-notice \
> > >> +    nfs-utils-client \
> > >> +    "
> > >> --
> > >> 1.7.0.4
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

