Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6A354529C7
	for <meta-arago@arago-project.org>;
	Mon, 25 Jun 2018 20:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 773EC20B0C;
	Mon, 25 Jun 2018 20:24:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ng4kjCfiHNIN; Mon, 25 Jun 2018 20:24:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4A81E20151;
	Mon, 25 Jun 2018 20:24:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C0D701634C7;
	Mon, 25 Jun 2018 16:24:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 25 Jun 2018 16:24:52 -0400
Message-Id: <1529958292-48792-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] iperf: restore version 2.0.5 as newer versions segfaults and unstable
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
X-List-Received-Date: Mon, 25 Jun 2018 20:25:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ++++++++++++++++++++++
 .../0002-fix-bool-size-m4.patch                    |  0
 .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch    |  8 ++++
 ...s.h-include-stdbool.h-for-bool-definition.patch | 25 -----------
 .../iperf/{iperf_2.0.11.bb => iperf_2.0.5.bb}      | 19 ++++----
 5 files changed, 70 insertions(+), 34 deletions(-)
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
 rename meta-arago-extras/recipes-benchmark/iperf/{iperf => iperf-2.0.5}/0002-fix-bool-size-m4.patch (100%)
 create mode 100755 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
 delete mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf/0001-headers.h-include-stdbool.h-for-bool-definition.patch
 rename meta-arago-extras/recipes-benchmark/iperf/{iperf_2.0.11.bb => iperf_2.0.5.bb} (34%)

diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
new file mode 100644
index 0000000..e8a0297
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
@@ -0,0 +1,52 @@
+iperf: fix out of tree configuration
+
+The configure step uses a package header to check for support of types/declares,
+this package header encapsulates all the required system header for providing
+the needed resources. When configured from an out of tree directory the package
+header is not found due to the hard path.
+We now make the path for package header relative to our 'srcdir' so it is
+found appropriately.
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+---
+diff --git a/configure.ac b/configure.ac
+index 2b3fd20..d420f9e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -176,8 +176,8 @@ dnl Check for system services
+ 
+ dnl check for multicast
+ if test "$ac_cv_multicast" != no; then
+-  AC_CHECK_TYPES(struct ip_mreq,,,[#include "compat/headers_slim.h"])
+-  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
++  AC_CHECK_TYPES(struct ip_mreq,,,[#include "${srcdir}/compat/headers_slim.h"])
++  AC_CHECK_DECLS(IP_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_slim.h"])
+   AC_MSG_CHECKING(for multicast support)
+   ac_cv_multicast=no
+   if test "$ac_cv_have_decl_IP_ADD_MEMBERSHIP" = yes; then
+@@ -193,9 +193,9 @@ fi
+ 
+ dnl check for IPv6
+ if test "$ac_cv_have_ipv6" != no; then
+-  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "compat/headers_slim.h"])
+-  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "compat/headers_slim.h"])
+-  AC_CHECK_DECLS(AF_INET6,,,[#include "compat/headers_slim.h"])
++  AC_CHECK_TYPES(struct sockaddr_storage,,,[#include "${srcdir}/compat/headers_slim.h"])
++  AC_CHECK_TYPES(struct sockaddr_in6,,,[#include "${srcdir}/compat/headers_slim.h"])
++  AC_CHECK_DECLS(AF_INET6,,,[#include "${srcdir}/compat/headers_slim.h"])
+   AC_MSG_CHECKING(for IPv6 headers and structures)
+   ac_cv_have_ipv6=no
+   if test "$ac_cv_type_struct_sockaddr_storage" = yes; then
+@@ -211,9 +211,9 @@ fi
+ 
+ if test "$ac_cv_have_ipv6" = yes; then
+   if test "$ac_cv_multicast" = yes; then
+-    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "compat/headers_slim.h"])
+-    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "compat/headers_slim.h"])
+-    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "compat/headers_slim.h"])
++    AC_CHECK_TYPES(struct ipv6_mreq,,,[#include "${srcdir}/compat/headers_slim.h"])
++    AC_CHECK_DECLS(IPV6_ADD_MEMBERSHIP,,,[#include "${srcdir}/compat/headers_slim.h"])
++    AC_CHECK_DECLS(IPV6_MULTICAST_HOPS,,,[#include "${srcdir}/compat/headers_slim.h"])
+     AC_MSG_CHECKING(for IPv6 multicast support)
+     ac_cv_have_ipv6_multicast=no
+     if test "$ac_cv_type_struct_ipv6_mreq" = yes; then
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf/0002-fix-bool-size-m4.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
similarity index 100%
rename from meta-arago-extras/recipes-benchmark/iperf/iperf/0002-fix-bool-size-m4.patch
rename to meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
new file mode 100755
index 0000000..12e8f46
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
@@ -0,0 +1,8 @@
+diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
+ index ed97bc6..728873f 100644
+--- iperf-2.0.5/man/Makefile.am
++++ iperf-2.0.5/man/Makefile.am
+@@ -1,2 +1 @@
+-man_MANS = iperf.1
+-dist_man_MANS = $(man_MANS)
++dist_man_MANS = iperf.1
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf/0001-headers.h-include-stdbool.h-for-bool-definition.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf/0001-headers.h-include-stdbool.h-for-bool-definition.patch
deleted file mode 100644
index 26c5bef..0000000
--- a/meta-arago-extras/recipes-benchmark/iperf/iperf/0001-headers.h-include-stdbool.h-for-bool-definition.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f6d6e2551e88221ae2c7bce6246f5286ac5bc124 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 3 May 2018 16:09:44 -0400
-Subject: [PATCH] headers.h: include <stdbool.h> for bool definition
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- include/headers.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/headers.h b/include/headers.h
-index 7e43b44..36e59d7 100644
---- a/include/headers.h
-+++ b/include/headers.h
-@@ -86,6 +86,7 @@
- #include <sys/types.h>
- #include <fcntl.h>
- #include <inttypes.h>
-+#include <stdbool.h>
- 
- #ifdef WIN32
- 
--- 
-2.7.4
-
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.11.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
similarity index 34%
rename from meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.11.bb
rename to meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
index c6ba7dc..9981d82 100644
--- a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.11.bb
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -1,16 +1,17 @@
-SUMMARY = "iperf is a widely used tool for network performance measurement and tuning"
-HOMEPAGE = "https://sourceforge.net/projects/iperf2/"
+DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
+HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
 SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/iperf2/${BP}.tar.gz \
-        file://0001-headers.h-include-stdbool.h-for-bool-definition.patch \
-        file://0002-fix-bool-size-m4.patch \
-"
+SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
+            file://iperf-2.0.5_ManPage.patch \
+            file://0001-fix-out-of-tree-config.patch \
+            file://0002-fix-bool-size-m4.patch \
+          "
 
-SRC_URI[md5sum] = "c63766d275b4537f419db096b9dfe4dc"
-SRC_URI[sha256sum] = "b7d650d07c6bb0e357b5938a20e4ac33876012fddb952299c5d321e6958da5d2"
+SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
+SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
 
 S = "${WORKDIR}/${BP}"
 
-- 
2.7.4


