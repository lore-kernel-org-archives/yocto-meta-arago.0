Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 280EF52A43
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 17:37:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AHbmwB018056
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 11:37:48 -0600
Received: from DLEE51.ent.ti.com (dlee51.ent.ti.com [157.170.170.85])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AHbk7m001719
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 11:37:47 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE51.ent.ti.com ([fe80::240e:6c25:3382:183d%26]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 11:37:46 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
	psplash	conditional with splash feature
Thread-Index: AQHQRUrSpfcJZ/Wr3ky4aFvJIjT345zqDUvAgABqmYCAAAGjgIAAAd2A//+p84A=
Date: Tue, 10 Feb 2015 17:37:46 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7FE20D@DFLE08.ent.ti.com>
References: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7FE138@DFLE08.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49058111635@DLEE11.ent.ti.com>
	<20150210163649.GF13231@edge>
	<4F9216F96E5DF9428610502835A9F49058111673@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058111673@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Tue, 10 Feb 2015 17:37:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Nelson, Sam
> Sent: Tuesday, February 10, 2015 10:43 AM
> To: Dmytriyenko, Denys
> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
> psplash conditional with splash feature
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, February 10, 2015 11:37 AM
> > To: Nelson, Sam
> > Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
> > psplash conditional with splash feature
> >
> > On Tue, Feb 10, 2015 at 04:30:57PM +0000, Nelson, Sam wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Cooper Jr., Franklin
> > > > Sent: Tuesday, February 10, 2015 11:16 AM
> > > > To: Nelson, Sam; meta-arago@arago-project.org
> > > > Subject: RE: [meta-arago] [PATCH] packagegroup-arago-base-tisdk:
> > > > Make psplash conditional with splash feature
> > > >
> > > > Splash is not a distro feature we use so this will essentially
> > > > remove it from
> > all
> > > > devices.
> > > >
> > > > You can either put this in a packagegroup that isn't included for
> > > > headless filesystems. But pick one that makes sense.
> > > > You can conditional include or not include psplash depending on
> machines.
> > > > You can use machine features and check for touchscreen. Although
> > > > some
> > kind
> > > > of generic "display" machine feature would be better. But it
> > > > currently
> > doesn't
> > > > exist.
> > > > Or you can add splash as a distro feature for the various branding
> > > > files excluding yours.
> >
> > > [Sam] Do you see any issues using the "IMAGE_FEATURES" instead?
> > > Core-image-base include splash by default ( so all products will
> > > include psplash).
[Franklin] I've never used it and don't really understand the purpose but i=
f Denys recommends it then I'm sure its not a bad option.
> >
> > That's the wrong assumption.
> >
> [Sam] Ok.  Thanks for the clarification. Is there any other alternative
> suggestion?
> >
> > > And I am thinking of removing it for Keystone using branding file
> > > and can be done for any other headless distribution similarly.
> >
> > Won't work due to above.
> >
> >
> > > > > -----Original Message-----
> > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > > > > Sent: Tuesday, February 10, 2015 10:01 AM
> > > > > To: meta-arago@arago-project.org
> > > > > Subject: [meta-arago] [PATCH] packagegroup-arago-base-tisdk:
> > > > > Make
> > psplash
> > > > > conditional with splash feature
> > > > >
> > > > > - This is meant to avoid error message with headless
> > > > > distribution
> > > > >
> > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > ---
> > > > >  .../packagegroups/packagegroup-arago-base-tisdk.bb |    4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git
> > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > > > arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > > > > core/packagegroups/packagegroup-arago-base-tisdk.bb
> > > > > index 7652622..7b71aa4 100644
> > > > > ---
> > > > > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag
> > > > > o-
> > > > > base-tisdk.bb
> > > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-
> > > > > base-tisdk.bb
> > > > > @@ -1,6 +1,6 @@
> > > > >  DESCRIPTION =3D "Additional packages beyond console packages
> > > > > shared by
> > TI
> > > > > SDKs"
> > > > >  LICENSE =3D "MIT"
> > > > > -PR =3D "r15"
> > > > > +PR =3D "r16"
> > > > >
> > > > >  inherit packagegroup
> > > > >
> > > > > @@ -12,7 +12,7 @@ RDEPENDS_${PN} =3D "\
> > > > >      libpcre \
> > > > >      iptables \
> > > > >      iperf \
> > > > > -    psplash \
> > > > > +    ${@base_contains('DISTRO_FEATURES', 'splash', 'psplash',
> > > > > + '',d)} \
> > > > >      arago-gpl-notice \
> > > > >      arago-feed-config \
> > > > >      nfs-utils-client \
> > > > > --
> > > > > 1.7.9.5
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

