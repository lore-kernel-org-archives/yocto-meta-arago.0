Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0BD4652A43
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 16:43:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AGhVVq014666
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:43:31 -0600
Received: from DFLE51.ent.ti.com (dfle51.ent.ti.com [10.64.6.12])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGhUZl004231
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:43:30 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE51.ent.ti.com ([fe80::f88a:66e:ad57:ae4a%17]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 10:43:30 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
	psplash	conditional with splash feature
Thread-Index: AQHQRUznhfw48FDGlk6EVb9m4bMh7pzqEZ+AgABn5ID//5xcMA==
Date: Tue, 10 Feb 2015 16:43:29 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058111673@DLEE11.ent.ti.com>
References: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7FE138@DFLE08.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49058111635@DLEE11.ent.ti.com>
	<20150210163649.GF13231@edge>
In-Reply-To: <20150210163649.GF13231@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Tue, 10 Feb 2015 16:43:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, February 10, 2015 11:37 AM
> To: Nelson, Sam
> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
> psplash conditional with splash feature
>=20
> On Tue, Feb 10, 2015 at 04:30:57PM +0000, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Cooper Jr., Franklin
> > > Sent: Tuesday, February 10, 2015 11:16 AM
> > > To: Nelson, Sam; meta-arago@arago-project.org
> > > Subject: RE: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
> > > psplash conditional with splash feature
> > >
> > > Splash is not a distro feature we use so this will essentially remove=
 it from
> all
> > > devices.
> > >
> > > You can either put this in a packagegroup that isn't included for hea=
dless
> > > filesystems. But pick one that makes sense.
> > > You can conditional include or not include psplash depending on machi=
nes.
> > > You can use machine features and check for touchscreen. Although some
> kind
> > > of generic "display" machine feature would be better. But it currentl=
y
> doesn't
> > > exist.
> > > Or you can add splash as a distro feature for the various branding fi=
les
> > > excluding yours.
>=20
> > [Sam] Do you see any issues using the "IMAGE_FEATURES" instead?
> > Core-image-base include splash by default ( so all products will includ=
e
> > psplash).
>=20
> That's the wrong assumption.
>=20
[Sam] Ok.  Thanks for the clarification. Is there any other alternative sug=
gestion? =20
>=20
> > And I am thinking of removing it for Keystone using branding file
> > and can be done for any other headless distribution similarly.
>=20
> Won't work due to above.
>=20
>=20
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > > > Sent: Tuesday, February 10, 2015 10:01 AM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
> psplash
> > > > conditional with splash feature
> > > >
> > > > - This is meant to avoid error message with headless distribution
> > > >
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > ---
> > > >  .../packagegroups/packagegroup-arago-base-tisdk.bb |    4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-
> > > > arago-base-tisdk.bb b/meta-arago-distro/recipes-
> > > > core/packagegroups/packagegroup-arago-base-tisdk.bb
> > > > index 7652622..7b71aa4 100644
> > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-
> > > > base-tisdk.bb
> > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-
> > > > base-tisdk.bb
> > > > @@ -1,6 +1,6 @@
> > > >  DESCRIPTION =3D "Additional packages beyond console packages share=
d by
> TI
> > > > SDKs"
> > > >  LICENSE =3D "MIT"
> > > > -PR =3D "r15"
> > > > +PR =3D "r16"
> > > >
> > > >  inherit packagegroup
> > > >
> > > > @@ -12,7 +12,7 @@ RDEPENDS_${PN} =3D "\
> > > >      libpcre \
> > > >      iptables \
> > > >      iperf \
> > > > -    psplash \
> > > > +    ${@base_contains('DISTRO_FEATURES', 'splash', 'psplash', '',d)=
} \
> > > >      arago-gpl-notice \
> > > >      arago-feed-config \
> > > >      nfs-utils-client \
> > > > --
> > > > 1.7.9.5
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

