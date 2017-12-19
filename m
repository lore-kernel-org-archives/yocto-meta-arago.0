Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B80815299D
	for <meta-arago@arago-project.org>;
	Tue, 19 Dec 2017 18:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3C161208CC;
	Tue, 19 Dec 2017 18:52:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZXVJ5eEbrjmj; Tue, 19 Dec 2017 18:52:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1583D2087C;
	Tue, 19 Dec 2017 18:52:49 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 754181631F8;
	Tue, 19 Dec 2017 13:52:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 19 Dec 2017 13:52:48 -0500
Message-Id: <1513709568-70100-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] doxygen: moved to meta-ti, remove
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
X-List-Received-Date: Tue, 19 Dec 2017 18:52:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../doxygen/doxygen/patch-flex_2_6_0.diff          | 66 ----------------------
 .../recipes-devtools/doxygen/doxygen_1.8.9.1.bb    | 34 -----------
 2 files changed, 100 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff
 delete mode 100644 meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb

diff --git a/meta-arago-extras/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff b/meta-arago-extras/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff
deleted file mode 100644
index 36d7379..0000000
--- a/meta-arago-extras/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff
+++ /dev/null
@@ -1,66 +0,0 @@
---- src/code.l.orig
-+++ src/code.l
-@@ -3695,7 +3695,7 @@ void codeFreeScanner()
- extern "C" { // some bogus code to keep the compiler happy
-   void codeYYdummy() { yy_flex_realloc(0,0); } 
- }
--#elif YY_FLEX_SUBMINOR_VERSION<33
-+#elif YY_FLEX_MAJOR_VERSION<=2 && YY_FLEX_MINOR_VERSION<=5 && YY_FLEX_SUBMINOR_VERSION<33
- #error "You seem to be using a version of flex newer than 2.5.4 but older than 2.5.33. These versions do NOT work with doxygen! Please use version <=2.5.4 or >=2.5.33 or expect things to be parsed wrongly!"
- #endif
- 
---- src/commentscan.l.orig
-+++ src/commentscan.l
-@@ -1098,7 +1098,7 @@ RCSTAG    "$"{ID}":"[^\n$]+"$"
- 					      // but we need to know the position in the input buffer where this 
- 					      // rule matched.
- 					      // for flex 2.5.33+ we should use YY_CURRENT_BUFFER_LVALUE
--#if YY_FLEX_MINOR_VERSION>=5 && YY_FLEX_SUBMINOR_VERSION>=33
-+#if YY_FLEX_MAJOR_VERSION>=2 && (YY_FLEX_MINOR_VERSION>5 || (YY_FLEX_MINOR_VERSION==5 && YY_FLEX_SUBMINOR_VERSION>=33))
- 					      inputPosition=prevPosition + (int)(yy_bp - YY_CURRENT_BUFFER_LVALUE->yy_ch_buf);
- #else
- 					      inputPosition=prevPosition + (int)(yy_bp - yy_current_buffer->yy_ch_buf);
-@@ -1160,7 +1160,7 @@ RCSTAG    "$"{ID}":"[^\n$]+"$"
-                                           g_memberGroupHeader.resize(0);
- 					  parseMore=TRUE;
-                                           needNewEntry = TRUE;
--#if YY_FLEX_MINOR_VERSION>=5 && YY_FLEX_SUBMINOR_VERSION>=33
-+#if YY_FLEX_MAJOR_VERSION>=2 && (YY_FLEX_MINOR_VERSION>5 || (YY_FLEX_MINOR_VERSION==5 && YY_FLEX_SUBMINOR_VERSION>=33))
- 				          inputPosition=prevPosition + (int)(yy_bp - YY_CURRENT_BUFFER_LVALUE->yy_ch_buf) + strlen(yytext);
- #else
- 				          inputPosition=prevPosition + (int)(yy_bp - yy_current_buffer->yy_ch_buf) + strlen(yytext);
-
---- src/fortrancode.l.orig
-+++ src/fortrancode.l
-@@ -1289,7 +1289,7 @@ void parseFortranCode(CodeOutputInterfac
- extern "C" { // some bogus code to keep the compiler happy
-   void fortrancodeYYdummy() { yy_flex_realloc(0,0); } 
- }
--#elif YY_FLEX_SUBMINOR_VERSION<33
-+#elif YY_FLEX_MAJOR_VERSION<=2 && YY_FLEX_MINOR_VERSION<=5 && YY_FLEX_SUBMINOR_VERSION<33
- #error "You seem to be using a version of flex newer than 2.5.4 but older than 2.5.33. These versions do NOT work with doxygen! Please use version <=2.5.4 or >=2.5.33 or expect things to be parsed wrongly!"
- #else
- extern "C" { // some bogus code to keep the compiler happy
-
---- src/pycode.l.orig
-+++ src/pycode.l        
-@@ -1503,7 +1503,7 @@ void parsePythonCode(CodeOutputInterface
- extern "C" { // some bogus code to keep the compiler happy
-   void pycodeYYdummy() { yy_flex_realloc(0,0); } 
- }
--#elif YY_FLEX_SUBMINOR_VERSION<33
-+#elif YY_FLEX_MAJOR_VERSION<=2 && YY_FLEX_MINOR_VERSION<=5 && YY_FLEX_SUBMINOR_VERSION<33
- #error "You seem to be using a version of flex newer than 2.5.4. These are currently incompatible with 2.5.4, and do NOT work with doxygen! Please use version 2.5.4 or expect things to be parsed wrongly! A bug report has been submitted (#732132)."
- #endif
- 
---- src/vhdlcode.l
-+++ src.a/vhdlcode.l
-@@ -1613,7 +1613,7 @@ void codeFreeVhdlScanner()
- extern "C" { // some bogus code to keep the compiler happy
-   void vhdlcodeYYdummy() { yy_flex_realloc(0,0); } 
- }
--#elif YY_FLEX_SUBMINOR_VERSION<33
-+#elif YY_FLEX_MAJOR_VERSION<=2 && YY_FLEX_MINOR_VERSION<=5 && YY_FLEX_SUBMINOR_VERSION<33
- #error "You seem to be using a version of flex newer than 2.5.4 but older than 2.5.33. These versions do NOT work with doxygen! Please use version <=2.5.4 or >=2.5.33 or expect things to be parsed wrongly!"
- #endif
- 
diff --git a/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb b/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
deleted file mode 100644
index 68594e1..0000000
--- a/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "Utilities for generating documentation from source code"
-HOMEPAGE = "http://www.doxygen.org/"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
-
-DEPENDS = "flex-native bison-native"
-
-SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/${BP}.src.tar.gz \
-	   file://patch-flex_2_6_0.diff;striplevel=0"
-SRC_URI[md5sum] = "3d1a5c26bef358c10a3894f356a69fbc"
-SRC_URI[sha256sum] = "d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b92167e738c1887feccec"
-
-PR = "r1"
-EXTRA_OECONF = "--prefix ${prefix}"
-
-do_configure () {
-	./configure ${EXTRA_OECONF}
-
-	# TODO on rebuilds will repeatedly append.  Change logic to include a
-	# separate file and overwrite that file?
-        echo "TMAKE_CC=${CC}" >> tmake/lib/linux-g++/tmake.conf
-        echo "TMAKE_CXX=${CXX}" >> tmake/lib/linux-g++/tmake.conf
-        echo "TMAKE_CFLAGS=${CFLAGS}" >> tmake/lib/linux-g++/tmake.conf
-        echo "TMAKE_CXXFLAGS=${CXXFLAGS}" >> tmake/lib/linux-g++/tmake.conf
-        echo "TMAKE_LINK=${CXX}" >> tmake/lib/linux-g++/tmake.conf
-        echo "TMAKE_LFLAGS=${LDFLAGS}" >> tmake/lib/linux-g++/tmake.conf
-}
-
-do_install() {
-	oe_runmake install DESTDIR=${D} MAN1DIR=share/man/man1
-}
-
-BBCLASSEXTEND = "native"
-- 
2.7.4


