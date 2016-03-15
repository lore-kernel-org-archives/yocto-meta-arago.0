Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F0A1D52AAC
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 19:54:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FJsGNo021042
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsG0u025380
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGob027956;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1afv2m-0004a4-A4; Tue, 15 Mar 2016 15:54:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Mar 2016 15:54:10 -0400
Message-ID: <1458071653-17553-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Cc: xuj@ti.com
Subject: [PATCH 5/8] linalg-examples: And Linear Algebra Library examples
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
X-List-Received-Date: Tue, 15 Mar 2016 19:54:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/linalg/linalg-examples_git.bb       | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb

diff --git a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
new file mode 100644
index 0000000..acafb36
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
@@ -0,0 +1,74 @@
+DESCRIPTION = "TI Linear Algebra Library examples"
+
+include linalg.inc
+PR = "${INC_PR}.0"
+
+DEPENDS += "linalg"
+RDEPENDS_${PN} += "opencl-runtime"
+
+export LINALG_DIR = "${LINALG_INSTALL_DIR}"
+
+EXAMPLES_ROOT = "${WORKDIR}/git/linalg_example_src"
+B = "${S}"
+
+LINALG_EXAMPLE_LIST = "dgemm_test \
+                       dsyrk_test \
+                       eig \
+                       gemm_bench \
+                       ludinv \
+                       matmpy \
+                       ztrmm_test \
+                       ztrsm_test \
+"
+
+python do_unpack_append() {
+    import shutil
+
+    git_dir = d.expand("${WORKDIR}/git/examples/arm+dsp")
+    s = d.getVar("EXAMPLES_ROOT", True)
+
+    os.makedirs(s)
+    shutil.copy(os.path.join(git_dir,"Makefile"),s)
+    shutil.copy(os.path.join(git_dir,"make.inc"),s)
+    shutil.copy(os.path.join(git_dir,"run_tests_evm.sh"),s)
+    for example in d.getVar("LINALG_EXAMPLE_LIST").split():
+        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
+}
+
+EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+
+do_compile() {
+    cd ${EXAMPLES_ROOT}
+    oe_runmake
+    # Remove object files before installing so that the binaries are not present
+    find . -name "*.obj" -type f -delete
+    find . -name "*.o" -type f -delete
+}
+
+do_install() {
+    install -d ${D}${datadir}/ti/examples/linalg
+
+    install ${EXAMPLES_ROOT}/Makefile ${D}${datadir}/ti/examples/linalg
+    install ${EXAMPLES_ROOT}/make.inc ${D}${datadir}/ti/examples/linalg
+    install ${EXAMPLES_ROOT}/run_tests_evm.sh ${D}${datadir}/ti/examples/linalg
+
+    cd ${EXAMPLES_ROOT}
+    for linalg_example in ${LINALG_EXAMPLE_LIST}; do
+        install -d ${D}${datadir}/ti/examples/linalg/${linalg_example}
+        cp -rv ${EXAMPLES_ROOT}/${linalg_example}/. ${D}${datadir}/ti/examples/linalg/${linalg_example}
+    done
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/examples/linalg/* \
+"
+
+FILES_${PN}-dbg += "\
+    ${datadir}/ti/examples/linalg/*/.debug \
+"
+
+INSANE_SKIP_${PN} = "arch ldflags textrel"
+
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
+SRCIPK_SRC_DIR = "${EXAMPLES_ROOT}"
-- 
1.9.1


