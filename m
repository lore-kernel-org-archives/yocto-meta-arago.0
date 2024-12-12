Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB658E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 15:01:01 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.21494.1734015652742951509
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Dec 2024 07:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JOeRabT9;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BCF0mKr2947305
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 12 Dec 2024 09:00:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734015648;
	bh=0Yh12y8QZM8N05Cu7mZB4Igydljj8ynUfIH0mwfNO1k=;
	h=From:To:CC:Subject:Date;
	b=JOeRabT9hBJ/UnPl1yroQY9m459jYvJHvdwe35CD0Sd2NLLhyxd/BilitNiY5SSja
	 0StmivI8vkJMib9/hp8vSCxuHxGLBmMsgMpYoSABpCVFp4uqwYihQk9blzhFlresZR
	 3lC9gDyi2YDT8A9MszOd+QUC71VtdAOQ7v6ZvosU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BCF0m5d099663;
	Thu, 12 Dec 2024 09:00:48 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Dec 2024 09:00:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Dec 2024 09:00:47 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BCF0l4u052259;
	Thu, 12 Dec 2024 09:00:47 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] meta-arago-demos: omapdrmtest: Remove this demo recipe
Date: Thu, 12 Dec 2024 09:00:47 -0600
Message-ID: <20241212150047.12352-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Dec 2024 15:01:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15653

This has not been functional for a long time. Even if it was it
is no longer a good example of the modern ways to use the DRM
interfaces. Remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     |  3 --
 ...ah-flags-belong-to-LDADD-not-LDFLAGS.patch | 30 -------------------
 .../omapdrmtest/omapdrmtest_1.0.0.bb          | 22 --------------
 3 files changed, 55 deletions(-)
 delete mode 100644 meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
 delete mode 100644 meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index e8458cef..38540aa3 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -94,15 +94,12 @@ TI_TEST_TI_TOOLS:append:ti43x = " \
     switch-config \
 "
 
-NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
-
 TI_TEST_TI_TOOLS:append:omap-a15 = " \
     omapconf \
     pru-icss \
     switch-config \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
-	    ${NOT_MAINLINE_MMIP_DEPS} \
     ", d)} \
 "
 
diff --git a/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch b/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
deleted file mode 100644
index 0adb30b7..00000000
--- a/meta-arago-test/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 315652fa73555b71b7f1d0c77357f824c432c882 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Wed, 4 Apr 2018 20:09:54 -0400
-Subject: [PATCH] Makefile.am: -lblah flags belong to LDADD, not LDFLAGS
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 99f4036..7ac6146 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -26,9 +26,8 @@ if ENABLE_DCE
- bin_PROGRAMS += viddec3test copycodectest yuvcopytest videnc2test
- endif
- 
--LDADD_COMMON = util/libutil.la @DRM_LIBS@ @DCE_LIBS@ @GBM_LIBS@ @EGL_LIBS@ @GLES2_LIBS@
-+LDADD_COMMON = util/libutil.la @DRM_LIBS@ @DCE_LIBS@ @GBM_LIBS@ @EGL_LIBS@ @GLES2_LIBS@ -lm -lavcodec -lpthread
- AM_CFLAGS = @DRM_CFLAGS@ @DCE_CFLAGS@ @GBM_CFLAGS@ @EGL_CFLAGS@ @GLES2_CFLAGS@ @WARN_CFLAGS@ -I$(top_srcdir)/util
--LDFLAGS = -lm -lavcodec -lpthread
- 
- fliptest_SOURCES = fliptest.c
- fliptest_LDADD = $(LDADD_COMMON)
--- 
-2.7.4
-
diff --git a/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
deleted file mode 100644
index fb6e7a6a..00000000
--- a/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Test applications for OMAP DRM interface"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a29096285e3121923041df"
-
-DEPENDS = "ffmpeg libdce libdrm virtual/libgbm virtual/libgles2 virtual/egl wayland"
-
-COMPATIBLE_MACHINE = "omap-a15|ti43x"
-
-inherit autotools pkgconfig
-
-PR = "r29"
-SRCREV = "1fceb3ac4b0e7ed014000a10dfe6ca8729f9cd8d"
-
-EXTRA_OEMAKE = "CC="${CC}""
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-SRC_URI = "git://git.ti.com/git/glsdk/omapdrmtest.git;protocol=https;branch=master \
-        file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
-"
-
-S = "${WORKDIR}/git"
-- 
2.39.2


