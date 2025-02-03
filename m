Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB75C02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 19:00:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.96255.1738609196459754970
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 10:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tgI4URLD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513IxtX82190318
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 12:59:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738609195;
	bh=2PYEQeFLW1NNTQznihA7vDJJIaq5ob1Oi9LXPGxn/SU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tgI4URLDEhj6fuhRIAg+5FJb8z9i45Eft7DiIDZORy1pHwyzCLMEEEmm1fTqkBmEv
	 uhh9A+TASRhQh4zvlWlBSdCqeyFjBGoGrscLBHGaHNwIoFI7/a7X9Y4FMM1+UugSf5
	 qxgTExZaRRVkRzrq18GSwQ0gEZRviGKDU2Z1m+zU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513Ixt3B014232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 12:59:55 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 12:59:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 12:59:55 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513Ixsp4123822;
	Mon, 3 Feb 2025 12:59:55 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 2/4] meta-arago-extras: Add recipe for Arm NN
Date: Mon, 3 Feb 2025 12:59:51 -0600
Message-ID: <20250203185953.269693-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250203185953.269693-1-afd@ti.com>
References: <20250203185953.269693-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Feb 2025 19:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15794

Arm NN is a performant machine learning inference engine for Linux,
accelerating ML on Arm Cortex-A CPUs.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...01-Fix-type-casting-for-32bit-builds.patch | 40 +++++++++++
 .../recipes-devtools/armnn/armnn_24.11.bb     | 70 +++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-casting-for-32bit-builds.patch
 create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb

diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-casting-for-32bit-builds.patch b/meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-casting-for-32bit-builds.patch
new file mode 100644
index 00000000..8e3cf34d
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/armnn/armnn/0001-Fix-type-casting-for-32bit-builds.patch
@@ -0,0 +1,40 @@
+From 10953c25a77989709bcbd065489700314fe0c8c6 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 16 Jan 2025 11:11:28 -0600
+Subject: [PATCH] Fix type casting for 32bit builds
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: Id68274e68e7832b827050a2e417053e88e7a6728
+---
+ include/armnn/Numpy.hpp                         | 2 +-
+ tests/ExecuteNetwork/FileComparisonExecutor.cpp | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/armnn/Numpy.hpp b/include/armnn/Numpy.hpp
+index a4154b434..f77b065ca 100644
+--- a/include/armnn/Numpy.hpp
++++ b/include/armnn/Numpy.hpp
+@@ -209,7 +209,7 @@ namespace armnnNumpy
+     template<typename T>
+     inline void ReadData(std::ifstream& ifStream, T* tensor, const unsigned int& numElements)
+     {
+-        ifStream.read(reinterpret_cast<char *>(tensor), sizeof(T) * numElements);
++        ifStream.read(reinterpret_cast<char *>(tensor), static_cast<std::streamsize>(sizeof(T) * numElements));
+     }
+ 
+ 
+diff --git a/tests/ExecuteNetwork/FileComparisonExecutor.cpp b/tests/ExecuteNetwork/FileComparisonExecutor.cpp
+index 903ed0362..4617ebe4a 100644
+--- a/tests/ExecuteNetwork/FileComparisonExecutor.cpp
++++ b/tests/ExecuteNetwork/FileComparisonExecutor.cpp
+@@ -187,7 +187,7 @@ Tensor ReadTensorFromFile(const std::string fileName)
+ 
+     // We'll read the entire file into one buffer.
+     std::ifstream file(fileName, std::ios::binary);
+-    std::vector<char> buffer(fileSize);
++    std::vector<char> buffer(static_cast<std::size_t>(fileSize));
+     if (file.read(buffer.data(), static_cast<std::streamsize>(fileSize)))
+     {
+         std::string tensorName;
diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
new file mode 100644
index 00000000..e965382a
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
@@ -0,0 +1,70 @@
+SUMMARY = "ARM Neural Network SDK"
+DESCRIPTION = "Linux software and tools to enable machine learning workloads on power-efficient devices"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+BRANCH = "branches/armnn_24_11"
+SRC_URI = "git://github.com/ARM-software/armnn.git;branch=${BRANCH};protocol=https"
+SRC_URI += "file://0001-Fix-type-casting-for-32bit-builds.patch"
+
+# v24.11
+SRCREV = "3ed70c005559d409feff2c578a1a39cf8fec8804"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit pkgconfig
+
+DEPENDS = " \
+    boost \
+    protobuf \
+    xxd-native \
+    arm-compute-library \
+"
+
+RDEPENDS:${PN} = " \
+    arm-compute-library \
+    protobuf \
+    boost \
+"
+
+PACKAGECONFIG += "unit-tests tests ref"
+PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', 'neon', '', d)}"
+PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'arm', 'neon', '', d)}"
+
+PACKAGECONFIG[neon] = "-DARMCOMPUTENEON=1, -DARMCOMPUTENEON=0"
+PACKAGECONFIG[unit-tests] = "-DBUILD_UNIT_TESTS=1, -DBUILD_UNIT_TESTS=0"
+PACKAGECONFIG[tests] = "-DBUILD_TESTS=1, -DBUILD_TESTS=0"
+PACKAGECONFIG[ref] = "-DARMNNREF=1, -DARMNNREF=0"
+
+EXTRA_OECMAKE += " \
+    -DHALF_INCLUDE=${STAGING_DIR_TARGET} \
+"
+
+do_install:append() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; then
+        install -d ${D}${bindir}/${P}
+        find ${B}/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir}/${P} \;
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'unit-tests', 'true', 'false', d)}; then
+        install -d ${D}${bindir}/${P}
+        cp $CP_ARGS ${B}/UnitTests ${D}${bindir}/${P}
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'tensorflow-lite', 'false', 'true', d)}; then
+        rm -rf ${D}${includedir}/armnnTfLiteParser
+    fi
+}
+
+CXXFLAGS += "-Wno-error=array-bounds -Wno-error=deprecated-declarations -Wno-error=nonnull"
+
+FILES:${PN} += "${libdir}/*"
+FILES:${PN}-dev += "${includedir}/* ${libdir}/cmake/armnn/* ${libdir}/pkgconfig/*.pc ${bindir}/*"
+
+INSANE_SKIP:${PN} = "dev-so"
+INSANE_SKIP:${PN}-dev += "buildpaths"
-- 
2.39.2


