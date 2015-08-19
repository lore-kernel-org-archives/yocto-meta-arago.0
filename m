Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2446F52987
	for <meta-arago@arago-project.org>;
	Wed, 19 Aug 2015 13:59:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7JDx0hg026369
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 08:59:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JDx0K2007030
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 08:59:00 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 08:58:59 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JDwxth016884;
	Wed, 19 Aug 2015 08:58:59 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZS3tL-0004Cm-MA; Wed, 19 Aug 2015 09:58:59 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Aug 2015 09:58:45 -0400
Message-ID: <1439992726-16109-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
References: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/5] opencl: Add the opencl library
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
X-List-Received-Date: Wed, 19 Aug 2015 13:59:01 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: Update description and homepage.

 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl_git.bb

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
new file mode 100644
index 0000000..568e249
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "TI OpenCL host runtime and development packages"
+HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
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


