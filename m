Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9CD835298F
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2013 16:50:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r89Goc0o004375
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2013 11:50:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r89Gocab009733
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2013 11:50:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 9 Sep 2013 11:50:38 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r89GoZou021558;
	Mon, 9 Sep 2013 11:50:36 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Sep 2013 12:28:22 -0500
Message-ID: <1378747702-6121-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] libnl: Pull in version 2.0 from oe-core
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
X-List-Received-Date: Mon, 09 Sep 2013 16:50:40 -0000
Content-Type: text/plain

* Version 2.0 of libnl is required for software required by  wilink 6 and
  wilink 8.
* Pull in older recipe to re enable wilink support.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../libnl/libnl-2.0/fix-pc-file.patch              |   17 +++++++++++
 .../libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch |   29 ++++++++++++++++++++
 .../recipes-support/libnl/libnl_2.0.bb             |   29 ++++++++++++++++++++
 3 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
 create mode 100644 meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
 create mode 100644 meta-arago-extras/recipes-support/libnl/libnl_2.0.bb

diff --git a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch b/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
new file mode 100644
index 0000000..85afe8f
--- /dev/null
+++ b/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Some packages are asking only for libnl-2.0, but expects to get also
+libnl-genl, libnl-nf libnl-route, easiest way to fix them is here.
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Index: libnl-2.0/libnl-2.0.pc.in
+===================================================================
+--- libnl-2.0.orig/libnl-2.0.pc.in
++++ libnl-2.0/libnl-2.0.pc.in
+@@ -6,5 +6,5 @@
+ Name: libnl
+ Description: Convenience library for netlink sockets
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -lnl
++Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
+ Cflags: -I${includedir}
diff --git a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch b/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
new file mode 100644
index 0000000..ea32e82
--- /dev/null
+++ b/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Inappropriate [configuration]
+
+libnl has progressed to 0.3.2 and there does not appear to be any
+"make -j" issues with this build after my limited testing on that
+newer version so we can assume this issue is fixed upstream
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Index: libnl-2.0/lib/Makefile.am
+===================================================================
+--- libnl-2.0.orig/lib/Makefile.am
++++ libnl-2.0/lib/Makefile.am
+@@ -27,11 +27,16 @@ CLEANFILES = \
+ 	route/pktloc_grammar.c route/pktloc_grammar.h \
+ 	route/pktloc_syntax.c route/pktloc_syntax.h
+ 
++BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
++
+ # Hack to avoid using ylwrap. It does not function correctly in combination
+ # with --header-file=
++route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
++route/pktloc_grammar.h: route/pktloc_grammar.c
+ route/pktloc_grammar.c: route/pktloc_grammar.l
+ 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 
++route/pktloc_syntax.h: route/pktloc_syntax.c
+ route/pktloc_syntax.c: route/pktloc_syntax.y
+ 	$(YACC) -d $(YFLAGS) -o $@ $^
+ 
diff --git a/meta-arago-extras/recipes-support/libnl/libnl_2.0.bb b/meta-arago-extras/recipes-support/libnl/libnl_2.0.bb
new file mode 100644
index 0000000..5882bf5
--- /dev/null
+++ b/meta-arago-extras/recipes-support/libnl/libnl_2.0.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
+HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+SECTION = "libs/network"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
+
+DEFAULT_PREFERENCE = "-1"
+
+DEPENDS = "flex-native bison-native"
+PE = "1"
+PR = "r6"
+
+SRC_URI = "\
+  http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
+  file://fix-pktloc_syntax_h-race.patch \
+  file://fix-pc-file.patch \
+"
+
+SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
+SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8bc87a9c"
+
+inherit autotools pkgconfig
+
+PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
+FILES_${PN}-route = "${libdir}/libnl-route.so.*"
+FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
+FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
+FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
-- 
1.7.0.4


