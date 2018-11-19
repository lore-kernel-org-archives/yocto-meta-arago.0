Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id EDDC3529AC
	for <meta-arago@arago-project.org>;
	Mon, 19 Nov 2018 20:32:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAJKVsC6041727
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 14:31:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542659514;
	bh=NWok3q36wnSg+dMPmfrUsEUitApwlPz2WRbUpHrjDQ8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=M1jwLzSzL/mBAMbLFs9L4UUX53f4C+L3qgNCncYmTqIpwuzCxOwz77Zg+jqbnJbEy
	lxvwtumFe2ekA6VkZSpCh/xZu6PGlXwaetLXguyac8yv8hByAD2G2Z3jSmqXNgjMhE
	QlGIPkHtkTlR+GAFuvWMvnjBaAsap1CCX6anLyZE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAJKVsWZ009763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 14:31:54 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 19 Nov 2018 14:31:54 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 19 Nov 2018 14:31:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAJKVqHJ031318;
	Mon, 19 Nov 2018 14:31:53 -0600
Date: Mon, 19 Nov 2018 15:31:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Qin Su <qsu@ti.com>
Message-ID: <20181119203151.GC2540@beryl>
References: <1542400052-28613-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1542400052-28613-1-git-send-email-qsu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] armnn: bump SRCREV and add a demo example
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
X-List-Received-Date: Mon, 19 Nov 2018 20:32:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 16, 2018 at 03:27:32PM -0500, Qin Su wrote:
> updated to the latest version of 18.08
> updated to generate versioned library
> created a demo example with mobileNet

Same comment about missing Upstream-Status for new patches.


> Signed-off-by: Qin Su <qsu@ti.com>
> ---
>  .../0003-add-more-test-command-arguments.patch     |  74 ++
>  .../armnn/0004-generate-versioned-library.patch    |  62 ++
>  .../0005-add-armnn-mobilenet-test-example.patch    |  68 ++
>  .../armnn/0006-armnn-mobilenet-test-example.patch  | 862 +++++++++++++++++++++
>  .../recipes-support/armnn/armnn_git.bb             |  31 +-
>  5 files changed, 1092 insertions(+), 5 deletions(-)
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-arguments.patch
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch

[snip]


> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> index 726a9da..c31e4ae 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> @@ -1,12 +1,13 @@
>  SUMMARY = "ARM Neural Network SDK"
>  DESCRIPTION = "Linux software and tools to enable machine learning (Caffe/Tensorflow) workloads on power-efficient devices"
> -LICENSE = "MIT"
> +LICENSE = "MIT & Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"

Did the license change? Also, need a checksum for Apache-2.0 too.


> -PV = "20180502"
> +PV = "18.08"
> +PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>  
>  BRANCH = "master"
> -SRCREV = "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
> +SRCREV = "c577f2c6a3b4ddb6ba87a882723c53a248afbeba"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -16,8 +17,20 @@ SRC_URI = " \
>      git://github.com/ARM-software/armnn.git;branch=${BRANCH} \

Might want to add "name=armnn" above since used in SRCREV_FORMAT.


>      file://0001-stdlib-issue-work-around.patch \
>      file://0002-enable-use-of-boost-shared-library.patch \
> +    file://0003-add-more-test-command-arguments.patch \
> +    file://0004-generate-versioned-library.patch \
> +    file://0005-add-armnn-mobilenet-test-example.patch \
> +    file://0006-armnn-mobilenet-test-example.patch \
> +    http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz; \

Might want to add "name=mobilenet" for use in SRC_URI[md5sum/sha256sum]


> +    git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
>  "
>  
> +SRC_URI[md5sum] = "d5f69cef81ad8afb335d9727a17c462a"
> +SRC_URI[sha256sum] = "1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
> +
> +SRCREV_tidl-api = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
> +SRCREV_FORMAT = "armnn"
> +
>  DEPENDS = " \
>      boost \
>      protobuf \
> @@ -25,6 +38,7 @@ DEPENDS = " \
>      arm-compute-library \
>      armnn-caffe \
>      armnn-tensorflow \
> +    opencv \
>  "
>  
>  RDEPENDS_${PN} = " arm-compute-library protobuf boost "
> @@ -39,21 +53,28 @@ EXTRA_OECMAKE=" \
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
> +    cp ${WORKDIR}/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
> +    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
> +    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
> +    cp ${WORKDIR}/tidl-api/examples/classification/clips/test2.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
>      chrpath -d ${D}${bindir}/*
>  }
>  
>  CXXFLAGS += "-fopenmp"
>  LIBS += "-larmpl_lp64_mp"
>  
> -SOLIBS = ".so"
> -FILES_SOLIBSDEV = ""
>  FILES_${PN} += "{bindir}/*"
>  FILES_${PN} += "{libdir}/*"
>  FILES_${PN}-dev += "{libdir}/cmake/*"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

