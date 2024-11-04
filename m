Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85BDD1BDF5
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 21:18:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2040.1730755123372527715
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 13:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZuJTE3B4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A4LIfYM116602;
	Mon, 4 Nov 2024 15:18:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730755121;
	bh=EkTOwloTWuphkvC1PfuoriehOdDz7BxKDTc8LgquqPI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZuJTE3B4ChpnKnGqRYQn9o3nzJsUKczWG8fCF2TQVrWYbapwHQ/UlKBUAs9vfEb3F
	 ZbpD5oL0RP1sP9cYHrO8iYgjCvVsNrknM0CX4GicU9RHUQ8rpSYgOOe7ymvYVdoT4R
	 OrC4X7lFIyJmwJdvatZiFzrJhW6zdE0wLIUpz5jo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4LIfX4095151;
	Mon, 4 Nov 2024 15:18:41 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 15:18:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 15:18:41 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4LIfcd082006;
	Mon, 4 Nov 2024 15:18:41 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t84TB-0002aP-D9; Mon, 04 Nov 2024 15:18:41 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2 2/2] mesa-pvr-22.3.5: Fix build issues with llvm 18+
Date: Mon, 4 Nov 2024 15:18:41 -0600
Message-ID: <20241104211841.9898-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241104211841.9898-1-reatmon@ti.com>
References: <20241104211841.9898-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Nov 2024 21:18:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15587

Backport two fixes from the latest mesa project to fix two builds issues
related to newer llvm versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...lude-of-Host-h-moved-to-TargetParser.patch | 65 +++++++++++++++++++
 ...allium-Fix-build-with-llvm-18-and-19.patch |  6 +-
 .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |  2 +
 3 files changed, 70 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
 copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-22.3.5}/0001-gallium-Fix-build-with-llvm-18-and-19.patch (92%)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
new file mode 100644
index 00000000..7d4fe078
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch
@@ -0,0 +1,65 @@
+From bb2db56ffec6e527d88751f75117ae690227cd6c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kai=20Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>
+Date: Sat, 11 Feb 2023 18:38:01 +0100
+Subject: [PATCH] fix: gallivm: fix LLVM #include of Host.h, moved to
+ TargetParser
+
+Upstream moved Host.h from Support to TargetParser in LLVM 17.
+
+This shouldn't lead to a FTBFS, since there is a forwarding include left
+behind. Sadly the added deprecation warning #pragma is invalid and thus
+causes a build failure right away. But since we would have to follow the
+move anyway in the future, just do it right away.
+
+Reference: https://github.com/llvm/llvm-project/commit/d768bf994f508d7eaf9541a568be3d71096febf5
+Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
+Closes: #8275
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21263>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/bb2db56ffec6e527d88751f75117ae690227cd6c]
+
+---
+ src/gallium/auxiliary/gallivm/lp_bld_debug.cpp | 7 ++++++-
+ src/gallium/auxiliary/gallivm/lp_bld_misc.cpp  | 4 +++-
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp b/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp
+index 54bc5d5ada36c..f78f04f042be8 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_debug.cpp
+@@ -35,9 +35,14 @@
+ #include <llvm-c/Disassembler.h>
+ #include <llvm/Support/raw_ostream.h>
+ #include <llvm/Support/Format.h>
+-#include <llvm/Support/Host.h>
+ #include <llvm/IR/Module.h>
+ 
++#if LLVM_VERSION_MAJOR >= 17
++#include <llvm/TargetParser/Host.h>
++#else
++#include <llvm/Support/Host.h>
++#endif
++
+ #include "util/u_math.h"
+ #include "util/u_debug.h"
+ 
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+index 334c13530394b..5e7a30a6cc2e3 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+@@ -60,7 +60,11 @@
+ #include <llvm/Analysis/TargetLibraryInfo.h>
+ #include <llvm/ExecutionEngine/SectionMemoryManager.h>
+ #include <llvm/Support/CommandLine.h>
++#if LLVM_VERSION_MAJOR >= 17
++#include <llvm/TargetParser/Host.h>
++#else
+ #include <llvm/Support/Host.h>
++#endif
+ #include <llvm/Support/PrettyStackTrace.h>
+ #include <llvm/ExecutionEngine/ObjectCache.h>
+ #include <llvm/Support/TargetSelect.h>
+ 
+-- 
+GitLab
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch
similarity index 92%
copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch
index ad5059f1..37888c34 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-22.3.5/0001-gallium-Fix-build-with-llvm-18-and-19.patch
@@ -19,7 +19,7 @@ diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxilia
 index 5e7a30a6cc2..dbc777e3096 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -366,7 +366,11 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
+@@ -368,7 +368,11 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
     builder.setEngineKind(EngineKind::JIT)
            .setErrorStr(&Error)
            .setTargetOptions(options)
@@ -29,9 +29,9 @@ index 5e7a30a6cc2..dbc777e3096 100644
            .setOptLevel((CodeGenOpt::Level)OptLevel);
 +#endif
  
- #if DETECT_OS_WINDOWS
+ #ifdef _WIN32
      /*
-@@ -394,8 +398,14 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
+@@ -392,8 +396,14 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
      * which allows us to enable/disable code generation based
      * on the results of cpuid on these architectures.
      */
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index c93d01f9..bdc9ce16 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -19,6 +19,8 @@ SRC_URI = " \
     file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
     file://0001-gallium-Fix-build-with-llvm-17.patch \
     file://0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch \
+    file://0001-fix-gallivm-fix-LLVM-include-of-Host-h-moved-to-TargetParser.patch \
+    file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


