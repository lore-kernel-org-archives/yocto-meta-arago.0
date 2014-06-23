Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 618D5529B3
	for <meta-arago@arago-project.org>;
	Mon, 23 Jun 2014 18:21:19 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7M00E2MWBIK4S0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 Jun 2014 13:21:19 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E1EBF2009B; Mon,
	23 Jun 2014 14:21:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Jun 2014 14:21:14 -0400
Message-id: <1403547675-13026-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 1/2] cryptodev: remove local cryptodev, now available in oe-core, adjust name
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
X-List-Received-Date: Mon, 23 Jun 2014 18:21:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |  6 +-
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |  6 +-
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb  |  6 +-
 .../packagegroup-arago-tisdk-crypto.bb             |  6 +-
 .../0001-allow-for-cross-compiling-cryptodev.patch | 35 +++++++++
 .../cryptodev/cryptodev-module_1.6.bbappend        |  7 ++
 .../0001-allow-for-cross-compiling-cryptodev.patch | 35 ---------
 .../cryptodev/cryptodev_1.6.bbappend               |  7 --
 .../cryptodev/cryptodev-tests_1.6.bb               | 23 ------
 .../recipes-kernel/cryptodev/cryptodev_1.6.bb      | 13 ----
 .../recipes-kernel/cryptodev/cryptodev_1.6.inc     | 11 ---
 ...ests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch | 29 --------
 ...-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch | 86 ----------------------
 ...pile-and-install-rules-for-cryptodev-test.patch | 69 -----------------
 14 files changed, 54 insertions(+), 285 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-allow-for-cross-compiling-cryptodev.patch
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev/0001-allow-for-cross-compiling-cryptodev.patch
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
 delete mode 100644 meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
 delete mode 100644 meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
 delete mode 100644 meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.inc
 delete mode 100644 meta-arago-extras/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
 delete mode 100644 meta-arago-extras/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
 delete mode 100644 meta-arago-extras/recipes-kernel/cryptodev/files/Add-the-compile-and-install-rules-for-cryptodev-test.patch

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index a2777e9..f6b682d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -190,9 +190,9 @@ CREATE_SRCIPK_pn-linux-omapl1 = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omapl1 = "board-support/linux-${KVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omapl1 = "${MACHINE_ARCH}"
 
-CREATE_SRCIPK_pn-cryptodev = "1"
-SRCIPK_INSTALL_DIR_pn-cryptodev = "board-support/extra-drivers/cryptodev-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-cryptodev = "${MACHINE_ARCH}"
+CREATE_SRCIPK_pn-cryptodev-module = "1"
+SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-cryptodev-module = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 0026ea3..bb406d7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -11,9 +11,9 @@ CRYPTO_RDEPENDS = ""
 CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
 CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
 
-CRYPTO_RDEPENDS_append_ti33x = " cryptodev-src"
-CRYPTO_RDEPENDS_append_ti43x = " cryptodev-src"
-CRYPTO_RDEPENDS_append_dra7xx-evm = " cryptodev-src"
+CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_dra7xx-evm = " cryptodev-module-src"
 
 CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index a9e4150..fa14649 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -8,9 +8,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 CRYPTO_API = "ocf-linux-dev"
 
-CRYPTO_API_ti33x = "cryptodev-dev"
-CRYPTO_API_ti43x = "cryptodev-dev"
-CRYPTO_API_dra7xx-evm = "cryptodev-dev"
+CRYPTO_API_ti33x = "cryptodev-module-dev"
+CRYPTO_API_ti43x = "cryptodev-module-dev"
+CRYPTO_API_dra7xx-evm = "cryptodev-module-dev"
 
 RDEPENDS_${PN} = "\
     openssl-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 6d1275f..e6b6ec4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -15,9 +15,9 @@ CRYPTO_SUPPORT = "\
     openssl-engines \
     "
 
-CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples cryptodev cryptodev-tests"
-CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples cryptodev cryptodev-tests"
-CRYPTO_SUPPORT_append_dra7xx-evm = " ti-crypto-examples cryptodev cryptodev-tests"
+CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT_append_dra7xx-evm = " ti-crypto-examples cryptodev-module cryptodev-tests"
 
 # Add crypto hardware support for am37x-evm
 # NOTE: this package depends on a kernel patch which also has a TSU
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-allow-for-cross-compiling-cryptodev.patch b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-allow-for-cross-compiling-cryptodev.patch
new file mode 100644
index 0000000..e6f04e0
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-allow-for-cross-compiling-cryptodev.patch
@@ -0,0 +1,35 @@
+From 90f5154302df24d9fe4a71270cb87261789c036a Mon Sep 17 00:00:00 2001
+From: Phil Sutter <phil.sutter@viprinet.com>
+Date: Mon, 24 Jan 2011 17:44:30 +0100
+Subject: [PATCH] allow for cross-compiling cryptodev
+
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+---
+ Makefile |   10 +++++++++-
+ 1 files changed, 9 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 489c5f3..c657c70 100644
+--- a/Makefile
++++ b/Makefile
+@@ -13,8 +13,16 @@ cryptodev-objs = ioctl.o main.o cryptlib.o authenc.o zc.o util.o
+ 
+ obj-m += cryptodev.o
+ 
++KERNEL_MAKE_OPTS := -C ${KERNEL_DIR} SUBDIRS=`pwd`
++ifneq (${ARCH},)
++KERNEL_MAKE_OPTS += ARCH=${ARCH}
++endif
++ifneq (${CROSS_COMPILE},)
++KERNEL_MAKE_OPTS += CROSS_COMPILE=${CROSS_COMPILE}
++endif
++
+ build: version.h
+-	make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules
++	make ${KERNEL_MAKE_OPTS} modules
+ 
+ version.h: Makefile
+ 	@echo "#define VERSION \"$(VERSION)\"" > version.h
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
new file mode 100644
index 0000000..00d7919
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
@@ -0,0 +1,7 @@
+PR_append = "-arago1"
+
+module_autoload_cryptodev-module = "cryptodev-module"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-allow-for-cross-compiling-cryptodev.patch"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev/0001-allow-for-cross-compiling-cryptodev.patch b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev/0001-allow-for-cross-compiling-cryptodev.patch
deleted file mode 100644
index e6f04e0..0000000
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev/0001-allow-for-cross-compiling-cryptodev.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 90f5154302df24d9fe4a71270cb87261789c036a Mon Sep 17 00:00:00 2001
-From: Phil Sutter <phil.sutter@viprinet.com>
-Date: Mon, 24 Jan 2011 17:44:30 +0100
-Subject: [PATCH] allow for cross-compiling cryptodev
-
-Signed-off-by: Phil Sutter <phil@nwl.cc>
----
- Makefile |   10 +++++++++-
- 1 files changed, 9 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 489c5f3..c657c70 100644
---- a/Makefile
-+++ b/Makefile
-@@ -13,8 +13,16 @@ cryptodev-objs = ioctl.o main.o cryptlib.o authenc.o zc.o util.o
- 
- obj-m += cryptodev.o
- 
-+KERNEL_MAKE_OPTS := -C ${KERNEL_DIR} SUBDIRS=`pwd`
-+ifneq (${ARCH},)
-+KERNEL_MAKE_OPTS += ARCH=${ARCH}
-+endif
-+ifneq (${CROSS_COMPILE},)
-+KERNEL_MAKE_OPTS += CROSS_COMPILE=${CROSS_COMPILE}
-+endif
-+
- build: version.h
--	make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules
-+	make ${KERNEL_MAKE_OPTS} modules
- 
- version.h: Makefile
- 	@echo "#define VERSION \"$(VERSION)\"" > version.h
--- 
-1.7.0.4
-
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
deleted file mode 100644
index 75f5a29..0000000
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-PR_append = "-arago1"
-
-module_autoload_cryptodev = "cryptodev"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://0001-allow-for-cross-compiling-cryptodev.patch"
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
deleted file mode 100644
index 9688c87..0000000
--- a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require cryptodev_${PV}.inc
-
-SUMMARY = "Linux Cryptodev Test Suite"
-DESCRIPTION = "The Cryptodev package contains the test apps"
-
-PR = "r1"
-DEPENDS += "openssl"
-
-SRC_URI += " \
-file://Add-the-compile-and-install-rules-for-cryptodev-test.patch \
-file://0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch \
-"
-
-do_compile() {
-	oe_runmake testprogs
-}
-
-do_install() {
-	oe_runmake install_tests
-}
-
-FILES_${PN}-dbg += "${bindir}/tests_cryptodev/.debug"
-FILES_${PN} = "${bindir}/tests_cryptodev/*"
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
deleted file mode 100644
index 086259b..0000000
--- a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require cryptodev_${PV}.inc
-
-SUMMARY = "Linux Cryptodev KERNEL MODULE"
-DESCRIPTION = "The Cryptodev package contains the kernel /dev/crypto module"
-
-RCONFLICTS_${PN} = "ocf-linux"
-RREPLACES_${PN} = "ocf-linux"
-
-inherit module
-
-PR = "r2"
-
-SRC_URI += "file://0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch"
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.inc b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.inc
deleted file mode 100644
index b3c6aef..0000000
--- a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRCREV = "4e2c848628425c572d8994ea96601d27543cd5fd"
-
-SRC_URI = "git://github.com/nmav/cryptodev-linux.git;protocol=git"
-
-EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
-
-S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch b/meta-arago-extras/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
deleted file mode 100644
index f5ab8b4..0000000
--- a/meta-arago-extras/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 47ff1eb9bb4f872c1d731b93d334ee5865bf3439 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 6 Apr 2014 22:16:30 -0400
-Subject: [PATCH] Fix tests Makefile usage of LDLIBS vs. LDFLAGS
-
-Libraries must come after objects, as link order matters, especially
-when using linker flags like -Wl,--as-needed.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-
-Upstream-Status: Pending
----
- tests/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index cd202af..67c3c83 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -39,5 +39,5 @@ testprogs: $(hostprogs)
- clean:
- 	rm -f *.o *~ $(hostprogs)
- 
--${comp_progs}: LDFLAGS += -lssl -lcrypto
-+${comp_progs}: LDLIBS += -lssl -lcrypto
- ${comp_progs}: %: %.o openssl_wrapper.o
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch b/meta-arago-extras/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
deleted file mode 100644
index c5c7ec7..0000000
--- a/meta-arago-extras/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 57b5544de80db85c8955499831fdaa30829db77a Mon Sep 17 00:00:00 2001
-From: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
-Date: Thu, 23 Jan 2014 03:40:00 +0100
-Subject: [PATCH] In the 3.13-rc1 Linux kernel, the INIT_COMPLETION macro has
- been replaced with an inline function, reinit_completion [1][2]. We are
- currently using the 3.13-rc3 Linux kernel, which leads to the following
- error:
-
-cryptlib.c:279:2: error: implicit declaration of function 'INIT_COMPLETION' [-Werror=implicit-function-declaration]
-  INIT_COMPLETION(cdata->async.result->completion);
-
-[1] https://github.com/torvalds/linux/commit/c32f74ab2872994bc8336ed367313da3139350ca
-[2] https://github.com/torvalds/linux/commit/62026aedaacedbe1ffe94a3599ad4acd8ecdf587
-
-Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
-Reviewed-by: Cristian Stoica <cristian.stoica@freescale.com>
-Tested-by: Cristian Stoica <cristian.stoica@freescale.com>
-Signed-off-by: Horia Geanta <horia.geanta@freescale.com>
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-
-Upstream-Status: Backport
----
- cryptlib.c      | 8 ++++----
- cryptodev_int.h | 6 ++++++
- 2 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/cryptlib.c b/cryptlib.c
-index 54d5d41..a923c14 100644
---- a/cryptlib.c
-+++ b/cryptlib.c
-@@ -217,7 +217,7 @@ ssize_t cryptodev_cipher_encrypt(struct cipher_data *cdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(cdata->async.result->completion);
-+	reinit_completion(&cdata->async.result->completion);
- 
- 	if (cdata->aead == 0) {
- 		ablkcipher_request_set_crypt(cdata->async.request,
-@@ -240,7 +240,7 @@ ssize_t cryptodev_cipher_decrypt(struct cipher_data *cdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(cdata->async.result->completion);
-+	reinit_completion(&cdata->async.result->completion);
- 	if (cdata->aead == 0) {
- 		ablkcipher_request_set_crypt(cdata->async.request,
- 			(struct scatterlist *)src, dst,
-@@ -351,7 +351,7 @@ ssize_t cryptodev_hash_update(struct hash_data *hdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(hdata->async.result->completion);
-+	reinit_completion(&hdata->async.result->completion);
- 	ahash_request_set_crypt(hdata->async.request, sg, NULL, len);
- 
- 	ret = crypto_ahash_update(hdata->async.request);
-@@ -363,7 +363,7 @@ int cryptodev_hash_final(struct hash_data *hdata, void* output)
- {
- 	int ret;
- 
--	INIT_COMPLETION(hdata->async.result->completion);
-+	reinit_completion(&hdata->async.result->completion);
- 	ahash_request_set_crypt(hdata->async.request, NULL, output, 0);
- 
- 	ret = crypto_ahash_final(hdata->async.request);
-diff --git a/cryptodev_int.h b/cryptodev_int.h
-index 12dd5b1..188063d 100644
---- a/cryptodev_int.h
-+++ b/cryptodev_int.h
-@@ -2,6 +2,12 @@
- #ifndef CRYPTODEV_INT_H
- # define CRYPTODEV_INT_H
- 
-+#include <linux/version.h>
-+
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))
-+#  define reinit_completion(x) INIT_COMPLETION(*(x))
-+#endif
-+
- #include <linux/init.h>
- #include <linux/sched.h>
- #include <linux/fs.h>
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/files/Add-the-compile-and-install-rules-for-cryptodev-test.patch b/meta-arago-extras/recipes-kernel/cryptodev/files/Add-the-compile-and-install-rules-for-cryptodev-test.patch
deleted file mode 100644
index cb871f6..0000000
--- a/meta-arago-extras/recipes-kernel/cryptodev/files/Add-the-compile-and-install-rules-for-cryptodev-test.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 1980a8f4779a955e73285e7a0d86549b69bea5c8 Mon Sep 17 00:00:00 2001
-From: Yu Zongchun <b40527@freescale.com>
-Date: Sun, 28 Apr 2013 14:39:22 +0800
-Subject: [PATCH] Add the compile and install rules for cryptodev tests folder
-
-This is required to install the cryptodev tests folder to rootfs
-
-Signed-off-by: Yu Zongchun <b40527@freescale.com>
-
-Upstream-Status: Pending
-
----
- Makefile       |    6 ++++++
- tests/Makefile |    8 ++++++++
- 2 files changed, 14 insertions(+), 0 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 2be8825..4cbb865 100644
---- a/Makefile
-+++ b/Makefile
-@@ -17,6 +17,9 @@ install:
- 	@echo "Installing cryptodev.h in /usr/include/crypto ..."
- 	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
- 
-+install_tests:
-+	make -C tests install DESTDIR=$(PREFIX)
-+
- clean:
- 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
- 	rm -f $(hostprogs) *~
-@@ -25,6 +28,9 @@ clean:
- check:
- 	KERNEL_DIR=$(KERNEL_DIR) make -C tests check
- 
-+testprogs:
-+	KERNEL_DIR=$(KERNEL_DIR) make -C tests testprogs
-+
- FILEBASE = cryptodev-linux-$(VERSION)
- TMPDIR ?= /tmp
- OUTPUT = $(FILEBASE).tar.gz
-diff --git a/tests/Makefile b/tests/Makefile
-index 87ca3c7..0488cf6 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -19,6 +19,12 @@ example-async-hmac-objs := async_hmac.o
- example-async-speed-objs := async_speed.o
- example-hashcrypt-speed-objs := hashcrypt_speed.c
- 
-+install:
-+	install -d  $(DESTDIR)/usr/bin/tests_cryptodev
-+	for bin in $(hostprogs); do \
-+		install -m 755 $${bin} $(DESTDIR)/usr/bin/tests_cryptodev/; \
-+	done
-+
- check: $(hostprogs)
- 	./cipher
- 	./hmac
-@@ -28,6 +34,8 @@ check: $(hostprogs)
- 	./cipher-gcm
- 	./cipher-aead
- 
-+testprogs: $(hostprogs)
-+
- clean:
- 	rm -f *.o *~ $(hostprogs)
- 
--- 
-1.7.5.4
-
-- 
2.0.0


