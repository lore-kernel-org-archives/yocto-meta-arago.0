Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864CEC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 20:18:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1689.1717100282088016700
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 May 2024 13:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iN5LeKwt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: detheridge@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UKI0Fb124271;
	Thu, 30 May 2024 15:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717100280;
	bh=cMwhNfN8OBZFv4CbmJOGLPT7yxLW1ZV3GmW9bzRg8Mk=;
	h=From:To:CC:Subject:Date;
	b=iN5LeKwtD6T01XACWOVe9dQP0bT2wtpgzdJjHGZ/+956a+8z4AHGpHQx0HvFNh0w4
	 NtEM/QCa8+UXpUeePHDYUmZytqrrGvrm5mvkRWSX4PuG3ArnCcmajCskTxjandiPxr
	 /7RimEn1lyRzUqqdRaXI2//u0JTNHcz31qxUbUH8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UKI0E3103592
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 May 2024 15:18:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 15:18:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 15:18:00 -0500
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UKI06n071700;
	Thu, 30 May 2024 15:18:00 -0500
From: <detheridge@ti.com>
To: <reatmon@ti.com>, <rs@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-distro: chromium-browser: add support for Chromium v123
Date: Thu, 30 May 2024 15:17:50 -0500
Message-ID: <20240530201750.29910-1-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 May 2024 20:18:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15343

From: Darren Etheridge <detheridge@ti.com>

Add support for Chromium v123 and remove the v111 support as this
is not functional on Scarthgap.

This fixes up the wrapper script to use --use-gl=angle instead of
--use-gl=egl when launching Chromium.  With the PowerVR drivers
everything works better if we go through ANGLE with never versions of
Chromium.

Also apply a couple of patches (these are not strictly needed) the first
reduces a permissions warning that gets logged to stderr,  however it is
not fatal because chromium falls back to using another allocation method
which succeeds.   The second is an upstream patch that fixes an issue
where the buffer object size that is getting allocated is incorrect.
It hasn't been shown to be a problem in our testing, but just in the
abundance of caution this patch is going to be included.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 ...dbox-allow-access-to-PowerVR-GPU-fro.patch | 40 +++++-----
 ...stream-fix-incorrect-size-allocation.patch | 79 +++++++++++++++++++
 ...omium-ozone-wayland_111.0.5563.64.bbappend |  8 --
 ...-chromium-32307795-fix-nullprt-deref.patch | 52 ------------
 ...mium-ozone-wayland_123.0.6312.122.bbappend | 11 +++
 5 files changed, 112 insertions(+), 78 deletions(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland_111.0.5563.64 => chromium-ozone-wayland-123.0.6312.122}/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch (69%)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0002-upstream-fix-incorrect-size-allocation.patch
 delete mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
 delete mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_123.0.6312.122.bbappend

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
similarity index 69%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
index 86b4a179..ae50828a 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
@@ -1,9 +1,12 @@
-From 11267fe76f81dce283d565d517b679aa2be44466 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Fri, 26 Jan 2024 10:54:49 -0600
+From a27529b8808e2eaa18ae5a30d5fee8193969bde7 Mon Sep 17 00:00:00 2001
+From: Darren Etheridge <a0867391@uda0393673-1.dhcp.ti.com>
+Date: Mon, 20 May 2024 15:48:36 -0500
 Subject: [PATCH] chromium: gpu: sandbox: allow access to PowerVR GPU from
  sandbox
 
+Upstream-Status: Pending [not strictly necessary, but reduces
+permissions warnings on console]
+
 Chromium runs in a sandbox to limit access to the system, however
 the PowerVR drivers for the Imagination GPU used on TI hardware need
 some extra libraries along with the DRM device nodes to be opened up.
@@ -11,17 +14,17 @@ This patch opens up the necessary pieces.
 
 Signed-off-by: Darren Etheridge <detheridge@ti.com>
 ---
- content/gpu/gpu_sandbox_hook_linux.cc | 16 +++++++++++++++-
+ content/common/gpu_pre_sandbox_hook_linux.cc | 16 +++++++++++++++-
  1 file changed, 15 insertions(+), 1 deletion(-)
 
-diff --git a/content/gpu/gpu_sandbox_hook_linux.cc b/content/gpu/gpu_sandbox_hook_linux.cc
-index d93285a..1f8aafd 100644
---- a/content/gpu/gpu_sandbox_hook_linux.cc
-+++ b/content/gpu/gpu_sandbox_hook_linux.cc
+diff --git a/content/common/gpu_pre_sandbox_hook_linux.cc b/content/common/gpu_pre_sandbox_hook_linux.cc
+index 28de3c7..7db0617 100644
+--- a/content/common/gpu_pre_sandbox_hook_linux.cc
++++ b/content/common/gpu_pre_sandbox_hook_linux.cc
 @@ -67,6 +67,11 @@ inline bool UseChromecastSandboxAllowlist() {
  #endif
  }
-
+ 
 +inline bool IsGPUIMGRogue() {
 +  return true;
 +}
@@ -30,10 +33,10 @@ index d93285a..1f8aafd 100644
  inline bool IsArchitectureArm() {
  #if defined(ARCH_CPU_ARM_FAMILY)
    return true;
-@@ -441,6 +446,11 @@ std::vector<BrokerFilePermission> FilePermissionsForGpu(
-
+@@ -484,6 +489,11 @@ std::vector<BrokerFilePermission> FilePermissionsForGpu(
+ 
    AddVulkanICDPermissions(&permissions);
-
+ 
 +  if (IsGPUIMGRogue()) {
 +      // Add standard DRM permissions for snapdragon/PowerVR:
 +      AddDrmGpuPermissions(&permissions);
@@ -42,7 +45,7 @@ index d93285a..1f8aafd 100644
    if (IsChromeOS()) {
      // Permissions are additive, there can be multiple GPUs in the system.
      AddStandardChromeOsPermissions(&permissions);
-@@ -508,6 +518,8 @@ void LoadArmGpuLibraries() {
+@@ -552,6 +562,8 @@ void LoadArmGpuLibraries() {
          DRI_DRIVER_DIR "/mediatek_dri.so",
          DRI_DRIVER_DIR "/rockchip_dri.so",
          DRI_DRIVER_DIR "/asahi_dri.so",
@@ -51,7 +54,7 @@ index d93285a..1f8aafd 100644
  #else
          "/usr/lib64/dri/msm_dri.so",
          "/usr/lib64/dri/panfrost_dri.so",
-@@ -515,6 +527,8 @@ void LoadArmGpuLibraries() {
+@@ -559,6 +571,8 @@ void LoadArmGpuLibraries() {
          "/usr/lib64/dri/rockchip_dri.so",
          "/usr/lib64/dri/asahi_dri.so",
          "/usr/lib/dri/msm_dri.so",
@@ -60,7 +63,7 @@ index d93285a..1f8aafd 100644
          "/usr/lib/dri/panfrost_dri.so",
          "/usr/lib/dri/mediatek_dri.so",
          "/usr/lib/dri/rockchip_dri.so",
-@@ -632,7 +646,7 @@ sandbox::syscall_broker::BrokerCommandSet CommandSetForGPU(
+@@ -655,7 +669,7 @@ sandbox::syscall_broker::BrokerCommandSet CommandSetForGPU(
    command_set.set(sandbox::syscall_broker::COMMAND_ACCESS);
    command_set.set(sandbox::syscall_broker::COMMAND_OPEN);
    command_set.set(sandbox::syscall_broker::COMMAND_STAT);
@@ -68,6 +71,7 @@ index d93285a..1f8aafd 100644
 +  if ((IsGPUIMGRogue() || IsChromeOS()) &&
        (options.use_amd_specific_policies ||
         options.use_intel_specific_policies ||
-        options.use_virtio_specific_policies || IsArchitectureArm())) {
---
-2.36.1
+        options.use_nvidia_specific_policies ||
+-- 
+2.34.1
+
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0002-upstream-fix-incorrect-size-allocation.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0002-upstream-fix-incorrect-size-allocation.patch
new file mode 100644
index 00000000..e8a1643e
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0002-upstream-fix-incorrect-size-allocation.patch
@@ -0,0 +1,79 @@
+From 7efb6857a17195f08b609129e92732e19aa1d54c Mon Sep 17 00:00:00 2001
+From: Reito <carolwolfking@gmail.com>
+Date: Sat, 09 Mar 2024 12:23:57 +0000
+Subject: [PATCH] fix: Use correct size when GbmBuffer::CreateBufferWithModifiers
+
+Upstream-Status: Backport [https://chromium.googlesource.com/chromium/src/+/7efb6857a17195f08b609129e92732e19aa1d54c]
+
+CreateBufferWithModifiers currently uses the wrong size used for
+verification when creating gfx::Buffer, which can be different
+(1x1) from the real size on linux due to a bug in nvidia driver.
+Use real size when creating gfx::Buffer instead.
+
+Bug: 327768768
+Change-Id: Ic3e619bd1dd5afd050c1f5a76f73638c6f350da3
+Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5338184
+Reviewed-by: Mitsuru Oshima <oshima@chromium.org>
+Reviewed-by: Nick Yamane <nickdiego@igalia.com>
+Commit-Queue: Reito OvO <carolwolfking@gmail.com>
+Cr-Commit-Position: refs/heads/main@{#1270603}
+---
+
+diff --git a/ui/gfx/linux/gbm_wrapper.cc b/ui/gfx/linux/gbm_wrapper.cc
+index c0dfe4fd..58c3c0b 100644
+--- a/ui/gfx/linux/gbm_wrapper.cc
++++ b/ui/gfx/linux/gbm_wrapper.cc
+@@ -312,7 +312,7 @@
+     // do the create/import modifiers validation loop below using a separate set
+     // of 1x1 BOs which are destroyed before creating the final BO creation used
+     // to instantiate the returned GbmBuffer.
+-    gfx::Size size =
++    gfx::Size size_for_verification =
+ #if BUILDFLAG(IS_LINUX)
+         gfx::Size(1, 1);
+ #else
+@@ -324,16 +324,18 @@
+ 
+     while (!valid_modifiers && !filtered_modifiers.empty()) {
+       created_bo = gbm_bo_create_with_modifiers(
+-          device_, size.width(), size.height(), format,
+-          filtered_modifiers.data(), filtered_modifiers.size());
++          device_, size_for_verification.width(),
++          size_for_verification.height(), format, filtered_modifiers.data(),
++          filtered_modifiers.size());
+       if (!created_bo) {
+         return nullptr;
+       }
+ 
+       const int planes_count = gbm_bo_get_plane_count(created_bo);
+       struct gbm_import_fd_modifier_data fd_data = {
+-          .width = base::checked_cast<uint32_t>(size.width()),
+-          .height = base::checked_cast<uint32_t>(size.height()),
++          .width = base::checked_cast<uint32_t>(size_for_verification.width()),
++          .height =
++              base::checked_cast<uint32_t>(size_for_verification.height()),
+           .format = format,
+           .num_fds = base::checked_cast<uint32_t>(planes_count),
+           .modifier = gbm_bo_get_modifier(created_bo)};
+@@ -358,7 +360,7 @@
+             GetFilteredModifiers(format, flags, filtered_modifiers);
+       }
+ 
+-      if (!valid_modifiers || size != requested_size) {
++      if (!valid_modifiers || size_for_verification != requested_size) {
+         gbm_bo_destroy(created_bo);
+         created_bo = nullptr;
+       }
+@@ -374,8 +376,10 @@
+       PLOG_IF(ERROR, !created_bo) << "Failed to create BO with modifiers.";
+     }
+ 
+-    return created_bo ? CreateBufferForBO(created_bo, format, size, flags)
+-                      : nullptr;
++    // TODO(327768768): Add a test for this about size.
++    return created_bo
++               ? CreateBufferForBO(created_bo, format, requested_size, flags)
++               : nullptr;
+   }
+ 
+   std::unique_ptr<ui::GbmBuffer> CreateBufferFromHandle(
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
deleted file mode 100644
index df93e26b..00000000
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-PR:append = ".arago0"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}_${PV}:"
-
-SRC_URI:append = " \
-                  file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
-                  file://0002-upstream-chromium-32307795-fix-nullprt-deref.patch \
-                  "
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch
deleted file mode 100644
index 4971f543..00000000
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_111.0.5563.64/0002-upstream-chromium-32307795-fix-nullprt-deref.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 323077958301bc321d840a2c2b983ab469934753 Mon Sep 17 00:00:00 2001
-From: Max Ihlenfeldt <max@igalia.com>
-Date: Wed, 02 Aug 2023 15:46:56 +0000
-Subject: [PATCH] ozone/wayland: Fix nullptr deref in WaylandWindowManager
-
-When no input devices are available (e.g. embedded devices),
-`connection_->window_drag_controller()` returns nullptr. Add a check to
-ensure we don't accidentally dereference that.
-
-See also https://github.com/OSSystems/meta-browser/issues/736.
-
-Bug: 578890
-Change-Id: I472d0dfabfea6b4d072ede98c8593370524f54f0
-Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/4724882
-Reviewed-by: Antonio Gomes <tonikitoo@igalia.com>
-Commit-Queue: Max Ihlenfeldt <max@igalia.com>
-Cr-Commit-Position: refs/heads/main@{#1178426}
----
-
-diff --git a/ui/ozone/platform/wayland/host/wayland_window_manager.cc b/ui/ozone/platform/wayland/host/wayland_window_manager.cc
-index e4a8e4541..24999725 100644
---- a/ui/ozone/platform/wayland/host/wayland_window_manager.cc
-+++ b/ui/ozone/platform/wayland/host/wayland_window_manager.cc
-@@ -96,15 +96,19 @@
-
- WaylandWindow* WaylandWindowManager::GetCurrentPointerOrTouchFocusedWindow()
-     const {
--  // In case there is an ongoing window dragging session, favor the window
--  // according to the active drag source.
--  //
--  // TODO(https://crbug.com/1317063): Apply the same logic to data drag sessions
--  // too?
--  if (auto drag_source = connection_->window_drag_controller()->drag_source()) {
--    return *drag_source == mojom::DragEventSource::kMouse
--               ? GetCurrentPointerFocusedWindow()
--               : GetCurrentTouchFocusedWindow();
-+  // Might be nullptr if no input devices are available.
-+  if (connection_->window_drag_controller()) {
-+    // In case there is an ongoing window dragging session, favor the window
-+    // according to the active drag source.
-+    //
-+    // TODO(https://crbug.com/1317063): Apply the same logic to data drag
-+    // sessions too?
-+    if (auto drag_source =
-+            connection_->window_drag_controller()->drag_source()) {
-+      return *drag_source == mojom::DragEventSource::kMouse
-+                 ? GetCurrentPointerFocusedWindow()
-+                 : GetCurrentTouchFocusedWindow();
-+    }
-   }
-
-   for (const auto& entry : window_map_) {
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_123.0.6312.122.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_123.0.6312.122.bbappend
new file mode 100644
index 00000000..3612228b
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_123.0.6312.122.bbappend
@@ -0,0 +1,11 @@
+PR:append = ".arago0"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
+
+CHROMIUM_EXTRA_ARGS:remove = " --use-gl=egl"
+CHROMIUM_EXTRA_ARGS:append = " --use-gl=angle"
+
+SRC_URI:append = " \
+                  file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
+                  file://0002-upstream-fix-incorrect-size-allocation.patch \
+                  "
-- 
2.36.1


