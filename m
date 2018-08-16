Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D13BD52A59
	for <meta-arago@arago-project.org>;
	Thu, 16 Aug 2018 05:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 682AD207AF;
	Thu, 16 Aug 2018 05:35:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lpz_DSOJOA1h; Thu, 16 Aug 2018 05:35:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E20320567;
	Thu, 16 Aug 2018 05:35:21 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 525D916358C;
	Thu, 16 Aug 2018 01:35:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 16 Aug 2018 01:35:20 -0400
Message-Id: <1534397720-37555-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][PATCH] module-base: overlay local fix
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
X-List-Received-Date: Thu, 16 Aug 2018 05:35:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154191.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154189.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/module-base.bbclass | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-arago-distro/classes/module-base.bbclass

diff --git a/meta-arago-distro/classes/module-base.bbclass b/meta-arago-distro/classes/module-base.bbclass
new file mode 100644
index 0000000..c1fa3ad
--- /dev/null
+++ b/meta-arago-distro/classes/module-base.bbclass
@@ -0,0 +1,30 @@
+inherit kernel-arch
+
+# This is instead of DEPENDS = "virtual/kernel"
+do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"
+
+export OS = "${TARGET_OS}"
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+
+# This points to the build artefacts from the main kernel build
+# such as .config and System.map
+# Confusingly it is not the module build output (which is ${B}) but
+# we didn't pick the name.
+export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
+
+DEPENDS += "bc-native"
+
+export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
+KERNEL_OBJECT_SUFFIX = ".ko"
+
+# kernel modules are generally machine specific
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# Function to ensure the kernel scripts are created. Expected to
+# be called before do_compile. See module.bbclass for an example.
+do_make_scripts() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
+	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	           HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" \
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
+}
-- 
2.7.4


