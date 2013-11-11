Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5A65752998
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 16:08:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rABG8ghH013611
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 10:08:42 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABG8g2q005658
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 10:08:42 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 11 Nov 2013 10:08:42 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABG8dvo031084;
	Mon, 11 Nov 2013 10:08:40 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Nov 2013 11:07:05 -0600
Message-ID: <1384189628-21944-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/4] input-utils: Add the input-utils package recipe
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
X-List-Received-Date: Mon, 11 Nov 2013 16:08:44 -0000
Content-Type: text/plain

* Build the input utils for ARM to enable these for system test

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...utoconf-fix-for-cross-compilation-for-ARM.patch |   67 ++++++++++++++++++++
 .../input-utils/input-utils_git.bb                 |   30 +++++++++
 2 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
 create mode 100644 meta-arago-extras/recipes-devtools/input-utils/input-utils_git.bb

diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch b/meta-arago-extras/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
new file mode 100644
index 0000000..7230869
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
@@ -0,0 +1,67 @@
+From fb1bbf8342c4a87380964465443bbb4b61dc0259 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Tue, 5 Nov 2013 05:22:10 -0600
+Subject: [PATCH] autoconf: fix for cross compilation for ARM
+
+* Based on changes from Yebio Mesfin fixup the input-utils to
+  cross compile for ARM.
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ mk/Autoconf.mk  |    8 ++++++--
+ mk/Variables.mk |    4 ++--
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/mk/Autoconf.mk b/mk/Autoconf.mk
+index 7608ea5..95999cc 100644
+--- a/mk/Autoconf.mk
++++ b/mk/Autoconf.mk
+@@ -47,11 +47,13 @@ ac_uname = $(shell \
+ 	$(call ac_s_cmd,uname -s | tr 'A-Z' 'a-z');\
+ 	$(call ac_fini))
+ 
+-ac_uname_arch = $(shell \
++#ac_uname_arch = $(shell \
+ 	$(call ac_init,for arch);\
+ 	$(call ac_s_cmd,uname -m | tr 'A-Z' 'a-z');\
+ 	$(call ac_fini))
+ 
++ac_uname_arch = arm
++
+ # check for some header file
+ # args: header file
+ ac_header = $(shell \
+@@ -108,12 +110,14 @@ ac_binary = $(shell \
+ #	$(call ac_s_cmd,$(CC) -print-search-dirs | grep -q lib64 &&\
+ #		echo "lib64" || echo "lib");\
+ #	$(call ac_fini))
+-ac_lib64 = $(shell \
++#ac_lib64 = $(shell \
+ 	$(call ac_init,for libdir name);\
+ 	$(call ac_s_cmd,/sbin/ldconfig -p | grep -q lib64 &&\
+ 		echo "lib64" || echo "lib");\
+ 	$(call ac_fini))
+ 
++ac_lib64 = gcc
++
+ # check for x11 ressource dir prefix
+ ac_resdir = $(shell \
+ 	$(call ac_init,for X11 app-defaults prefix);\
+diff --git a/mk/Variables.mk b/mk/Variables.mk
+index 99f787c..fd47f73 100644
+--- a/mk/Variables.mk
++++ b/mk/Variables.mk
+@@ -24,8 +24,8 @@ endif
+ RELTAG	:= v$(subst .,_,$(VERSION))
+ 
+ # programs
+-CC		?= gcc
+-CXX		?= g++
++CC		?= $(CROSS_COMPILE)gcc
++CXX		?= $(CROSS_COMPILE)g++
+ MOC             ?= $(if $(QTDIR),$(QTDIR)/bin/moc,moc)
+ 
+ STRIP		?= -s
+-- 
+1.7.0.4
+
diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils_git.bb b/meta-arago-extras/recipes-devtools/input-utils/input-utils_git.bb
new file mode 100644
index 0000000..30a7454
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/input-utils/input-utils_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Utilities for the Linux input drivers"
+HOMEPAGE = "http://packages.tanglu.org/source/aequorea/input-utils"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PV = "1.0"
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "230a22bda95ea5616251b43db418f9df445651b6"
+
+SRC_URI = "git://git.debian.org/collab-maint/input-utils.git;protocol=git;branch=${BRANCH}"
+SRC_URI_append_arm = " file://0001-autoconf-fix-for-cross-compilation-for-ARM.patch"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+    oe_runmake
+}
+
+# set the DESTDIR and the STRIP variables used by the GNUmakefile.
+# The STRIP variable is set to blank or else the variable setting from OE
+# is picked up as <TC>-strip and the install step sees that as another
+# file to install.
+EXTRA_OEMAKE = "DESTDIR=${D} STRIP=''"
+
+do_install () {
+    oe_runmake install
+}
-- 
1.7.0.4


