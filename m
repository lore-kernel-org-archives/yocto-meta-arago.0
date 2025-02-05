Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03040C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:04:20 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.22464.1738785852278455691
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CrSLSfAU;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515K4BFm2596771
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:04:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738785851;
	bh=UFhyQsClp/pEDM8LHtiCCv7ukHGIdkwWPY1hkZlqPvE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CrSLSfAUY3BQbtAtIXyew3uIp/6IflWUC1rr9Ud3TLtzBXZiVxpGsb5XTGFEZVvDX
	 7tsjYmMVfbTTUtqvX7PCbGpw366J4gnc62Pr30OblcHYmnX/HtYlaDUMO7Yb+4KVRS
	 j3rqzB36FsaPKT2G6F9vUKcqhfEFQAobvTbuExoU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515K4BoM004351
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:04:11 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 14:04:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 14:04:11 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515K4Bpl061044;
	Wed, 5 Feb 2025 14:04:11 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [PATCH 1/3] meta-arago-test: Ignore Compiler Warnings Patch for OpenCL-CTS
Date: Wed, 5 Feb 2025 14:04:09 -0600
Message-ID: <20250205200411.686617-2-a-christidis@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15814

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

Within the cmake build system, the compiler -Werror flag is enabeled.  This
turns all warnings into errors and doens't allow the system to compile
correctly.  Change the system to ignore the 3 warning rules that show up when
compiling.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../files/0001-Ignore-Compiler-Warnings.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch

diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
new file mode 100644
index 00000000..c21db6fb
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -0,0 +1,35 @@
+From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Fri, 17 Jan 2025 15:05:39 -0600
+Subject: [PATCH] Ignore Compiler Warnings
+
+Within the cmake build system, the compiler -Werror flag is enabeled.  This
+turns all warnings into errors and doens't allow the system to compile
+correctly.  Change the system to ignore the 3 warning rules that show up when
+compiling.
+
+Upstream-Status: Inappropriate [oe specific - compilation errors due to cross-compiling]
+
+Singed-Off-By: Antonios Christidis <a-christidis@ti.com>
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
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
-- 
2.34.1


