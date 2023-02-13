Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5061C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 19:22:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.24647.1676316148800458351
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 11:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RdIpZnvx;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31DJMRGk092349;
	Mon, 13 Feb 2023 13:22:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676316147;
	bh=/q0sDGTqAo71CenLo2T9Rv+Du1iEKu6iH9HI2lPiLwA=;
	h=From:To:CC:Subject:Date;
	b=RdIpZnvx9TF8L59S00JLU/LS3hWQh2j5Nd+0aUBt+0mQWt1C2FEwtdOmgQzxM+PUO
	 /Xp8YTYY8SUL15GGVxtZwLzVaH+KFQKrauATLpj41N6m4e5vVYcyvSclveMGElNuSF
	 eyuQHp8fNxcUrQ6lqtDUOX2ySxmWI6QqRuV2ESG8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31DJMR3r023677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Feb 2023 13:22:27 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Feb 2023 13:22:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Feb 2023 13:22:27 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31DJMQqA052501;
	Mon, 13 Feb 2023 13:22:26 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] libloki: fix C++ compile errors with gcc-11
Date: Mon, 13 Feb 2023 13:22:26 -0600
Message-ID: <20230213192226.26228-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 13 Feb 2023 19:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14219

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...llObj.h-ISO-C-17-does-not-allow-dyna.patch | 44 +++++++++++++++++++
 .../recipes-support/loki/libloki_0.1.7.bb     |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch

diff --git a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch
new file mode 100644
index 00000000..96c487a4
--- /dev/null
+++ b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch
@@ -0,0 +1,44 @@
+From 9e36399573fd075d9607b3a89c4358dc18b065d7 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Mon, 13 Feb 2023 13:11:16 -0600
+Subject: [PATCH] include/loki/SmallObj.h: ISO C++17 does not allow dynamic
+ exception specifications
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ include/loki/SmallObj.h | 15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/include/loki/SmallObj.h b/include/loki/SmallObj.h
+index 65828bf..b5d1857 100644
+--- a/include/loki/SmallObj.h
++++ b/include/loki/SmallObj.h
+@@ -455,12 +455,7 @@ namespace Loki
+     public:
+ 
+         /// Throwing single-object new throws bad_alloc when allocation fails.
+-#ifdef _MSC_VER
+-        /// @note MSVC complains about non-empty exception specification lists.
+-        static void * operator new ( std::size_t size )
+-#else
+-        static void * operator new ( std::size_t size ) throw ( std::bad_alloc )
+-#endif
++        static void * operator new ( std::size_t size ) throw ()
+         {
+             typename MyThreadingModel::Lock lock;
+             (void)lock; // get rid of warning
+@@ -508,13 +503,7 @@ namespace Loki
+ #ifdef LOKI_SMALL_OBJECT_USE_NEW_ARRAY
+ 
+         /// Throwing array-object new throws bad_alloc when allocation fails.
+-#ifdef _MSC_VER
+-        /// @note MSVC complains about non-empty exception specification lists.
+-        static void * operator new [] ( std::size_t size )
+-#else
+-        static void * operator new [] ( std::size_t size )
+-            throw ( std::bad_alloc )
+-#endif
++        static void * operator new [] ( std::size_t size ) throw ()
+         {
+             typename MyThreadingModel::Lock lock;
+             (void)lock; // get rid of warning
diff --git a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
index 07aaa2f5..7eda512b 100644
--- a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
+++ b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://README;md5=5f7c1a2bebe34fc290234984d5845b03"
 
 SRC_URI = "http://libloki.sourcearchive.com/downloads/${PV}-3/${BPN}_${PV}.orig.tar.gz \
            file://0001-include-loki-Threads.h-return-statement-with-a-value.patch \
-           file://0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch"
+           file://0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch \
+           file://0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch \
+"
 
 SRC_URI[md5sum] = "af532c24a7f2e12d0829be8201934d92"
 SRC_URI[sha256sum] = "0c2094ce916b106731c8be61c32f538a22e1c0f8398bd5d6295b13d08e0c41a3"
-- 
2.39.1


