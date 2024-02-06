Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5F2C4829D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 17:58:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.28484.1707242326449465655
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 09:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PalSbMUp;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 416HwjVD104704;
	Tue, 6 Feb 2024 11:58:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707242325;
	bh=GEx1iwZbhgNSX9ofVClIWeMQGJSv+hMdPCeQbs77dog=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PalSbMUpMt2rKeYGC4fXGTs1qY9X57mXpoDgvDPi9uT/QbB2eQ/AT8E6QIT+hwb+S
	 TvIsHYUPg4dRTWXJmKO0h5DF96H8dALfIARMiR/kUNzgaCh3kwJOAAHa1NdEr7n4kA
	 Iuzmxuh4Qk/rlszRY3OgnB481HreoVG3VmgkwSHk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 416HwjkK039871
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Feb 2024 11:58:45 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Feb 2024 11:58:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Feb 2024 11:58:44 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 416HwhcR064292;
	Tue, 6 Feb 2024 11:58:44 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][kirkstone][PATCH  2/4] meta-arago: distro: add a bbapend to patch the chromium browser
Date: Tue, 6 Feb 2024 11:58:39 -0600
Message-ID: <20240206175841.32717-3-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240206175841.32717-1-detheridge@ti.com>
References: <20240206175841.32717-1-detheridge@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Feb 2024 17:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15119

From: Darren Etheridge <detheridge@ti.com>

This applies a patch for meta-browser/chromium-ozone-wayland to make the
sandboxing work with the Imagination GPU components without the need for
the --no-sandbox flag.

GPU acceleration in Chromium is dependant on IMG DDK 23.3.  It works
across AXE/BXS/8XE GPU's.   No acceleration is expected for SGX.

Also add an upstream patch to stop Chromium from segfaulting when it is
run with no input devices connected to the board.
Patch was retrieved from:
https://chromium.googlesource.com/chromium/src/+/323077958301bc321d840a2c2b983ab469934753

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 meta-arago-distro/conf/layer.conf             |  2 +
 ...omium-ozone-wayland_111.0.5563.64.bbappend |  8 ++
 ...dbox-allow-access-to-PowerVR-GPU-fro.patch | 74 +++++++++++++++++++
 ...-chromium-32307795-fix-nullprt-deref.patch | 52 +++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 40b0f5bb..b0221860 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -24,9 +24,11 @@ LAYERDEPENDS_meta-arago-distro = " \
 # clang-layer
 
 LAYERRECOMMENDS_meta-arago-distro = " \
+    chromium-browser-layer \
 "
 
 BBFILES_DYNAMIC += " \
+    chromium-browser-layer:${LAYERDIR}/dynamic-layers/chromium-browser-layer/recipes*/*/*.bbappend \
 "
 
 BB_DANGLINGAPPENDS_WARNONLY = "true"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
new file mode 100644
index 00000000..df93e26b
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
@@ -0,0 +1,8 @@
+PR:append = ".arago0"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}_${PV}:"
+
+SRC_URI:append = " \
+                  file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
+                  file://0002-upstream-chromium-32307795-fix-nullprt-deref.patch \
+                  "
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
new file mode 100644
index 00000000..1930f976
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
@@ -0,0 +1,74 @@
+From 11267fe76f81dce283d565d517b679aa2be44466 Mon Sep 17 00:00:00 2001
+From: Darren Etheridge <detheridge@ti.com>
+Date: Fri, 26 Jan 2024 10:54:49 -0600
+Subject: [PATCH] chromium: gpu: sandbox: allow access to PowerVR GPU from
+ sandbox
+
+Chromium runs in a sandbox to limit access to the system, however
+the PowerVR drivers for the Imagination GPU used on TI hardware need
+some extra libraries along with the DRM device nodes to be opened up.
+This patch opens up the necessary pieces.
+
+Signed-off-by: Darren Etheridge <detheridge@ti.com>
+---
+ content/gpu/gpu_sandbox_hook_linux.cc | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/content/gpu/gpu_sandbox_hook_linux.cc b/content/gpu/gpu_sandbox_hook_linux.cc
+index d93285a..1f8aafd 100644
+--- a/content/gpu/gpu_sandbox_hook_linux.cc
++++ b/content/gpu/gpu_sandbox_hook_linux.cc
+@@ -67,6 +67,11 @@ inline bool UseChromecastSandboxAllowlist() {
+ #endif
+ }
+ 
++inline bool IsGPUIMGRogue() {
++  return true;
++}
++
++
+ inline bool IsArchitectureArm() {
+ #if defined(ARCH_CPU_ARM_FAMILY)
+   return true;
+@@ -441,6 +446,11 @@ std::vector<BrokerFilePermission> FilePermissionsForGpu(
+ 
+   AddVulkanICDPermissions(&permissions);
+ 
++  if (IsGPUIMGRogue()) {
++      // Add standard DRM permissions for snapdragon/PowerVR:
++      AddDrmGpuPermissions(&permissions);
++  }
++
+   if (IsChromeOS()) {
+     // Permissions are additive, there can be multiple GPUs in the system.
+     AddStandardChromeOsPermissions(&permissions);
+@@ -508,6 +518,8 @@ void LoadArmGpuLibraries() {
+         DRI_DRIVER_DIR "/mediatek_dri.so",
+         DRI_DRIVER_DIR "/rockchip_dri.so",
+         DRI_DRIVER_DIR "/asahi_dri.so",
++        DRI_DRIVER_DIR "/pvr_dri.so",
++        DRI_DRIVER_DIR "/tidss_dri.so",
+ #else
+         "/usr/lib64/dri/msm_dri.so",
+         "/usr/lib64/dri/panfrost_dri.so",
+@@ -515,6 +527,8 @@ void LoadArmGpuLibraries() {
+         "/usr/lib64/dri/rockchip_dri.so",
+         "/usr/lib64/dri/asahi_dri.so",
+         "/usr/lib/dri/msm_dri.so",
++        "/usr/lib/dri/tidss_dri.so",
++        "/usr/lib/dri/pvr_dri.so",
+         "/usr/lib/dri/panfrost_dri.so",
+         "/usr/lib/dri/mediatek_dri.so",
+         "/usr/lib/dri/rockchip_dri.so",
+@@ -632,7 +646,7 @@ sandbox::syscall_broker::BrokerCommandSet CommandSetForGPU(
+   command_set.set(sandbox::syscall_broker::COMMAND_ACCESS);
+   command_set.set(sandbox::syscall_broker::COMMAND_OPEN);
+   command_set.set(sandbox::syscall_broker::COMMAND_STAT);
+-  if (IsChromeOS() &&
++  if ((IsGPUIMGRogue() || IsChromeOS()) &&
+       (options.use_amd_specific_policies ||
+        options.use_intel_specific_policies ||
+        options.use_virtio_specific_policies || IsArchitectureArm())) {
+-- 
+2.36.1
+
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch
new file mode 100644
index 00000000..5624de96
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch
@@ -0,0 +1,52 @@
+From 323077958301bc321d840a2c2b983ab469934753 Mon Sep 17 00:00:00 2001
+From: Max Ihlenfeldt <max@igalia.com>
+Date: Wed, 02 Aug 2023 15:46:56 +0000
+Subject: [PATCH] ozone/wayland: Fix nullptr deref in WaylandWindowManager
+
+When no input devices are available (e.g. embedded devices),
+`connection_->window_drag_controller()` returns nullptr. Add a check to
+ensure we don't accidentally dereference that.
+
+See also https://github.com/OSSystems/meta-browser/issues/736.
+
+Bug: 578890
+Change-Id: I472d0dfabfea6b4d072ede98c8593370524f54f0
+Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/4724882
+Reviewed-by: Antonio Gomes <tonikitoo@igalia.com>
+Commit-Queue: Max Ihlenfeldt <max@igalia.com>
+Cr-Commit-Position: refs/heads/main@{#1178426}
+---
+
+diff --git a/ui/ozone/platform/wayland/host/wayland_window_manager.cc b/ui/ozone/platform/wayland/host/wayland_window_manager.cc
+index e4a8e4541..24999725 100644
+--- a/ui/ozone/platform/wayland/host/wayland_window_manager.cc
++++ b/ui/ozone/platform/wayland/host/wayland_window_manager.cc
+@@ -96,15 +96,19 @@
+ 
+ WaylandWindow* WaylandWindowManager::GetCurrentPointerOrTouchFocusedWindow()
+     const {
+-  // In case there is an ongoing window dragging session, favor the window
+-  // according to the active drag source.
+-  //
+-  // TODO(https://crbug.com/1317063): Apply the same logic to data drag sessions
+-  // too?
+-  if (auto drag_source = connection_->window_drag_controller()->drag_source()) {
+-    return *drag_source == mojom::DragEventSource::kMouse
+-               ? GetCurrentPointerFocusedWindow()
+-               : GetCurrentTouchFocusedWindow();
++  // Might be nullptr if no input devices are available.
++  if (connection_->window_drag_controller()) {
++    // In case there is an ongoing window dragging session, favor the window
++    // according to the active drag source.
++    //
++    // TODO(https://crbug.com/1317063): Apply the same logic to data drag
++    // sessions too?
++    if (auto drag_source =
++            connection_->window_drag_controller()->drag_source()) {
++      return *drag_source == mojom::DragEventSource::kMouse
++                 ? GetCurrentPointerFocusedWindow()
++                 : GetCurrentTouchFocusedWindow();
++    }
+   }
+ 
+   for (const auto& entry : window_map_) {
-- 
2.36.1


