Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E59FD1CA0E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 00:10:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.5898.1730765444244910295
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 16:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=as1uCjPm;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A50AfRE039869;
	Mon, 4 Nov 2024 18:10:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730765441;
	bh=pRhqL+Y3yLeOpbH4dZidNancAOL/AF09OwBVa3YvaBo=;
	h=From:To:CC:Subject:Date;
	b=as1uCjPmL42ujWfRQDFmK+q818lAidiLgPGGVy1jHJ5usGVMQBC+GQdGXQ88EZBL6
	 /7XHk9royUEF+io08ggUcQ2eOcIRoncs2z2bV4PPxKBtC/wsYjyc6u3D3ERtqEdgoy
	 aghpQ0gMJGBSiGlrG24egmqs7HyfArR7YBHTxZfg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A50Af0H061286;
	Mon, 4 Nov 2024 18:10:41 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 18:10:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 18:10:41 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A50AfYk053391;
	Mon, 4 Nov 2024 18:10:41 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH] mesa: enable llvmpipe and pull in meta-clang
Date: Mon, 4 Nov 2024 18:10:29 -0600
Message-ID: <20241105001029.3716418-1-rs@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Nov 2024 00:10:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15591

From: Randolph Sapp <rs@ti.com>

In the 1 year since I initially enabled llvmpipe for mesa in this layer,
oe-core added their own version of clang and made it easier to enable
for most devices.

Unfortunately, we do not fall under the category of most devices,
considering we allow meta-browser. Meta-browser requires meta-clang,
which provides conflicting versions of clang at runtime. This causes the
mesa GLSL JIT to fail, among other things.

As a result this patch now pulls in meta-clang as a dependency and
configures the default clang provider to be the version provided by
meta-clang.

This reverts commit 90389044489ac8813098e5d6314f568440ff64ec.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf              | 8 ++++----
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++++
 meta-arago-distro/conf/layer.conf                     | 2 +-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 5316ce81..8e094e02 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -104,10 +104,10 @@ PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland"
 
 # Use llvmpipe for better performance with software rendering
 # Only available for armv6+ devices
-#MESA_GALLIUM_LLVM_PACKAGECONFIG = "gallium-llvm"
-#MESA_GALLIUM_LLVM_PACKAGECONFIG:omapl138 = ""
-#PACKAGECONFIG:append:pn-mesa = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
-#PACKAGECONFIG:append:pn-mesa-pvr = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
+MESA_GALLIUM_LLVM_PACKAGECONFIG = "gallium-llvm"
+MESA_GALLIUM_LLVM_PACKAGECONFIG:omapl138 = ""
+PACKAGECONFIG:append:pn-mesa = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
+PACKAGECONFIG:append:pn-mesa-pvr = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
 
 # Enable netperf intervals/pacing and histogram
 PACKAGECONFIG:append:pn-netperf = " intervals histogram"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 34c3c539..a518a857 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -19,3 +19,11 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 #PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
 #PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
 #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
+
+# Select meta-clang providers
+PREFERRED_PROVIDER_llvm = "clang"
+PREFERRED_PROVIDER_llvm-native = "clang-native"
+PREFERRED_PROVIDER_nativesdk-llvm = "nativesdk-clang"
+PROVIDES:pn-clang = "llvm"
+PROVIDES:pn-clang-native = "llvm-native"
+PROVIDES:pn-nativesdk-clang = "nativesdk-llvm"
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 04e553b4..00afb5b2 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -19,10 +19,10 @@ LAYERDEPENDS_meta-arago-distro = " \
     multimedia-layer \
     meta-python \
     qt5-layer \
+    clang-layer \
     meta-arago-extras \
     meta-arago-test \
 "
-# clang-layer
 
 LAYERRECOMMENDS_meta-arago-distro = " \
     chromium-browser-layer \
-- 
2.47.0


