Return-Path: <a0862859@udb0862859>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E125752A66
	for <meta-arago@arago-project.org>;
	Thu,  7 Nov 2013 05:03:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA753kkW021467
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2013 23:03:46 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA753kfX027485
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2013 23:03:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 6 Nov 2013 23:03:45 -0600
Received: from udb0862859 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA753j44028788;
	Wed, 6 Nov 2013 23:03:45 -0600
Received: from a0862859 by udb0862859 with local (Exim 4.76)	(envelope-from
	<a0862859@udb0862859>)	id 1VeHkv-0008Jo-6d;
	Thu, 07 Nov 2013 00:03:45 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>, <sam.nelson@ti.com>
Date: Thu, 7 Nov 2013 00:03:34 -0500
Message-ID: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Thu, 07 Nov 2013 05:03:50 -0000
Content-Type: text/plain

- Cmem module is used for user space contiguous memory alloation

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem-mod_git.bb |   26 ++++++++++++++++++++++++++
 recipes-bsp/cmem/cmem.inc        |   12 ++++++++++++
 recipes-bsp/cmem/cmem_git.bb     |   16 ++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 recipes-bsp/cmem/cmem-mod_git.bb
 create mode 100644 recipes-bsp/cmem/cmem.inc
 create mode 100644 recipes-bsp/cmem/cmem_git.bb

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
new file mode 100644
index 0000000..c402b72
--- /dev/null
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION="Contiguous memory allocation kernel module for contiguous memory allocation from userspace "
+
+include cmem.inc
+
+NAME="cmem"
+
+# This package builds a kernel module, use kernel PR as base and append a local
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a"
+
+PKG_${PN} = "kernel-module-${PN}"
+
+S = "${WORKDIR}/git"
+
+inherit module
+
+do_compile () {
+    cd ${S}
+    make -f lu.mak module_clean
+    make -f lu.mak module KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PREFIX=${CROSS_COMPILE} 
+}
+
+do_install () {
+    cd ${S}
+    make -f lu.mak module_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
+}
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
new file mode 100644
index 0000000..5d17d8e
--- /dev/null
+++ b/recipes-bsp/cmem/cmem.inc
@@ -0,0 +1,12 @@
+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
+
+COMPATIBLE_MACHINE = "keystone-evm"
+
+BRANCH ?= "master"
+#SRCREV = "4.00.00.06"
+SRCREV = "c2cf2406702bcb889c10d0e6e7d298ba7b84ae7d"
+
+SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
new file mode 100644
index 0000000..f415630
--- /dev/null
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION="The cmem component supports contiguous memory allocation from userspace "
+
+include cmem.inc
+
+RDEPENDS_${PN} = "cmem-mod" 
+
+S = "${WORKDIR}/git"
+
+PR = "r0"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/*"
+
+inherit autotools
+
-- 
1.7.9.5


