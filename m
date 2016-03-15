Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D4C7652AA5
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 19:54:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FJsGhu001336
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsG6H015899
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGHs011101;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1afv2l-0004Zq-Vn; Tue, 15 Mar 2016 15:54:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Mar 2016 15:54:07 -0400
Message-ID: <1458071653-17553-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Cc: xuj@ti.com
Subject: [PATCH 2/8] libarch-examples: Add examples for libarch version 1.0.0.0
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
X-List-Received-Date: Tue, 15 Mar 2016 19:54:17 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/libarch/libarch-examples_git.bb     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb

diff --git a/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb b/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
new file mode 100644
index 0000000..62a09af
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "TI Library Architecture Examples"
+
+include libarch.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS += "libarch clocl-native"
+RDEPENDS_${PN} += "opencl-runtime"
+
+export LIBARCH_DIR    = "${LIBARCH_INSTALL_DIR}"
+export TARGET_ROOTDIR = "${STAGING_DIR_TARGET}"
+
+do_compile() {
+    make examples TARGET=${TARGET} LIBOS=LIB_OPENCL
+
+    # Remove object files before installing so that the binaries are not present
+    find . -name "*.obj" -type f -delete
+    find . -name "*.o" -type f -delete
+    find . -name "*.out" -type f -delete
+    find . -name "*.dsp_h" -type f -delete
+}
+
+do_install() {
+    install -d ${D}${datadir}/ti/examples/libarch
+    cp -r examples/arm+dsp ${D}${datadir}/ti/examples/libarch
+    cp -r examples/common ${D}${datadir}/ti/examples/libarch
+    cp examples/Makefile ${D}${datadir}/ti/examples/libarch
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/examples/libarch/* \ "
+
+FILES_${PN}-dbg += "\
+    ${datadir}/ti/examples/libarch/*/.debug \ "
+
+INSANE_SKIP_${PN} = "arch ldflags textrel"
-- 
1.9.1


