Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 68E4D5297D
	for <meta-arago@arago-project.org>;
	Wed, 29 Mar 2017 17:55:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2THtZAH010844
	for <meta-arago@arago-project.org>; Wed, 29 Mar 2017 12:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490810135;
	bh=4NOSb6OIl0NMhePZP14Z9byOlK+I/vasCwnKUf8YVFQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=GZiakGtGD9VqZFMoUSSG0lau3aaJi6wAHMPBuu2HDAMBfbDHklRlbzHfr6ub4q/fE
	zkyW2MJ96RwvzrEygp4fM1v5xEp7KyRaqm/kWuGY/N8x9tHIUiYDQln6wWn7JYoWf4
	7hLP5ac5XtB3Zf1WSlXzOrIfhlsNc3kXfDpCKKVc=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2THtZeO030062
	for <meta-arago@arago-project.org>; Wed, 29 Mar 2017 12:55:35 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Wed, 29 Mar 2017 12:55:34 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/krogoth][PATCH 3/4 v3]
	matrix-gui-machinevision-demos: add simple-people-tracking demo
Thread-Index: AQHSqLVWiD5CNq1mUUiZuZbAiypWtaGsGXjw
Date: Wed, 29 Mar 2017 17:55:34 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D010A5@DLEE08.ent.ti.com>
References: <1490809856-2829-1-git-send-email-h-gou@ti.com>
	<20170329175311.GE11364@edge>
In-Reply-To: <20170329175311.GE11364@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: [morty/krogoth][PATCH 3/4 v3] matrix-gui-machinevision-demos: add simple-people-tracking demo
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
X-List-Received-Date: Wed, 29 Mar 2017 17:55:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys. I will resubmit all the patches shortly.

Regards,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 29, 2017 1:53 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org; Senicic, Djordje
> Subject: Re: [meta-arago] [morty/krogoth][PATCH 3/4 v3] matrix-gui-
> machinevision-demos: add simple-people-tracking demo
>=20
> Hongmei,
>=20
> Thanks. Would you mind re-submitting the entire series again with all the
> latest patches? It's getting hard for me to pick and choose the right rev=
isions
> by now... Thanks.
>=20
> --
> Denys
>=20
>=20
> On Wed, Mar 29, 2017 at 01:50:56PM -0400, Hongmei Gou wrote:
> > Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> > V3 changes:
> > * Remove voxelsdk dependency.
> >   voxelsdk has been added through packagegroup.
> >
> >  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc  |  4 ++=
--
> >  .../recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb  | 10
> +++++++++-
> >  2 files changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.=
inc
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > index 02156c8..0ae0d21 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D
> "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
> >  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
> >
> >  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-
> apps.git;protocol=3Dgit;branch=3D${BRANCH}"
> > -SRCREV =3D "b96f7c7365c166bf59abf6486912eaad2e0ad607"
> > +SRCREV =3D "7ab39e827e65c35f4e37d1142a45071f670395fe"
> >  BRANCH =3D "master"
> > -INC_PR =3D "r45"
> > +INC_PR =3D "r46"
> >
> >  # Pull in the base package for installing matrix applications
> >  require matrix-gui-apps.inc
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
> machinevision-demos_2.0.bb b/meta-arago-extras/recipes-
> core/matrix/matrix-gui-machinevision-demos_2.0.bb
> > index 9c7eb92..4adb7bc 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-
> demos_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-
> demos_2.0.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://gitorious.org/matrix-gui-
> v2/matrix-gui-v2-apps"
> >
> >  require recipes-core/matrix/matrix-gui-apps-git.inc
> >
> > -PR =3D "${INC_PR}.2"
> > +PR =3D "${INC_PR}.3"
> >
> >  inherit allarch
> >
> > @@ -17,6 +17,7 @@ FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
> >  PACKAGES =3D "matrix-machinevision-demo-dlp3dscanner \
> >              matrix-machinevision-demo-barcoderoi \
> >              matrix-machinevision-demo-barcoderoi-f2f \
> > +            matrix-machinevision-demo-simplepeopletracking \
> >  "
> >
> >  RDEPENDS_matrix-machinevision-demo-dlp3dscanner_dra7xx =3D " \
> > @@ -34,6 +35,10 @@ RDEPENDS_matrix-machinevision-demo-barcoderoi-
> f2f =3D " \
> >      barcode-roi \
> >  "
> >
> > +RDEPENDS_matrix-machinevision-demo-simplepeopletracking =3D " \
> > +    ${MACHINEVISION_RDEPENDS} \
> > +"
> > +
> >  FILES_matrix-machinevision-demo-dlp3dscanner    =3D
> "${MATRIX_APP_DIR}/machinevision_dlp_3d_scanner/*"
> >  FILES_matrix-machinevision-demo-dlp3dscanner   +=3D
> "${bindir}/runDlp3DScanner.sh"
> >
> > @@ -41,3 +46,6 @@ FILES_matrix-machinevision-demo-barcoderoi    =3D
> "${MATRIX_APP_DIR}/machinevision
> >  FILES_matrix-machinevision-demo-barcoderoi   +=3D
> "${bindir}/runBarcodeRoi.sh"
> >  FILES_matrix-machinevision-demo-barcoderoi-f2f =3D
> "${MATRIX_APP_DIR}/machinevision_barcode_roi_f2f/*"
> >  FILES_matrix-machinevision-demo-barcoderoi-f2f +=3D
> "${bindir}/runBarcodeRoiSave2File.sh"
> > +
> > +FILES_matrix-machinevision-demo-simplepeopletracking   =3D
> "${MATRIX_APP_DIR}/machinevision_simple_people_tracking/*"
> > +FILES_matrix-machinevision-demo-simplepeopletracking   +=3D
> "${bindir}/runSimplePeopleTracking.sh"
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

