Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C095B529E6
	for <meta-arago@arago-project.org>;
	Mon,  2 May 2016 16:43:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u42GhgqU003777
	for <meta-arago@arago-project.org>; Mon, 2 May 2016 11:43:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u42Ghglg006874
	for <meta-arago@arago-project.org>; Mon, 2 May 2016 11:43:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 May 2016 11:43:42 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u42GhgZt024917;	Mon, 2 May 2016 11:43:42 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 May 2016 12:43:38 -0400
Message-ID: <1462207418-62497-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] doxygen: Update to work with flex 2.6.0
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
X-List-Received-Date: Mon, 02 May 2016 16:43:43 -0000
Content-Type: text/plain

Build failure reported with flex 2.6.0.
Added patch from
https://trac.macports.org/attachment/ticket/49881/doxygen_flex2_6_0.diff
to resolve issue.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../doxygen/doxygen/patch-flex_2_6_0.diff          | 66 ++++++++++++++++++++++
 .../recipes-devtools/doxygen/doxygen_1.8.9.1.bb    |  4 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff

diff --git a/meta-arago-extras/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff b/meta-arago-extras/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff
new file mode 100644
index 0000000..36d7379
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff
@@ -0,0 +1,66 @@
+--- src/code.l.orig
++++ src/code.l
+@@ -3695,7 +3695,7 @@ void codeFreeScanner()
+ extern "C" { // some bogus code to keep the compiler happy
+   void codeYYdummy() { yy_flex_realloc(0,0); } 
+ }
+-#elif YY_FLEX_SUBMINOR_VERSION<33
++#elif YY_FLEX_MAJOR_VERSION<=2 && YY_FLEX_MINOR_VERSION<=5 && YY_FLEX_SUBMINOR_VERSION<33
+ #error "You seem to be using a version of flex newer than 2.5.4 but older than 2.5.33. These versions do NOT work with doxygen! Please use version <=2.5.4 or >=2.5.33 or expect things to be parsed wrongly!"
+ #endif
+ 
+--- src/commentscan.l.orig
++++ src/commentscan.l
+@@ -1098,7 +1098,7 @@ RCSTAG    "$"{ID}":"[^\n$]+"$"
+ 					      // but we need to know the position in the input buffer where this 
+ 					      // rule matched.
+ 					      // for flex 2.5.33+ we should use YY_CURRENT_BUFFER_LVALUE
+-#if YY_FLEX_MINOR_VERSION>=5 && YY_FLEX_SUBMINOR_VERSION>=33
++#if YY_FLEX_MAJOR_VERSION>=2 && (YY_FLEX_MINOR_VERSION>5 || (YY_FLEX_MINOR_VERSION==5 && YY_FLEX_SUBMINOR_VERSION>=33))
+ 					      inputPosition=prevPosition + (int)(yy_bp - YY_CURRENT_BUFFER_LVALUE->yy_ch_buf);
+ #else
+ 					      inputPosition=prevPosition + (int)(yy_bp - yy_current_buffer->yy_ch_buf);
+@@ -1160,7 +1160,7 @@ RCSTAG    "$"{ID}":"[^\n$]+"$"
+                                           g_memberGroupHeader.resize(0);
+ 					  parseMore=TRUE;
+                                           needNewEntry = TRUE;
+-#if YY_FLEX_MINOR_VERSION>=5 && YY_FLEX_SUBMINOR_VERSION>=33
++#if YY_FLEX_MAJOR_VERSION>=2 && (YY_FLEX_MINOR_VERSION>5 || (YY_FLEX_MINOR_VERSION==5 && YY_FLEX_SUBMINOR_VERSION>=33))
+ 				          inputPosition=prevPosition + (int)(yy_bp - YY_CURRENT_BUFFER_LVALUE->yy_ch_buf) + strlen(yytext);
+ #else
+ 				          inputPosition=prevPosition + (int)(yy_bp - yy_current_buffer->yy_ch_buf) + strlen(yytext);
+
+--- src/fortrancode.l.orig
++++ src/fortrancode.l
+@@ -1289,7 +1289,7 @@ void parseFortranCode(CodeOutputInterfac
+ extern "C" { // some bogus code to keep the compiler happy
+   void fortrancodeYYdummy() { yy_flex_realloc(0,0); } 
+ }
+-#elif YY_FLEX_SUBMINOR_VERSION<33
++#elif YY_FLEX_MAJOR_VERSION<=2 && YY_FLEX_MINOR_VERSION<=5 && YY_FLEX_SUBMINOR_VERSION<33
+ #error "You seem to be using a version of flex newer than 2.5.4 but older than 2.5.33. These versions do NOT work with doxygen! Please use version <=2.5.4 or >=2.5.33 or expect things to be parsed wrongly!"
+ #else
+ extern "C" { // some bogus code to keep the compiler happy
+
+--- src/pycode.l.orig
++++ src/pycode.l        
+@@ -1503,7 +1503,7 @@ void parsePythonCode(CodeOutputInterface
+ extern "C" { // some bogus code to keep the compiler happy
+   void pycodeYYdummy() { yy_flex_realloc(0,0); } 
+ }
+-#elif YY_FLEX_SUBMINOR_VERSION<33
++#elif YY_FLEX_MAJOR_VERSION<=2 && YY_FLEX_MINOR_VERSION<=5 && YY_FLEX_SUBMINOR_VERSION<33
+ #error "You seem to be using a version of flex newer than 2.5.4. These are currently incompatible with 2.5.4, and do NOT work with doxygen! Please use version 2.5.4 or expect things to be parsed wrongly! A bug report has been submitted (#732132)."
+ #endif
+ 
+--- src/vhdlcode.l
++++ src.a/vhdlcode.l
+@@ -1613,7 +1613,7 @@ void codeFreeVhdlScanner()
+ extern "C" { // some bogus code to keep the compiler happy
+   void vhdlcodeYYdummy() { yy_flex_realloc(0,0); } 
+ }
+-#elif YY_FLEX_SUBMINOR_VERSION<33
++#elif YY_FLEX_MAJOR_VERSION<=2 && YY_FLEX_MINOR_VERSION<=5 && YY_FLEX_SUBMINOR_VERSION<33
+ #error "You seem to be using a version of flex newer than 2.5.4 but older than 2.5.33. These versions do NOT work with doxygen! Please use version <=2.5.4 or >=2.5.33 or expect things to be parsed wrongly!"
+ #endif
+ 
diff --git a/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb b/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
index 23919e8..68594e1 100644
--- a/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
+++ b/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/${BP}.src.tar.gz"
+SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/${BP}.src.tar.gz \
+	   file://patch-flex_2_6_0.diff;striplevel=0"
 SRC_URI[md5sum] = "3d1a5c26bef358c10a3894f356a69fbc"
 SRC_URI[sha256sum] = "d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b92167e738c1887feccec"
 
+PR = "r1"
 EXTRA_OECONF = "--prefix ${prefix}"
 
 do_configure () {
-- 
1.9.1


