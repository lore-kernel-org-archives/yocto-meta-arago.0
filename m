Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803E1C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:19:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6843.1648732749568445434
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 06:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jxenUihf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22VDJ7fG050229;
	Thu, 31 Mar 2022 08:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648732747;
	bh=Qk6MqIgUItu50aitBfW18QRPR1AMHtfNIPMtJk/e0ws=;
	h=From:To:Subject:Date;
	b=jxenUihfJl299BTa+ulWfKHaN+5TKgFFiJrm8UCgVKUGt+418FDoqqZq2GYOI2bqS
	 yZZzwIQFmvmGGS9PlVc5/xqoFo3R7ASC9LkA9O+ChAMHT6mf2LB0xjn8NJXeweDT6F
	 U3tEchv5AGCyx5Olvq+ML0J3iMswvmc+BG1ZVLxk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22VDJ7PC081574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Mar 2022 08:19:07 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 31
 Mar 2022 08:19:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 31 Mar 2022 08:19:07 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22VDJ79R071597;
	Thu, 31 Mar 2022 08:19:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nZuhf-0002x5-47; Thu, 31 Mar 2022 08:19:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] dma-heap-tests: Move to latest
 version and remove the patch.
Date: Thu, 31 Mar 2022 08:19:07 -0500
Message-ID: <20220331131907.11307-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 31 Mar 2022 13:19:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13770

The patch was accepted upstream so we can now move to the latest version
and remove the patch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../dma-heap/dma-heap-tests.bb                |  6 ++--
 ...ble-name-change-to-fix-compile-error.patch | 32 -------------------
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch

diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
index 5d35eb5e..1a230e8e 100644
--- a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
+++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=
 PV = "1.0"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH} \
-	file://0001-Variable-name-change-to-fix-compile-error.patch \
-"
-SRCREV = "bccbfbf24baccefa09439a924f61f04e82b3910a"
+SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
+SRCREV = "334fc8ec8056badc9c6667e6f1328705cb973ab4"
 
 DEPENDS = "googletest"
 
diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
deleted file mode 100644
index 8bc744db..00000000
--- a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ab0bb27b915419e3f93b4c0102837e7e748b0667 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Thu, 13 Jan 2022 20:00:27 -0600
-Subject: [dma-heap-tests][PATCH] Variable name change to fix compile error.
-
-It appears that a recent change in the GTest CMake integration
-changed the variable names for the libraries.  This fixes that
-issue and makes the compile work under Yocto.
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 71d7225..7d4a97f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -19,8 +19,8 @@ target_include_directories(dma-heap-unit-tests
- )
- 
- target_link_libraries(dma-heap-unit-tests
--	${GTEST_LIBRARY}
--	${GTEST_MAIN_LIBRARY}
-+    ${GTEST_LIBRARIES}
-+    ${GTEST_MAIN_LIBRARIES}
- 	pthread
- )
- 
--- 
-2.17.1
-
-- 
2.17.1


