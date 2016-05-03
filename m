Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 0D625529EA
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 01:43:11 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K008Y3VFJ1X60@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 May 2016 20:42:55 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=Na2XfeO0AAAA:8
	a=oUOT70hIc92rlfJHhGYA:9
Received: by 100.15.86.14 with SMTP id 0c13cd07; Tue, 03 May 2016 01:42:55 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B41F4161FD5;	Mon,
	2 May 2016 21:42:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 May 2016 21:42:54 -0400
Message-id: <1462239774-18541-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1462239774-18541-1-git-send-email-denis@denix.org>
References: <1462239774-18541-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] cryptodev-module: drop local patch, make bbappend version-agnostic
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
X-List-Received-Date: Tue, 03 May 2016 01:43:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-allow-for-cross-compiling-cryptodev.patch | 35 ----------------------
 .../cryptodev/cryptodev-module_%.bbappend          |  3 ++
 .../cryptodev/cryptodev-module_1.6.bbappend        |  7 -----
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-allow-for-cross-compiling-cryptodev.patch
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-allow-for-cross-compiling-cryptodev.patch b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-allow-for-cross-compiling-cryptodev.patch
deleted file mode 100644
index e6f04e0..0000000
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-allow-for-cross-compiling-cryptodev.patch
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
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
new file mode 100644
index 0000000..99b426c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+KERNEL_MODULE_AUTOLOAD += "cryptodev"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
deleted file mode 100644
index f34f821..0000000
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-PR_append = "-arago8"
-
-KERNEL_MODULE_AUTOLOAD += "cryptodev"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://0001-allow-for-cross-compiling-cryptodev.patch"
-- 
2.2.0


