Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0E7CF52988
	for <meta-arago@arago-project.org>;
	Mon,  2 Mar 2020 19:39:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 022Jbmrk054636
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2020 13:37:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583177868;
	bh=u8Xujw2jRc/7/TmdH3rNwPtt3upwVJoRPhAT/WS+m74=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ICQipa+/1tMADf4kggTdyv2rYgkiSiEAkgQV7Oeng/CH+QhJlpLaZqI5/jJ7qpM7o
	VdxUZ0sNtpzv0enU+pbBb/YLNZMv6Ouce0zqNNFcIqkfQSZ++V/SLpxKB4ARPkorMC
	vinBnZ2SICW0VOoxA2nZtWgTFkIVQjpabNFMHVT0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 022JbmIM123821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2020 13:37:48 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 2 Mar 2020 13:37:48 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1847.007; Mon, 2 Mar 2020 13:37:48 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [zeus/master] [PATCH] tensorflow-lite-demo: Bump
	SRCREV and add tidl offload support for AM5
Thread-Index: AQHV7ou+FTjRPNORq0GHFk7qYWtDHKg2EICA//+mQwA=
Date: Mon, 2 Mar 2020 19:37:48 +0000
Message-ID: <e0086f3b8c7a4d69a335dc9b8e24d85d@ti.com>
References: <20200228225858.24538-1-a0271529@ti.com>
	<20200302185805.GQ2466@beryl>
In-Reply-To: <20200302185805.GQ2466@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.112.213]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [zeus/master] [PATCH] tensorflow-lite-demo: Bump SRCREV and add tidl offload support for AM5
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
X-List-Received-Date: Mon, 02 Mar 2020 19:39:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 2, 2020 1:58 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [zeus/master] [PATCH] tensorflow-lite-demo:
> Bump SRCREV and add tidl offload support for AM5
>=20
> On Fri, Feb 28, 2020 at 05:58:58PM -0500, Hongmei Gou wrote:
> > * Build the demos with tidl offload option for AM5
> > * Include mobilenet v1 model for demonstrating tidl offload
> > * Remove the demo scripts under the files directory. The scripts are no=
w
> >   maintained in the source repo.
> > * Make adjustments with the updated Makefile
> >
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  .../files/run_classification.sh               |  7 -----
> >  .../tensorflow-lite/files/run_segmentation.sh |  8 ------
> >  .../tensorflow-lite-demo_git.bb               | 27 +++++++++++--------
> >  3 files changed, 16 insertions(+), 26 deletions(-)
> >  delete mode 100644 meta-arago-extras/recipes-support/tensorflow-
> lite/files/run_classification.sh
> >  delete mode 100644 meta-arago-extras/recipes-support/tensorflow-
> lite/files/run_segmentation.sh
> >
> > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> lite/files/run_classification.sh b/meta-arago-extras/recipes-
> support/tensorflow-lite/files/run_classification.sh
> > deleted file mode 100644
> > index b2ad7fc4..00000000
> > --- a/meta-arago-extras/recipes-support/tensorflow-
> lite/files/run_classification.sh
> > +++ /dev/null
> > @@ -1,7 +0,0 @@
> > -#!/bin/sh
> > -
> > -cd /usr/share/tensorflow-lite/demos
> > -
> > -# Run tflite_classification binary with the model, the input image, an=
d the
> label file specified.
> > -# Classification label is overlayed with the input image. Right click =
the
> image display window to exit.
> > -./tflite_classification -m ../examples/mobilenet_v1_1.0_224_quant.tfli=
te -i
> ../examples/grace_hopper.bmp -l ../examples/labels.txt
> > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> lite/files/run_segmentation.sh b/meta-arago-extras/recipes-
> support/tensorflow-lite/files/run_segmentation.sh
> > deleted file mode 100644
> > index 5caea127..00000000
> > --- a/meta-arago-extras/recipes-support/tensorflow-
> lite/files/run_segmentation.sh
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -#!/bin/sh
> > -
> > -cd /usr/share/tensorflow-lite/demos
> > -
> > -# Run tflite_segmentation binary with the model and the input image
> specified.
> > -# The display window shows the input(resized) image, segmentation map,
> overlay
> > -# of the former two. Right click the image display window to exit.
> > -./tflite_segmentation -m ./deeplabv3_257_mv_gpu.tflite -i
> ./bird_segmentation.bmp
> > diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorfl=
ow-
> lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-
> lite/tensorflow-lite-demo_git.bb
> > index 9b99b63c..57d6ef20 100644
> > --- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite=
-
> demo_git.bb
> > +++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite=
-
> demo_git.bb
> > @@ -1,33 +1,33 @@
> > -DESCRIPTION =3D "Tensorflow Lite Demo with input and display via OpenC=
V
> and TIDL acceleration for AM5"
> > +SUMMARY =3D "Tensorflow Lite Demo with input and display via OpenCV
> and TIDL acceleration for AM5"
> >  LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd8927f3331d2b3e321b7dd1925166d25"
> >
> >  DEPENDS =3D "tensorflow-lite flatbuffers opencv"
> > +DEPENDS_append_dra7xx =3D " tidl-api"
> >
> >  COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> >  PV =3D "01.00.00"
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >  BRANCH =3D "master"
> >  SRC_URI  =3D "git://git.ti.com/apps/tensorflow-lite-
> examples.git;protocol=3Dgit;branch=3D${BRANCH} \
> >
> http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/
> deeplabv3_257_mv_gpu.tflite;name=3Ddeeplabv3;subdir=3D${WORKDIR}/model
> ;destsuffix=3Dmodel \
> > -            http://raw.githubusercontent.com/google-
> coral/edgetpu/master/test_data/bird_segmentation.bmp;name=3Dbird_segm
> entation;subdir=3D${WORKDIR}/test_data;destsuffix=3Dtest_data \
> > -            file://run_classification.sh \
> > -            file://run_segmentation.sh"
> > +
> http://storage.googleapis.com/download.tensorflow.org/models/mobilenet
> _v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=3Dmobilenetv1;subdir=3D${W
> ORKDIR}/model;destsuffix=3Dmodel \
> > +            http://raw.githubusercontent.com/google-
> coral/edgetpu/master/test_data/bird_segmentation.bmp;name=3Dbird_segm
> entation;subdir=3D${WORKDIR}/test_data;destsuffix=3Dtest_data"
> >
> >  SRC_URI[deeplabv3.md5sum] =3D "4a24db5a5fb05c47586a1197765e8548"
> >  SRC_URI[deeplabv3.sha256sum] =3D
> "68a539782c2c6a72f8aac3724600124a85ed977162b44e84cbae5db717c933c6"
> > +SRC_URI[mobilenetv1.md5sum] =3D "d5f69cef81ad8afb335d9727a17c462a"
> > +SRC_URI[mobilenetv1.sha256sum] =3D
> "1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
> >  SRC_URI[bird_segmentation.md5sum] =3D
> "fc3202ac4e3033b36df3043de6dc32c9"
> >  SRC_URI[bird_segmentation.sha256sum] =3D
> "e43cedd29ab385db787531c8a6cdcb31c5e4292af34f242877ed40611e502670"
> >
> > -SRCREV =3D "d84f1d43585c0db2fa6a1c15db9145ab53f859ce"
> > +SRCREV =3D "bd6a429c21f96d5112e0b6dea44a13b748eefd74"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -CXXFLAGS_append =3D " -O3 -DNDEBUG -fPIC -I${STAGING_INCDIR}"
> > -LDFLAGS_append =3D " -L${STAGING_LIBDIR}"
> > -
> >  EXTRA_OEMAKE =3D "\
> >      'CXX=3D${CXX}' \
> >      'CXXFLAGS=3D${CXXFLAGS}' \
> > @@ -37,8 +37,12 @@ EXTRA_OEMAKE =3D "\
> >      'TARGET=3D${TARGET_OS}' \
> >      'TARGET_ARCH=3D${TARGET_ARCH}'"
> >
> > +EXTRA_OEMAKE +=3D "SYSROOT_INCDIR=3D"${STAGING_INCDIR}"
> SYSROOT_LIBDIR=3D"${STAGING_LIBDIR}" \
> > +                 TIDL_API_DIR=3D"${STAGING_DATADIR}/ti/tidl""
> > +
> > +TIDL_dra7xx =3D "yes"
>=20
> Will TIDL be undefined for other platforms?

Yes, TIDL is undefined for other platforms.

>=20
>=20
> >  do_compile() {
> > -    oe_runmake -f Makefile
> > +    oe_runmake -f Makefile TIDL_ACC=3D${TIDL}
> >  }
> >
> >  do_install() {
> > @@ -46,8 +50,9 @@ do_install() {
> >      install -m 0755 ${S}/tflite_classification ${D}${datadir}/tensorfl=
ow-
> lite/demos
> >      install -m 0755 ${S}/tflite_segmentation ${D}${datadir}/tensorflow=
-
> lite/demos
> >      install -m 0644 ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite
> ${D}${datadir}/tensorflow-lite/demos
> > +    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224.tflite
> ${D}${datadir}/tensorflow-lite/demos
> >      install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp
> ${D}${datadir}/tensorflow-lite/demos
> > -    install -m 0755 ${WORKDIR}/run*.sh ${D}${datadir}/tensorflow-
> lite/demos
> > +    install -m 0755 ${S}/scripts/run*.sh ${D}${datadir}/tensorflow-
> lite/demos
> >  }
> >
> >  FILES_${PN} =3D "${datadir}/tensorflow-lite/demos"
> > --
> > 2.17.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

