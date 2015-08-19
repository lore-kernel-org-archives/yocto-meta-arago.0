Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0408752A65
	for <meta-arago@arago-project.org>;
	Wed, 19 Aug 2015 13:58:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7JDwuoN026641
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 08:58:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JDwuHh006927
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 08:58:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 08:58:55 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JDwtPW027725;
	Wed, 19 Aug 2015 08:58:55 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZS3tH-0004Cc-L2; Wed, 19 Aug 2015 09:58:55 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Aug 2015 09:58:43 -0400
Message-ID: <1439992726-16109-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
References: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/5] opencl-monitor: Add opencl monitor firmware
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
X-List-Received-Date: Wed, 19 Aug 2015 13:58:57 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: Update description and homepage.

 .../recipes-ti/ocl/opencl-monitor_git.bb           | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
new file mode 100644
index 0000000..336d068
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -0,0 +1,58 @@
+DESCRIPTION = "TI OpenCL compute device firmware"
+HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
+LICENSE = "BSD"
+
+include ocl.inc
+require recipes-ti/includes/ti-paths.inc
+
+PR = "${INC_PR}.0"
+
+inherit cmake
+
+DEPENDS = " ti-llvm3.3-native \
+            common-csl-ip-rtos \
+            ti-xdctools \
+            ti-ipc-rtos \
+            ti-sysbios \
+            ti-cgt6x-native \
+            edma3-lld-rtos \
+            ti-xdais \
+            ti-framework-components \
+            libulm \
+            gdbserver-c6x \
+"
+
+COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git/monitor"
+S_dra7xx = "${WORKDIR}/git/monitor_vayu"
+
+EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
+                   -DOCL_MONITOR_DIR=${S} \
+                   -DBUILD_OUTPUT=all \
+                   -DSHARE_PATH=${datadir}/ti \
+"
+
+export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export PDK_DIR = "${PDK_INSTALL_DIR}"
+export IPC_DIR = "${IPC_INSTALL_DIR}"
+export XDC_DIR = "${XDC_INSTALL_DIR}"
+export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
+export EDMA3LLD_DIR = "${EDMA3_LLD_INSTALL_DIR}"
+export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
+export FC_DIR = "${FC_INSTALL_DIR}"
+export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
+export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
+export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
+export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
+
+MONITOR_FIRMWARE = ""
+MONITOR_FIRMWARE_dra7xx = "${base_libdir}/firmware/*"
+
+FILES_${PN} += " \
+    ${datadir}/ti/opencl/* \
+    ${MONITOR_FIRMWARE} \
+"
+
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


