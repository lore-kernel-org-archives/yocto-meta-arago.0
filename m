Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 268DC529F7
	for <meta-arago@arago-project.org>;
	Fri,  1 Nov 2019 00:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B53B40BCF;
	Fri,  1 Nov 2019 00:53:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9TaxASsHxgxA; Fri,  1 Nov 2019 00:53:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 82F4640BF0;
	Fri,  1 Nov 2019 00:53:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 391EC1742D9;
	Thu, 31 Oct 2019 20:53:26 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 31 Oct 2019 20:53:24 -0400
Message-Id: <1572569604-34682-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572569604-34682-1-git-send-email-denys@ti.com>
References: <1572569604-34682-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] optee: update to 3.7.0
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
X-List-Received-Date: Fri, 01 Nov 2019 00:54:48 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-security/optee/optee-client.bbappend   |  4 +-
 .../recipes-security/optee/optee-os_git.bbappend   |  6 +--
 ...Makefile-fix-COMPILE_NS_USER-not-being-se.patch | 52 ----------------------
 .../recipes-security/optee/optee-test_git.bbappend | 10 +++--
 4 files changed, 11 insertions(+), 61 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-test/0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index a203bda..c653612 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -5,10 +5,10 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
 
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV = "3.5.0+git${SRCPV}"
+PV = "3.7.0+git${SRCPV}"
 
 BRANCH = "ti-optee-client"
-SRCREV = "1f8f9abe4a31abd7b7490a7ddd9bbe812c92d5af"
+SRCREV = "2e526f4be1d471706915ba1e0044bcbe7c0b2626"
 
 do_install() {
     oe_runmake install
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 2cd7a67..f8b329c 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
 inherit python3native
 
-DEPENDS += "python3-pyelftools-native"
+DEPENDS += "python3-pyelftools-native python3-pycrypto-native"
 
 PR_append = ".arago0"
 
-PV = "3.6.0+git${SRCPV}"
+PV = "3.7.0+git${SRCPV}"
 
 is_armv7 = "1"
 is_armv7_aarch64 = "0"
@@ -17,7 +17,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti-optee-os"
-SRCREV = "e5a8779a6ffa2aa7ad01aed43608bcb9321817c6"
+SRCREV = "5208e5c1f3743fcde71e150eada2fc9945f749df"
 
 ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
 ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
diff --git a/meta-arago-distro/recipes-security/optee/optee-test/0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch b/meta-arago-distro/recipes-security/optee/optee-test/0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch
deleted file mode 100644
index f7cf97f..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-test/0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 001c6b560ccd4f66dc4b623e8b2c3f93bd2cab43 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 19 Jun 2018 14:11:18 -0400
-Subject: [PATCH] host/xtest/Makefile: fix COMPILE_NS_USER not being set by
- default
-
-The build for TI ARM32 platforms attempts linking with aarch64 libcrypto.a
-and breaks, even when CFG_ARM32_core is set in the optee-os TA devkit.
-
-Fix it by moving setting of COMPILE_NS_USER based on CFG_ARM32_core outside
-of ifdef CFG_GP_PACKAGE_PATH, as it's also needed for CFG_TA_MBEDTLS
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- host/xtest/Makefile | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/host/xtest/Makefile b/host/xtest/Makefile
-index 47d24c2..2073cf6 100644
---- a/host/xtest/Makefile
-+++ b/host/xtest/Makefile
-@@ -24,6 +24,13 @@ OBJCOPY		?= $(CROSS_COMPILE)objcopy
- OBJDUMP		?= $(CROSS_COMPILE)objdump
- READELF		?= $(CROSS_COMPILE)readelf
- 
-+# by default, the client application is compiled as the kernel of optee-os
-+ifeq ($(CFG_ARM32_core),y)
-+COMPILE_NS_USER ?= 32
-+else
-+COMPILE_NS_USER ?= 64
-+endif
-+
- # OpenSSL is used by GP tests series 8500 and Mbed TLS test 8103
- ifneq (,$(filter y,$(CFG_GP_PACKAGE_PATH) $(CFG_TA_MBEDTLS)))
- CFLAGS += -I../openssl/include -DOPENSSL_FOUND=1
-@@ -122,13 +129,6 @@ CFLAGS += -I../../ta/GP_TTA_check_OpenSession_with_4_parameters
- CFLAGS += -I../../ta/GP_TTA_testingClientAPI
- 
- 
--# by default, the client application is compiled as the kernel of optee-os
--ifeq ($(CFG_ARM32_core),y)
--COMPILE_NS_USER ?= 32
--else
--COMPILE_NS_USER ?= 64
--endif
--
- endif
- 
- TA_DIR ?= /lib/optee_armtz
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index 001f04f..42bdadf 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -1,12 +1,14 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+inherit python3native
+
+DEPENDS += "python3-pycrypto-native"
+
 PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
-SRC_URI += "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch"
-
-PV = "3.5.0+git${SRCPV}"
+PV = "3.7.0+git${SRCPV}"
 
 BRANCH = "ti-optee-test"
-SRCREV = "e4f6f76b4cb5763112f4722981f84a26f4ac7e55"
+SRCREV = "7c68d7b098b19363ada3c48b133484b018254fb1"
-- 
2.7.4


