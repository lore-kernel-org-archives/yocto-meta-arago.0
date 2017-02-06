Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C8D645209B
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2017 23:09:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v16N9RMC018380
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 17:09:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16N9M7K027704
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 17:09:22 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 6 Feb 2017 17:09:22 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/krogoth][PATCH 5/6]
	packagegroup-arago-tisdk-matrix: add barcode-roi demo
Thread-Index: AQHSgKRg4CgitmfREkm1WBKJpG+EvKFcYIeggABuGQD//8wZUA==
Date: Mon, 6 Feb 2017 23:09:21 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926CD3656@DLEE08.ent.ti.com>
References: <1486160539-23523-1-git-send-email-h-gou@ti.com>
	<1486160539-23523-6-git-send-email-h-gou@ti.com>
	<20170206181101.GI25590@edge>
	<2E957F12D11D904590FA9AF86D366BD926CD354E@DLEE08.ent.ti.com>
	<20170206201448.GJ25590@edge>
In-Reply-To: <20170206201448.GJ25590@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/krogoth][PATCH 5/6] packagegroup-arago-tisdk-matrix: add barcode-roi demo
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
X-List-Received-Date: Mon, 06 Feb 2017 23:09:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

V2 patch has been submitted.

Thanks,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, February 06, 2017 3:15 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/krogoth][PATCH 5/6] packagegroup-arago-
> tisdk-matrix: add barcode-roi demo
>=20
> Hongmei,
>=20
> I see. We may need a separate "opencv" flag in MACHINE_FEATURES in the
> future.
>=20
> For now, can you please group barcode-roi in this packagegroup according =
to
> whether it uses opencl or not. Thanks.
>=20
> --
> Denys
>=20
>=20
> On Mon, Feb 06, 2017 at 02:49:16PM -0500, Gou, Hongmei wrote:
> > Hi Denys,
> >
> > The barcode-roi demo is included for AM3/AM4/DRA7xx/Keystone. It does
> depend on OpenCV, but not necessarily on OpenCL.
> >
> > For dra7xx and keystone, some OpenCV kernels are dispatched to DSP via
> OpenCL, thus there can be dependency on OpenCL.
> > For AM3 and AM4, OpenCV kernels run on ARM only, and there is no
> dependency on OpenCL.
> >
> > Thanks,
> > Hongmei
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Monday, February 06, 2017 1:11 PM
> > > To: Gou, Hongmei
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [morty/krogoth][PATCH 5/6] packagegroup-
> arago-
> > > tisdk-matrix: add barcode-roi demo
> > >
> > > Hongmei,
> > >
> > > Can you please re-do this patch due to this change:
> > > http://arago-project.org/git/?p=3Dmeta-
> > > arago.git;a=3Dcommitdiff;h=3D908f169117c7589eabc78a392e8c43eb099553cd
> > >
> > > barcode-roi depends on opencv/opencl and hence should be in
> > > MATRIX_OPENCL_APPS list, which gets conditionally included based on
> > > corresponding MACHINE_FEATURE.
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Fri, Feb 03, 2017 at 05:22:18PM -0500, Hongmei Gou wrote:
> > > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > > ---
> > > >  .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> | 6
> > > +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-
> > > arago-tisdk-matrix.bb b/meta-arago-distro/recipes-
> > > core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> > > > index a851ed5..7358da4 100644
> > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-
> > > tisdk-matrix.bb
> > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > > arago-tisdk-matrix.bb
> > > > @@ -1,6 +1,6 @@
> > > >  DESCRIPTION =3D "Task to include Matrix v2"
> > > >  LICENSE =3D "MIT"
> > > > -PR =3D "r61"
> > > > +PR =3D "r62"
> > > >
> > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >
> > > > @@ -76,6 +76,7 @@ MATRIX_APPS_append_ti33x =3D "        \
> > > >      matrix-gui-pm-demos-governor    \
> > > >                                      \
> > > >      matrix-gui-ethernet-demos       \
> > > > +    matrix-machinevision-demo-barcoderoi \
> > > >  "
> > > >
> > > >  MATRIX_APPS_append_ti43x =3D "        \
> > > > @@ -91,6 +92,7 @@ MATRIX_APPS_append_ti43x =3D "        \
> > > >                                      \
> > > >      matrix-gui-apps-dual-camera     \
> > > >      matrix-gui-apps-image-gallery   \
> > > > +    matrix-machinevision-demo-barcoderoi \
> > > >  "
> > > >
> > > >  MATRIX_APPS_append_omap-a15 =3D "     \
> > > > @@ -105,6 +107,7 @@ MATRIX_APPS_append_omap-a15 =3D "     \
> > > >      matrix-gui-generic-pm           \
> > > >      matrix-gui-clocks               \
> > > >      matrix-gui-pm-demos-governor    \
> > > > +    matrix-machinevision-demo-barcoderoi \
> > > >  "
> > > >
> > > >  MATRIX_APPS_append_dra7xx +=3D " \
> > > > @@ -116,6 +119,7 @@ MATRIX_APPS_append_keystone =3D " \
> > > >      matrix-gui-utility-demos    \
> > > >      matrix-mc-demo-ipc          \
> > > >      matrix-multimedia-demo-dsp66imgproc-f2f \
> > > > +    matrix-machinevision-demo-barcoderoi-f2f \
> > > >  "
> > > >
> > > >  RDEPENDS_${PN} =3D "        \
> > > > --
> > > > 1.9.1
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

