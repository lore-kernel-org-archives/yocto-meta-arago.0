Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 21F78520E2
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 05:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4658E40C04;
	Thu, 20 Feb 2020 05:14:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id et-nSJH8hw8N; Thu, 20 Feb 2020 05:14:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2395340A41;
	Thu, 20 Feb 2020 05:14:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D819B174414;
	Thu, 20 Feb 2020 00:14:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 20 Feb 2020 00:14:30 -0500
Message-Id: <1582175670-6389-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] ion-tests: move back to meta-arago-extras
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
X-List-Received-Date: Thu, 20 Feb 2020 05:16:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

As it happens, ion-tests requires gtest from by meta-oe, but meta-ti has no
dependency on meta-oe. Unfortunately this was overlooked when all ion recipes
were migrated to meta-ti. Fix this by moving just ion-tests back.

Cc: Andrew F. Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...-CMakeLists.txt-disable-phys-addr-for-now.patch | 34 +++++++++++
 ...eplace-PAGE_SIZE-with-local-variable-name.patch | 69 ++++++++++++++++++++++
 .../recipes-devtools/ion/ion-tests_git.bb          | 19 ++++++
 3 files changed, 122 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
 create mode 100644 meta-arago-extras/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch
 create mode 100644 meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb

diff --git a/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch b/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
new file mode 100644
index 0000000..7cf5895
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
@@ -0,0 +1,34 @@
+From 85264fc72a261d20107a50ea2fad0258900a132b Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sat, 20 Apr 2019 16:54:03 +0000
+Subject: [PATCH] CMakeLists.txt: disable phys-addr for now
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ CMakeLists.txt | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1d60003..eca6ba7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -54,16 +54,3 @@ target_link_libraries(ion-print-heaps
+ target_include_directories(ion-print-heaps PUBLIC ${LIBION_INCLUDE_DIRS})
+ 
+ install(TARGETS ion-print-heaps RUNTIME DESTINATION bin)
+-
+-# phys-addr
+-
+-add_executable(phys-addr
+-	src/phys-addr.c
+-)
+-
+-target_link_libraries(phys-addr
+-	${LIBION_LIBRARIES}
+-)
+-target_include_directories(phys-addr PUBLIC ${LIBION_INCLUDE_DIRS})
+-
+-install(TARGETS phys-addr RUNTIME DESTINATION bin)
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch b/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch
new file mode 100644
index 0000000..8915c64
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch
@@ -0,0 +1,69 @@
+From f045cbf9aae0053e9e785e32b772e473aa892443 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Oct 2019 16:08:36 -0700
+Subject: [PATCH] map_test: Replace PAGE_SIZE with local variable name
+
+PAGE_SIZE is already a define in libc implementations global namespace
+e.g. in musl. Therefore its best to use a unique variable name to not
+stamp on the global definition.
+
+Fixes
+src/map_test.cpp:59:23: error: expected unqualified-id
+unsigned long PAGE_SIZE = sysconf(_SC_PAGESIZE);
+^
+/usr/include/limits.h:89:19: note: expanded from macro 'PAGE_SIZE'
+^
+/usr/include/bits/limits.h:3:18: note: expanded from macro 'PAGESIZE'
+^
+
+Upstream-Status: Submitted [https://github.com/glneo/ion-tests/pull/1]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/map_test.cpp | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/map_test.cpp b/src/map_test.cpp
+index a7ce2c9..7b5746d 100644
+--- a/src/map_test.cpp
++++ b/src/map_test.cpp
+@@ -56,27 +56,27 @@ TEST_F(Map, MapOffset)
+         SCOPED_TRACE(::testing::Message() << "heap " << heapMask);
+         int map_fd = -1;
+ 
+-        unsigned long PAGE_SIZE = sysconf(_SC_PAGESIZE);
++        unsigned long psize = sysconf(_SC_PAGESIZE);
+ 
+-        ASSERT_EQ(0, ion_alloc(m_ionFd, PAGE_SIZE * 2, heapMask, 0, &map_fd));
++        ASSERT_EQ(0, ion_alloc(m_ionFd, psize * 2, heapMask, 0, &map_fd));
+         ASSERT_GE(map_fd, 0);
+ 
+         unsigned char *ptr;
+-        ptr = (unsigned char *)mmap(NULL, PAGE_SIZE * 2, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, 0);
++        ptr = (unsigned char *)mmap(NULL, psize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, 0);
+         ASSERT_TRUE(ptr != NULL);
+ 
+-        memset(ptr, 0, PAGE_SIZE);
+-        memset(ptr + PAGE_SIZE, 0xaa, PAGE_SIZE);
++        memset(ptr, 0, psize);
++        memset(ptr + psize, 0xaa, psize);
+ 
+-        ASSERT_EQ(0, munmap(ptr, PAGE_SIZE * 2));
++        ASSERT_EQ(0, munmap(ptr, psize * 2));
+ 
+-        ptr = (unsigned char *)mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, PAGE_SIZE);
++        ptr = (unsigned char *)mmap(NULL, psize, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, psize);
+         ASSERT_TRUE(ptr != NULL);
+ 
+         ASSERT_EQ(ptr[0], 0xaa);
+-        ASSERT_EQ(ptr[PAGE_SIZE - 1], 0xaa);
++        ASSERT_EQ(ptr[psize - 1], 0xaa);
+ 
+-        ASSERT_EQ(0, munmap(ptr, PAGE_SIZE));
++        ASSERT_EQ(0, munmap(ptr, psize));
+ 
+         ASSERT_EQ(0, close(map_fd));
+     }
+-- 
+2.23.0
+
diff --git a/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb b/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb
new file mode 100644
index 0000000..52346f1
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ion/ion-tests_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Test cases for ION"
+HOMEPAGE = "https://github.com/glneo/ion-tests"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/ion_test.c;beginline=1;endline=15;md5=b225db900869a4cd31461606e55a3ec5"
+
+PV = "1.0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/glneo/ion-tests.git;protocol=git;branch=${BRANCH} \
+	file://0001-CMakeLists.txt-disable-phys-addr-for-now.patch \
+	file://0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch \
+"
+SRCREV = "70d730cebca29e6fd37b21d9beac82ae645f3900"
+
+DEPENDS = "libion gtest"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
-- 
2.7.4


