Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8843F5296D
	for <meta-arago@arago-project.org>;
	Thu,  3 May 2018 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B27420BCB;
	Thu,  3 May 2018 20:26:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UWdtHvaC6pAg; Thu,  3 May 2018 20:26:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4A93B20BBD;
	Thu,  3 May 2018 20:26:13 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A34CE16342D;
	Thu,  3 May 2018 16:26:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  3 May 2018 16:26:10 -0400
Message-Id: <1525379171-19544-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] iperf: add 2.0.10 of iperf from restored iperf2 project
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
X-List-Received-Date: Thu, 03 May 2018 20:26:19 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...s.h-include-stdbool.h-for-bool-definition.patch | 25 ++++++++++++++++++++++
 .../iperf/iperf/0002-fix-bool-size-m4.patch        | 16 ++++++++++++++
 .../recipes-benchmark/iperf/iperf_2.0.10.bb        | 22 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf/0001-headers.h-include-stdbool.h-for-bool-definition.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf/0002-fix-bool-size-m4.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.10.bb

diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf/0001-headers.h-include-stdbool.h-for-bool-definition.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf/0001-headers.h-include-stdbool.h-for-bool-definition.patch
new file mode 100644
index 0000000..26c5bef
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf/0001-headers.h-include-stdbool.h-for-bool-definition.patch
@@ -0,0 +1,25 @@
+From f6d6e2551e88221ae2c7bce6246f5286ac5bc124 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 3 May 2018 16:09:44 -0400
+Subject: [PATCH] headers.h: include <stdbool.h> for bool definition
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ include/headers.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/headers.h b/include/headers.h
+index 7e43b44..36e59d7 100644
+--- a/include/headers.h
++++ b/include/headers.h
+@@ -86,6 +86,7 @@
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #include <inttypes.h>
++#include <stdbool.h>
+ 
+ #ifdef WIN32
+ 
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf/0002-fix-bool-size-m4.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf/0002-fix-bool-size-m4.patch
new file mode 100644
index 0000000..348e316
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf/0002-fix-bool-size-m4.patch
@@ -0,0 +1,16 @@
+--- iperf-2.0.5/m4/dast.m4.orig	2016-06-15 11:42:03.945581785 -0400
++++ iperf-2.0.5/m4/dast.m4	2016-06-15 11:42:11.053581641 -0400
+@@ -11,7 +11,12 @@
+ 
+ AC_DEFUN(DAST_CHECK_BOOL, [
+ 
+-AC_CHECK_SIZEOF(bool)
++if test "$ac_cv_header_stdbool_h" = yes; then
++  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
++else
++    AC_CHECK_SIZEOF(bool)
++fi
++
+ if test "$ac_cv_sizeof_bool" = 0 ; then
+   AC_DEFINE(bool, int)
+ fi
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.10.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.10.bb
new file mode 100644
index 0000000..737efba
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.10.bb
@@ -0,0 +1,22 @@
+SUMMARY = "iperf is a widely used tool for network performance measurement and tuning"
+HOMEPAGE = "https://sourceforge.net/projects/iperf2/"
+SECTION = "console/network"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/iperf2/${BP}.tar.gz \
+        file://0001-headers.h-include-stdbool.h-for-bool-definition.patch \
+        file://0002-fix-bool-size-m4.patch \
+"
+
+SRC_URI[md5sum] = "097cf0754bc1afa165975c06a91e6906"
+SRC_URI[sha256sum] = "7fe4348dcca313b74e0aa9c34a8ccd713b84a5615b8578f4aa94cedce9891ef2"
+
+S = "${WORKDIR}/${BP}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.7.4


