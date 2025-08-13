Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D2DCA0EE6
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:52:01 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1531.1755103914724824392
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 09:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dR7Jh0Hy;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: t-lannynd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DGps8e2191842
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755103914;
	bh=WGpxElWNy/PgnI1WvWhBJ6iq4G1F/tFceurgE92ccgs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dR7Jh0HyIHrlP2Cqd7n2kqGcQqntCtEg/4sChcD65+aB87UACp1LZRK/MhoFm0h08
	 PDfBizO7QfptBNYphtIFt+KLo21rDQNdwnkggmeCmL3S0gaiSbVS6Ytdyi9MS5fZdD
	 nRqsA261ZRo+CbX+/zn+t2eRhnwiuPsWSj+VvRwE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DGpsEA1106877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 11:51:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 11:51:53 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DGpoA12292823;
	Wed, 13 Aug 2025 11:51:53 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 3/5] meta-arago-distro: chromium: Allow GPU sandbox access to V4L2
Date: Wed, 13 Aug 2025 11:51:46 -0500
Message-ID: <20250813165148.220012-4-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813165148.220012-1-t-lannynd@ti.com>
References: <20250813165148.220012-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16364

Add a patch to allow Chromium to open the V4L2 device patchs
from Weston which is needed for enabling the V4L2 Stateful decoder
in Chromium without using --no-sandbox.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...dbox-Allow-GPU-sandbox-access-to-V4L.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
new file mode 100644
index 00000000..1cadaa5b
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
@@ -0,0 +1,55 @@
+From 99c59368f9cdd43638dd30c2ea867a950a54b648 Mon Sep 17 00:00:00 2001
+From: Thorsten Lannynd <t-lannynd@ti.com>
+Date: Fri, 8 Aug 2025 23:05:18 -0500
+Subject: [PATCH] chromium: gpu: sandbox: Allow GPU sandbox access to V4L2
+ devices
+
+Upstream-Status: Pending
+
+This patch modifies the Chromium GPU sandbox configuration to allow
+access to V4L2 (Video4Linux2) devices. This is necessary to enable
+hardware-accelerated video decoding and encoding on systems that rely on
+Chromium with V4L2 for video processing.
+
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ content/common/gpu_pre_sandbox_hook_linux.cc | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/content/common/gpu_pre_sandbox_hook_linux.cc b/content/common/gpu_pre_sandbox_hook_linux.cc
+index 2a3abc9775..1865246fa8 100644
+--- a/content/common/gpu_pre_sandbox_hook_linux.cc
++++ b/content/common/gpu_pre_sandbox_hook_linux.cc
+@@ -140,8 +140,13 @@ void AddV4L2GpuPermissions(
+     static constexpr size_t MAX_V4L2_DECODERS = 5;
+     static const base::FilePath::CharType kDevicePath[] =
+         FILE_PATH_LITERAL("/dev/");
++#if BUILDFLAG(IS_LINUX)
++    static const base::FilePath::CharType kVideoDecBase[] = "video";
++    static const base::FilePath::CharType kMediaDecBase[] = "";
++#else
+     static const base::FilePath::CharType kVideoDecBase[] = "video-dec";
+     static const base::FilePath::CharType kMediaDecBase[] = "media-dec";
++#endif
+     for (size_t i = 0; i < MAX_V4L2_DECODERS; i++) {
+       std::ostringstream decoderPath;
+       decoderPath << kDevicePath << kVideoDecBase << i;
+@@ -516,11 +521,14 @@ std::vector<BrokerFilePermission> FilePermissionsForGpu(
+       AddDrmGpuPermissions(&permissions);
+   }
+
++  if (UseV4L2Codec(options)) {
++      // Add V4L2 permissions for video decode/encode.
++      AddV4L2GpuPermissions(&permissions, options);
++  }
++
+   if (IsChromeOS()) {
+     // Permissions are additive, there can be multiple GPUs in the system.
+     AddStandardChromeOsPermissions(&permissions);
+-    if (UseV4L2Codec(options))
+-      AddV4L2GpuPermissions(&permissions, options);
+     if (IsArchitectureArm()) {
+       AddImgPvrGpuPermissions(&permissions);
+       AddArmGpuPermissions(&permissions);
+--
+2.34.1

