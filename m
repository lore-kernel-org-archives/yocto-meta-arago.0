Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E0D45529C0
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 18:01:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6AI1mpm098150
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 13:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531245708;
	bh=wBR/F/8542T6CDInK16Fy0vyzn/4FCuYZKLZwuO7Wlc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=OAvskx4zhM2JSi6WR3UY/pt91IKCcDSBGcXvaYsJJJCyo/k+BJ2qUfyO9Xdi7bO6b
	GS+sS6L67VmvLHhgLVqeDQaRwIL2j2yrFcGd9TxTxhEuqbgqVsEw8hHe+hZIUgDkpa
	CGTkDCHMc4hOiJNkAuVeDPcpPMzUcFo7dXP5fc2U=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AI1mmV005105
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 13:01:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 10 Jul 2018 13:01:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 10 Jul 2018 13:01:47 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AI1l5U002444;
	Tue, 10 Jul 2018 13:01:47 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20180710172615.144475-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e8df6142-7e03-db54-8b7c-d57474e0ce1b@ti.com>
Date: Tue, 10 Jul 2018 14:01:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <20180710172615.144475-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v2] tidl-api: update to version 01.00.00.02
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
X-List-Received-Date: Tue, 10 Jul 2018 18:01:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/10/2018 1:26 PM, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  4 +-
>   .../recipes-ti/tidl-api/tidl-api_git.bb            | 54 ++++++++++++++++++++++
>   .../recipes-ti/tidl-api/tidl-examples_git.bb       | 34 ++++++++------
>   3 files changed, 77 insertions(+), 15 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index d266611c..d2b570d1 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,4 +1,4 @@
> -PV = "1.0.0.0"
> +PV = "1.0.0.2"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
> @@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
>   BRANCH = "master"
>   
>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "d6326ad29c9ed4b79ebf3e0f588f247ed2cf3d2e"
> +SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
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
>   HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
>   LICENSE = "BSD"
>   
> @@ -11,9 +11,16 @@ PR = "${INC_PR}.0"
>   COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
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
>   S = "${WORKDIR}/git"
>   
> @@ -28,20 +35,21 @@ do_compile() {
>   
>   CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>   
> +TIDL_INSTALL_DIR = "${datadir}/ti/tidl"
> +
>   do_install() {
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
>   }
>   
>   FILES_${PN} += "\
> -    ${datadir}/ti/tidl-api \
> +    ${TIDL_INSTALL_DIR} \
>   "
>   
>   
>   INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
> +
> +CREATE_SRCIPK = "1"
> +SRCIPK_SRC_DIR = "${S}/examples"
> +SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"

This SRCIPK configuration should go into 
meta-arago-distro/conf/distro/include/arago-source-ipk.inc


