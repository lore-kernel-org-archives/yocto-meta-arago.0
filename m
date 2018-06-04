Return-Path: <d-senicic1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 53E8D529BA
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 14:56:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54EumaV002762
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 09:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528124208;
	bh=8Nc95Y+0cyKabDGJ80ejnGI7p3bVmCkzW22MFcFkyJ8=;
	h=From:To:CC:Subject:Date;
	b=l0qat7kLVPpTRMXg8ZEULfKsit35vTnoW58IPWThwZEmoERBwZyWbqmqbeFLIm5FQ
	zQYDXPU7qzvfgdZTY/3p53QiIoHvMykq8LhH3WLfqXgQJ4YUCmKE33TtFqhmPJGvwf
	DJzmsHsmvmepfzOhAOMOgJryxkA3LLAsIUUT1e5s=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Eumqs014611
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 09:56:48 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 09:56:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 09:56:48 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Eumpn003223;
	Mon, 4 Jun 2018 09:56:48 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Jun 2018 10:56:41 -0400
Message-ID: <1528124204-19003-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH 1/4] ti-pdk: Include path for EVE toolchain
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
X-List-Received-Date: Mon, 04 Jun 2018 14:56:55 -0000
Content-Type: text/plain

* ti-pdk class is like one from meta-ti, but with additional path for EVE toolchain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 classes/ti-pdk.bbclass | 137 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 classes/ti-pdk.bbclass

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
new file mode 100644
index 0000000..73dc94e
--- /dev/null
+++ b/classes/ti-pdk.bbclass
@@ -0,0 +1,137 @@
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+inherit perlnative
+
+DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
+
+DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
+DEPENDS_remove_ti33x = "ti-cgt6x-native"
+DEPENDS_remove_ti43x = "ti-cgt6x-native"
+DEPENDS_append_omapl1 = " ti-cgt-arm-native"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+# HTML hyperlink text
+PDK_COMP_LINK_TEXT ?= ""
+
+DOC_FILE = "API_Documentation_${PN}.html"
+
+create_doc_link () {
+    PDK_COMP_DIR=`get_build_dir_bash`
+
+    echo "<a href=\"${PDK_COMP_DIR}/docs/doxygen/html/index.html\">${PDK_COMP_LINK_TEXT}</a>" >> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc/${DOC_FILE}
+}
+
+get_build_dir_bash() {
+  if [ -f ${S}/package.xdc ]
+  then
+    grep '^package' ${S}/package.xdc | sed -e 's|\[.*$||' | awk '{ print $2 }' | sed -e 's|\.|/|g'
+  else
+    echo ${S}
+    return 1
+  fi
+}
+
+export CROSS_TOOL_PRFX="arm-none-eabi-"
+export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export TOOLCHAIN_PATH_EVE = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-arp32"
+export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
+
+export ROOTDIR = "${B}"
+export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+
+export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
+export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
+
+TI_PDK_XDCMAKE ?= "1"
+
+# By default, only build the cores with available toolchains
+TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x a9host a8host pru_0 pru_1"
+TI_PDK_LIMIT_SOCS ?= ""
+TI_PDK_LIMIT_BOARDS ?= ""
+TI_PDK_MAKE_TARGET ?= "release"
+TI_PDK_EXTRA_MAKE ?= ""
+TI_PDK_DOXYGEN_SUPPORT ?= "1"
+
+TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
+
+PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
+PARALLEL_MAKE = ""
+
+def get_doxygen_support(d):
+    if d.getVar('TI_PDK_DOXYGEN_SUPPORT', True) == '1':
+        return ''
+    return 'DOXYGEN_SUPPORT=no'
+
+EXTRA_OEMAKE = " \
+    LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" \
+    LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" \
+    LIMIT_CORES="${TI_PDK_LIMIT_CORES}" \
+    ${TI_PDK_EXTRA_MAKE} \
+    ${@get_doxygen_support(d)} \
+"
+
+do_configure() {
+    BUILD_DIR=${B}/`get_build_dir_bash`
+
+    mkdir -p ${BUILD_DIR}
+    cp -r ${S}/* ${BUILD_DIR}
+
+    if [ "${TI_PDK_XDCMAKE}" == "1" ]
+    then
+        cd ${BUILD_DIR}
+
+        sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
+        find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
+        find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
+        find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
+        find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
+
+        cd ${B}
+        ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
+    else
+        if [ "${CLEANBROKEN}" != "1" ]
+        then
+            cd ${BUILD_DIR}
+            oe_runmake clean
+            cd "${B}"
+        fi
+    fi
+
+}
+
+do_compile() {
+
+    if [ "${TI_PDK_XDCMAKE}" == "1" ]
+    then
+        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${TI_PDK_XDC_ARGS}" ROOTDIR="${ROOTDIR}" -PR .
+        ${XDC_INSTALL_DIR}/xdc release XDCARGS="${TI_PDK_XDC_ARGS}" -PR .
+    else
+        BUILD_DIR=${B}/`get_build_dir_bash`
+        cd ${BUILD_DIR}
+
+        oe_runmake ${TI_PDK_MAKE_TARGET}
+    fi
+}
+
+do_install () {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
+    
+    if [ "${PDK_COMP_LINK_TEXT}" != "" ]
+    then
+        install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/.extras/doc
+        create_doc_link
+    fi
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
-- 
1.9.1


