Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id C5E4052AC3
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:41 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00BIU5RR4GE0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Lv5vsSpc c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=pGLkceISAAAA:8	a=JfrnYn6hAAAA:8
	a=zTHxBRev5l3MRNL4fWMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EF500161AC5;	Thu,
	2 Jul 2015 23:02:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:22 -0400
Message-id: <1435892533-6046-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 03/54] libnl: remove old local copies of 2.0 and 3.2.24 versions
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../libnl/libnl-2.0/fix-pc-file.patch              | 17 --------
 .../libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch | 29 -------------
 .../libnl/libnl-3.2.24/fix-pc-file.patch           | 17 --------
 .../libnl-3.2.24/fix-pktloc_syntax_h-race.patch    | 36 ----------------
 .../recipes-support/libnl/libnl_2.0.bb             | 29 -------------
 .../recipes-support/libnl/libnl_3.2.24.bb          | 49 ----------------------
 6 files changed, 177 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pc-file.patch
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pktloc_syntax_h-race.patch
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl_2.0.bb
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb

diff --git a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch b/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
deleted file mode 100644
index 85afe8f..0000000
--- a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Some packages are asking only for libnl-2.0, but expects to get also
-libnl-genl, libnl-nf libnl-route, easiest way to fix them is here.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Index: libnl-2.0/libnl-2.0.pc.in
-===================================================================
---- libnl-2.0.orig/libnl-2.0.pc.in
-+++ libnl-2.0/libnl-2.0.pc.in
-@@ -6,5 +6,5 @@
- Name: libnl
- Description: Convenience library for netlink sockets
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lnl
-+Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
- Cflags: -I${includedir}
diff --git a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch b/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
deleted file mode 100644
index ea32e82..0000000
--- a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-libnl has progressed to 0.3.2 and there does not appear to be any
-"make -j" issues with this build after my limited testing on that
-newer version so we can assume this issue is fixed upstream
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-Index: libnl-2.0/lib/Makefile.am
-===================================================================
---- libnl-2.0.orig/lib/Makefile.am
-+++ libnl-2.0/lib/Makefile.am
-@@ -27,11 +27,16 @@ CLEANFILES = \
- 	route/pktloc_grammar.c route/pktloc_grammar.h \
- 	route/pktloc_syntax.c route/pktloc_syntax.h
- 
-+BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
-+
- # Hack to avoid using ylwrap. It does not function correctly in combination
- # with --header-file=
-+route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
-+route/pktloc_grammar.h: route/pktloc_grammar.c
- route/pktloc_grammar.c: route/pktloc_grammar.l
- 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
- 
-+route/pktloc_syntax.h: route/pktloc_syntax.c
- route/pktloc_syntax.c: route/pktloc_syntax.y
- 	$(YACC) -d $(YFLAGS) -o $@ $^
- 
diff --git a/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pc-file.patch b/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pc-file.patch
deleted file mode 100644
index 0a7f2fc..0000000
--- a/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pc-file.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Some packages are asking only for libnl-2.0, but expects to get also
-libnl-genl, libnl-nf libnl-route, easiest way to fix them is here.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Index: libnl-3.2.24/libnl-3.0.pc.in
-===================================================================
---- libnl-3.2.24.orig/libnl-3.0.pc.in
-+++ libnl-3.2.24/libnl-3.0.pc.in
-@@ -6,5 +6,5 @@ includedir=@includedir@
- Name: libnl
- Description: Convenience library for netlink sockets
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lnl-@MAJ_VERSION@
-+Libs: -L${libdir} -lnl-@MAJ_VERSION@ -lnl-genl-@MAJ_VERSION@ -lnl-nf-@MAJ_VERSION@ -lnl-route-@MAJ_VERSION@
- Cflags: -I${includedir}/libnl@MAJ_VERSION@
diff --git a/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pktloc_syntax_h-race.patch b/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pktloc_syntax_h-race.patch
deleted file mode 100644
index 1939ee2..0000000
--- a/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pktloc_syntax_h-race.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-libnl has progressed to 0.3.2 and there does not appear to be any
-"make -j" issues with this build after my limited testing on that
-newer version so we can assume this issue is fixed upstream
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-Index: libnl-3.2.24/lib/Makefile.am
-===================================================================
---- libnl-3.2.24.orig/lib/Makefile.am
-+++ libnl-3.2.24/lib/Makefile.am
-@@ -46,9 +46,12 @@ CLEANFILES = \
- 
- # Hack to avoid using ylwrap. It does not function correctly in combination
- # with --header-file=
-+route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
-+route/pktloc_grammar.h: route/pktloc_grammar.c
- route/pktloc_grammar.c: route/pktloc_grammar.l
- 	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
- 
-+route/pktloc_syntax.h: route/pktloc_syntax.c
- route/pktloc_syntax.c: route/pktloc_syntax.y
- 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
- 
-@@ -100,7 +103,9 @@ BUILT_SOURCES = \
- 	route/cls/ematch_grammar.c \
- 	route/cls/ematch_syntax.c \
- 	route/pktloc_grammar.c \
--	route/pktloc_syntax.c
-+   route/pktloc_syntax.c \
-+   route/pktloc_syntax.h \
-+   route/pktloc_grammar.h
- 
- EXTRA_DIST = \
- 	route/pktloc_grammar.l \
diff --git a/meta-arago-extras/recipes-support/libnl/libnl_2.0.bb b/meta-arago-extras/recipes-support/libnl/libnl_2.0.bb
deleted file mode 100644
index 5882bf5..0000000
--- a/meta-arago-extras/recipes-support/libnl/libnl_2.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-SECTION = "libs/network"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
-
-DEFAULT_PREFERENCE = "-1"
-
-DEPENDS = "flex-native bison-native"
-PE = "1"
-PR = "r6"
-
-SRC_URI = "\
-  http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
-  file://fix-pktloc_syntax_h-race.patch \
-  file://fix-pc-file.patch \
-"
-
-SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
-SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8bc87a9c"
-
-inherit autotools pkgconfig
-
-PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
-FILES_${PN}-route = "${libdir}/libnl-route.so.*"
-FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
-FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
-FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
diff --git a/meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb b/meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
deleted file mode 100644
index 073322b..0000000
--- a/meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "A library for applications dealing with netlink sockets"
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-SECTION = "libs/network"
-
-PE = "1"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "flex-native bison-native"
-
-SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
-           file://fix-pktloc_syntax_h-race.patch \
-           file://fix-pc-file.patch \
-          "
-
-SRC_URI[md5sum] = "6e0e7bad0674749d930dd9f285343d55"
-SRC_URI[sha256sum] = "fb8d6e5dc8af5b85bc6d00a71582a68a01e6a3f7d1664d4a646e289a99dd6816"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-#   Install private files to allow libnl extensions
-    install -d ${D}${includedir}/netlink-private
-    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/netlink-private/
-    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/netlink-private/
-}
-
-FILES_${PN} = "${libdir}/libnl-3.so.* \
-               ${libdir}/libnl.so.* \
-               ${sysconfdir}"
-RREPLACES_${PN} = "libnl2"
-RCONFLICTS_${PN} = "libnl2"
-FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
-FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
-                    ${libdir}/libnl/cli/*/*.la"
-FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
-
-PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
-FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
-                     ${libdir}/libnl/cli/*/*.so.* \
-                     ${sbindir}/nl-*"
-FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
-FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
-FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
-                     ${libdir}/libnl-genl.so.* \
-                     ${sbindir}/genl-ctrl-list"
-RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
2.2.0


