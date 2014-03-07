Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9AB3752A0A
	for <meta-arago@arago-project.org>;
	Fri,  7 Mar 2014 21:57:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27LvHoI026304
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 15:57:17 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27LvHJC019093
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 15:57:17 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 15:57:17 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27Lv98c006131;
	Fri, 7 Mar 2014 15:57:15 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Mar 2014 15:57:05 -0600
Message-ID: <1394229426-12753-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1394229426-12753-1-git-send-email-fcooper@ti.com>
References: <1394229426-12753-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] cryptodev: Add patch to make cryptodev cross compile friendly.
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
X-List-Received-Date: Fri, 07 Mar 2014 21:57:18 -0000
Content-Type: text/plain

* This patch is already upstreamed.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-allow-for-cross-compiling-cryptodev.patch |   35 ++++++++++++++++++++
 .../cryptodev/cryptodev_1.6.bbappend               |    6 +++-
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev/0001-allow-for-cross-compiling-cryptodev.patch

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev/0001-allow-for-cross-compiling-cryptodev.patch b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev/0001-allow-for-cross-compiling-cryptodev.patch
new file mode 100644
index 0000000..e6f04e0
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev/0001-allow-for-cross-compiling-cryptodev.patch
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
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
index 0c6a087..75f5a29 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev_1.6.bbappend
@@ -1,3 +1,7 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 module_autoload_cryptodev = "cryptodev"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-allow-for-cross-compiling-cryptodev.patch"
-- 
1.7.0.4


