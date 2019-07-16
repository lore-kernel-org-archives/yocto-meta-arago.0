Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 670B852976
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2019 17:14:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GHDxAG113338
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 12:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563297239;
	bh=6puRfN0WORP5byvar7asC52sWICYTG+s0gyk9vuP7kQ=;
	h=From:To:CC:Subject:Date;
	b=ChzDHAhTkXv0yy39UFRHtqkz217UIIhnzzwwXfuj10G7emu3Zju/GXRUe6hbN/a98
	A7gJJm33G3QdTIKMG9LDn2NH9b4tPLkji01emuA51RK9fB5JYZ6U2xYICXljRqD6An
	mN75SxDbP+PnPjHTpqFSx0m9Z5k8Vy+/rlMW36Oc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GHDxVW088813
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 12:13:59 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Jul 2019 12:13:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Jul 2019 12:13:59 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GHDx9m065387;
	Tue, 16 Jul 2019 12:13:59 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Jul 2019 12:57:15 -0400
Message-ID: <1563296237-23799-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 1/3] fftlib: add fftlib v3.1.0.0
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
X-List-Received-Date: Tue, 16 Jul 2019 17:14:49 -0000
Content-Type: text/plain

From: Yimin Zhang <a0216607@ti.com>

* Optimized FFT libraries for TI C66x devices

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/fftlib/fftlib.inc     | 17 ++++
 meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb  | 99 ++++++++++++++++++++++
 .../recipes-ti/includes/arago-paths.inc            |  2 +
 3 files changed, 118 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/fftlib/fftlib.inc
 create mode 100644 meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb

diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
new file mode 100644
index 0000000..ab5baf5
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
@@ -0,0 +1,17 @@
+PV = "3_1_0_0"
+INC_PR = "r3"
+
+require recipes-ti/includes/arago-paths.inc
+
+
+FFTLIB_GIT_URI = "git://git.ti.com/fftlib/fftlib"
+FFTLIB_GIT_PROTOCOL = "git"
+FFTLIB_GIT_BRANCH = "master"
+FFTLIB_GIT_DESTSUFFIX = "${WORKDIR}/git"
+
+FFTLIB_SRCREV = "54fb858e97235c0a3cd948d24d22329653a7837f"
+
+BRANCH = "${FFTLIB_GIT_BRANCH}"
+SRC_URI = "${FFTLIB_GIT_URI};destsuffix=${FFTLIB_GIT_DESTSUFFIX};protocol=${FFTLIB_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${FFTLIB_SRCREV}"
diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb b/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb
new file mode 100644
index 0000000..5b2ceaa
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb
@@ -0,0 +1,99 @@
+SUMMARY = "TI FFTLIB"
+HOMEPAGE = "http://git.ti.com/fftlib/fftlib"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://ti/fftlib/docs/manifest/manifest.xml.xdt;md5=178402e86abc15ff3bac0d4fc57e5463"
+
+include fftlib.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "common-csl-ip-rtos libarch ti-xdctools-native doxygen-native ti-cgt6x-native ti-xdais libulm dsplib-c66x php libxslt-native libxslt openmp-rtos"
+
+COMPATIBLE_MACHINE = "k2hk|dra7xx"
+
+TARGET_dra7xx = "SOC_AM572x"
+TARGET_k2hk   = "SOC_K2H"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+
+export FFTLIB_ROOT="${S}"
+export DOXYGEN_DIR="${DOXYGEN_INSTALL_DIR}"
+
+export TI_OCL_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/opencl"
+export CGTROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
+export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
+export FC_DIR = "${FC_INSTALL_DIR}"
+export PDK_DIR = "${PDK_INSTALL_DIR}"
+export OMP_DIR ="${OMP_INSTALL_DIR}"
+export IPC_DIR = "${IPC_INSTALL_DIR}/packages"
+export LIBARCH_DIR = "${LIBARCH_INSTALL_DIR}"
+export TARGET_ROOTDIR ="${STAGING_DIR_TARGET}"
+
+export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
+export C6636_PDK_DIR ="${PDK_INSTALL_DIR}/packages"
+export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export LINUX_DEVKIT_ROOT = "${STAGING_DIR_TARGET}"
+
+export PDK_INSTALL_DIR
+export FC_INSTALL_DIR
+export IPC_INSTALL_DIR
+export XDC_INSTALL_DIR
+export XDAIS_INSTALL_DIR
+
+export OPENMP_INSTALL_DIR="${OMP_INSTALL_DIR}"
+export BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}"
+export EDMA_INSTALL_DIR="${EDMA3_LLD_INSTALL_DIR}"
+export C66CODEGENTOOL="${TI_OCL_CGT_INSTALL}"
+export C64CODEGENTOOL="${TI_OCL_CGT_INSTALL}"
+export TI_DOXYGEN_TEMPLATES="${DOXYGEN_DIR}/TI_Templates/10-01-2007"
+export XDCBUILDCFG="${FFTLIB_ROOT}/ti/mas/swtools/config.bld"
+export FFTLIB_INSTALL_DIR="${FFTLIB_ROOT}"
+export IPC_DIR="{IPC_INSTALL_DIR}"
+
+XDCPATH.="${XDCCGROOT}/include;"
+XDCPATH.="${XDAIS_INSTALL_DIR}/packages;"
+XDCPATH.="${XDC_INSTALL_DIR}/packages;"
+XDCPATH.="${FFTLIB_INSTALL_DIR};"
+XDCPATH.="${FC_INSTALL_DIR}/packages;"
+XDCPATH.="${OMP_INSTALL_DIR}/packages;"
+XDCPATH.="${PDK_INSTALL_DIR}/packages;"
+XDCPATH.="${BIOS_INSTALL_DIR}/packages;"
+XDCPATH.="${EDMA3_LLD_INSTALL_DIR}/packages;"
+XDCPATH.="${DSPLIB_C66_INSTALL_DIR}/packages;"
+XDCPATH.="${IPC_INSTALL_DIR}/packages;"
+XDCPATH.="${LIBARCH_INSTALL_DIR}/packages;"
+XDCPATH.="${TI_OCL_INSTALL_DIR};"
+
+XDCPATH.="${FFTLIB_ROOT}"
+
+export XDCPATH
+export PATH := "${XDC_INSTALL_DIR}:${PATH}"
+
+
+do_compile() {
+   echo "Building the FFTLIB.zip"
+   cd ${FFTLIB_ROOT}/ti/fftlib
+   xdc XDCARGS="${TARGET} c66x armplusdsp bundle" XDCOPTIONS="-v"
+}
+
+do_install() {
+
+   cd ${FFTLIB_ROOT}/ti/fftlib
+   install -d ${D}${FFTLIB_INSTALL_DIR_RECIPE}
+
+   find -name "fftlib*.zip" -exec unzip -o {} -d ${D}${FFTLIB_INSTALL_DIR_RECIPE} \;
+   mv ${D}${FFTLIB_INSTALL_DIR_RECIPE}/fftlib/* ${D}${FFTLIB_INSTALL_DIR_RECIPE}
+   rm -r ${D}${FFTLIB_INSTALL_DIR_RECIPE}/fftlib
+
+}
+
+FILES_${PN}-dev += "${FFTLIB_INSTALL_DIR_RECIPE}"
+
+# skip checking binary against ARM architecture
+INSANE_SKIP_${PN}-dev = "arch"
+ALLOW_EMPTY_${PN} = "1"
diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index 5a2efaf..74833cf 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -5,9 +5,11 @@ export LINALG_INSTALL_DIR_RECIPE     = "${installdir}/ti-linalg-tree"
 export LLVM_RTOS_INSTALL_DIR_RECIPE  = "${installdir}/llvm-rtos-tree"
 export OCL_RTOS_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-rtos-tree"
 export OCL_TIDL_FW_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-tidl-fw-tree"
+export FFTLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-fftlib-tree"
 
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
 export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
 export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
 export OCL_RTOS_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_RTOS_INSTALL_DIR_RECIPE}"
 export OCL_TIDL_FW_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
+export FFTLIB_INSTALL_DIR     = "${STAGING_DIR_TARGET}${FFTLIB_INSTALL_DIR_RECIPE}"
-- 
2.7.4


