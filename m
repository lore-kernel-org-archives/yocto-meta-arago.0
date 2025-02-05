Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF2DC0219A
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:04:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.22606.1738785852351710769
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BITRWLgQ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515K4BoT2664098
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:04:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738785851;
	bh=jOcx8d5qoTcZnE9OYce0zRbMTvjOGbqkg1s0AvrLjCc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BITRWLgQKAbIQzO9f7X4MfMSDXpYd779nx6lvXQ1bUMbGea8n0iI9KkJhR9DS+jEI
	 VuIjWDjaXvbZbJKYcwBjmBldz/cIo1CJyB48WIBWZNW29Pc61btxup/wjG69YkjxcK
	 QoGB0ZjkAg5779ySiAz4Jtni6j3wBuQTJYcn80K4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515K4B1D069840
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:04:11 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 14:04:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 14:04:11 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515K4Bpm061044;
	Wed, 5 Feb 2025 14:04:11 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [PATCH 2/3] meta-arago-test: Introducing OpenCL testing
Date: Wed, 5 Feb 2025 14:04:10 -0600
Message-ID: <20250205200411.686617-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205200411.686617-1-a-christidis@ti.com>
References: <20250205200411.686617-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:04:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15815

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

Adding recipe for opencl-cts, v2024-08-08 is a pre-release version.
I have tested it to work with opencl-headers version v2024.05.08 . This version
is picked due to incompatibility issues with other versions of headers.

The recipe also includes a patch, to allow it to compile and build properly.
Further information below.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 ...Ignore-Compiler-Warnings-Patch-for-O.patch | 61 +++++++++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 27 ++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-meta-arago-test-Ignore-Compiler-Warnings-Patch-for-O.patch
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index e8458cef..81f6e1c6 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -61,6 +61,7 @@ TI_TEST_EXTRAS = " \
     piglit \
     python3-numpy \
     wayland-utils \
+    opencl-cts \
 "
 
 TI_TEST_BASE:append:armv7a = " \
diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-meta-arago-test-Ignore-Compiler-Warnings-Patch-for-O.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-meta-arago-test-Ignore-Compiler-Warnings-Patch-for-O.patch
new file mode 100644
index 00000000..35019946
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/files/0001-meta-arago-test-Ignore-Compiler-Warnings-Patch-for-O.patch
@@ -0,0 +1,61 @@
+From 3f01b7509cf725e9668b8e01d65669fc5626c160 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>
+Date: Wed, 5 Feb 2025 11:40:22 -0600
+Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Ignore
+ Compiler Warnings Patch for OpenCL-CTS
+
+Within the cmake build system, the compiler -Werror flag is enabeled.  This
+turns all warnings into errors and doens't allow the system to compile
+correctly.  Change the system to ignore the 3 warning rules that show up when
+compiling.
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ .../files/0001-Ignore-Compiler-Warnings.patch | 35 +++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+ create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
+
+diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
+new file mode 100644
+index 00000000..c21db6fb
+--- /dev/null
++++ b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
+@@ -0,0 +1,35 @@
++From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
++From: Antonios Christidis <a-christidis@ti.com>
++Date: Fri, 17 Jan 2025 15:05:39 -0600
++Subject: [PATCH] Ignore Compiler Warnings
++
++Within the cmake build system, the compiler -Werror flag is enabeled.  This
++turns all warnings into errors and doens't allow the system to compile
++correctly.  Change the system to ignore the 3 warning rules that show up when
++compiling.
++
++Upstream-Status: Inappropriate [oe specific - compilation errors due to cross-compiling]
++
++Singed-Off-By: Antonios Christidis <a-christidis@ti.com>
++---
++ CMakeLists.txt | 4 +++-
++ 1 file changed, 3 insertions(+), 1 deletion(-)
++
++diff --git a/CMakeLists.txt b/CMakeLists.txt
++index 5cfef6b3..71b6ddb4 100644
++--- a/CMakeLists.txt
+++++ b/CMakeLists.txt
++@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
++     add_cxx_flag_if_supported(-Wno-error=cpp) # Allow #warning directive
++     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
++     add_cxx_flag_if_supported(-Wno-error=asm-operand-widths) # Issue #784
++-
+++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
+++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
+++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
++     # -msse -mfpmath=sse to force gcc to use sse for float math,
++     # avoiding excess precision problems that cause tests like int2float
++     # to falsely fail. -ffloat-store also works, but WG suggested
++-- 
++2.34.1
++
+-- 
+2.34.1
+
diff --git a/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
new file mode 100644
index 00000000..c200884b
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
@@ -0,0 +1,27 @@
+SUMMARY = "OpenCL CTS"
+DESCRIPTION = "OpenCL CTS test suite"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pkgconfig cmake
+
+DEPENDS += "opencl-headers opencl-icd-loader"
+RDEPENDS:${PN} += "python3-core python3-io"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
+          file://0001-Ignore-Compiler-Warnings.patch"
+
+
+SRCREV = "a406b340913f622da089b00f284a597656c10239"
+
+EXTRA_OECMAKE:append = " -DCMAKE_BUILD_TYPE=Debug -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
+
+do_install() {
+        install -d ${D}${bindir}/opencl_test_conformance
+        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
+        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
+	find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
+        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
+}
-- 
2.34.1


