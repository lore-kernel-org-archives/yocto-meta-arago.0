Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 97BEC529CF
	for <meta-arago@arago-project.org>;
	Sat, 14 Dec 2013 07:23:27 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXS007H6CINSI70@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 14 Dec 2013 01:23:12 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 79DF52016B; Sat,
	14 Dec 2013 02:23:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 14 Dec 2013 02:23:06 -0500
Message-id: <1387005788-16338-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/3] cryptodev: add cryptodev kernel module and -tests packages
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
X-List-Received-Date: Sat, 14 Dec 2013 07:23:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Cryptodev-linux is a device that allows access to Linux kernel cryptographic
drivers; thus allowing of userspace applications to take advantage of hardware
accelerators. http://cryptodev-linux.org/

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../cryptodev/cryptodev-tests_1.6.bb               | 20 +++++++
 .../recipes-kernel/cryptodev/cryptodev_1.6.bb      |  9 +++
 .../recipes-kernel/cryptodev/cryptodev_1.6.inc     | 11 ++++
 ...pile-and-install-rules-for-cryptodev-test.patch | 69 ++++++++++++++++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
 create mode 100644 meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
 create mode 100644 meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.inc
 create mode 100644 meta-arago-extras/recipes-kernel/cryptodev/files/Add-the-compile-and-install-rules-for-cryptodev-test.patch

diff --git a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
new file mode 100644
index 0000000..618e6e5
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
@@ -0,0 +1,20 @@
+require cryptodev_${PV}.inc
+
+SUMMARY = "Linux Cryptodev Test Suite"
+DESCRIPTION = "The Cryptodev package contains the test apps"
+
+PR = "r0"
+DEPENDS += "openssl"
+
+SRC_URI += "file://Add-the-compile-and-install-rules-for-cryptodev-test.patch"
+
+do_compile() {
+	oe_runmake testprogs
+}
+
+do_install() {
+	oe_runmake install_tests
+}
+
+FILES_${PN}-dbg += "${bindir}/tests_cryptodev/.debug"
+FILES_${PN} = "${bindir}/tests_cryptodev/*"
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
new file mode 100644
index 0000000..939a795
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb
@@ -0,0 +1,9 @@
+require cryptodev_${PV}.inc
+
+SUMMARY = "Linux Cryptodev KERNEL MODULE"
+DESCRIPTION = "The Cryptodev package contains the kernel /dev/crypto module"
+RCONFLICTS_${PN} = "ocf-linux"
+
+inherit module
+
+PR = "r0"
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.inc b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.inc
new file mode 100644
index 0000000..b3c6aef
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.inc
@@ -0,0 +1,11 @@
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "4e2c848628425c572d8994ea96601d27543cd5fd"
+
+SRC_URI = "git://github.com/nmav/cryptodev-linux.git;protocol=git"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
+
+S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/files/Add-the-compile-and-install-rules-for-cryptodev-test.patch b/meta-arago-extras/recipes-kernel/cryptodev/files/Add-the-compile-and-install-rules-for-cryptodev-test.patch
new file mode 100644
index 0000000..cb871f6
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/cryptodev/files/Add-the-compile-and-install-rules-for-cryptodev-test.patch
@@ -0,0 +1,69 @@
+From 1980a8f4779a955e73285e7a0d86549b69bea5c8 Mon Sep 17 00:00:00 2001
+From: Yu Zongchun <b40527@freescale.com>
+Date: Sun, 28 Apr 2013 14:39:22 +0800
+Subject: [PATCH] Add the compile and install rules for cryptodev tests folder
+
+This is required to install the cryptodev tests folder to rootfs
+
+Signed-off-by: Yu Zongchun <b40527@freescale.com>
+
+Upstream-Status: Pending
+
+---
+ Makefile       |    6 ++++++
+ tests/Makefile |    8 ++++++++
+ 2 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 2be8825..4cbb865 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,6 +17,9 @@ install:
+ 	@echo "Installing cryptodev.h in /usr/include/crypto ..."
+ 	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
+ 
++install_tests:
++	make -C tests install DESTDIR=$(PREFIX)
++
+ clean:
+ 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
+ 	rm -f $(hostprogs) *~
+@@ -25,6 +28,9 @@ clean:
+ check:
+ 	KERNEL_DIR=$(KERNEL_DIR) make -C tests check
+ 
++testprogs:
++	KERNEL_DIR=$(KERNEL_DIR) make -C tests testprogs
++
+ FILEBASE = cryptodev-linux-$(VERSION)
+ TMPDIR ?= /tmp
+ OUTPUT = $(FILEBASE).tar.gz
+diff --git a/tests/Makefile b/tests/Makefile
+index 87ca3c7..0488cf6 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -19,6 +19,12 @@ example-async-hmac-objs := async_hmac.o
+ example-async-speed-objs := async_speed.o
+ example-hashcrypt-speed-objs := hashcrypt_speed.c
+ 
++install:
++	install -d  $(DESTDIR)/usr/bin/tests_cryptodev
++	for bin in $(hostprogs); do \
++		install -m 755 $${bin} $(DESTDIR)/usr/bin/tests_cryptodev/; \
++	done
++
+ check: $(hostprogs)
+ 	./cipher
+ 	./hmac
+@@ -28,6 +34,8 @@ check: $(hostprogs)
+ 	./cipher-gcm
+ 	./cipher-aead
+ 
++testprogs: $(hostprogs)
++
+ clean:
+ 	rm -f *.o *~ $(hostprogs)
+ 
+-- 
+1.7.5.4
+
-- 
1.8.3.2


