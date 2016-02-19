Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A008E52AD0
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 19:43:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JJh1IE031520
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1NE029766
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1Ix028782;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aWqxB-0006eZ-4k; Fri, 19 Feb 2016 14:43:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 14:42:54 -0500
Message-ID: <1455910978-25530-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
References: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] openmpacc-examples: Add the OpenMP-Acc examples
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
X-List-Received-Date: Fri, 19 Feb 2016 19:43:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/openmpacc/openmpacc-examples_git.bb | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb

diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
new file mode 100644
index 0000000..9c7e85e
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
@@ -0,0 +1,72 @@
+DESCRIPTION = "TI OpenMP-Acc example applications"
+
+include openmpacc.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "openmpacc clacc-native clocl-native ti-cgt6x-native"
+RDEPENDS_${PN} += "opencl-runtime"
+
+S = "${WORKDIR}/git/openmpacc-examples-src"
+
+OMPACC_EXAMPLE_LIST = " target_update \
+                        vecadd \
+                        printf_debug \
+                        edmamgr \
+                        dspheap \
+                        target_orphan_call \
+                        target_implicit_map \
+                        vecadd_t \
+                        vecadd_complex \
+                        local \
+                        null \
+                        dsplib_fft \
+                        vecadd_lib \
+                        edmabw \
+                        sub_section \
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
+    shutil.copy(os.path.join(git_dir,"ompacc_env.sh"),s)
+    for example in d.getVar("OMPACC_EXAMPLE_LIST").split():
+        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
+}
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
+    install -d ${D}${datadir}/ti/examples/openmpacc
+
+    install -m 644 ${B}/Makefile ${D}${datadir}/ti/examples/openmpacc
+    install -m 644 ${B}/make.inc ${D}${datadir}/ti/examples/openmpacc
+    install -m 644 ${B}/ompacc_env.sh ${D}${datadir}/ti/examples/openmpacc
+
+    for ompacc_example in ${OMPACC_EXAMPLE_LIST}; do
+        install -d ${D}${datadir}/ti/examples/openmpacc/${ompacc_example}
+        cp -rv ${B}/${ompacc_example}/* ${D}${datadir}/ti/examples/openmpacc/${ompacc_example}
+    done
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/examples/openmpacc \
+"
+
+FILES_${PN}-dbg += "\
+    ${datadir}/ti/examples/openmpacc/*/.debug \
+"
+
+INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
-- 
1.9.1


