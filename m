Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 99641529BF
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 17:11:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6AHBmP2060942
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 12:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531242708;
	bh=9mzrKvppXsUk8nkZXfLHB5YMMU5fJ6zxII16bVtVDP0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=O0kaYfR/rWe/vIOJLvMEsu05fTECRexkOrog6cTTjkEuVVhBSz/4Nrsh6jZ1xlbq7
	NcOVq5j64RAe7nz11Nx0sQXwLt5c+gKjH/eIv/FnG2Apzjmh6JPmOGi1y/ZKH2p6z/
	+FP8h398YBJT3yF0B558SYUi7YSUP35cAaTEwt6U=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AHBmYu017429
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 12:11:48 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 10 Jul 2018 12:11:47 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 10 Jul 2018 12:11:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AHBlch015799;
	Tue, 10 Jul 2018 12:11:47 -0500
Date: Tue, 10 Jul 2018 13:11:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20180710171105.GQ5464@beryl>
References: <20180710170704.139418-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20180710170704.139418-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tidl-api: update to version 01.00.00.02
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
X-List-Received-Date: Tue, 10 Jul 2018 17:11:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 10, 2018 at 12:07:04PM -0500, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 13 +++---
>  .../recipes-ti/tidl-api/tidl-api_git.bb            | 54 ++++++++++++++++++++++
>  .../recipes-ti/tidl-api/tidl-examples_git.bb       | 34 ++++++++------
>  3 files changed, 82 insertions(+), 19 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index d266611c..ca9131d9 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,11 +1,12 @@
> -PV = "1.0.0.0"
> +PV = "1.0.0.2"
>  INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
>  
> -GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
> -GIT_PROTOCOL = "git"
> -BRANCH = "master"
> +TIDL_API_GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
> +TIDL_API_GIT_PROTOCOL = "git"
> +TIDL_API_GIT_BRANCH = "master"
> +TIDL_API_GIT_SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"

What's with the unnecessary abstraction? Those vars are recipe-local anyway...


> -SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
> +SRC_URI = "${TIDL_API_GIT_URI};protocol=${TIDL_API_GIT_PROTOCOL};branch=${TIDL_API_GIT_BRANCH}"
> +SRCREV = "${TIDL_API_GIT_SRCREV}"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> new file mode 100644
> index 00000000..9c41ef11
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -0,0 +1,54 @@
> +SUMMARY = "TIDL API"
> +DESCRIPTION = "TIDL API header and library. Refer TIDL API User's Guide for details."
> +HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
> +LICENSE = "BSD"
> +
> +include tidl-api.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +PR = "${INC_PR}.0"
> +
> +COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +DEPENDS = "opencv \
> +           opencl \
> +           opencl-monitor \
> +           ti-cgt6x-native \
> +           clocl-native \
> +"
> +
> +RDEPENDS_${PN} += "opencl-runtime \
> +                   opencv \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = " -C ${S}/tidl_api \
> +                 TARGET_ROOTDIR=${STAGING_DIR_HOST} \
> +                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> +"
> +
> +do_compile() {
> +  oe_runmake
> +}
> +
> +CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
> +
> +do_install() {
> +    install -d ${D}${TIDL_INSTALL_DIR}
> +    install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
> +    install -d ${D}${TIDL_INSTALL_DIR}/viewer
> +    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
> +    cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
> +    install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
> +}
> +
> +FILES_${PN} += "\
> +    ${TIDL_INSTALL_DIR} \
> +"
> +
> +
> +INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> index be9bb65f..3e4514fe 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -1,5 +1,5 @@
> -SUMMARY = "TIDL API and examples"
> -DESCRIPTION = "TIDL API and examples of API usage. Refer TIDL API User's Guide for details."
> +SUMMARY = "TIDL API examples"
> +DESCRIPTION = "Examples of TIDL API. Refer TIDL API User's Guide for details."
>  HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
>  LICENSE = "BSD"
>  
> @@ -11,9 +11,16 @@ PR = "${INC_PR}.0"
>  COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -DEPENDS = "opencv opencl opencl-monitor ti-cgt6x-native clocl-native"
> +DEPENDS = "opencv \
> +           clocl-native \
> +           ti-cgt6x-native \
> +           tidl-api \
> +"
>  
> -RDEPENDS_${PN} += " opencl-runtime opencv"
> +RDEPENDS_${PN} += "tidl-api \
> +                   opencl-runtime \
> +                   opencv \
> +"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -28,20 +35,21 @@ do_compile() {
>  
>  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>  
> +TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
> +
>  do_install() {
> -    install -d ${D}${datadir}/ti/tidl-api
> -    install -d ${D}${datadir}/ti/tidl-api/examples
> -    install -d ${D}${datadir}/ti/tidl-api/tidl_api
> -    install -d ${D}${datadir}/ti/tidl-api/viewer
> -    cp ${CP_ARGS} ${S}/examples/* ${D}${datadir}/ti/tidl-api/examples/
> -    cp ${CP_ARGS} ${S}/tidl_api/* ${D}${datadir}/ti/tidl-api/tidl_api/
> -    cp ${CP_ARGS} ${S}/viewer/* ${D}${datadir}/ti/tidl-api/viewer/
> -    install ${S}/readme.md ${D}${datadir}/ti/tidl-api/
> +    install -d ${D}${TIDL_INSTALL_DIR}
> +    install -d ${D}${TIDL_INSTALL_DIR}/examples
> +    cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
>  }
>  
>  FILES_${PN} += "\
> -    ${datadir}/ti/tidl-api \
> +    ${TIDL_INSTALL_DIR} \
>  "
>  
>  
>  INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> +
> +CREATE_SRCIPK = "1"
> +SRCIPK_SRC_DIR = "${S}/examples"
> +SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

