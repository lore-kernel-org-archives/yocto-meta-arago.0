Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C7E0F52999
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 21:12:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4LCQ0W004212
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 15:12:26 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4LCQPj020925
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 15:12:26 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 4 Nov 2015 15:12:26 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 7/7] packagegroup-arago-tisdk-matrix:
	update the SGX demos for ti43x
Thread-Index: AQHRFzxTnTyp3MirVECPdzgWv2rT4p6MXFLg
Date: Wed, 4 Nov 2015 21:12:26 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926AE90A5@DLEE08.ent.ti.com>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
	<1446667217-21466-8-git-send-email-h-gou@ti.com>
	<20151104200627.GK25957@edge>
In-Reply-To: <20151104200627.GK25957@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 7/7] packagegroup-arago-tisdk-matrix: update the SGX demos for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 21:12:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, November 04, 2015 3:06 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 7/7] packagegroup-arago-tisdk-matrix:
> update the SGX demos for ti43x
>=20
> On Wed, Nov 04, 2015 at 03:00:17PM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10
> +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > index a6d1b39..a63b8ea 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-matrix.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-matrix.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to include Matrix v2"
> >  LICENSE =3D "MIT"
> > -PR =3D "r45"
> > +PR =3D "r46"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > @@ -49,6 +49,14 @@ MATRIX_SGX_DEMOS_omap-a15 =3D " \
> >      matrix-3d-demo-kmscubevideo \
> >  "
> >
> > +MATRIX_SGX_DEMOS_ti43x =3D " \
> > +    matrix-3d-demo-chameleon \
> > +    matrix-3d-demo-coverflow \
> > +    matrix-3d-demo-navigation \
> > +    matrix-3d-demo-exampleui \
> > +    matrix-3d-demo-kmscube \
>=20
> Same question as before about kmscubevideo - that is used on omap-a15...

kmscubevideo is not supported for AM4, as the video decoding is running on =
IVAHD.

>=20
> > +"
> > +
> >  MATRIX_QT_APPS_keystone =3D ""
> >
> >  MATRIX_APPS =3D ""
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

