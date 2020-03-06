Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9E386529A8
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2020 22:29:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 026MQv0t054130
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 16:26:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583533617;
	bh=XNTwHQusiUw+x99UKkRop9td5zExdI096HNtuGHmo6M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=I3BVU7qG5sHZJxbY63T4q3qAMc8Kmf76i3NJN4Ft9ip3+M2h/+3hADP+U4xGtgsjO
	jrDoAbA6FUShEe2YNiLPah/WaWqfoNaaWobBaQwSE15Pqc9LNwtDo4Hd5Fc2DAQ+ka
	qlYtBKokTsik7kcWxXYQqCUaBiuuAM7Y2dN/JYgg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 026MQvwX092513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2020 16:26:57 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Mar 2020 16:26:57 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1847.007; Fri, 6 Mar 2020 16:26:57 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [thud] [PATCH] packagegroup-arago-tisdk-addons: add
	tensorflow-lite
Thread-Index: AQHV8+BAssncBYT3AUyD8mSb9tUMz6g8RnYA///b5LA=
Date: Fri, 6 Mar 2020 22:26:57 +0000
Message-ID: <f05d086b2cc345169824afc4a943d7ed@ti.com>
References: <20200306174625.16312-1-a0271529@ti.com>
	<20200306182656.GY1628@beryl>
In-Reply-To: <20200306182656.GY1628@beryl>
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
X-List-Received-Date: Fri, 06 Mar 2020 22:29:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 6, 2020 1:27 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [thud] [PATCH] packagegroup-arago-tisdk-addons:
> add tensorflow-lite
>=20
> On Fri, Mar 06, 2020 at 12:46:25PM -0500, Hongmei Gou wrote:
> > * This is for including the examples built from the tensforflow lite pa=
ckage
> >   to the target filesystem at usr/share/tensorflow-lite/examples
> >
> > * As tensorflow-lite is creating static library, tensorflow-lite-demo w=
hich
> >   depends on tensorflow-lite will not bring in the examples folder for
> >   tensorflow-lite to the target filesystem
>=20
> Not really clear from this description - do you package examples in a sep=
arate
> package? Then you need to list that package in RDEPENDS packagegroup
> below.
> Otherwise the standard depency from demo package should be fine.

There used to be a separate tensorflow-lite-examples package for the exampl=
es.
The examples got in the tensorflow-lite package after changing the target l=
ocation
to /usr/share/tensorflow-lite. So, the current tensorflow-lite package itse=
lf contains
the examples (console output).

On the other hand, we newly introduced the tensorflow-lite-demo package whi=
ch
contains demos with GUI display, and it depends on tensorflow-lite.

>=20
> Denys
>=20
>=20
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> > This is applicable to thud only, since zeus/master is now using ti-
> analytics.bb
> >
> >  .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-addons.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > index 583d2c0b..ff34ab95 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-addons.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install additional utilities/demos for SDKs"
> >  LICENSE =3D "MIT"
> > -PR =3D "r77"
> > +PR =3D "r78"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > @@ -153,6 +153,7 @@ ARMNN_PACKAGES =3D "armnn"
> >  EXTRA_PACKAGES_append_ti33x =3D " voxelsdk \
> >                                  arm-compute-library \
> >                                  ${ARMNN_PACKAGES} \
> > +                                tensorflow-lite \
> >                                  tensorflow-lite-demo \
> >                                  pdm-anomaly-detection \
> >  "
> > @@ -160,6 +161,7 @@ EXTRA_PACKAGES_append_ti33x =3D " voxelsdk \
> >  EXTRA_PACKAGES_append_ti43x =3D " voxelsdk \
> >                                  arm-compute-library \
> >                                  ${ARMNN_PACKAGES} \
> > +                                tensorflow-lite \
> >                                  tensorflow-lite-demo \
> >                                  pdm-anomaly-detection \
> >  "
> > @@ -169,12 +171,14 @@ EXTRA_PACKAGES_append_omap-a15 =3D "
> voxelsdk \
> >                                     big-data-ipc-demo-linux-firmware \
> >                                     arm-compute-library \
> >                                     ${ARMNN_PACKAGES} \
> > +                                   tensorflow-lite \
> >                                     tensorflow-lite-demo \
> >                                     pdm-anomaly-detection \
> >  "
> >
> >  EXTRA_PACKAGES_append_am65xx =3D " arm-compute-library \
> >                               ${ARMNN_PACKAGES} \
> > +                             tensorflow-lite \
> >                               tensorflow-lite-demo \
> >                               pdm-anomaly-detection \
> >  "
> > --
> > 2.17.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

