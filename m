Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2520.1642625782150294660
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 12:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uu98LWGD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20JKuJhR007765;
	Wed, 19 Jan 2022 14:56:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1642625779;
	bh=gxLLm/D10DVYYR0IaxJsl7GHXD+chsUbj40OMzO0q3g=;
	h=Date:From:Subject:Reply-To:To;
	b=uu98LWGDrGgd6A7HyGJIm8DCd3PntrLNFkaEUCNunLhnK2mhhRL3jD3pduOMYi4hI
	 7gbmUyB+5/Dh4E5ajbZWHOGhwdzyhQbcBG/3rsyJCA6uaGDLux4On96U+upJ9RqbrK
	 peT3gv/ZFd51WsRjx5AN2JJULlbmWvwyut+ZU3go=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20JKuJXX005497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Jan 2022 14:56:19 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 19
 Jan 2022 14:56:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 19 Jan 2022 14:56:19 -0600
Received: from [10.249.39.206] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20JKuJhv083246;
	Wed, 19 Jan 2022 14:56:19 -0600
Message-ID: <2395b6b2-17d6-b86e-9c8e-43c0d84a6ac2@ti.com>
Date: Wed, 19 Jan 2022 14:56:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: "Ryan Eatmon" <reatmon@ti.com>
Subject: [meta-arago][dunfell/master][PATCH v2] dma-heap-tests: patch to fix cmake linking issue
Reply-To: <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Adding patch to CMakeLists.txt to fix variable name that contains
the libraries to link against.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
  .../dma-heap/dma-heap-tests.bb                |  4 ++-
  ...ble-name-change-to-fix-compile-error.patch | 32 +++++++++++++++++++
  2 files changed, 35 insertions(+), 1 deletion(-)
  create mode 100644 
meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch

diff --git 
a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb 
b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
index fab2b4a0..5d35eb5e 100644
--- a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
+++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = 
"file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=
  PV = "1.0"
   BRANCH = "master"
-SRC_URI = 
"git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
+SRC_URI = 
"git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH} \
+	file://0001-Variable-name-change-to-fix-compile-error.patch \
+"
  SRCREV = "bccbfbf24baccefa09439a924f61f04e82b3910a"
   DEPENDS = "googletest"
diff --git 
a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch 
b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
new file mode 100644
index 00000000..8bc744db
--- /dev/null
+++ 
b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
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
+ + target_link_libraries(dma-heap-unit-tests
+-	${GTEST_LIBRARY}
+-	${GTEST_MAIN_LIBRARY}
++    ${GTEST_LIBRARIES}
++    ${GTEST_MAIN_LIBRARIES}
+ 	pthread
+ )
+ +-- +2.17.1
+
-- 
2.17.1






