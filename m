Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2673B52A19
	for <meta-arago@arago-project.org>;
	Tue, 11 Aug 2015 14:02:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7BE1xa2007034
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 09:01:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7BE1x78032078
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 09:01:59 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 11 Aug 2015 09:01:59 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7BE1xYL029497;
	Tue, 11 Aug 2015 09:01:59 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPA7r-00087V-23; Tue, 11 Aug 2015 10:01:59 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Aug 2015 10:01:49 -0400
Message-ID: <1439301710-31159-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
References: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] opencl: Add the opencl library
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
X-List-Received-Date: Tue, 11 Aug 2015 14:02:00 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl_git.bb

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
new file mode 100644
index 0000000..983e0d4
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "TI OpenCL"
+HOMEPAGE = "https://gitorious.design.ti.com/ocl"
+LICENSE = "BSD"
+
+include ocl.inc
+
+PR = "${INC_PR}.0"
+
+inherit cmake
+
+COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PACKAGES += " ${PN}-runtime"
+
+DEPENDS = " ocl-gl-headers \
+            opencl-monitor \
+            cmake-native \
+            cmem \
+            ti-llvm3.3 \
+            ti-llvm3.3-native \
+            binutils \
+            sqlite3 \
+            libffi \
+            boost \
+            boost-native \
+            libloki \
+            pkgconfig-native \
+            libulm \
+"
+
+DEPENDS_append_dra7xx += "ti-ipc virtual/kernel"
+DEPENDS_append_k2hk-evm += " mpm-transport multiprocmgr"
+
+RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
+RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
+
+ALLOW_EMPTY_${PN}-runtime = "1"
+
+
+S = "${WORKDIR}/git/host"
+
+export WANT_LLVM_RELEASE = "3.3-ti"
+
+OCL_BUILD_TARGET_dra7xx = "ARM_AM57"
+OCL_BUILD_TARGET_k2hk-evm = "ARM_K2H"
+
+EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABLE_ULM=1"
+
+EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} LINUX_DEVKIT_ROOT=${STAGING_DIR_HOST}"
+export KERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}"
+
+FILES_${PN} += " \
+    ${datadir}/ti/opencl/* \
+"
-- 
1.9.1


