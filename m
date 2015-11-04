Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 24AEC52999
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 21:11:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4LBago013805
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 15:11:36 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4LBaVE019357
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 15:11:36 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Wed, 4 Nov 2015 15:11:36 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 6/7] matrix-gui-3d-demos: add kmscube for
	ti43x
Thread-Index: AQHRFzwrtOdTPxHCrE6qchT0XcP/A56MW9Uw
Date: Wed, 4 Nov 2015 21:11:36 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926AE905F@DLEE08.ent.ti.com>
References: <1446667217-21466-1-git-send-email-h-gou@ti.com>
	<1446667217-21466-7-git-send-email-h-gou@ti.com>
	<20151104200520.GJ25957@edge>
In-Reply-To: <20151104200520.GJ25957@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 6/7] matrix-gui-3d-demos: add kmscube for ti43x
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
X-List-Received-Date: Wed, 04 Nov 2015 21:11:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please see below inline.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, November 04, 2015 3:05 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 6/7] matrix-gui-3d-demos: add kmscube
> for ti43x
>=20
> On Wed, Nov 04, 2015 at 03:00:16PM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb | 6
> > +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git
> > a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> > b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> > index 4373d5f..710bb75 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-
> demos_2.0.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://gitorious.org/matrix-gui-
> v2/matrix-gui-v2-apps"
> >
> >  require matrix-gui-apps-git.inc
> >
> > -PR =3D "${INC_PR}.5"
> > +PR =3D "${INC_PR}.6"
> >
> >  S =3D "${WORKDIR}/git/3d_apps"
> >
> > @@ -33,6 +33,10 @@ PACKAGES_append_omap-a15 =3D " \
> >              matrix-3d-demo-kmscubevideo \  "
> >
> > +PACKAGES_append_ti43x =3D " \
> > +            matrix-3d-demo-kmscube \
>=20
> What about kmscubevideo one?

kmscubevideo is not supported for AM4, as the video decoding is running on =
IVAHD.

>=20
> > +"
> > +
> >  MATRIX_3D_DEMO_SGX_QAF_PARAM =3D "1000"
> >
> >  do_install_prepend() {
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

