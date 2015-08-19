Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C832252987
	for <meta-arago@arago-project.org>;
	Wed, 19 Aug 2015 13:59:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7JDx2gs026379
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 08:59:02 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JDx1rG026600
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 08:59:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 08:59:01 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JDx1xD027853;
	Wed, 19 Aug 2015 08:59:01 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZS3tN-0004Cr-Ia; Wed, 19 Aug 2015 09:59:01 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Aug 2015 09:58:46 -0400
Message-ID: <1439992726-16109-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
References: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 5/5] opencl-examples: Add the opencl examples.
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
X-List-Received-Date: Wed, 19 Aug 2015 13:59:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: Update description and homepage.

 .../recipes-ti/ocl/opencl-examples_git.bb          | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
new file mode 100644
index 0000000..af225d1
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -0,0 +1,77 @@
+DESCRIPTION = "TI OpenCL example applications"
+HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
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


