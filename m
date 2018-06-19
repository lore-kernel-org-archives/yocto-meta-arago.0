Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 951EE529CA
	for <meta-arago@arago-project.org>;
	Tue, 19 Jun 2018 19:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B441020C15;
	Tue, 19 Jun 2018 19:23:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NM-SwclxBGq9; Tue, 19 Jun 2018 19:23:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C74120BFB;
	Tue, 19 Jun 2018 19:23:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F12261634BF;
	Tue, 19 Jun 2018 15:23:52 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 19 Jun 2018 15:23:51 -0400
Message-Id: <1529436231-29959-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529436231-29959-1-git-send-email-denys@ti.com>
References: <1529436231-29959-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] optee-test: fix build issue for ARM32 TI HS platforms
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
X-List-Received-Date: Tue, 19 Jun 2018 19:24:01 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...Makefile-fix-COMPILE_NS_USER-not-being-se.patch | 52 ++++++++++++++++++++++
 .../recipes-security/optee/optee-test_git.bbappend |  4 ++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-test/0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch

diff --git a/meta-arago-distro/recipes-security/optee/optee-test/0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch b/meta-arago-distro/recipes-security/optee/optee-test/0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch
new file mode 100644
index 0000000..f7cf97f
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-test/0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch
@@ -0,0 +1,52 @@
+From 001c6b560ccd4f66dc4b623e8b2c3f93bd2cab43 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 19 Jun 2018 14:11:18 -0400
+Subject: [PATCH] host/xtest/Makefile: fix COMPILE_NS_USER not being set by
+ default
+
+The build for TI ARM32 platforms attempts linking with aarch64 libcrypto.a
+and breaks, even when CFG_ARM32_core is set in the optee-os TA devkit.
+
+Fix it by moving setting of COMPILE_NS_USER based on CFG_ARM32_core outside
+of ifdef CFG_GP_PACKAGE_PATH, as it's also needed for CFG_TA_MBEDTLS
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ host/xtest/Makefile | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 47d24c2..2073cf6 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -24,6 +24,13 @@ OBJCOPY		?= $(CROSS_COMPILE)objcopy
+ OBJDUMP		?= $(CROSS_COMPILE)objdump
+ READELF		?= $(CROSS_COMPILE)readelf
+ 
++# by default, the client application is compiled as the kernel of optee-os
++ifeq ($(CFG_ARM32_core),y)
++COMPILE_NS_USER ?= 32
++else
++COMPILE_NS_USER ?= 64
++endif
++
+ # OpenSSL is used by GP tests series 8500 and Mbed TLS test 8103
+ ifneq (,$(filter y,$(CFG_GP_PACKAGE_PATH) $(CFG_TA_MBEDTLS)))
+ CFLAGS += -I../openssl/include -DOPENSSL_FOUND=1
+@@ -122,13 +129,6 @@ CFLAGS += -I../../ta/GP_TTA_check_OpenSession_with_4_parameters
+ CFLAGS += -I../../ta/GP_TTA_testingClientAPI
+ 
+ 
+-# by default, the client application is compiled as the kernel of optee-os
+-ifeq ($(CFG_ARM32_core),y)
+-COMPILE_NS_USER ?= 32
+-else
+-COMPILE_NS_USER ?= 64
+-endif
+-
+ endif
+ 
+ TA_DIR ?= /lib/optee_armtz
+-- 
+2.7.4
+
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index d99361f..e6d1073 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -1,7 +1,11 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
 PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
+SRC_URI += "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.patch"
+
 PV = "3.1.0+git${SRCPV}"
 
 BRANCH = "ti_optee_test"
-- 
2.7.4


