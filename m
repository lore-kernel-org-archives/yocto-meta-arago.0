Return-Path: <grygorii.strashko@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 3BA8B52A09
	for <meta-arago@arago-project.org>;
	Wed, 21 Jul 2021 18:05:41 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16LI5qrh011412;
	Wed, 21 Jul 2021 13:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626890752;
	bh=6ylVfwthUuivGTE59j0deu+YH0ln7TuXjzZkIjmwSek=;
	h=From:To:CC:Subject:Date;
	b=gfPMHxkNcZJr5u3fNe9NDzWofIfkyCg8+LV2BGrKauTigPxDZV7d2jEPCDGTn429o
	y363wm3/ibhy5qNKxSeQ4UPD4T9YCBIRhC2iEs/uoaPmlS3/Uh4ibem4ai0H/y830r
	TPC0tGCnRAOJISmFYnOSeTxOgCD3I40kT9ydWVvs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16LI5qNp095384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jul 2021 13:05:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 21 Jul 2021 13:05:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 21 Jul 2021 13:05:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16LI5oTA124941;
	Wed, 21 Jul 2021 13:05:51 -0500
From: Grygorii Strashko <grygorii.strashko@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>, Yogesh
	Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denis@denix.org>
Date: Wed, 21 Jul 2021 21:05:48 +0300
Message-ID: <20210721180548.26052-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [dunfell][PATCH v2] ethtool: upgrade to 5.10
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
X-List-Received-Date: Wed, 21 Jul 2021 18:05:41 -0000
Content-Type: text/plain

Upgrade ethtool to 5.10

This is being backported from master oe-core, so it can be dropped when
migrating to the new LTS.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 .../ethtool/avoid_parallel_tests.patch        | 29 +++++++++++++++
 .../ethtool/ethtool/run-ptest                 |  2 +
 .../ethtool/ethtool_5.10.bb                   | 37 +++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest
 create mode 100644 meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb

diff --git a/meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch b/meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch
new file mode 100644
index 00000000..54aec012
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/ethtool/ethtool/avoid_parallel_tests.patch
@@ -0,0 +1,29 @@
+From b493e2fb472307997576eef33cce784594070f44 Mon Sep 17 00:00:00 2001
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
+index 13c2bc0..0b6ca1d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT(ethtool, 5.10, netdev@vger.kernel.org)
+ AC_PREREQ(2.52)
+ AC_CONFIG_SRCDIR([ethtool.c])
+-AM_INIT_AUTOMAKE([gnu subdir-objects])
++AM_INIT_AUTOMAKE([gnu subdir-objects serial-tests])
+ AC_CONFIG_HEADERS([ethtool-config.h])
+ 
+ AM_MAINTAINER_MODE
diff --git a/meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest b/meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest
new file mode 100644
index 00000000..1e245da1
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/ethtool/ethtool/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k runtest-TESTS
diff --git a/meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb b/meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb
new file mode 100644
index 00000000..5c0df3ac
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/ethtool/ethtool_5.10.bb
@@ -0,0 +1,37 @@
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
+SRC_URI[sha256sum] = "4b86adb3ed913c1ef14a276301981f696ab4ec360c19f0a5b68235c4756abae5"
+
+UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
+
+inherit autotools ptest bash-completion pkgconfig
+
+RDEPENDS_${PN}-ptest += "make"
+
+PACKAGECONFIG ?= "netlink"
+PACKAGECONFIG[netlink] = "--enable-netlink,--disable-netlink,libmnl,"
+
+do_compile_ptest() {
+   oe_runmake buildtest-TESTS
+}
+
+do_install_ptest () {
+   cp ${B}/Makefile                 ${D}${PTEST_PATH}
+   install ${B}/test-cmdline        ${D}${PTEST_PATH}
+   if ${@bb.utils.contains('PACKAGECONFIG', 'netlink', 'false', 'true', d)}; then
+       install ${B}/test-features       ${D}${PTEST_PATH}
+   fi
+   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
+   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
+}
-- 
2.17.1


