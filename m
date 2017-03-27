Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 05F92520C1
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8472220B87;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MKzkLTCJREx6; Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 58269208E3;
	Mon, 27 Mar 2017 02:10:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id AB19A16242A;
	Sun, 26 Mar 2017 22:10:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 26 Mar 2017 22:10:47 -0400
Message-Id: <1490580653-40192-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490580653-40192-1-git-send-email-denis@denix.org>
References: <1490580653-40192-1-git-send-email-denis@denix.org>
Subject: [morty/master][PATCH 2/8] ti-gc320-tests: relax assignment of CC and other tools
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
X-List-Received-Date: Mon, 27 Mar 2017 02:10:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Fix other warnings

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...nux.def-relax-assignment-of-CC-and-other-.patch | 38 ++++++++++++++++++++++
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb     |  7 ++--
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch b/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch
new file mode 100644
index 0000000..0078a29
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch
@@ -0,0 +1,38 @@
+From 764b18a591c0e64adb7d5e5147c6a9afef2111d3 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 26 Mar 2017 14:14:49 -0400
+Subject: [PATCH] makefile.linux.def: relax assignment of CC and other tools
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ tests/src/makefile.linux.def | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/tests/src/makefile.linux.def b/tests/src/makefile.linux.def
+index 4904717..d229a5a 100755
+--- a/tests/src/makefile.linux.def
++++ b/tests/src/makefile.linux.def
+@@ -91,13 +91,13 @@ ifeq ($(USE_ARMCC),1)
+ 	LD     := $(CROSS_COMPILE)link
+ else
+ 	CROSS_COMPILE ?= arm-none-linux-gnueabi-
+-	CC     := $(CROSS_COMPILE)gcc
+-	CXX    := $(CROSS_COMPILE)g++
+-	AR     := $(CROSS_COMPILE)ar
+-	AS     := $(CROSS_COMPILE)as
+-	LD     := $(CROSS_COMPILE)ld
+-	RANLIB := $(CROSS_COMPILE)ranlib
+-	STRIP  := $(CROSS_COMPILE)strip
++	CC     ?= $(CROSS_COMPILE)gcc
++	CXX    ?= $(CROSS_COMPILE)g++
++	AR     ?= $(CROSS_COMPILE)ar
++	AS     ?= $(CROSS_COMPILE)as
++	LD     ?= $(CROSS_COMPILE)ld
++	RANLIB ?= $(CROSS_COMPILE)ranlib
++	STRIP  ?= $(CROSS_COMPILE)strip
+ endif
+ 
+ ################################################################
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index 4bbcb18..9138f27 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -7,7 +7,9 @@ DEPENDS = "ti-gc320-libs"
 
 BRANCH = "ti-${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/ti-gc320-test.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/graphics/ti-gc320-test.git;protocol=git;branch=${BRANCH} \
+file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
+"
 SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
 PR = "r2"
 
@@ -30,4 +32,5 @@ do_install() {
 	done
 }
 
-INSANE_SKIP_${PN} += "ldflags"
+INSANE_SKIP_${PN} += "ldflags already-stripped libdir"
+INSANE_SKIP_${PN}-dbg += "libdir"
-- 
2.7.4


