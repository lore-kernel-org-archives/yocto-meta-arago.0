Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3A96252A47
	for <meta-arago@arago-project.org>;
	Tue, 15 Jan 2019 21:59:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0FLxdTs045533
	for <meta-arago@arago-project.org>; Tue, 15 Jan 2019 15:59:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1547589579;
	bh=4NxSR3t/lT+E2XfbeWs7Jj5GhbIzFymBShZ73uqUoJ0=;
	h=From:To:CC:Subject:Date;
	b=bwLDyC7PoV4PNzGoPRNr4pZ3xCqb4O/445O3Vjck6g2naSTUTEB/geWTO99qbAcOf
	fV13KMcY9KxKbCkTZ95U3Oq09b6aLB5zyXebiZGz89lFcm/M3mRME+AaX6UQByhcpe
	9IsdQUdTz6XbZ3Ysdti1XYwpZlBXV10V/uSeT774=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0FLxdEj055108
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 15 Jan 2019 15:59:39 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 15 Jan 2019 15:59:39 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 15 Jan 2019 15:59:38 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0FLxcAQ014263;
	Tue, 15 Jan 2019 15:59:38 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Jan 2019 21:51:50 +0000
Message-ID: <20190115215150.7089-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] nativesdk-packagegroup-*-host: add option for bare devtool w/o TI OCL, CGT tools
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
X-List-Received-Date: Tue, 15 Jan 2019 21:59:52 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...k-packagegroup-arago-qte-toolchain-host.bb |  2 +-
 .../nativesdk-packagegroup-arago-sdk-host.bb  | 13 +----------
 ...nativesdk-packagegroup-arago-tisdk-host.bb | 22 +++++++++++++++++++
 3 files changed, 24 insertions(+), 13 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
index 25d4f156..88736682 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
@@ -5,6 +5,6 @@ LICENSE = "MIT"
 inherit packagegroup nativesdk qt-vars
 
 RDEPENDS_${PN} = "\
-    nativesdk-packagegroup-arago-sdk-host \
+    nativesdk-packagegroup-arago-tisdk-host \
     ${QT_RDEPENDS_NATIVESDK_TOOLS} \
     "
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index af83521a..4199c2eb 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,21 +1,11 @@
 SUMMARY = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r17"
+PR = "r18"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
-EXTRA_TI_TOOLS = " \
-    nativesdk-ti-cgt6x \
-    nativesdk-ti-cgt-pru \
-    nativesdk-clocl \
-    nativesdk-clacc \
-    nativesdk-open62541-examples \
-    nativesdk-open62541-tests \
-    nativesdk-tidl-import \
-"
-
 RDEPENDS_${PN} = "\
     nativesdk-pkgconfig \
     nativesdk-opkg \
@@ -28,5 +18,4 @@ RDEPENDS_${PN} = "\
     nativesdk-git \
     nativesdk-cmake \
     nativesdk-mtd-utils-ubifs \
-    ${EXTRA_TI_TOOLS} \
 "
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
new file mode 100644
index 00000000..cb345918
--- /dev/null
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Host packages for a standalone Arago SDK with TI tools"
+PR = "r0"
+LICENSE = "MIT"
+
+inherit packagegroup nativesdk
+
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
+
+EXTRA_TI_TOOLS = " \
+    nativesdk-ti-cgt6x \
+    nativesdk-ti-cgt-pru \
+    nativesdk-clocl \
+    nativesdk-clacc \
+    nativesdk-open62541-examples \
+    nativesdk-open62541-tests \
+    nativesdk-tidl-import \
+"
+
+RDEPENDS_${PN} = "\
+    nativesdk-packagegroup-arago-sdk-host \
+    ${EXTRA_TI_TOOLS} \
+"
-- 
2.17.1


