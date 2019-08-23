Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2C087529B8
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2019 16:18:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NGHXUI000856
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 11:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566577053;
	bh=YQe4TKH5dvZiOm/pO6V8XpPRrJhYonFuVe6Ddvqg5Yw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=idbJEgRNhFVe3tr1A8fuzSsbLA4phvzlmVqEolTwvjzIf+HxmnTluQplnioXd3WqD
	n1MxrkXrMML8HbExRCbIicB+g/VX9QOAH3mihVA8NB/8n9nvmB+w4xzBE5l2M39IIL
	pHPC1o2QOYvpcv1STtq/6nxkhPpaUHrL11DGz/jk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NGHXxa050922
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 11:17:33 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 23 Aug 2019 11:17:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 23 Aug 2019 11:17:32 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7NGHWNG071754;
	Fri, 23 Aug 2019 11:17:32 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190823135856.8053-1-x0157990@ti.com>
	<20190823135856.8053-5-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6503dace-1df7-e288-29bb-afb0570058ca@ti.com>
Date: Fri, 23 Aug 2019 12:17:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823135856.8053-5-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCHv2 4/5] demo-glow: Restore in top-level makefile examples after recipe cleanup
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
X-List-Received-Date: Fri, 23 Aug 2019 16:18:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This fails to apply, can you rebase?

On 8/23/2019 9:58 AM, Djordje Senicic wrote:
> - demo-glow is added back to top level example-applications
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   recipes-apps/demo-glow/demo-glow.bb              | 16 +++++++++-------
>   recipes-apps/demo-glow/files/Makefile.build      |  3 ++-
>   .../ti-tisdk-makefile_1.0.bbappend               |  4 ++++
>   3 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-apps/demo-glow/demo-glow.bb b/recipes-apps/demo-glow/demo-glow.bb
> index 21d6bdf..76bd224 100644
> --- a/recipes-apps/demo-glow/demo-glow.bb
> +++ b/recipes-apps/demo-glow/demo-glow.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   PV = "1.0"
>   PR = "r1"
>   
> -DEPENDS    = "glow-native libpng"
> +DEPENDS    = "glow-native libpng protobuf-native "
>   
>   SRC_URI = "https://raw.githubusercontent.com/pytorch/glow/1af031c9c040dd4ff843d9b50f83e71f6e605631/examples/bundles/lenet_mnist/main.cpp;name=lenet_mnist_main;subdir=src \
>              file://0001-fix-missing-string.patch \
> @@ -23,6 +23,8 @@ SRC_URI[lenet_mnist_license.md5sum] = "86d3f3a95c324c9479bd8986968f4327"
>   
>   S = "${WORKDIR}/src"
>   
> +CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
>   do_compile() {
>      install -d ${WORKDIR}/build
>      LD_LIBRARY_PATH=${STAGING_DIR_NATIVE}/usr/lib ${STAGING_DIR_NATIVE}/usr/share/glow/bin/image-classifier ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ${WORKDIR}/build/ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
> @@ -32,12 +34,12 @@ do_compile() {
>   do_install () {
>      install -d ${D}${datadir}/glow/infer
>      install -d ${D}${datadir}/glow/tests
> -   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/*.weights ${D}${datadir}/glow/infer
> -   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/infer_mnist ${D}${datadir}/glow/infer
> -   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/lenet_mnist.o ${D}${datadir}/glow/infer
> -   cp -Prf --preserve=mode,timestamps ${WORKDIR}/src/makefile ${D}${datadir}/glow/infer
> -   cp -Prf --preserve=mode,timestamps ${WORKDIR}/src/main.cpp ${D}${datadir}/glow/infer
> -   cp -Prf --preserve=mode,timestamps ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/*.png ${D}${datadir}/glow/tests/.
> +   cp ${CP_ARGS} ${WORKDIR}/build/*.weights ${D}${datadir}/glow/infer
> +   cp $(CP_ARGS) ${WORKDIR}/build/infer_mnist ${D}${datadir}/glow/infer
> +   cp ${CP_ARGS} ${WORKDIR}/build/lenet_mnist.o ${D}${datadir}/glow/infer
> +   cp ${CP_ARGS} ${WORKDIR}/src/makefile ${D}${datadir}/glow/infer
> +   cp ${CP_ARGS} ${WORKDIR}/src/main.cpp ${D}${datadir}/glow/infer
> +   cp ${CP_ARGS} ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/*.png ${D}${datadir}/glow/tests/.
>   }
>   
>   FILES_${PN} += "${datadir}/glow"
> diff --git a/recipes-apps/demo-glow/files/Makefile.build b/recipes-apps/demo-glow/files/Makefile.build
> index 044bbf9..baf1fc0 100644
> --- a/recipes-apps/demo-glow/files/Makefile.build
> +++ b/recipes-apps/demo-glow/files/Makefile.build
> @@ -6,7 +6,8 @@ DESTDIR ?=
>   all: release
>   
>   lenet_mnist:
> -	LD_LIBRARY_PATH=${SDK_PATH_NATIVE}/usr/lib ${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
> +	@. ${ENV_SETUP}; \
> +	${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
>   
>   release: lenet_mnist
>   	@. ${ENV_SETUP}; \
> diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> index acd396b..ead9d53 100644
> --- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> +++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
> @@ -10,6 +10,7 @@ SRC_URI_append = "\
>       file://Makefile_tiovx-app-host \
>       file://Makefile_tidl-examples \
>       file://Makefile_pru-adc \
> +    file://Makefile_demo-glow \
>   "
>   
>   SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
> @@ -29,13 +30,16 @@ MAKEFILES_append_omap-a15 = " dual-camera-demo \
>   "
>   
>   MAKEFILES_append_omap-a15 = " video-graphics-test \
> +                              demo-glow \
>   "
>   
>   MAKEFILES_append_ti43x = " evse-hmi \
> +                           demo-glow \
>   "
>   
>   MAKEFILES_append_ti33x = " evse-hmi \
>   			   protection-relays-hmi \
> +                           demo-glow \
>   "
>   
>   MAKEFILES_append_k3 = " evse-hmi"

