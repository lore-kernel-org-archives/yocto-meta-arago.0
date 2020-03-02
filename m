Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 5189F52A1F
	for <meta-arago@arago-project.org>;
	Mon,  2 Mar 2020 19:42:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 022Je96h110182
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2020 13:40:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583178009;
	bh=D6Heb3pOSYuLLho1gDwCJ5mvbzYdqAorYDFW1B4X6nI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hvdqgOnyghxrwKuJ3v1oVDOU7HTamYSMPEXcR7rdYKoldKG7simt7GHSfSLiwXghx
	q+KHDlLCIMJLzRmL1FGEMM8ONqRAXu69ya32zZuoNX2e+7QN9/2A5lwklboSia7Ym+
	tYJHN/U9AZTSjd727LifgobCc8JJLjDxL0NmZIu0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 022Je9Nh012646
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2020 13:40:09 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 2 Mar 2020 13:40:09 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 2 Mar 2020 13:40:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 022Je9E4015304;
	Mon, 2 Mar 2020 13:40:09 -0600
Date: Mon, 2 Mar 2020 14:40:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20200302194008.GU2466@beryl>
References: <20200228225858.24538-1-a0271529@ti.com>
	<20200302185805.GQ2466@beryl>
	<e0086f3b8c7a4d69a335dc9b8e24d85d@ti.com>
MIME-Version: 1.0
In-Reply-To: <e0086f3b8c7a4d69a335dc9b8e24d85d@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Mon, 02 Mar 2020 19:42:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 02, 2020 at 02:37:48PM -0500, Gou, Hongmei wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, March 2, 2020 1:58 PM
> > To: Gou, Hongmei
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [zeus/master] [PATCH] tensorflow-lite-demo:
> > Bump SRCREV and add tidl offload support for AM5
> > 
> > On Fri, Feb 28, 2020 at 05:58:58PM -0500, Hongmei Gou wrote:
> > > * Build the demos with tidl offload option for AM5
> > > * Include mobilenet v1 model for demonstrating tidl offload
> > > * Remove the demo scripts under the files directory. The scripts are now
> > >   maintained in the source repo.
> > > * Make adjustments with the updated Makefile
> > >
> > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > ---
> > >  .../files/run_classification.sh               |  7 -----
> > >  .../tensorflow-lite/files/run_segmentation.sh |  8 ------
> > >  .../tensorflow-lite-demo_git.bb               | 27 +++++++++++--------
> > >  3 files changed, 16 insertions(+), 26 deletions(-)
> > >  delete mode 100644 meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_classification.sh
> > >  delete mode 100644 meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_segmentation.sh
> > >
> > > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_classification.sh b/meta-arago-extras/recipes-
> > support/tensorflow-lite/files/run_classification.sh
> > > deleted file mode 100644
> > > index b2ad7fc4..00000000
> > > --- a/meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_classification.sh
> > > +++ /dev/null
> > > @@ -1,7 +0,0 @@
> > > -#!/bin/sh
> > > -
> > > -cd /usr/share/tensorflow-lite/demos
> > > -
> > > -# Run tflite_classification binary with the model, the input image, and the
> > label file specified.
> > > -# Classification label is overlayed with the input image. Right click the
> > image display window to exit.
> > > -./tflite_classification -m ../examples/mobilenet_v1_1.0_224_quant.tflite -i
> > ../examples/grace_hopper.bmp -l ../examples/labels.txt
> > > diff --git a/meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_segmentation.sh b/meta-arago-extras/recipes-
> > support/tensorflow-lite/files/run_segmentation.sh
> > > deleted file mode 100644
> > > index 5caea127..00000000
> > > --- a/meta-arago-extras/recipes-support/tensorflow-
> > lite/files/run_segmentation.sh
> > > +++ /dev/null
> > > @@ -1,8 +0,0 @@
> > > -#!/bin/sh
> > > -
> > > -cd /usr/share/tensorflow-lite/demos
> > > -
> > > -# Run tflite_segmentation binary with the model and the input image
> > specified.
> > > -# The display window shows the input(resized) image, segmentation map,
> > overlay
> > > -# of the former two. Right click the image display window to exit.
> > > -./tflite_segmentation -m ./deeplabv3_257_mv_gpu.tflite -i
> > ./bird_segmentation.bmp
> > > diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-
> > lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-
> > lite/tensorflow-lite-demo_git.bb
> > > index 9b99b63c..57d6ef20 100644
> > > --- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-
> > demo_git.bb
> > > +++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-
> > demo_git.bb
> > > @@ -1,33 +1,33 @@
> > > -DESCRIPTION = "Tensorflow Lite Demo with input and display via OpenCV
> > and TIDL acceleration for AM5"
> > > +SUMMARY = "Tensorflow Lite Demo with input and display via OpenCV
> > and TIDL acceleration for AM5"
> > >  LICENSE = "Apache-2.0"
> > >  LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=d8927f3331d2b3e321b7dd1925166d25"
> > >
> > >  DEPENDS = "tensorflow-lite flatbuffers opencv"
> > > +DEPENDS_append_dra7xx = " tidl-api"
> > >
> > >  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > >  PV = "01.00.00"
> > > -PR = "r0"
> > > +PR = "r1"
> > >
> > >  BRANCH = "master"
> > >  SRC_URI  = "git://git.ti.com/apps/tensorflow-lite-
> > examples.git;protocol=git;branch=${BRANCH} \
> > >
> > http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/
> > deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${WORKDIR}/model
> > ;destsuffix=model \
> > > -            http://raw.githubusercontent.com/google-
> > coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segm
> > entation;subdir=${WORKDIR}/test_data;destsuffix=test_data \
> > > -            file://run_classification.sh \
> > > -            file://run_segmentation.sh"
> > > +
> > http://storage.googleapis.com/download.tensorflow.org/models/mobilenet
> > _v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenetv1;subdir=${W
> > ORKDIR}/model;destsuffix=model \
> > > +            http://raw.githubusercontent.com/google-
> > coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segm
> > entation;subdir=${WORKDIR}/test_data;destsuffix=test_data"
> > >
> > >  SRC_URI[deeplabv3.md5sum] = "4a24db5a5fb05c47586a1197765e8548"
> > >  SRC_URI[deeplabv3.sha256sum] =
> > "68a539782c2c6a72f8aac3724600124a85ed977162b44e84cbae5db717c933c6"
> > > +SRC_URI[mobilenetv1.md5sum] = "d5f69cef81ad8afb335d9727a17c462a"
> > > +SRC_URI[mobilenetv1.sha256sum] =
> > "1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
> > >  SRC_URI[bird_segmentation.md5sum] =
> > "fc3202ac4e3033b36df3043de6dc32c9"
> > >  SRC_URI[bird_segmentation.sha256sum] =
> > "e43cedd29ab385db787531c8a6cdcb31c5e4292af34f242877ed40611e502670"
> > >
> > > -SRCREV = "d84f1d43585c0db2fa6a1c15db9145ab53f859ce"
> > > +SRCREV = "bd6a429c21f96d5112e0b6dea44a13b748eefd74"
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > -CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -I${STAGING_INCDIR}"
> > > -LDFLAGS_append = " -L${STAGING_LIBDIR}"
> > > -
> > >  EXTRA_OEMAKE = "\
> > >      'CXX=${CXX}' \
> > >      'CXXFLAGS=${CXXFLAGS}' \
> > > @@ -37,8 +37,12 @@ EXTRA_OEMAKE = "\
> > >      'TARGET=${TARGET_OS}' \
> > >      'TARGET_ARCH=${TARGET_ARCH}'"
> > >
> > > +EXTRA_OEMAKE += "SYSROOT_INCDIR="${STAGING_INCDIR}"
> > SYSROOT_LIBDIR="${STAGING_LIBDIR}" \
> > > +                 TIDL_API_DIR="${STAGING_DATADIR}/ti/tidl""
> > > +
> > > +TIDL_dra7xx = "yes"
> > 
> > Will TIDL be undefined for other platforms?
> 
> Yes, TIDL is undefined for other platforms.
> 
> > 
> > 
> > >  do_compile() {
> > > -    oe_runmake -f Makefile
> > > +    oe_runmake -f Makefile TIDL_ACC=${TIDL}

This will result in passing undefined variable to Makefile here

Make you want to set it to "no" or empty "" for other platforms?


> > >  }
> > >
> > >  do_install() {
> > > @@ -46,8 +50,9 @@ do_install() {
> > >      install -m 0755 ${S}/tflite_classification ${D}${datadir}/tensorflow-
> > lite/demos
> > >      install -m 0755 ${S}/tflite_segmentation ${D}${datadir}/tensorflow-
> > lite/demos
> > >      install -m 0644 ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite
> > ${D}${datadir}/tensorflow-lite/demos
> > > +    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224.tflite
> > ${D}${datadir}/tensorflow-lite/demos
> > >      install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp
> > ${D}${datadir}/tensorflow-lite/demos
> > > -    install -m 0755 ${WORKDIR}/run*.sh ${D}${datadir}/tensorflow-
> > lite/demos
> > > +    install -m 0755 ${S}/scripts/run*.sh ${D}${datadir}/tensorflow-
> > lite/demos
> > >  }
> > >
> > >  FILES_${PN} = "${datadir}/tensorflow-lite/demos"
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

