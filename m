Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 17D1F529AD
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2020 18:31:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02AITO5d115481
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2020 13:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583864964;
	bh=MPsBDZqirZdtIyji1GtffIYsjIvLCDS0HVHu4H1iaO0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=X3w3L1tGdnblevLJE0/Oj47nBB5iiNx6vKONc3I8T0WpUBP9KM40SLyN7C1JFFpYp
	Q8/eJj/UUnLxzwxWgD1J+WekxVOeVjlFRDtYsbTmZshS1gB5GvY4Eg3UXW4x/MzwR7
	ORAFEU7+ziITwzZte/GUWpNMwSPTMjOsI8d3yTBY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02AITOgp080722
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2020 13:29:24 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 10 Mar 2020 13:29:24 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1847.007; Tue, 10 Mar 2020 13:29:24 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud] [PATCH] packagegroup-arago-tisdk-addons: add
	tensorflow-lite
Thread-Index: AQHV8+BAssncBYT3AUyD8mSb9tUMz6g8RnYA///b5LCABiydAP//2ZPA
Date: Tue, 10 Mar 2020 18:29:24 +0000
Message-ID: <a5deee76906c40299319b2c9dc4385e3@ti.com>
References: <20200306174625.16312-1-a0271529@ti.com>
	<20200306182656.GY1628@beryl> <f05d086b2cc345169824afc4a943d7ed@ti.com>
	<20200310153456.GV2301@beryl>
In-Reply-To: <20200310153456.GV2301@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.112.213]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud] [PATCH] packagegroup-arago-tisdk-addons: add tensorflow-lite
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
X-List-Received-Date: Tue, 10 Mar 2020 18:31:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 10, 2020 11:35 AM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [thud] [PATCH] packagegroup-arago-tisdk-addons:
> add tensorflow-lite
>=20
> On Fri, Mar 06, 2020 at 05:26:57PM -0500, Gou, Hongmei wrote:
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Friday, March 6, 2020 1:27 PM
> > > To: Gou, Hongmei
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [thud] [PATCH] packagegroup-arago-tisdk-
> addons:
> > > add tensorflow-lite
> > >
> > > On Fri, Mar 06, 2020 at 12:46:25PM -0500, Hongmei Gou wrote:
> > > > * This is for including the examples built from the tensforflow lit=
e
> package
> > > >   to the target filesystem at usr/share/tensorflow-lite/examples
> > > >
> > > > * As tensorflow-lite is creating static library, tensorflow-lite-de=
mo
> which
> > > >   depends on tensorflow-lite will not bring in the examples folder =
for
> > > >   tensorflow-lite to the target filesystem
> > >
> > > Not really clear from this description - do you package examples in a
> separate
> > > package? Then you need to list that package in RDEPENDS packagegroup
> > > below.
> > > Otherwise the standard depency from demo package should be fine.
> >
> > There used to be a separate tensorflow-lite-examples package for the
> examples.
> > The examples got in the tensorflow-lite package after changing the targ=
et
> location
> > to /usr/share/tensorflow-lite. So, the current tensorflow-lite package =
itself
> contains
> > the examples (console output).
> >
> > On the other hand, we newly introduced the tensorflow-lite-demo
> package which
> > contains demos with GUI display, and it depends on tensorflow-lite.
>=20
> Sorry for the delay.
>=20
> So, tensorflow-lite-demo links *statically* against tensorflow-lite and h=
ence
> there's no RDEPENDS preserved, which was expected to be there for the
> proper
> packaging to work...
>=20
> Is static linking the expected behavior? Are there plans to link dynamica=
lly?

Yes, the static linking is expected - the upstream tensorflow lite package =
is creating static library.
No plan to use dynamical linking for this quarter's release.

>=20
>=20
> Second question - should examples from tensorflow-lite still be packaged
> separately? I understand they got moved and now picked up by the main
> package
> automatically. But there is an easy way to get the old behavior by prepen=
ding
> examples package to the PACKAGES list, instead of appending.

Agree with you that moving the examples back as a separate tensorflow-lite-=
examples package is a better solution.
=20
>=20
> I guess I can merge this to thud as is, but would like to clean this up g=
oing
> forward, so please answer above questions anyway. Thanks!

Thanks for merging this to thud!

>=20
> Denys
>=20
>=20
> > > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > > ---
> > > > This is applicable to thud only, since zeus/master is now using ti-
> > > analytics.bb
> > > >
> > > >  .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 ++=
+++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > > arago-tisdk-addons.bb b/meta-arago-distro/recipes-
> > > core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > > index 583d2c0b..ff34ab95 100644
> > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-
> > > tisdk-addons.bb
> > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > arago-tisdk-addons.bb
> > > > @@ -1,6 +1,6 @@
> > > >  DESCRIPTION =3D "Task to install additional utilities/demos for SD=
Ks"
> > > >  LICENSE =3D "MIT"
> > > > -PR =3D "r77"
> > > > +PR =3D "r78"
> > > >
> > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >
> > > > @@ -153,6 +153,7 @@ ARMNN_PACKAGES =3D "armnn"
> > > >  EXTRA_PACKAGES_append_ti33x =3D " voxelsdk \
> > > >                                  arm-compute-library \
> > > >                                  ${ARMNN_PACKAGES} \
> > > > +                                tensorflow-lite \
> > > >                                  tensorflow-lite-demo \
> > > >                                  pdm-anomaly-detection \
> > > >  "
> > > > @@ -160,6 +161,7 @@ EXTRA_PACKAGES_append_ti33x =3D " voxelsdk \
> > > >  EXTRA_PACKAGES_append_ti43x =3D " voxelsdk \
> > > >                                  arm-compute-library \
> > > >                                  ${ARMNN_PACKAGES} \
> > > > +                                tensorflow-lite \
> > > >                                  tensorflow-lite-demo \
> > > >                                  pdm-anomaly-detection \
> > > >  "
> > > > @@ -169,12 +171,14 @@ EXTRA_PACKAGES_append_omap-a15 =3D "
> > > voxelsdk \
> > > >                                     big-data-ipc-demo-linux-firmwar=
e \
> > > >                                     arm-compute-library \
> > > >                                     ${ARMNN_PACKAGES} \
> > > > +                                   tensorflow-lite \
> > > >                                     tensorflow-lite-demo \
> > > >                                     pdm-anomaly-detection \
> > > >  "
> > > >
> > > >  EXTRA_PACKAGES_append_am65xx =3D " arm-compute-library \
> > > >                               ${ARMNN_PACKAGES} \
> > > > +                             tensorflow-lite \
> > > >                               tensorflow-lite-demo \
> > > >                               pdm-anomaly-detection \
> > > >  "
> > > > --
> > > > 2.17.1
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

