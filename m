Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 55926529F2
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2020 23:16:52 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RNEpjI065484
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2020 17:14:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582845291;
	bh=BNW85epYkpy8rcz5G9/gC10Vg9i4t7nU8X++r4tgBoM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FXmDlUdpzuS11DOVve0EJp8jCmm9nJCTp6byvUYPmLtUurL5ksPDy22mXCZHswJqY
	HD6/ijw4it91gHnWO1AcjG049/a3wtytRKd2wuLj/9acG0uRl+FmFgsgt0Q5nGPA/0
	CiFOb46cwaJXmq8Wxg4PO8WIkY8+cNxQg7hKN19c=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01RNEpTZ022697
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2020 17:14:51 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 27 Feb 2020 17:14:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 27 Feb 2020 17:14:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RNEojK071439;
	Thu, 27 Feb 2020 17:14:50 -0600
Date: Thu, 27 Feb 2020 18:14:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20200227231450.GA2466@beryl>
References: <20200225231226.24898-1-a0271529@ti.com>
	<20200225231226.24898-2-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200225231226.24898-2-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 27 Feb 2020 23:16:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 25, 2020 at 06:12:25PM -0500, Hongmei Gou wrote:
> * This supports classification and segmentation demos with tensorflow lite models
>   running on Arm. It demonstrates the whole pipeline from image/video/camera input,
>   to tensorflow lite inference, to display the classification/segemenation results.
> 
> * OpenCV is used for capturing the input and displaying the results.
> 
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  .../files/run_classification.sh               |  7 +++
>  .../tensorflow-lite/files/run_segmentation.sh |  8 +++
>  .../tensorflow-lite-demo_git.bb               | 53 +++++++++++++++++++
>  3 files changed, 68 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
>  create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh
>  create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
> 
> diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
> new file mode 100644
> index 00000000..b2ad7fc4
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +cd /usr/share/tensorflow-lite/demos
> +
> +# Run tflite_classification binary with the model, the input image, and the label file specified.
> +# Classification label is overlayed with the input image. Right click the image display window to exit.
> +./tflite_classification -m ../examples/mobilenet_v1_1.0_224_quant.tflite -i ../examples/grace_hopper.bmp -l ../examples/labels.txt
> diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh
> new file mode 100644
> index 00000000..5caea127
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +cd /usr/share/tensorflow-lite/demos
> +
> +# Run tflite_segmentation binary with the model and the input image specified.
> +# The display window shows the input(resized) image, segmentation map, overlay
> +# of the former two. Right click the image display window to exit.
> +./tflite_segmentation -m ./deeplabv3_257_mv_gpu.tflite -i ./bird_segmentation.bmp
> diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
> new file mode 100644
> index 00000000..9b99b63c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
> @@ -0,0 +1,53 @@
> +DESCRIPTION = "Tensorflow Lite Demo with input and display via OpenCV and TIDL acceleration for AM5"

SUMMARY?


> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d8927f3331d2b3e321b7dd1925166d25"
> +
> +DEPENDS = "tensorflow-lite flatbuffers opencv"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"

Why ^^^?


> +PV = "01.00.00"
> +PR = "r0"
> +
> +BRANCH = "master"
> +SRC_URI  = "git://git.ti.com/apps/tensorflow-lite-examples.git;protocol=git;branch=${BRANCH} \
> +            http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${WORKDIR}/model;destsuffix=model \
> +            http://raw.githubusercontent.com/google-coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segmentation;subdir=${WORKDIR}/test_data;destsuffix=test_data \
> +            file://run_classification.sh \
> +            file://run_segmentation.sh"
> +
> +SRC_URI[deeplabv3.md5sum] = "4a24db5a5fb05c47586a1197765e8548"
> +SRC_URI[deeplabv3.sha256sum] = "68a539782c2c6a72f8aac3724600124a85ed977162b44e84cbae5db717c933c6"
> +SRC_URI[bird_segmentation.md5sum] = "fc3202ac4e3033b36df3043de6dc32c9"
> +SRC_URI[bird_segmentation.sha256sum] = "e43cedd29ab385db787531c8a6cdcb31c5e4292af34f242877ed40611e502670"
> +
> +SRCREV = "d84f1d43585c0db2fa6a1c15db9145ab53f859ce"
> +
> +S = "${WORKDIR}/git"
> +
> +CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -I${STAGING_INCDIR}"
> +LDFLAGS_append = " -L${STAGING_LIBDIR}"
> +
> +EXTRA_OEMAKE = "\
> +    'CXX=${CXX}' \
> +    'CXXFLAGS=${CXXFLAGS}' \
> +    'AR=${AR}' \
> +    'LD=${LD}' \
> +    'LDFLAGS=${LDFLAGS}' \
> +    'TARGET=${TARGET_OS}' \
> +    'TARGET_ARCH=${TARGET_ARCH}'"
> +
> +do_compile() {
> +    oe_runmake -f Makefile
> +}
> +
> +do_install() {
> +    install -d ${D}${datadir}/tensorflow-lite/demos
> +    install -m 0755 ${S}/tflite_classification ${D}${datadir}/tensorflow-lite/demos
> +    install -m 0755 ${S}/tflite_segmentation ${D}${datadir}/tensorflow-lite/demos
> +    install -m 0644 ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite ${D}${datadir}/tensorflow-lite/demos
> +    install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp ${D}${datadir}/tensorflow-lite/demos
> +    install -m 0755 ${WORKDIR}/run*.sh ${D}${datadir}/tensorflow-lite/demos
> +}
> +
> +FILES_${PN} = "${datadir}/tensorflow-lite/demos"
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

