Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753F0C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:35:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.11472.1651156537055615297
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 07:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S8Ujkd+1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SEZaMb012085;
	Thu, 28 Apr 2022 09:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651156536;
	bh=7VEYKNQH06GfVhfWK+/gB6ngGuJkamdqA7ADnN38jsw=;
	h=From:To:CC:Subject:Date;
	b=S8Ujkd+1HALTrVd1R3E6v46vKcICt4rcmE20lApy5+iNRSBTexIN2WUIf4t8r5zi+
	 37fDzNX7/BMriwD92EC5R3ZJvj2OhuGCEUzm8tVThTsSGOZeJ4wnbAQcHn7MPp5Q6d
	 bXkBAJMpP4dzmWoqjXMfiaVhWbtVVLTGezVZm4e0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SEZZUx115641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 09:35:36 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 09:35:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 09:35:35 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SEZZe6130420;
	Thu, 28 Apr 2022 09:35:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] ION is superseded now by DMA-BUF Heaps
 remove ION tests
Date: Thu, 28 Apr 2022 09:35:35 -0500
Message-ID: <20220428143535.17298-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 14:35:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13818

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...eLists.txt-disable-phys-addr-for-now.patch | 34 ---------
 ...e-PAGE_SIZE-with-local-variable-name.patch | 69 -------------------
 .../recipes-devtools/ion/ion-tests_git.bb     | 19 -----
 3 files changed, 122 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb

diff --git a/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch b/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
deleted file mode 100644
index 7cf5895c..00000000
--- a/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 85264fc72a261d20107a50ea2fad0258900a132b Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sat, 20 Apr 2019 16:54:03 +0000
-Subject: [PATCH] CMakeLists.txt: disable phys-addr for now
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- CMakeLists.txt | 13 -------------
- 1 file changed, 13 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1d60003..eca6ba7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -54,16 +54,3 @@ target_link_libraries(ion-print-heaps
- target_include_directories(ion-print-heaps PUBLIC ${LIBION_INCLUDE_DIRS})
- 
- install(TARGETS ion-print-heaps RUNTIME DESTINATION bin)
--
--# phys-addr
--
--add_executable(phys-addr
--	src/phys-addr.c
--)
--
--target_link_libraries(phys-addr
--	${LIBION_LIBRARIES}
--)
--target_include_directories(phys-addr PUBLIC ${LIBION_INCLUDE_DIRS})
--
--install(TARGETS phys-addr RUNTIME DESTINATION bin)
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch b/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch
deleted file mode 100644
index 8915c642..00000000
--- a/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From f045cbf9aae0053e9e785e32b772e473aa892443 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Oct 2019 16:08:36 -0700
-Subject: [PATCH] map_test: Replace PAGE_SIZE with local variable name
-
-PAGE_SIZE is already a define in libc implementations global namespace
-e.g. in musl. Therefore its best to use a unique variable name to not
-stamp on the global definition.
-
-Fixes
-src/map_test.cpp:59:23: error: expected unqualified-id
-unsigned long PAGE_SIZE = sysconf(_SC_PAGESIZE);
-^
-/usr/include/limits.h:89:19: note: expanded from macro 'PAGE_SIZE'
-^
-/usr/include/bits/limits.h:3:18: note: expanded from macro 'PAGESIZE'
-^
-
-Upstream-Status: Submitted [https://github.com/glneo/ion-tests/pull/1]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/map_test.cpp | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/src/map_test.cpp b/src/map_test.cpp
-index a7ce2c9..7b5746d 100644
---- a/src/map_test.cpp
-+++ b/src/map_test.cpp
-@@ -56,27 +56,27 @@ TEST_F(Map, MapOffset)
-         SCOPED_TRACE(::testing::Message() << "heap " << heapMask);
-         int map_fd = -1;
- 
--        unsigned long PAGE_SIZE = sysconf(_SC_PAGESIZE);
-+        unsigned long psize = sysconf(_SC_PAGESIZE);
- 
--        ASSERT_EQ(0, ion_alloc(m_ionFd, PAGE_SIZE * 2, heapMask, 0, &map_fd));
-+        ASSERT_EQ(0, ion_alloc(m_ionFd, psize * 2, heapMask, 0, &map_fd));
-         ASSERT_GE(map_fd, 0);
- 
-         unsigned char *ptr;
--        ptr = (unsigned char *)mmap(NULL, PAGE_SIZE * 2, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, 0);
-+        ptr = (unsigned char *)mmap(NULL, psize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, 0);
-         ASSERT_TRUE(ptr != NULL);
- 
--        memset(ptr, 0, PAGE_SIZE);
--        memset(ptr + PAGE_SIZE, 0xaa, PAGE_SIZE);
-+        memset(ptr, 0, psize);
-+        memset(ptr + psize, 0xaa, psize);
- 
--        ASSERT_EQ(0, munmap(ptr, PAGE_SIZE * 2));
-+        ASSERT_EQ(0, munmap(ptr, psize * 2));
- 
--        ptr = (unsigned char *)mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, PAGE_SIZE);
-+        ptr = (unsigned char *)mmap(NULL, psize, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, psize);
-         ASSERT_TRUE(ptr != NULL);
- 
-         ASSERT_EQ(ptr[0], 0xaa);
--        ASSERT_EQ(ptr[PAGE_SIZE - 1], 0xaa);
-+        ASSERT_EQ(ptr[psize - 1], 0xaa);
- 
--        ASSERT_EQ(0, munmap(ptr, PAGE_SIZE));
-+        ASSERT_EQ(0, munmap(ptr, psize));
- 
-         ASSERT_EQ(0, close(map_fd));
-     }
--- 
-2.23.0
-
diff --git a/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb b/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb
deleted file mode 100644
index d30d0695..00000000
--- a/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Test cases for ION"
-HOMEPAGE = "https://github.com/glneo/ion-tests"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/ion_test.c;beginline=1;endline=15;md5=b225db900869a4cd31461606e55a3ec5"
-
-PV = "1.0"
-
-BRANCH = "master"
-SRC_URI = "git://github.com/glneo/ion-tests.git;protocol=https;branch=${BRANCH} \
-	file://0001-CMakeLists.txt-disable-phys-addr-for-now.patch \
-	file://0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch \
-"
-SRCREV = "70d730cebca29e6fd37b21d9beac82ae645f3900"
-
-DEPENDS = "libion gtest"
-
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig
-- 
2.17.1


