Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 20114529C7
	for <meta-arago@arago-project.org>;
	Tue,  8 May 2018 17:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A0C4C20914;
	Tue,  8 May 2018 17:14:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FMifE0o88Yni; Tue,  8 May 2018 17:14:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 744762005C;
	Tue,  8 May 2018 17:14:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 98DC3163457;
	Tue,  8 May 2018 13:14:52 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  8 May 2018 13:14:52 -0400
Message-Id: <1525799692-6990-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][PATCH] ethtool: overlay 4.15 from master to resolve errors due to UFO removal in kernel
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
X-List-Received-Date: Tue, 08 May 2018 17:15:03 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch     | 29 +++++++++++++++++++++
 .../recipes-extended/ethtool/ethtool/run-ptest     |  2 ++
 .../recipes-extended/ethtool/ethtool_4.15.bb       | 30 ++++++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 meta-arago-distro/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
 create mode 100644 meta-arago-distro/recipes-extended/ethtool/ethtool/run-ptest
 create mode 100644 meta-arago-distro/recipes-extended/ethtool/ethtool_4.15.bb

diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta-arago-distro/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
new file mode 100644
index 0000000..59299e2
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -0,0 +1,29 @@
+From d069dada68b063e386cdb61707f0b22fb1799029 Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Wed, 28 May 2014 18:59:54 +0200
+Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
+
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Inappropriate
+(default automake behavior incompatible with ptest)
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cb61a02..c75b9a9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT(ethtool, 4.15, netdev@vger.kernel.org)
+ AC_PREREQ(2.52)
+ AC_CONFIG_SRCDIR([ethtool.c])
+-AM_INIT_AUTOMAKE([gnu])
++AM_INIT_AUTOMAKE([gnu serial-tests])
+ AC_CONFIG_HEADERS([ethtool-config.h])
+ 
+ AM_MAINTAINER_MODE
diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool/run-ptest b/meta-arago-distro/recipes-extended/ethtool/ethtool/run-ptest
new file mode 100644
index 0000000..1e245da
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k runtest-TESTS
diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool_4.15.bb b/meta-arago-distro/recipes-extended/ethtool/ethtool_4.15.bb
new file mode 100644
index 0000000..8538a75
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool_4.15.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Display or change ethernet card settings"
+DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
+HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
+
+SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
+           file://run-ptest \
+           file://avoid_parallel_tests.patch \
+           "
+
+SRC_URI[md5sum] = "a4b83b35a4bc7d3646d973b0baf36c78"
+SRC_URI[sha256sum] = "3996127fc22950b865287bd9d28c0aa3fcd44e914a5a4ef01de64872106dc178"
+
+inherit autotools ptest
+RDEPENDS_${PN}-ptest += "make"
+
+do_compile_ptest() {
+   oe_runmake buildtest-TESTS
+}
+
+do_install_ptest () {
+   cp ${B}/Makefile                 ${D}${PTEST_PATH}
+   install ${B}/test-cmdline        ${D}${PTEST_PATH}
+   install ${B}/test-features       ${D}${PTEST_PATH}
+   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
+   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
+}
-- 
2.7.4


