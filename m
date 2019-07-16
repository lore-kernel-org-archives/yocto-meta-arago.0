Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 63C9652976
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2019 17:14:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GHE03b119821
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 12:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563297241;
	bh=JWZN9/Cz4QzdVaeA2YWXrh1PF+hmKMLT9xws+lyZDHk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ox5pIefT7J6Jz55XTiAVxK0xmN9dar7P4JxCY5wmiHZEEpm8HyYmq0e0ASe6Ur0BX
	m7CDM9yiYjwLzLj6/GTHZO8S5iHIDwtO4Gu1tSSEYRbo9AL7WdAzL5NNXBy//pZV/L
	4ieFuaEeHlCAIE+TpGzUxsSRNXG3p9fwR60LQYPM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GHE0IL131000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 12:14:00 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Jul 2019 12:14:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Jul 2019 12:14:00 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GHDx9n065387;
	Tue, 16 Jul 2019 12:14:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Jul 2019 12:57:16 -0400
Message-ID: <1563296237-23799-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563296237-23799-1-git-send-email-j-stiffler@ti.com>
References: <1563296237-23799-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 2/3] ti-fftw: add ti-fftw v3.1.0.0
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
X-List-Received-Date: Tue, 16 Jul 2019 17:14:51 -0000
Content-Type: text/plain

From: Yimin Zhang <a0216607@ti.com>

* TI implementation of FFTW APIs which support offloading to from ARM
  to DSP via OpenCL.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/fftlib/ti-fftw-examples_git.bb      | 25 +++++++++
 meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb | 59 ++++++++++++++++++++++
 .../recipes-ti/includes/arago-paths.inc            |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb

diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb b/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb
new file mode 100644
index 0000000..130504b
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "TI FFTW"
+HOMEPAGE = "http://git.ti.com/fftlib"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://../docs/TI-FFTW_3.1.0_manifest.html;md5=aaa275ec704a738216ba696898941b44"
+
+include fftlib.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "ti-fftw"
+
+RDEPENDS_${PN} += "ti-fftw-staticdev"
+
+S = "${WORKDIR}/git/ti/fftw/examples"
+
+EXTRA_OEMAKE += "TARGET_ROOTDIR="${STAGING_DIR_TARGET}""
+
+do_install() {
+    install -d ${D}${datadir}/ti/examples/fftw
+    cp -r ./* ${D}${datadir}/ti/examples/fftw
+}
+
+FILES_${PN} = "${datadir}/ti/examples/fftw"
+INSANE_SKIP_${PN} = "ldflags"
diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb b/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
new file mode 100644
index 0000000..abb5f60
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
@@ -0,0 +1,59 @@
+SUMMARY = "TI FFTW"
+HOMEPAGE = "http://git.ti.com/fftlib"
+LICENSE = "GPL-2.0 & BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://docs/TI-FFTW_3.1.0_manifest.html;md5=aaa275ec704a738216ba696898941b44 \
+                    file://fftw-3.3.4/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+include fftlib.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "common-csl-ip-rtos common-csl-ip ti-xdctools-native ti-sysbios ti-cgt6x-native ti-xdais libulm fftlib dsplib-c66x opencl clocl-native libarch"
+
+RDEPENDS_${PN} += "opencl-runtime"
+
+COMPATIBLE_MACHINE = "k2hk|dra7xx"
+TARGET_dra7xx = "SOC_AM572x"
+TARGET_k2hk   = "SOC_K2H"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git/ti/fftw"
+
+export TI_OCL_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/opencl"
+export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export PDK_DIR = "${PDK_INSTALL_DIR}"
+export IPC_DIR = "${IPC_INSTALL_DIR}/packages"
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
+export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
+export FC_DIR = "${FC_INSTALL_DIR}"
+export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
+export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
+export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
+export C6636_PDK_DIR ="${PDK_INSTALL_DIR}/packages"
+export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export LINUX_DEVKIT_ROOT = "${STAGING_DIR_TARGET}"
+export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
+export OMP_DIR = "${OMP_INSTALL_DIR}"
+export FFTLIB_DIR="${FFTLIB_INSTALL_DIR}"
+export DSPLIB_DIR="${DSPLIB_C66_INSTALL_DIR}"
+export BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}"
+export EDMA_INSTALL_DIR="${EDMA3_LLD_INSTALL_DIR}"
+export XDCTOOLS_DIR="${XDC_INSTALL_DIR}/packages"
+export LIBARCH_DIR = "${LIBARCH_INSTALL_DIR}"
+
+do_compile() {
+    make build TARGET=${TARGET}
+}
+
+do_install() {
+    make install DESTDIR=${D}
+
+    # These files will be installed by the ti-fftw-examples recipe
+    rm -rf ${D}${datadir}/ti
+}
+
+ALLOW_EMPTY_${PN} = "1"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index 74833cf..e90a82b 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -6,6 +6,7 @@ export LLVM_RTOS_INSTALL_DIR_RECIPE  = "${installdir}/llvm-rtos-tree"
 export OCL_RTOS_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-rtos-tree"
 export OCL_TIDL_FW_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-tidl-fw-tree"
 export FFTLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-fftlib-tree"
+export FFTW_INSTALL_DIR_RECIPE       = "${installdir}/ti-fftw-tree"
 
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
 export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
@@ -13,3 +14,4 @@ export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${LLVM_RTOS_INSTALL_DIR_RE
 export OCL_RTOS_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_RTOS_INSTALL_DIR_RECIPE}"
 export OCL_TIDL_FW_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
 export FFTLIB_INSTALL_DIR     = "${STAGING_DIR_TARGET}${FFTLIB_INSTALL_DIR_RECIPE}"
+export FFTW_INSTALL_DIR       = "${STAGING_DIR_TARGET}${FFTW_INSTALL_DIR_RECIPE}"
-- 
2.7.4


