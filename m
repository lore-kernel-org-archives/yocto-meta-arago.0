Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A8896529D0
	for <meta-arago@arago-project.org>;
	Mon, 26 Nov 2018 22:08:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAQM7wdA024325
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 16:07:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543270079;
	bh=dSfLw1YImSZNolLkp/9r1wumuXGsBBb3qijAUkU6+Xo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cxq+lE6BEKnQREmGSTDd+HpIN/PwDgtdvP0vwe1QrhBJOE7dpN1I9d0uZMXSU+u9J
	Bc68iX58itBVaQtOXxkOOyoLVxWjzwbupmU7fkFm1QWBdp2fXbvwhp60dYAfixRgzO
	U509RtYoM/pFxEGe6deGVPHw9R8k5Iv4DIFs1sLI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAQM7wA0016666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 16:07:58 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 26 Nov 2018 16:07:58 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 26 Nov 2018 16:07:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAQM7wvZ018801;
	Mon, 26 Nov 2018 16:07:58 -0600
Date: Mon, 26 Nov 2018 17:07:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Qin Su <qsu@ti.com>
Message-ID: <20181126220758.GH21933@beryl>
References: <1542837395-7368-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1542837395-7368-1-git-send-email-qsu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] armnn: bump SRCREV and add a demo example
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
X-List-Received-Date: Mon, 26 Nov 2018 22:08:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 21, 2018 at 04:56:35PM -0500, Qin Su wrote:
> updated to the latest version of 18.08
> updated to generate versioned library
> created a demo example with mobileNet
> 
> Signed-off-by: Qin Su <qsu@ti.com>
> ---

Would be nice to document here changes between patch revisions, i.e. v1 -> v2


>  ...0003-add-more-test-command-line-arguments.patch |  75 ++
>  .../armnn/0004-generate-versioned-library.patch    |  63 ++
>  .../0005-add-armnn-mobilenet-test-example.patch    |  69 ++
>  .../armnn/0006-armnn-mobilenet-test-example.patch  | 886 +++++++++++++++++++++
>  .../recipes-support/armnn/armnn_git.bb             |  40 +-
>  5 files changed, 1125 insertions(+), 8 deletions(-)
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
>  mode change 100644 => 100755 meta-arago-extras/recipes-support/armnn/armnn_git.bb

^^^^^^^^^^^^^^^^^^^^^^
Why are you making all patches and the recipe executable?

[snip]


> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> old mode 100644
> new mode 100755
> index 726a9da..2b25da8
> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> @@ -1,23 +1,39 @@
>  SUMMARY = "ARM Neural Network SDK"
>  DESCRIPTION = "Linux software and tools to enable machine learning (Caffe/Tensorflow) workloads on power-efficient devices"
> -LICENSE = "MIT"
> +LICENSE = "MIT & Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
> +LIC_FILES_CHKSUM_tfmodel = "file://tfmodel/LICENSE;md5=7e2764bb89441ae65b52f305ffee5fa8"

This is incorrect - why do you use _tfmodel override here? And it won't work 
anyway. You simply need to add both entries to the variable.

BTW, tfmodel is a new entry in v2 - it wasn't there in v1...


> -PV = "20180502"
> +PV = "18.08"
> +PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>  
>  BRANCH = "master"
> -SRCREV = "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
> +SRCREV = "c577f2c6a3b4ddb6ba87a882723c53a248afbeba"
> +SRCREV_tfmodel = "d299118e54aade794d5d98d9122b392783faeb8a"
> +SRCREV_tidl-api = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
> +
> +SRCREV_FORMAT = "armnn"
>  
>  S = "${WORKDIR}/git"
>  
>  inherit cmake
>  
>  SRC_URI = " \
> -    git://github.com/ARM-software/armnn.git;branch=${BRANCH} \
> +    git://github.com/ARM-software/armnn.git;name=armnn;branch=${BRANCH} \
>      file://0001-stdlib-issue-work-around.patch \
>      file://0002-enable-use-of-boost-shared-library.patch \
> +    file://0003-add-more-test-command-line-arguments.patch \
> +    file://0004-generate-versioned-library.patch \
> +    file://0005-add-armnn-mobilenet-test-example.patch \
> +    file://0006-armnn-mobilenet-test-example.patch \
> +    git://github.com/tensorflow/models;name=tfmodel;branch=${BRANCH};subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
> +    http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
> +    git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
>  "
>  
> +SRC_URI[mobilenet.md5sum] = "d5f69cef81ad8afb335d9727a17c462a"
> +SRC_URI[mobilenet.sha256sum] = "1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
> +
>  DEPENDS = " \
>      boost \
>      protobuf \
> @@ -25,6 +41,7 @@ DEPENDS = " \
>      arm-compute-library \
>      armnn-caffe \
>      armnn-tensorflow \
> +    opencv \
>  "
>  
>  RDEPENDS_${PN} = " arm-compute-library protobuf boost "
> @@ -39,22 +56,29 @@ EXTRA_OECMAKE=" \
>      -DARMCOMPUTENEON=1 \
>      -DBUILD_TESTS=1 -DPROFILING=1 \
>      -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
> +    -DBUILD_ARMNN_EXAMPLES=1 \
> +    -DGENERIC_LIB_VERSION=${PV} -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
>  "
>  
> +TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
> +
>  do_install_append() {
>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>      install -d ${D}${bindir}
>      find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
>      cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
> +    install -d ${D}${TESTVECS_INSTALL_DIR}/models
> +    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
> +    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
> +    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${TESTVECS_INSTALL_DIR}/testvecs
>      chrpath -d ${D}${bindir}/*
>  }
>  
>  CXXFLAGS += "-fopenmp"
>  LIBS += "-larmpl_lp64_mp"
>  
> -SOLIBS = ".so"
> -FILES_SOLIBSDEV = ""
> -FILES_${PN} += "{bindir}/*"
> -FILES_${PN} += "{libdir}/*"
> +FILES_${PN} += "${TESTVECS_INSTALL_DIR}"
>  FILES_${PN}-dev += "{libdir}/cmake/*"
>  INSANE_SKIP_${PN}-dev = "dev-elf"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

