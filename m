Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 225A852A7D
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 19:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1193720C19;
	Wed, 29 Aug 2018 19:07:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fq3DyVM-sUEx; Wed, 29 Aug 2018 19:07:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A1EE32014B;
	Wed, 29 Aug 2018 19:07:32 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 184BE1635D2;
	Wed, 29 Aug 2018 15:07:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 29 Aug 2018 15:07:31 -0400
Message-Id: <1535569651-32616-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][PATCH] Revert "module-base: overlay local fix"
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
X-List-Received-Date: Wed, 29 Aug 2018 19:07:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

The fix got merged to oe-core/rocko.

This reverts commit a278f055979262625eb7650762df2b21c2eb8c33.
---
 meta-arago-distro/classes/module-base.bbclass | 30 ---------------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-arago-distro/classes/module-base.bbclass

diff --git a/meta-arago-distro/classes/module-base.bbclass b/meta-arago-distro/classes/module-base.bbclass
deleted file mode 100644
index c1fa3ad..0000000
--- a/meta-arago-distro/classes/module-base.bbclass
+++ /dev/null
@@ -1,30 +0,0 @@
-inherit kernel-arch
-
-# This is instead of DEPENDS = "virtual/kernel"
-do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"
-
-export OS = "${TARGET_OS}"
-export CROSS_COMPILE = "${TARGET_PREFIX}"
-
-# This points to the build artefacts from the main kernel build
-# such as .config and System.map
-# Confusingly it is not the module build output (which is ${B}) but
-# we didn't pick the name.
-export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
-
-DEPENDS += "bc-native"
-
-export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
-KERNEL_OBJECT_SUFFIX = ".ko"
-
-# kernel modules are generally machine specific
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# Function to ensure the kernel scripts are created. Expected to
-# be called before do_compile. See module.bbclass for an example.
-do_make_scripts() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
-	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
-}
-- 
2.7.4


