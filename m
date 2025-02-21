Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A0FC021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 20:41:57 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.33356.1740170514636805836
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 12:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qv2ELOFq;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LKfr28388536
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 14:41:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740170514;
	bh=zO9eso66WLu9CtBilCJZ6rwrGwePgoAAPVq2kFvaDPs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qv2ELOFqOq9LW2jZMQmmGUhv7dJFtJ/c/JpsxCZl0029oEtX8Wx9e9bFMJTnxd3vR
	 3bKUto9lDm6bhaI1GzRGiOwK4M6pw7wgF3HBzcMnXpxBM+lOfIfeC6VINz3clFS7o6
	 2Uh8LMkQg43nPDeJhz3DxNGxRzVYm9v4Z8KaMZlQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LKfrnH058440
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 14:41:53 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 14:41:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 14:41:53 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LKfrlX038613;
	Fri, 21 Feb 2025 14:41:53 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v4 1/2] meta-arago-test: add recipe opencl-cts
Date: Fri, 21 Feb 2025 14:41:52 -0600
Message-ID: <20250221204153.428129-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221204153.428129-1-a-christidis@ti.com>
References: <20250221204153.428129-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 20:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15889

From: Antonios Christidis <a-christidis@ti.com>

Adding recipe for opencl-cts, v2024-08-08 is a pre-release version.
I have tested it to work with opencl-headers version v2024.05.08 . This version
is picked due to incompatibility issues with other versions of headers.

This is a backport from meta-openembedded, they rejected to move opencl-cts to
scarthgap due to their LTS procedure. New packages do not get merged into LTS
branches after 7 months of the branch creation.

This recipe also comes with a patch.

Within the cmake build system, the compiler -Werror flag is enabled.  This
turns all warnings into errors and doesn't allow the system to compile
correctly.  Change the system to ignore the 3 warning rules that show up when
compiling.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v4:
-merged the patch patch and recipe patch into one patch, this is it 

v3:
- Changed from adress, it was wrong. 

v2:
- Added explanation on why this patch is a backport from
  meta-openembedded 


 .../files/0001-Ignore-Compiler-Warnings.patch | 18 +++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 27 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb

diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
new file mode 100644
index 00000000..067cffa1
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -0,0 +1,18 @@
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5cfef6b3..71b6ddb4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
+     add_cxx_flag_if_supported(-Wno-error=cpp) # Allow #warning directive
+     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
+     add_cxx_flag_if_supported(-Wno-error=asm-operand-widths) # Issue #784
+-
++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
+     # -msse -mfpmath=sse to force gcc to use sse for float math,
+     # avoiding excess precision problems that cause tests like int2float
+     # to falsely fail. -ffloat-store also works, but WG suggested
+-- 
+2.34.1
+
diff --git a/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
new file mode 100644
index 00000000..60bc3c6a
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
+           file://0001-Ignore-Compiler-Warnings.patch"
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


