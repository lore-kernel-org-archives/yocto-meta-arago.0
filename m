Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 1744352990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 20:19:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KKJ9jx016716
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 15:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505938749;
	bh=gEACJhM+KA9U/2UOapoJFSd2+IOIIdLJO4Q97JGkygM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=F8a3Z2BsFZy1ho57jFMXkXEejRjf2HL2CqUp5DYKQEw8CWL+tafxxM1Ua+3t/txYy
	36VoDGPQB+vf8ctrvED1yp+c1jy8bkycDZd9Tcw22xHCNgCk49OQbyHzfqUYeQhlni
	lO/yMPmmXmIt4344pLth/UOhptvTf2WJ4COWHuxM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KKJ8QD023551
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 15:19:08 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 15:19:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 15:19:08 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KKJ831027883;
	Wed, 20 Sep 2017 15:19:08 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505936620-7090-1-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <eef87279-9c58-ce5e-248b-70784aadf6f4@ti.com>
Date: Wed, 20 Sep 2017 16:19:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505936620-7090-1-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processsor-sdk] [PATCH] ti-pdk.bbclass: added to enable the building of icss-emac firmware binaries
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
X-List-Received-Date: Wed, 20 Sep 2017 20:19:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/20/2017 3:43 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   classes/ti-pdk.bbclass | 115 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 classes/ti-pdk.bbclass
>
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> new file mode 100644
> index 0000000..1e3a7cb
> --- /dev/null
> +++ b/classes/ti-pdk.bbclass
> @@ -0,0 +1,115 @@
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
> +
> +inherit perlnative
> +
> +DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-pdk-build-rtos"
> +
> +DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
> +DEPENDS_remove_ti33x = "ti-cgt6x-native"
> +DEPENDS_remove_ti43x = "ti-cgt6x-native"
> +DEPENDS_append_omapl1 = " ti-cgt-arm-native"
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
> +
> +# HTML hyperlink text
> +PDK_COMP_LINK_TEXT ?= ""
> +
> +DOC_FILE = "API_Documentation_${PN}.html"
> +
> +create_doc_link () {
> +    PDK_COMP_DIR=`get_build_dir_bash`
> +
> +    echo "<a href=\"${PDK_COMP_DIR}/docs/doxygen/html/index.html\">${PDK_COMP_LINK_TEXT}</a>" >> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc/${DOC_FILE}
> +}
> +
> +get_build_dir_bash() {
> +  if [ -f ${S}/package.xdc ]
> +  then
> +    grep '^package' ${S}/package.xdc | sed -e 's|\[.*$||' | awk '{ print $2 }' | sed -e 's|\.|/|g'
> +  else
> +    echo ${S}
> +    return 1
> +  fi
> +}
> +
> +export CROSS_TOOL_PRFX="arm-none-eabi-"
> +export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> +export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> +export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"

It appears that there is a missing dependency for the PRU toolchain?

> +
> +export ROOTDIR = "${B}"
> +export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> +export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +
> +export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
> +export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
> +
> +TI_PDK_XDCMAKE ?= "1"
> +
> +# By default, only build the cores with available toolchains
> +TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1"
> +TI_PDK_LIMIT_SOCS ?= ""
> +TI_PDK_LIMIT_BOARDS ?= ""
> +TI_PDK_MAKE_TARGET ?= "release"
> +TI_PDK_EXTRA_MAKE ?= ""
> +
> +TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
> +
> +PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
> +
> +do_configure() {
> +    BUILD_DIR=${B}/`get_build_dir_bash`
> +
> +    mkdir -p ${BUILD_DIR}
> +    cp -r ${S}/* ${BUILD_DIR}
> +
> +    if [ "${TI_PDK_XDCMAKE}" == "1" ]
> +    then
> +        cd ${BUILD_DIR}
> +
> +        sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
> +        find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
> +        find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
> +        find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
> +        find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
> +    fi
> +}
> +
> +do_compile() {
> +
> +    if [ "${TI_PDK_XDCMAKE}" == "1" ]
> +    then
> +        ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
> +        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${TI_PDK_XDC_ARGS}" ROOTDIR="${ROOTDIR}" -PR .
> +        ${XDC_INSTALL_DIR}/xdc release XDCARGS="${TI_PDK_XDC_ARGS}" -PR .
> +    else
> +        BUILD_DIR=${B}/`get_build_dir_bash`
> +        cd ${BUILD_DIR}
> +
> +        make ${TI_PDK_MAKE_TARGET} \
> +             LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" \
> +             LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" \
> +             LIMIT_CORES="${TI_PDK_LIMIT_CORES}" \
> +             ${TI_PDK_EXTRA_MAKE}
> +    fi
> +}
> +
> +do_install () {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
> +
> +    if [ "${PDK_COMP_LINK_TEXT}" != "" ]
> +    then
> +        install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc
> +        create_doc_link
> +    fi
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"


