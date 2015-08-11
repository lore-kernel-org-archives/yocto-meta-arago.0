Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7BDE052986
	for <meta-arago@arago-project.org>;
	Tue, 11 Aug 2015 14:02:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7BE214f024220
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 09:02:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7BE212x008292
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 09:02:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 11 Aug 2015 09:02:01 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7BE21gq028678;
	Tue, 11 Aug 2015 09:02:01 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPA7s-00087a-S6; Tue, 11 Aug 2015 10:02:00 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Aug 2015 10:01:50 -0400
Message-ID: <1439301710-31159-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
References: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] opencl-examples: Add the opencl examples.
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
X-List-Received-Date: Tue, 11 Aug 2015 14:02:35 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/ocl/opencl-examples_git.bb          | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
new file mode 100644
index 0000000..9d9a8d5
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -0,0 +1,77 @@
+DESCRIPTION = "TI OpenCL Examples"
+HOMEPAGE = "https://gitorious.design.ti.com/ocl"
+LICENSE = "BSD"
+
+include ocl.inc
+
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = "opencl ti-cgt6x-native clocl-native"
+
+RDEPENDS_${PN} += " opencl-runtime"
+RDEPENDS_${PN}-dev += " libgomp-dev"
+
+S = "${WORKDIR}/git/opencl_example_src"
+B = "${S}"
+
+OCL_EXAMPLE_LIST = " buffer \
+                     ccode \
+                     dsplib_fft \
+                     float_compute \
+                     null \
+                     offline \
+                     offline_embed \
+                     platforms \
+                     simple \
+                     vecadd \
+                     matmpy \
+                     ooo_callback \
+                     edmamgr \
+"
+
+python do_unpack_append() {
+    import shutil
+
+    git_dir = d.expand("${WORKDIR}/git/examples")
+    s = d.getVar("S", True)
+
+    os.makedirs(s)
+    shutil.copy(os.path.join(git_dir,"Makefile"),s)
+    shutil.copy(os.path.join(git_dir,"make.inc"),s)
+    for example in d.getVar("OCL_EXAMPLE_LIST").split():
+        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
+}
+
+
+EXTRA_OEMAKE = " TARGET_ROOTDIR=${STAGING_DIR_HOST} \
+                 TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
+"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    install -d ${D}${datadir}/ti/examples/opencl
+
+    install ${B}/Makefile ${D}${datadir}/ti/examples/opencl
+    install ${B}/make.inc ${D}${datadir}/ti/examples/opencl
+
+    for ocl_example in ${OCL_EXAMPLE_LIST}; do
+        install -d ${D}${datadir}/ti/examples/opencl/${ocl_example}
+        cp -rv ${B}/${ocl_example}/* ${D}${datadir}/ti/examples/opencl/${ocl_example}
+    done
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/examples/opencl \
+"
+
+FILES_${PN}-dbg += "\
+    ${datadir}/ti/examples/opencl/*/.debug \
+"
+
+INSANE_SKIP_${PN} = "arch ldflags textrel"
-- 
1.9.1


