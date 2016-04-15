Return-Path: <a0869574local@uda0869574b>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8DFDE5296D
	for <meta-arago@arago-project.org>;
	Fri, 15 Apr 2016 19:14:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3FJEUTq005983
	for <meta-arago@arago-project.org>; Fri, 15 Apr 2016 14:14:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3FJEUId004202
	for <meta-arago@arago-project.org>; Fri, 15 Apr 2016 14:14:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 15 Apr 2016 14:14:30 -0500
Received: from uda0869574b (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3FJEUPB028301;
	Fri, 15 Apr 2016 14:14:30 -0500
Received: from a0869574local by uda0869574b with local (Exim 4.82)
	(envelope-from <a0869574local@uda0869574b>)	id 1ar9CH-0008DQ-VK;
	Fri, 15 Apr 2016 15:14:30 -0400
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Apr 2016 15:14:20 -0400
Message-ID: <1460747660-31535-2-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460747660-31535-1-git-send-email-xuj@ti.com>
References: <1460747660-31535-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
Subject: [master/fido][PATCH 2/2] linalg: added support for AM57xx and made into a RTSC package.
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
X-List-Received-Date: Fri, 15 Apr 2016 19:14:30 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../recipes-ti/linalg/linalg-examples_git.bb       | 44 ++--------------------
 meta-arago-extras/recipes-ti/linalg/linalg.inc     |  8 ++--
 meta-arago-extras/recipes-ti/linalg/linalg_git.bb  | 12 +++---
 3 files changed, 15 insertions(+), 49 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
index acafb36..58b3b88 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
@@ -8,38 +8,11 @@ RDEPENDS_${PN} += "opencl-runtime"
 
 export LINALG_DIR = "${LINALG_INSTALL_DIR}"
 
-EXAMPLES_ROOT = "${WORKDIR}/git/linalg_example_src"
-B = "${S}"
-
-LINALG_EXAMPLE_LIST = "dgemm_test \
-                       dsyrk_test \
-                       eig \
-                       gemm_bench \
-                       ludinv \
-                       matmpy \
-                       ztrmm_test \
-                       ztrsm_test \
-"
-
-python do_unpack_append() {
-    import shutil
-
-    git_dir = d.expand("${WORKDIR}/git/examples/arm+dsp")
-    s = d.getVar("EXAMPLES_ROOT", True)
-
-    os.makedirs(s)
-    shutil.copy(os.path.join(git_dir,"Makefile"),s)
-    shutil.copy(os.path.join(git_dir,"make.inc"),s)
-    shutil.copy(os.path.join(git_dir,"run_tests_evm.sh"),s)
-    for example in d.getVar("LINALG_EXAMPLE_LIST").split():
-        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
-}
-
-EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+EXAMPLES_ROOT = "${WORKDIR}/git/examples/arm+dsp"
 
 do_compile() {
-    cd ${EXAMPLES_ROOT}
-    oe_runmake
+    cd examples/arm+dsp
+    make
     # Remove object files before installing so that the binaries are not present
     find . -name "*.obj" -type f -delete
     find . -name "*.o" -type f -delete
@@ -47,16 +20,7 @@ do_compile() {
 
 do_install() {
     install -d ${D}${datadir}/ti/examples/linalg
-
-    install ${EXAMPLES_ROOT}/Makefile ${D}${datadir}/ti/examples/linalg
-    install ${EXAMPLES_ROOT}/make.inc ${D}${datadir}/ti/examples/linalg
-    install ${EXAMPLES_ROOT}/run_tests_evm.sh ${D}${datadir}/ti/examples/linalg
-
-    cd ${EXAMPLES_ROOT}
-    for linalg_example in ${LINALG_EXAMPLE_LIST}; do
-        install -d ${D}${datadir}/ti/examples/linalg/${linalg_example}
-        cp -rv ${EXAMPLES_ROOT}/${linalg_example}/. ${D}${datadir}/ti/examples/linalg/${linalg_example}
-    done
+    cp -r examples/arm+dsp/* ${D}${datadir}/ti/examples/linalg
 }
 
 FILES_${PN} += "\
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index 7c197b6..bb8efdf 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
 LICENSE = "BSD-3-Clause"
 
 PV = "1_2_0_0"
-INC_PR = "r0"
+INC_PR = "r1"
 
 S = "${WORKDIR}/git"
 
@@ -11,8 +11,8 @@ require recipes-ti/includes/ti-staging.inc
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH}"
-LIC_FILES_CHKSUM = "file://docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
-SRCREV = "4de29dac3c6fbd16df1b19876593de0afdbcb30f"
+LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
+SRCREV = "5e435f2457565ed7c6199406ef248370bb2a4ad2"
 
 DEPENDS = "common-csl-ip \
            libarch \
@@ -40,4 +40,4 @@ export OMP_DIR ="${OMP_INSTALL_DIR}"
 export LIBARCH_DIR = "${LIBARCH_INSTALL_DIR}"
 export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
 
-COMPATIBLE_MACHINE = "k2hk-evm"
+COMPATIBLE_MACHINE = "k2hk-evm|am57xx"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
index 4d7a5a4..18754a7 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
@@ -3,17 +3,19 @@ DESCRIPTION = "TI Linear Algebra Library"
 include linalg.inc
 PR = "${INC_PR}.0"
 
-TARGET_k2hk-evm = "SOC_K2H"
-MEM_MODEL_k2hk-evm = "Large"
+TARGET_k2hk-evm      = "SOC_K2H"
+TARGET_am57xx-evm    = "SOC_AM572x"
+MEM_MODEL_k2hk-evm   = "Large"
+MEM_MODEL_am57xx-evm = "Small"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_compile() {
-   make ARMplusDSP MEM_MODEL=${MEM_MODEL} TARGET=${TARGET} LIBOS=LIB_OPENCL
-   make docs
+   make -f build/Makefile MEM_MODEL=${MEM_MODEL} TARGET=${TARGET} LIBOS=LIB_OPENCL
 }
 
 do_install() {
-   make installARMplusDSPlib DESTDIR=${D}${LINALG_INSTALL_DIR_RECIPE}
+    install -d ${D}${LINALG_INSTALL_DIR_RECIPE}
+    cp -r exports/linalg_${PV}/* ${D}${LINALG_INSTALL_DIR_RECIPE}
 }
 
 # to create a package for LINALG
-- 
1.9.1


