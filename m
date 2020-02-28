Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BBD7A52A4C
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2020 17:56:08 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SHs629035296
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 11:54:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582912446;
	bh=zR5P+V3dkUTVsL7GMEN+oKGtKwenvdynMAZ+BJ1P7uI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=SjT7HzQZ3+2o+nxT/2rbz3cfPwLpaCrbWo63ErFV/6c21hEi4eUEiuHg/bCLOicdX
	KOd3EYNgiD9WiaCy6seaD7KBZFgh5Chmpf5PDNidCjCtaa3s+vIuv8ETbF+dLlfTBi
	Eao3WCefSAs5U0ldn3xjmV7HIMVPAwcm6FYAfmbY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SHs6eU057934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 11:54:06 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 28 Feb 2020 11:54:06 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1847.007; Fri, 28 Feb 2020 11:54:06 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [zeus/master] [PATCH 2/3] tensorflow-lite-demo: add
	version 01.00.00
Thread-Index: AQHV7DIf1itPg7MHHkCNJ0gS3xYlCqgwE5wAgADDrWCAAGlPAP//nhnggABloQD//6KyAA==
Date: Fri, 28 Feb 2020 17:54:06 +0000
Message-ID: <1b36727beab44a37a482ea9f11a12fac@ti.com>
References: <20200225231226.24898-1-a0271529@ti.com>
	<20200225231226.24898-2-a0271529@ti.com> <20200227231450.GA2466@beryl>
	<dbcf117fd9a74d579503e9c8438d5e0a@ti.com> <20200228171206.GE2466@beryl>
	<92987f994a9c49c5ae44a75c80dad390@ti.com> <20200228172526.GH2466@beryl>
In-Reply-To: <20200228172526.GH2466@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.112.213]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [zeus/master] [PATCH 2/3] tensorflow-lite-demo: add version 01.00.00
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
X-List-Received-Date: Fri, 28 Feb 2020 17:56:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, February 28, 2020 12:25 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [zeus/master] [PATCH 2/3] tensorflow-lite-demo:
> add version 01.00.00
>=20
> On Fri, Feb 28, 2020 at 12:22:36PM -0500, Gou, Hongmei wrote:
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Friday, February 28, 2020 12:12 PM
> > > To: Gou, Hongmei
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [zeus/master] [PATCH 2/3] tensorflow-lite-
> demo:
> > > add version 01.00.00
> > >
> > > On Fri, Feb 28, 2020 at 12:00:46PM -0500, Gou, Hongmei wrote:
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Thursday, February 27, 2020 6:15 PM
> > > > > To: Gou, Hongmei
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [zeus/master] [PATCH 2/3] tensorflow-li=
te-
> > > demo:
> > > > > add version 01.00.00
> > > > >
> > > > > On Tue, Feb 25, 2020 at 06:12:25PM -0500, Hongmei Gou wrote:
> > > > > > * This supports classification and segmentation demos with
> tensorflow
> > > lite
> > > > > models
> > > > > >   running on Arm. It demonstrates the whole pipeline from
> > > > > image/video/camera input,
> > > > > >   to tensorflow lite inference, to display the
> classification/segemenation
> > > > > results.
> > > > > >
> > > > > > * OpenCV is used for capturing the input and displaying the res=
ults.
> > > > > >
> > > > > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > > > > ---
> > > > > >  .../files/run_classification.sh               |  7 +++
> > > > > >  .../tensorflow-lite/files/run_segmentation.sh |  8 +++
> > > > > >  .../tensorflow-lite-demo_git.bb               | 53
> +++++++++++++++++++
> > > > > >  3 files changed, 68 insertions(+)
> > > > > >  create mode 100644 meta-arago-extras/recipes-
> support/tensorflow-
> > > > > lite/files/run_classification.sh
> > > > > >  create mode 100644 meta-arago-extras/recipes-
> support/tensorflow-
> > > > > lite/files/run_segmentation.sh
> > > > > >  create mode 100644 meta-arago-extras/recipes-
> support/tensorflow-
> > > > > lite/tensorflow-lite-demo_git.bb
> > > > > >
> > > > > > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> > > > > lite/files/run_classification.sh b/meta-arago-extras/recipes-
> > > > > support/tensorflow-lite/files/run_classification.sh
> > > > > > new file mode 100644
> > > > > > index 00000000..b2ad7fc4
> > > > > > --- /dev/null
> > > > > > +++ b/meta-arago-extras/recipes-support/tensorflow-
> > > > > lite/files/run_classification.sh
> > > > > > @@ -0,0 +1,7 @@
> > > > > > +#!/bin/sh
> > > > > > +
> > > > > > +cd /usr/share/tensorflow-lite/demos
> > > > > > +
> > > > > > +# Run tflite_classification binary with the model, the input i=
mage,
> and
> > > the
> > > > > label file specified.
> > > > > > +# Classification label is overlayed with the input image. Righ=
t click
> the
> > > > > image display window to exit.
> > > > > > +./tflite_classification -m
> > > ../examples/mobilenet_v1_1.0_224_quant.tflite -
> > > > > i ../examples/grace_hopper.bmp -l ../examples/labels.txt
> > > > > > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> > > > > lite/files/run_segmentation.sh b/meta-arago-extras/recipes-
> > > > > support/tensorflow-lite/files/run_segmentation.sh
> > > > > > new file mode 100644
> > > > > > index 00000000..5caea127
> > > > > > --- /dev/null
> > > > > > +++ b/meta-arago-extras/recipes-support/tensorflow-
> > > > > lite/files/run_segmentation.sh
> > > > > > @@ -0,0 +1,8 @@
> > > > > > +#!/bin/sh
> > > > > > +
> > > > > > +cd /usr/share/tensorflow-lite/demos
> > > > > > +
> > > > > > +# Run tflite_segmentation binary with the model and the input
> image
> > > > > specified.
> > > > > > +# The display window shows the input(resized) image,
> segmentation
> > > > > map, overlay
> > > > > > +# of the former two. Right click the image display window to e=
xit.
> > > > > > +./tflite_segmentation -m ./deeplabv3_257_mv_gpu.tflite -i
> > > > > ./bird_segmentation.bmp
> > > > > > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> > > lite/tensorflow-
> > > > > lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-
> > > > > lite/tensorflow-lite-demo_git.bb
> > > > > > new file mode 100644
> > > > > > index 00000000..9b99b63c
> > > > > > --- /dev/null
> > > > > > +++ b/meta-arago-extras/recipes-support/tensorflow-
> lite/tensorflow-
> > > lite-
> > > > > demo_git.bb
> > > > > > @@ -0,0 +1,53 @@
> > > > > > +DESCRIPTION =3D "Tensorflow Lite Demo with input and display v=
ia
> > > OpenCV
> > > > > and TIDL acceleration for AM5"
> > > > >
> > > > > SUMMARY?
> > > >
> > > > Do you mean adding "SUMMARY" or replacing "DESCRIPTION" with
> > > "SUMMARY"?
> > >
> > > Either.
> >
> > Thank you! Just submitted a v2 patch to replace "DESCRIPTION" with
> "SUMMARY".
>=20
> SUMMARY is required and is a short one-line.
> DESCRIPTION is optional and can be a longer, more detailed one.
>=20
> BTW, I already merged v1 - can you please submit a separate change?
> Thanks!

Sure, I will include this change with my next recipe patch which adds the T=
IDL offload for AM5.

>=20
>=20
> > > > > > +LICENSE =3D "Apache-2.0"
> > > > > > +LIC_FILES_CHKSUM =3D
> > > > > "file://LICENSE;md5=3Dd8927f3331d2b3e321b7dd1925166d25"
> > > > > > +
> > > > > > +DEPENDS =3D "tensorflow-lite flatbuffers opencv"
> > > > > > +
> > > > > > +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
> > > > >
> > > > > Why ^^^?
> > > >
> > > > This demo has dependency on OpenCV for GUI display, which is
> available
> > > for the machines above.
> > >
> > > Yes, pushed a fix for that - OpenCV was limited to DSP-enabled platfo=
rms
> in
> > > Zeus due to initial integration limitations.
> > >
> > >
> > > > > > +PV =3D "01.00.00"
> > > > > > +PR =3D "r0"
> > > > > > +
> > > > > > +BRANCH =3D "master"
> > > > > > +SRC_URI  =3D "git://git.ti.com/apps/tensorflow-lite-
> > > > > examples.git;protocol=3Dgit;branch=3D${BRANCH} \
> > > > > > +
> > > > >
> > >
> http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/
> > > > >
> > >
> deeplabv3_257_mv_gpu.tflite;name=3Ddeeplabv3;subdir=3D${WORKDIR}/model
> > > > > ;destsuffix=3Dmodel \
> > > > > > +            http://raw.githubusercontent.com/google-
> > > > >
> > >
> coral/edgetpu/master/test_data/bird_segmentation.bmp;name=3Dbird_segm
> > > > > entation;subdir=3D${WORKDIR}/test_data;destsuffix=3Dtest_data \
> > > > > > +            file://run_classification.sh \
> > > > > > +            file://run_segmentation.sh"
> > > > > > +
> > > > > > +SRC_URI[deeplabv3.md5sum] =3D
> > > "4a24db5a5fb05c47586a1197765e8548"
> > > > > > +SRC_URI[deeplabv3.sha256sum] =3D
> > > > >
> > >
> "68a539782c2c6a72f8aac3724600124a85ed977162b44e84cbae5db717c933c6"
> > > > > > +SRC_URI[bird_segmentation.md5sum] =3D
> > > > > "fc3202ac4e3033b36df3043de6dc32c9"
> > > > > > +SRC_URI[bird_segmentation.sha256sum] =3D
> > > > >
> > >
> "e43cedd29ab385db787531c8a6cdcb31c5e4292af34f242877ed40611e502670"
> > > > > > +
> > > > > > +SRCREV =3D "d84f1d43585c0db2fa6a1c15db9145ab53f859ce"
> > > > > > +
> > > > > > +S =3D "${WORKDIR}/git"
> > > > > > +
> > > > > > +CXXFLAGS_append =3D " -O3 -DNDEBUG -fPIC -
> I${STAGING_INCDIR}"
> > > > > > +LDFLAGS_append =3D " -L${STAGING_LIBDIR}"
> > > > > > +
> > > > > > +EXTRA_OEMAKE =3D "\
> > > > > > +    'CXX=3D${CXX}' \
> > > > > > +    'CXXFLAGS=3D${CXXFLAGS}' \
> > > > > > +    'AR=3D${AR}' \
> > > > > > +    'LD=3D${LD}' \
> > > > > > +    'LDFLAGS=3D${LDFLAGS}' \
> > > > > > +    'TARGET=3D${TARGET_OS}' \
> > > > > > +    'TARGET_ARCH=3D${TARGET_ARCH}'"
> > > > > > +
> > > > > > +do_compile() {
> > > > > > +    oe_runmake -f Makefile
> > > > > > +}
> > > > > > +
> > > > > > +do_install() {
> > > > > > +    install -d ${D}${datadir}/tensorflow-lite/demos
> > > > > > +    install -m 0755 ${S}/tflite_classification
> ${D}${datadir}/tensorflow-
> > > > > lite/demos
> > > > > > +    install -m 0755 ${S}/tflite_segmentation
> ${D}${datadir}/tensorflow-
> > > > > lite/demos
> > > > > > +    install -m 0644
> ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite
> > > > > ${D}${datadir}/tensorflow-lite/demos
> > > > > > +    install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp
> > > > > ${D}${datadir}/tensorflow-lite/demos
> > > > > > +    install -m 0755 ${WORKDIR}/run*.sh ${D}${datadir}/tensorfl=
ow-
> > > > > lite/demos
> > > > > > +}
> > > > > > +
> > > > > > +FILES_${PN} =3D "${datadir}/tensorflow-lite/demos"
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

