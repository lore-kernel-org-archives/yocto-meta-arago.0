Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 22D7452986
	for <meta-arago@arago-project.org>;
	Tue, 11 Aug 2015 14:01:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7BE1vPS000770
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 09:01:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7BE1vEM008123
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 09:01:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 11 Aug 2015 09:01:57 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7BE1v6C024215;
	Tue, 11 Aug 2015 09:01:57 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPA7o-00087G-SR; Tue, 11 Aug 2015 10:01:56 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Aug 2015 10:01:46 -0400
Message-ID: <1439301710-31159-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
References: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] clocl: Add opencl kernel compiler.
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
X-List-Received-Date: Tue, 11 Aug 2015 14:01:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb | 34 +++++++++++++++++++++++++++
 meta-arago-extras/recipes-ti/ocl/ocl.inc      | 10 ++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/clocl_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl.inc

diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
new file mode 100644
index 0000000..d566cde
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "TI OpenCL"
+HOMEPAGE = "https://gitorious.design.ti.com/ocl"
+LICENSE = "BSD"
+
+include ocl.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "ti-llvm3.3 ti-llvm3.3-native boost"
+
+S = "${WORKDIR}/git/host"
+
+export WANT_LLVM_RELEASE = "3.3-ti"
+
+TARGET_class-target = "arm"
+TARGET_class-native = "x86"
+TARGET_class-nativesdk = "x86"
+
+EXTRA_OEMAKE = " -C ${S}/clocl \
+                 _PRODUCT_VERSION=${PV} \
+                 TARGET=${TARGET} \
+                 LLVM_CONFIG_EXE=llvm-config \
+"
+
+do_compile() {
+  oe_runmake
+}
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 755 ${S}/clocl/${TARGET}/clocl ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
new file mode 100644
index 0000000..3195d5b
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -0,0 +1,10 @@
+PV = "1.1.4"
+INC_PR = "r0"
+
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/ocl:"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/opencl/ti-opencl.git;protocol=git;branch=${BRANCH}"
+SRCREV = "a675f28647b294d0fc5d5234dd8bcf89a330a0e5"
-- 
1.9.1


