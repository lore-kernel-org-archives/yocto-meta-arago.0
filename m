Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BFA9A529D4
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2020 17:14:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SHC7dt097804
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 11:12:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582909927;
	bh=VwlTxCVlNzxqggoBKfsrgbbgxdR/1P69bh51/iOOIUg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z5eB7rJIoZOrcnn+97NzMB5AU/ch4pj/01+wkTovyYIbeO8KeFCTcq4BtnmdAn0k0
	rvsEdsAtUdTTu3MzmUFA3TPCV235fpSy0csVtgQ+Xm5tU+ILFlKM4yQyhk64X4uRT4
	3lIbfS4s9HMruNJUUE3OY90eW3cIpeV4A3tbmh4U=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SHC79j067070
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 11:12:07 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 28 Feb 2020 11:12:06 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 28 Feb 2020 11:12:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01SHC6bx079554; 
	Fri, 28 Feb 2020 11:12:06 -0600
Date: Fri, 28 Feb 2020 12:12:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20200228171206.GE2466@beryl>
References: <20200225231226.24898-1-a0271529@ti.com>
	<20200225231226.24898-2-a0271529@ti.com>
	<20200227231450.GA2466@beryl>
	<dbcf117fd9a74d579503e9c8438d5e0a@ti.com>
MIME-Version: 1.0
In-Reply-To: <dbcf117fd9a74d579503e9c8438d5e0a@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Fri, 28 Feb 2020 17:14:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 28, 2020 at 12:00:46PM -0500, Gou, Hongmei wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, February 27, 2020 6:15 PM
> > To: Gou, Hongmei
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [zeus/master] [PATCH 2/3] tensorflow-lite-demo:
> > add version 01.00.00
> > 
> > On Tue, Feb 25, 2020 at 06:12:25PM -0500, Hongmei Gou wrote:
> > > * This supports classification and segmentation demos with tensorflow lite
> > models
> > >   running on Arm. It demonstrates the whole pipeline from
> > image/video/camera input,
> > >   to tensorflow lite inference, to display the classification/segemenation
> > results.
> > >
> > > * OpenCV is used for capturing the input and displaying the results.
> > >
> > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > ---
> > >  .../files/run_classification.sh               |  7 +++
> > >  .../tensorflow-lite/files/run_segmentation.sh |  8 +++
> > >  .../tensorflow-lite-demo_git.bb               | 53 +++++++++++++++++++
> > >  3 files changed, 68 insertions(+)
> > >  create mode 100644 meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_classification.sh
> > >  create mode 100644 meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_segmentation.sh
> > >  create mode 100644 meta-arago-extras/recipes-support/tensorflow-
> > lite/tensorflow-lite-demo_git.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_classification.sh b/meta-arago-extras/recipes-
> > support/tensorflow-lite/files/run_classification.sh
> > > new file mode 100644
> > > index 00000000..b2ad7fc4
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_classification.sh
> > > @@ -0,0 +1,7 @@
> > > +#!/bin/sh
> > > +
> > > +cd /usr/share/tensorflow-lite/demos
> > > +
> > > +# Run tflite_classification binary with the model, the input image, and the
> > label file specified.
> > > +# Classification label is overlayed with the input image. Right click the
> > image display window to exit.
> > > +./tflite_classification -m ../examples/mobilenet_v1_1.0_224_quant.tflite -
> > i ../examples/grace_hopper.bmp -l ../examples/labels.txt
> > > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_segmentation.sh b/meta-arago-extras/recipes-
> > support/tensorflow-lite/files/run_segmentation.sh
> > > new file mode 100644
> > > index 00000000..5caea127
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_segmentation.sh
> > > @@ -0,0 +1,8 @@
> > > +#!/bin/sh
> > > +
> > > +cd /usr/share/tensorflow-lite/demos
> > > +
> > > +# Run tflite_segmentation binary with the model and the input image
> > specified.
> > > +# The display window shows the input(resized) image, segmentation
> > map, overlay
> > > +# of the former two. Right click the image display window to exit.
> > > +./tflite_segmentation -m ./deeplabv3_257_mv_gpu.tflite -i
> > ./bird_segmentation.bmp
> > > diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-
> > lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-
> > lite/tensorflow-lite-demo_git.bb
> > > new file mode 100644
> > > index 00000000..9b99b63c
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-
> > demo_git.bb
> > > @@ -0,0 +1,53 @@
> > > +DESCRIPTION = "Tensorflow Lite Demo with input and display via OpenCV
> > and TIDL acceleration for AM5"
> > 
> > SUMMARY?
> 
> Do you mean adding "SUMMARY" or replacing "DESCRIPTION" with "SUMMARY"?

Either.


> > > +LICENSE = "Apache-2.0"
> > > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=d8927f3331d2b3e321b7dd1925166d25"
> > > +
> > > +DEPENDS = "tensorflow-lite flatbuffers opencv"
> > > +
> > > +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
> > 
> > Why ^^^?
> 
> This demo has dependency on OpenCV for GUI display, which is available for the machines above.

Yes, pushed a fix for that - OpenCV was limited to DSP-enabled platforms in 
Zeus due to initial integration limitations.


> > > +PV = "01.00.00"
> > > +PR = "r0"
> > > +
> > > +BRANCH = "master"
> > > +SRC_URI  = "git://git.ti.com/apps/tensorflow-lite-
> > examples.git;protocol=git;branch=${BRANCH} \
> > > +
> > http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/
> > deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${WORKDIR}/model
> > ;destsuffix=model \
> > > +            http://raw.githubusercontent.com/google-
> > coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segm
> > entation;subdir=${WORKDIR}/test_data;destsuffix=test_data \
> > > +            file://run_classification.sh \
> > > +            file://run_segmentation.sh"
> > > +
> > > +SRC_URI[deeplabv3.md5sum] = "4a24db5a5fb05c47586a1197765e8548"
> > > +SRC_URI[deeplabv3.sha256sum] =
> > "68a539782c2c6a72f8aac3724600124a85ed977162b44e84cbae5db717c933c6"
> > > +SRC_URI[bird_segmentation.md5sum] =
> > "fc3202ac4e3033b36df3043de6dc32c9"
> > > +SRC_URI[bird_segmentation.sha256sum] =
> > "e43cedd29ab385db787531c8a6cdcb31c5e4292af34f242877ed40611e502670"
> > > +
> > > +SRCREV = "d84f1d43585c0db2fa6a1c15db9145ab53f859ce"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -I${STAGING_INCDIR}"
> > > +LDFLAGS_append = " -L${STAGING_LIBDIR}"
> > > +
> > > +EXTRA_OEMAKE = "\
> > > +    'CXX=${CXX}' \
> > > +    'CXXFLAGS=${CXXFLAGS}' \
> > > +    'AR=${AR}' \
> > > +    'LD=${LD}' \
> > > +    'LDFLAGS=${LDFLAGS}' \
> > > +    'TARGET=${TARGET_OS}' \
> > > +    'TARGET_ARCH=${TARGET_ARCH}'"
> > > +
> > > +do_compile() {
> > > +    oe_runmake -f Makefile
> > > +}
> > > +
> > > +do_install() {
> > > +    install -d ${D}${datadir}/tensorflow-lite/demos
> > > +    install -m 0755 ${S}/tflite_classification ${D}${datadir}/tensorflow-
> > lite/demos
> > > +    install -m 0755 ${S}/tflite_segmentation ${D}${datadir}/tensorflow-
> > lite/demos
> > > +    install -m 0644 ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite
> > ${D}${datadir}/tensorflow-lite/demos
> > > +    install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp
> > ${D}${datadir}/tensorflow-lite/demos
> > > +    install -m 0755 ${WORKDIR}/run*.sh ${D}${datadir}/tensorflow-
> > lite/demos
> > > +}
> > > +
> > > +FILES_${PN} = "${datadir}/tensorflow-lite/demos"
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

