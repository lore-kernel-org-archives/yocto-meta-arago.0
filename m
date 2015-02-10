Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B485A529B3
	for <meta-arago@arago-project.org>;
	Tue, 10 Feb 2015 16:20:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1AGKPWa003278
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:20:25 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1AGKNQt017547
	for <meta-arago@arago-project.org>; Tue, 10 Feb 2015 10:20:23 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 10 Feb 2015 10:20:23 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
	psplash conditional with splash feature
Thread-Index: AQHQRUrNFd/v5qsR9U68oP7pkpUVtZzqc7sA//+cfwA=
Date: Tue, 10 Feb 2015 16:20:22 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058111610@DLEE11.ent.ti.com>
References: <1423584075-30606-1-git-send-email-sam.nelson@ti.com>
	<20150210161603.GD13231@edge>
In-Reply-To: <20150210161603.GD13231@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-base-tisdk: Make psplash conditional with splash feature
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
X-List-Received-Date: Tue, 10 Feb 2015 16:20:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, February 10, 2015 11:16 AM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] packagegroup-arago-base-tisdk: Make
> psplash conditional with splash feature
>=20
> On Tue, Feb 10, 2015 at 11:01:15AM -0500, Sam Nelson wrote:
> > - This is meant to avoid error message with headless distribution
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-base-tisdk.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk.bb
> > index 7652622..7b71aa4 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> base-tisdk.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> base-tisdk.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Additional packages beyond console packages shared by=
 TI
> SDKs"
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
>=20
> There's no "splash" in DISTRO_FEATURES. There is one in IMAGE_FEATURES
> though,
> which we don't use, but probably should.
[Sam] Thanks. I will make it depend on IMAGE_FEATURES.
>=20
>=20
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

