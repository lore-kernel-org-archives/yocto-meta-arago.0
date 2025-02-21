Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BD5C021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 23:15:09 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.36529.1740179701895481291
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 15:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MQzvyHTn;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LNF0Nj415159
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 17:15:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740179700;
	bh=cXUWutBkIIVncMYUvQo1bRBaC+ksdIo6or7fU+rv1k8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MQzvyHTnmpDsElGepgUxbaU/IEVqAwlwhxQnjAmmHKuRPx0fRHHohBHiKC5/FJnPQ
	 9z3GVdNEej8VNOIzrLDGGboMZMqhPuV7w8XTw7deDub0vpDttY1rzMgs+1CVCDPvjB
	 SkFA2xJwoYmV8qD/wt418gIIgVD/FF7MeCMgiHtw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51LNF04b038791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Feb 2025 17:15:00 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 17:15:00 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 17:15:00 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LNF0kg072477;
	Fri, 21 Feb 2025 17:15:00 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v5 1/2] meta-arago-test: add recipe opencl-cts
Date: Fri, 21 Feb 2025 17:14:59 -0600
Message-ID: <20250221231500.457741-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221231500.457741-1-a-christidis@ti.com>
References: <20250221231500.457741-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 23:15:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15896

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

v5:
-backport patches from upstream without any changes 

v4:
-merged the patch patch and recipe patch into one patch, this is it 

v3:
- Changed from adress, it was wrong. 

v2:
- Added explanation on why this patch is a backport from
  meta-openembedded 


 .../files/0001-Ignore-Compiler-Warnings.patch | 45 +++++++++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 32 +++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb

diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
new file mode 100644
index 00000000..d46a2cf1
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -0,0 +1,45 @@
+From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Fri, 17 Jan 2025 15:05:39 -0600
+Subject: [PATCH] Create CMake option ENABLE_WERROR
+
+This creates an option that can be toggled on or off when configuring the project.
+By default, it's set to ON
+
+Upstream-Status: Submitted [opencl-cts github - expected in next release v2026] 
+ 
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,6 +19,16 @@ add_definitions(-DCL_USE_DEPRECATED_OPEN
+ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_0_APIS=1)
+ add_definitions(-DCL_NO_EXTENSION_PROTOTYPES)
+ 
++option(ENABLE_WERROR "Enable warnings as errors" ON)
++
++if(ENABLE_WERROR)
++  if(MSVC)
++    add_compile_options(/WX)
++  else()
++    add_compile_options(-Werror)
++  endif()
++endif()
++
+ option(USE_CL_EXPERIMENTAL "Use Experimental definitions" OFF)
+ if(USE_CL_EXPERIMENTAL)
+   add_definitions(-DCL_EXPERIMENTAL)
+@@ -99,7 +109,6 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_C
+     add_cxx_flag_if_supported(-Wmisleading-indentation)
+     add_cxx_flag_if_supported(-Wunused-function)
+     add_cxx_flag_if_supported(-Wunused-variable)
+-    add_cxx_flag_if_supported(-Werror)
+     if(NOT CMAKE_BUILD_TYPE MATCHES "Release|RelWithDebInfo|MinSizeRel")
+         # Enable more warnings if not doing a release build.
+         add_cxx_flag_if_supported(-Wall)
+
diff --git a/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
new file mode 100644
index 00000000..791432a3
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb
@@ -0,0 +1,32 @@
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
+	   file://0001-Ignore-Compiler-Warnings.patch"
+
+SRCREV = "a406b340913f622da089b00f284a597656c10239"
+
+EXTRA_OECMAKE:append = " -DENABLE_WERROR=OFF -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
+
+SECURITY_STRINGFORMAT:remove = "-Werror=format-security"
+
+do_install() {
+        install -d ${D}${bindir}/opencl_test_conformance
+        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
+        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
+	 find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
+        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
+}
+
+COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+
-- 
2.34.1


