Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22089.1643242929326071481
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D32940CC1
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqvZn9AiUyfR for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F117440CC6
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0D6DE17473F
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:06 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 23/23] dma-heap-tests: patch to fix cmake linking issue
Date: Wed, 26 Jan 2022 19:22:04 -0500
Message-Id: <1643242924-25090-24-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Ryan Eatmon <reatmon@ti.com>

Adding patch to CMakeLists.txt to fix variable name that contains
the libraries to link against.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-devtools/dma-heap/dma-heap-tests.bb    |  4 ++-
 ...Variable-name-change-to-fix-compile-error.patch | 32 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch

diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
index fab2b4a..5d35eb5 100644
--- a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
+++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=
 PV = "1.0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH} \
+	file://0001-Variable-name-change-to-fix-compile-error.patch \
+"
 SRCREV = "bccbfbf24baccefa09439a924f61f04e82b3910a"
 
 DEPENDS = "googletest"
diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
new file mode 100644
index 0000000..8bc744d
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
@@ -0,0 +1,32 @@
+From ab0bb27b915419e3f93b4c0102837e7e748b0667 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Thu, 13 Jan 2022 20:00:27 -0600
+Subject: [dma-heap-tests][PATCH] Variable name change to fix compile error.
+
+It appears that a recent change in the GTest CMake integration
+changed the variable names for the libraries.  This fixes that
+issue and makes the compile work under Yocto.
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 71d7225..7d4a97f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,8 +19,8 @@ target_include_directories(dma-heap-unit-tests
+ )
+ 
+ target_link_libraries(dma-heap-unit-tests
+-	${GTEST_LIBRARY}
+-	${GTEST_MAIN_LIBRARY}
++    ${GTEST_LIBRARIES}
++    ${GTEST_MAIN_LIBRARIES}
+ 	pthread
+ )
+ 
+-- 
+2.17.1
+
-- 
2.7.4

