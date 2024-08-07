Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E8DC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 13:21:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.33358.1723036888183216348
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 06:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dTrNpX0X;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477DLP10130206;
	Wed, 7 Aug 2024 08:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723036885;
	bh=qizze8qY5DX9oTMdCz2NrMfV7jom5wju3qbEW8GOYPU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dTrNpX0XUOt/B/Jxjv75IHBEBYuscpsCidPIRe2LFJoPZZAvgs75DBcOVS6txRyIx
	 GkgFFAJvn7vhJhx+/jh8QYUu+e0CcKS/kLsoM0RNxvKgo6/tigiWt4qDS/SL+ZiVCc
	 d5pwCdKoNRhzWmwQnVuFW0WmZ9UbcdPOIwx2VelE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477DLPWK006694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 08:21:25 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 08:21:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 08:21:24 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477DLOtg120755;
	Wed, 7 Aug 2024 08:21:24 -0500
Message-ID: <66c5b0fc-e6c3-43c8-a632-47ac6aaccfbb@ti.com>
Date: Wed, 7 Aug 2024 08:21:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][RFC PATCH 07/16] tidl-api, tidl-utils:
 deprecate
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240805043713.172555-1-denis@denix.org>
 <20240805043713.172555-7-denis@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240805043713.172555-7-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Aug 2024 13:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15507

On 8/4/24 11:37 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Remove old tidl components as deprecated and not maintained.

Might be good to point out in this message that we are not really
deprecating our DL components, they simply moved to another layer
(meta-edgeai), and these are just leftover remnants, not that our
TIDL/AI solution is now unmaintained or something crazy like that.

Otherwise LGTM,

Acked-by: Andrew Davis <afd@ti.com>

> 
> This component was offloading processing tasks to DSP using heavily
> modified OpenCL/OpenCV forks of old versions of corresponding upstream
> projects on legacy platforms.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   ...nativesdk-packagegroup-arago-tisdk-host.bb |  8 ---
>   .../recipes-ti/tidl-api/tidl-api.inc          | 21 -------
>   .../recipes-ti/tidl-api/tidl-api_git.bb       | 57 -------------------
>   .../recipes-ti/tidl-api/tidl-examples_git.bb  | 52 -----------------
>   .../recipes-ti/tidl-api/tidl-viewer_git.bb    | 33 -----------
>   .../recipes-ti/tidl-utils/tidl-import_git.bb  | 46 ---------------
>   .../recipes-ti/tidl-utils/tidl-utils.bb       | 34 -----------
>   .../recipes-ti/tidl-utils/tidl-utils.inc      |  4 --
>   8 files changed, 255 deletions(-)
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
>   delete mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> 
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> index 92a80b6b..ed29b6c4 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> @@ -7,13 +7,6 @@ inherit_defer nativesdk
>   
>   PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
>   
> -TIDL_TOOLS = ""
> -#TIDL_TOOLS = " \
> -#    nativesdk-tidl-import \
> -#    nativesdk-tidl-viewer \
> -#    nativesdk-tidl-utils \
> -#"
> -
>   EXTRA_TI_TOOLS = " \
>       nativesdk-ti-cgt6x \
>       nativesdk-ti-cgt-pru \
> @@ -22,7 +15,6 @@ EXTRA_TI_TOOLS = " \
>       nativesdk-open62541-examples \
>       nativesdk-open62541-tests \
>       nativesdk-gcc-arm-baremetal \
> -    ${@oe.utils.all_distro_features(d, "opencl opencv", "${TIDL_TOOLS}")} \
>   "
>   
>   RDEPENDS:${PN} = "\
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> deleted file mode 100644
> index 389e565a..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -PV = "1.5.1"
> -INC_PR = "r0"
> -
> -LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
> -
> -GIT_URI = "git://git.ti.com/git/tidl/tidl-api.git"
> -GIT_PROTOCOL = "https"
> -BRANCH = "master"
> -
> -SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "4b801ad96b50f53e977b96d8b227ba4bcb26e011"
> -
> -# default patchdir is ${S}
> -S = "${WORKDIR}/git"
> -
> -inherit features_check
> -
> -REQUIRED_MACHINE_FEATURES = "dsp"
> -REQUIRED_MACHINE_FEATURES:class-native = ""
> -REQUIRED_MACHINE_FEATURES:class-nativesdk = ""
> -REQUIRED_DISTRO_FEATURES = "opencl opencv"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> deleted file mode 100644
> index 7f37b63b..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -SUMMARY = "TIDL API"
> -DESCRIPTION = "TIDL API header and library. Refer TIDL API User's Guide for details."
> -HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
> -LICENSE = "BSD-3-Clause"
> -
> -include tidl-api.inc
> -require recipes-ti/includes/ti-paths.inc
> -
> -PR = "${INC_PR}.0"
> -
> -COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -inherit python3native
> -
> -DEPENDS = "opencv \
> -           opencl \
> -           opencl-monitor \
> -           ti-cgt6x-native \
> -           clocl-native \
> -"
> -
> -RDEPENDS:${PN} += "opencl-runtime \
> -                   opencv \
> -"
> -
> -EXTRA_OEMAKE = " -C ${S}/tidl_api \
> -                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
> -                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> -"
> -
> -do_compile() {
> -  oe_runmake
> -}
> -
> -CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -
> -TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
> -
> -do_install() {
> -    install -d ${D}${TIDL_INSTALL_DIR}
> -    install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
> -    install -d ${D}${TIDL_INSTALL_DIR}/viewer
> -    install -d ${D}${libdir}
> -    cp ${CP_ARGS} ${S}/tidl_api/libtidl_*.so* ${D}${libdir}
> -    rm -f ${S}/tidl_api/libtidl_*.so*
> -    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
> -    cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
> -    install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
> -}
> -
> -FILES:${PN} += "\
> -    ${TIDL_INSTALL_DIR} \
> -"
> -
> -
> -INSANE_SKIP:${PN} = "arch ldflags textrel staticdev"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> deleted file mode 100644
> index c9756d40..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -SUMMARY = "TIDL API examples"
> -DESCRIPTION = "Examples of TIDL API. Refer TIDL API User's Guide for details."
> -HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
> -LICENSE = "BSD-3-Clause"
> -
> -include tidl-api.inc
> -require recipes-ti/includes/ti-paths.inc
> -
> -PR = "${INC_PR}.0"
> -
> -COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -DEPENDS = "opencv \
> -           clocl-native \
> -           ti-cgt6x-native \
> -           tidl-api \
> -           json-c \
> -"
> -
> -RDEPENDS:${PN} += "tidl-api \
> -                   opencl-runtime \
> -                   opencv \
> -                   json-c \
> -                   python3-core \
> -"
> -
> -EXTRA_OEMAKE = " -C ${S}/examples \
> -                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
> -                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> -"
> -
> -do_compile() {
> -  oe_runmake
> -}
> -
> -CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -
> -TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
> -
> -do_install() {
> -    install -d ${D}${TIDL_INSTALL_DIR}
> -    install -d ${D}${TIDL_INSTALL_DIR}/examples
> -    cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
> -}
> -
> -FILES:${PN} += "\
> -    ${TIDL_INSTALL_DIR} \
> -"
> -
> -
> -INSANE_SKIP:${PN} = "arch ldflags textrel staticdev"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> deleted file mode 100644
> index 644b8626..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SUMMARY = "TIDL Network Viewer"
> -DESCRIPTION = "TIDL Network viewer using dot and graphviz"
> -HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
> -LICENSE = "BSD-3-Clause"
> -
> -include tidl-api.inc
> -
> -PR = "${INC_PR}.0"
> -
> -DEPENDS = "boost boost-native ti-cgt6x-native clocl-native"
> -
> -TARGET:class-target = "arm"
> -TARGET:class-native = "x86"
> -TARGET:class-nativesdk = "x86"
> -
> -CXXFLAGS:append:class-native    = " -DPLATFORM_64BIT "
> -CXXFLAGS:append:class-nativesdk = " -DPLATFORM_64BIT "
> -
> -EXTRA_OEMAKE = " -C ${S}/viewer \
> -                 TARGET=${TARGET} \
> -                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
> -"
> -
> -do_compile() {
> -  oe_runmake
> -}
> -
> -do_install() {
> -  install -d ${D}${bindir}
> -  install -m 755 ${S}/viewer/${TARGET}/tidl_viewer ${D}${bindir}
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> deleted file mode 100644
> index 3c1b81ff..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -SUMMARY = "TIDL import tool for conversion of Caffe and TF models into TI custom network format"
> -DESCRIPTION = "TIDL import tool is using protobuf to read and parse information from external network models \
> -               This is ARM Linux implementation."
> -
> -require ./tidl-utils.inc
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
> -
> -S = "${WORKDIR}/git/src/importTool"
> -
> -DEPENDS = "protobuf zlib protobuf-native flatbuffers tensorflow-lite flatbuffers-native tensorflow-lite-native"
> -
> -EXTRA_OEMAKE += "TIARM_TOOLS=${GCC_ARM_NONE_TOOLCHAIN}"
> -EXTRA_OEMAKE += "XDAIS_PATH=${XDAIS_INSTALL_DIR}"
> -EXTRA_OEMAKE += "SHOW_COMMANDS=1"
> -EXTRA_OEMAKE += "CORE=eve"
> -EXTRA_OEMAKE += "TARGET_BUILD=release"
> -EXTRA_OEMAKE += "TARGET_PLATFORM=PC"
> -
> -EXTRA_MAKE_ARGS = "PLATFORM_BUILD=x86 LINUXENV=x86 LINUX_IMPORT_TOOL=64BIT \
> -                   PROTOBUF_LIB_DIR=${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=${STAGING_DIR_NATIVE}/usr/include \
> -                   FLATBUFFERS_INC_DIR=${STAGING_DIR_NATIVE}$/usr/include/flatbuffers \
> -                   TF_LITE_GENERATED_PATH=${STAGING_DIR_NATIVE}/usr/include/tensorflow/lite/schema"
> -EXTRA_MAKE_ARGS:class-target = "LINUX_BUILD_TOOLS=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} \
> -                                PROTOBUF_LIB_DIR=${STAGING_LIBDIR} PROTOBUF_INC_DIR=${STAGING_INCDIR} \
> -                                FLATBUFFERS_INC_DIR=${STAGING_INCDIR}/flatbuffers \
> -                                TF_LITE_GENERATED_PATH=${STAGING_INCDIR}/tensorflow/lite/schema LINUXENV=oearm"
> -
> -EXTRA_OEMAKE += "${EXTRA_MAKE_ARGS}"
> -
> -do_compile() {
> -    cd ${S}/modules/ti_dl/utils
> -    ./genProtoSrc.sh
> -    cd ${S}
> -    oe_runmake -C modules/ti_dl/utils/tidlModelImport
> -}
> -
> -do_install () {
> -    install -d ${D}${bindir}
> -    install -m 755 ${S}/modules/ti_dl/utils/tidlModelImport/out/tidl_model_import.out ${D}${bindir}
> -}
> -
> -INSANE_SKIP:${PN} = "ldflags"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> deleted file mode 100644
> index e8aad51c..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -SUMMARY = "TIDL Utilities and configuration files"
> -DESCRIPTION = "TIDL Utilities for standalone simulation and importing / translation of Caffe and TF-Slim models"
> -HOMEPAGE = "http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Foundational_Components.html#tidl"
> -LICENSE = "TI-TFL"
> -
> -require ./tidl-utils.inc
> -
> -LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
> -
> -RDEPENDS:${PN}:class-target += "tidl-api tidl-examples"
> -
> -S = "${WORKDIR}/git"
> -
> -TARGET:class-target = "arm"
> -TARGET:class-native = "x86"
> -TARGET:class-nativesdk = "x86"
> -
> -CP_ARGS = "-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -
> -do_install() {
> -  install -d ${D}${bindir}
> -  install -d ${D}${datadir}/ti/tidl/utils/test
> -  install -d ${D}${datadir}/ti/tidl/utils/docs
> -  install -m 755 ${S}/${TARGET}/bin/* ${D}${bindir}
> -  cp ${CP_ARGS} ${S}/test/* ${D}${datadir}/ti/tidl/utils/test/.
> -  cp ${CP_ARGS} ${S}/docs/* ${D}${datadir}/ti/tidl/utils/docs/.
> -}
> -
> -FILES:${PN} += "${datadir}/ti/tidl/utils \
> -                ${bindir}"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -INSANE_SKIP:${PN} += "build-deps ldflags already-stripped"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> deleted file mode 100644
> index 80eefe9d..00000000
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -SRC_URI = "git://git.ti.com/git/tidl/tidl-utils.git;protocol=https;branch=master"
> -SRCREV = "6a51b2aff1709c13edb3445bdb4698a28fbb2ae7"
> -PV = "01.01.03.02"
> -PR = "r1"

