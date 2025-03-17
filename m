Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F62C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:02:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.54737.1742223737547793516
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 08:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UYoC7J9o;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HF2GiQ2848722
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 10:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742223736;
	bh=W9NwfRiLebphY0wnLJJVM7y2VGqTaJcM3ZenZoiFwWw=;
	h=From:To:Subject:Date;
	b=UYoC7J9o/nLNGR0nKMZJXtXWMd1cmhLejUI3Rzqa8KeWgJKaY820N/QLGMeQQDFfG
	 Yz1zgOjszj/XSh6S51oQeBnb1t0G+cZH5BI6obV5hNaIBd96qrpc30AFel09Uc/Zka
	 c8JZtuCqpSCLnf8FDSLUjKDQks+hZZXuNjxtH9Ns=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HF2GD3108414;
	Mon, 17 Mar 2025 10:02:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 10:02:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 10:02:15 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HF2Fjn126074;
	Mon, 17 Mar 2025 10:02:15 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuByp-0008Br-Ni; Mon, 17 Mar 2025 10:02:15 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] libyang: Backport 3.7.8 from meta-openembedded master branch
Date: Mon, 17 Mar 2025 10:02:15 -0500
Message-ID: <20250317150215.31034-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 15:02:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16054

This is a backport of the libyang_3.7.8.bb recipe and related files from
the meta-openembedded master branch without any changes. [1]

In order to move to newer versions of the sysrepo recieps, this version
of libyang is required.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=d9b91513488916ef843d04377eb6841590ca047c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ntext-skip-test-case-test_searchdirs.patch | 29 ++++++++++++
 .../sysrepo/libyang/run-ptest                 | 18 ++++++++
 .../recipes-extended/sysrepo/libyang_3.7.8.bb | 45 +++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang/run-ptest
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb

diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang/0001-test_context-skip-test-case-test_searchdirs.patch b/meta-arago-extras/recipes-extended/sysrepo/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
new file mode 100644
index 00000000..3c6aee92
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
@@ -0,0 +1,29 @@
+From 5de24e1b39c09adb0c5bf4bb4228bd1bb935542a Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 22 Mar 2023 16:03:56 +0800
+Subject: [PATCH] test_context: skip test case test_searchdirs
+
+Skip test case test_searchdirs as it searchs the source code directory.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ tests/utests/basic/test_context.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test_context.c
+index cfba1d30f..8c3bb7ad6 100644
+--- a/tests/utests/basic/test_context.c
++++ b/tests/utests/basic/test_context.c
+@@ -1061,7 +1061,6 @@ int
+ main(void)
+ {
+     const struct CMUnitTest tests[] = {
+-        UTEST(test_searchdirs),
+         UTEST(test_options),
+         UTEST(test_models),
+         UTEST(test_imports),
+-- 
+2.25.1
+
diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang/run-ptest b/meta-arago-extras/recipes-extended/sysrepo/libyang/run-ptest
new file mode 100644
index 00000000..c507afb2
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/libyang/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+# cd into right directory
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests=$(find * -type f -name 'utest_*')
+
+for f in $tests
+do
+    if test -x ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    fi
+done
diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb b/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
new file mode 100644
index 00000000..3bea9bc2
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/libyang_3.7.8.bb
@@ -0,0 +1,45 @@
+SUMMARY = "YANG data modeling language library"
+DESCRIPTION = "libyang is a YANG data modelling language parser and toolkit written (and providing API) in C."
+HOMEPAGE = "https://github.com/CESNET/libyang"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
+
+SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
+
+SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
+           file://0001-test_context-skip-test-case-test_searchdirs.patch \
+           file://run-ptest \
+           "
+
+S = "${WORKDIR}/git"
+
+# Main dependencies
+inherit cmake pkgconfig lib_package ptest multilib_header
+DEPENDS = "libpcre2"
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
+EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON -DENABLE_VALGRIND_TESTS=OFF', '', d)}"
+
+do_compile:prepend () {
+    if [ ${PTEST_ENABLED} = "1" ]; then
+        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
+        sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/tests/tests_config.h
+    fi
+}
+
+do_install:append () {
+        oe_multilib_header  libyang/ly_config.h
+}
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -f ${B}/tests/utest_* ${D}${PTEST_PATH}/tests/
+    cp -fR ${S}/tests/modules ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/plugins
+    cp -f ${B}/tests/plugins/plugin_*.so ${D}${PTEST_PATH}/tests/plugins/
+}
+
+FILES:${PN} += "${datadir}/yang/*"
-- 
2.17.1


