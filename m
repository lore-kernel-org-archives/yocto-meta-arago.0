Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3E2D1BDF2
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 21:18:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1926.1730755124074423026
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 13:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oUhXb5G1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A4LIfhb116598;
	Mon, 4 Nov 2024 15:18:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730755121;
	bh=f3udvDzw1OziOJv9yjw8NdCAfheXl4vVoR88f/AGSvM=;
	h=From:To:Subject:Date;
	b=oUhXb5G1Dk60vfJr9QkKkqBD/zIp+VvtHUGkSZ5BbJgu+hgshboSrZTbCw4Z1PN2W
	 pzQwrgLRmKxJPLntAsStY0MvrIy/JzT8E3+j0G/0O6TZYdDu4W3PKphD5+026m4jFa
	 Xl4ikZEl6USw0jKEUdPyJA/chr1r04mxHKdzkUNc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A4LIfV9004186
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Nov 2024 15:18:41 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 15:18:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 15:18:41 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4LIfej126918;
	Mon, 4 Nov 2024 15:18:41 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t84TB-0002aN-9j; Mon, 04 Nov 2024 15:18:41 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2 1/2] mesa-pvr_23.2.1: Fix build issues with llvm 18+
Date: Mon, 4 Nov 2024 15:18:40 -0600
Message-ID: <20241104211841.9898-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Nov 2024 21:18:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15588

Backport two fixes from the latest mesa project to fix two builds issues
related to newer llvm versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rework commit message since we need to add patches for mesa-pvr_22.3.5 too.

 ...allium-Fix-build-with-llvm-18-and-19.patch | 53 +++++++++++++++++++
 .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
new file mode 100644
index 00000000..ad5059f1
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
@@ -0,0 +1,53 @@
+From 6c5033bb01a3a1341d4db5007586a5f2e2727b0a Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 4 Nov 2024 13:37:29 -0600
+Subject: [PATCH] gallium: Fix build with llvm 18 and 19
+
+- CodeGenOpt::Level changed to CodeGenOoptLevel. [1]
+- llvm::sys::getHostCPUFeatures() now returns the features instead of
+modifying the passed in argument. [2]
+
+Upstream-Status: Backport [1][https://gitlab.freedesktop.org/mesa/mesa/-/commit/f79617fe804ea6524651ff1bc3a91098d3199179]
+Upstream-Status: Backport [2][https://gitlab.freedesktop.org/mesa/mesa/-/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+index 5e7a30a6cc2..dbc777e3096 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+@@ -366,7 +366,11 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
+    builder.setEngineKind(EngineKind::JIT)
+           .setErrorStr(&Error)
+           .setTargetOptions(options)
++#if LLVM_VERSION_MAJOR >= 18
++          .setOptLevel((CodeGenOptLevel)OptLevel);
++#else
+           .setOptLevel((CodeGenOpt::Level)OptLevel);
++#endif
+ 
+ #if DETECT_OS_WINDOWS
+     /*
+@@ -394,8 +398,14 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
+     * which allows us to enable/disable code generation based
+     * on the results of cpuid on these architectures.
+     */
+-   llvm::StringMap<bool> features;
+-   llvm::sys::getHostCPUFeatures(features);
++   #if LLVM_VERSION_MAJOR >= 19
++      /* llvm-19+ returns StringMap from getHostCPUFeatures.
++      */
++      auto features = llvm::sys::getHostCPUFeatures();
++   #else
++      llvm::StringMap<bool> features;
++      llvm::sys::getHostCPUFeatures(features);
++   #endif
+ 
+    for (StringMapIterator<bool> f = features.begin();
+         f != features.end();
+-- 
+2.17.1
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
index 21134bc7..33af456d 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
     file://0001-gallium-Fix-build-with-llvm-17.patch \
     file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
+    file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


