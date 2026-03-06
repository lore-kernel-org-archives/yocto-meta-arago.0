Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3EAF513FE
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 05:54:48 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63671.1772776479274051025
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 21:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vJK8ZnNu;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.54, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkG2Jnq6ApSdF7DnTl7wUw0QGaZtEWpyMuB6TVqR59QUiA/UuV3VlOGfcSUypmuq3rpq/tK9utjuZAZO37sztHIxgp2YTwnjoLRm8d7V2illmpIss1QAbYywHQo1RjdJn1q7qK4hv3VS3BRo/l+rlqswPB8CA5gVVAwpo8vq5W/czuJhXYbueewH29PKCp93u2eEyjuZJmuEuY+Xht3F1hc0hm6l33oaxIHXwrnH42IXOskp4QQ+2isuzYKAUra2c0+Z1cLafSsYqdlz8FrxSQJcHTRlPEpede7yGRwi4sfJLIGf9PCzhI7mENUO5BJdKNBOZfxPZSc0BMNH0WQP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qksQT0fi/Qkd1619ggH6KQh2TN+1n0JPgY3Dv5Gy/A=;
 b=ClgtJ73+tcv+axXWBkzo9s4qiyfLW465xdexCG6LGLG3ObR9+v45kKLdwp+twRzdy12egldPmv31qksrPfrfMMYQX1lGvaF4Qbz9+kBTmQk9RLxq72Jz46cA/kwVknpr65+GunDIEJ/LGPXTDm1Wyq8SdHWuFWcikfb2ALQUpNHt0nCn47qBZ8p/Je4d/t4Vw3SNzgwIQ/Lf1U4cOG/Sg8t3jlRfEYVjTjUNv04/zVLdkyUKCbtwyi6744AfCd1F0lDxepEbEuat80WxDccGsH4dhFaTLYl4MsvL0GyWqw1Eg5TZEu+3HK+9D2INlMJOikbEkz1tV94hd7quNMur4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qksQT0fi/Qkd1619ggH6KQh2TN+1n0JPgY3Dv5Gy/A=;
 b=vJK8ZnNuvn+s7oDBXclH1nnxXg1VE8xxGZedaRToqqEv34HezTd64UlrwKI+YxUNKPAv1rz0scapbqwfYS4h2/daz7E+bhFli9K8LARbwAWaNbTiwkfDfZOTFMf9lJKYASEG70I2mN7O1AOcG/muNGP4CnLFcUguHW43lTP2X0Q=
Received: from IA4P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::15)
 by MW4PR10MB6677.namprd10.prod.outlook.com (2603:10b6:303:22f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 05:54:35 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::7d) by IA4P220CA0010.outlook.office365.com
 (2603:10b6:208:558::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 05:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 05:54:35 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 23:54:34 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 23:54:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 23:54:34 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6265sYEY3737966;
	Thu, 5 Mar 2026 23:54:34 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] chromium: Upgrade to v142.0.7444.175
Date: Thu, 5 Mar 2026 23:53:48 -0600
Message-ID: <20260306055348.1760322-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|MW4PR10MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 41aa328f-7ca4-4902-5fdf-08de7b44d870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	yrpICuGQ3xqKGCfjKIZBzX6mzWZF4SMOcL2NT0J4hYwvbYBAG91QJwipNo2E/9GhH4QM4ksdfswnspKgGX1u/s1stmLduSxxIdc8hdfYKHiGZ9dcDeXti4p92EiUuU9qv7/Nwl5wlQJWyG1Zi2q1rHSu2COTHYus0+XKWLhpEuQChJuwMBSQwRabwr+lX1CBxpW2a9KZOXTH2fxhMNRvaKHyNnA5SqtRTm81GeZZ6pcouqm88Yux0PuH3PkhE6W4KC3LvqcDS6vlJwxvDz17ZR0pzNK7tCbtPFD2A3Zwuk3Vq6POhCoWsdv2116nqB4/FCaapnIZFynrvFM1ZsfmHYTEOqYeOkqSD0vsKYl2lK2P7n2hqjk9Kb7llBTX98c+/YRWQ8JSomE2Nv0jAQuxmRqiSselWUCO6Ol1C9HwUABVbbmRvcNuraOb2ulg/TI1vQchudZfbU0ArEENZJV82044lWmIyYajoHghJG3nB0svAq56fzLblKnYU3q1UH4T589qEMXr9Mx6zSW5Ba+N80NgTLz+Or0s+NLCWg4/tuWk5dgYyr69hpXFwF0l7hRJtLvfWDeoa66PvrPFIpv4XB0uvw5g5/AqmA1XtUF9j6buIoHcgKRk8UZp8kr3Vk1eSd4xaMZMaJmiwNH4c1eEYNVupmAdlwXM/rD3wMXG64mY0nkdtA8pKIxU+VL15ZTeOPcVy4CheYup5bMi33bxMjkskebv+lZYAKEY5e5Pfm3uG/OdAdgbw1O9TJgCLsc7TKVrEm4F3ydWpR316b8Fpw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wU39Wyx6+WdelKlf4+++aA+DpXz6phA80QOP+y8P+NDb/ZP3ekMEkrr8kAc+Ny7kGf6QL30RqKaThf2hRNede0ArzYQk3VCddJu9ouJB2qQ7MF9OoNymQYn60ZM7vZS+taa0vVyvY6ytgcLV2mx8j1Z/PLRRULscJ2f0E9RywVjTvRpIxIIopLGp6DtwZdVuVDsS4kUdbVP+a661DQjRy9DECxcwsGTR6fY/G1ws8yUYW42zgVlJmARpjehJrMQEbsyVBb1oZ4/qDdXDnXIdVku+U/QVb8rnhPPWp95NbSjQ9BS9vK1t1Hiuzw4nX+FJNP+HaArDAzq5w+mJebQcImXfqMKtjQGCOJh/lXVK2G8Y4uMQaXDGj+7HnM+6vGP7ummezBKJDIwVx5f9nbcZbQ9ZcxkMA+viVVnaqMTq+WKTTRWZzzuwKX5o8Gjh1dSV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:54:35.0773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aa328f-7ca4-4902-5fdf-08de7b44d870
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6677
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Mar 2026 05:54:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17273

Changes:
- Remove PowerVR-specific sandbox patch
- Remove platform conditionals and use ChromeOS-style device paths
  (/dev/video-dec, /dev/video-enc)
- Disable ThinLTO to prevent linker OOM crashes
- Fix clang library copying for both aarch64 and x86_64 architectures
- Add NSS pkg-config detection
- Rebase existing V4L2 patches to new Chromium version
- Removed PACKAGECONFIG[use-v4l2] and v4l2 flags as they enabled by default

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...dbox-allow-access-to-PowerVR-GPU-fro.patch | 76 ----------------
 ...se-ChromeOS-style-dev-paths-for-all-.patch | 89 +++++++++++++++++++
 ...dbox-Allow-GPU-sandbox-access-to-V4L.patch | 23 ++---
 ...2-Fix-OUTPUT-queue-streaming-in-V4L2.patch | 44 ++-------
 ...oid-placing-incomplete-H264-access-.patch} | 10 +--
 .../chromium/chromium-ozone-wayland-arago.inc | 75 ++++++++++++++--
 ...ium-ozone-wayland_142.0.7444.175.bbappend} |  0
 7 files changed, 183 insertions(+), 134 deletions(-)
 delete mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer=
/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0001-chromiu=
m-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer=
/recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0001-media-=
gpu-v4l2-Use-ChromeOS-style-dev-paths-for-all-.patch
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland-132.0.6834.83 =3D> chromium-ozone-way=
land-142.0.7444.175}/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-=
V4L.patch (71%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland-132.0.6834.83 =3D> chromium-ozone-way=
land-142.0.7444.175}/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V=
4L2.patch (67%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland-132.0.6834.83/0004-Avoid-placing-inco=
mplete-H264-access-units-in-buffer.patch =3D> chromium-ozone-wayland-142.0.=
7444.175/0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch} (=
82%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
wser/chromium/{chromium-ozone-wayland_132.0.6834.83.bbappend =3D> chromium-=
ozone-wayland_142.0.7444.175.bbappend} (100%)

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0001-chromium-gpu-s=
andbox-allow-access-to-PowerVR-GPU-fro.patch b/meta-arago-distro/dynamic-la=
yers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland=
-132.0.6834.83/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.pa=
tch
deleted file mode 100644
index a9a5a49b..00000000
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-132.0.6834.83/0001-chromium-gpu-sandbox-=
allow-access-to-PowerVR-GPU-fro.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From a27529b8808e2eaa18ae5a30d5fee8193969bde7 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <a0867391@uda0393673-1.dhcp.ti.com>
-Date: Mon, 20 May 2024 15:48:36 -0500
-Subject: [PATCH] chromium: gpu: sandbox: allow access to PowerVR GPU from
- sandbox
-
-Upstream-Status: Pending [not strictly necessary, but reduces
-permissions warnings on console]
-
-Chromium runs in a sandbox to limit access to the system, however
-the PowerVR drivers for the Imagination GPU used on TI hardware need
-some extra libraries along with the DRM device nodes to be opened up.
-This patch opens up the necessary pieces.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
----
- content/common/gpu_pre_sandbox_hook_linux.cc | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/content/common/gpu_pre_sandbox_hook_linux.cc b/content/common=
/gpu_pre_sandbox_hook_linux.cc
-index 28de3c7..7db0617 100644
---- a/content/common/gpu_pre_sandbox_hook_linux.cc
-+++ b/content/common/gpu_pre_sandbox_hook_linux.cc
-@@ -67,6 +67,11 @@ inline bool UseChromecastSandboxAllowlist() {
- #endif
- }
-
-+inline bool IsGPUIMGRogue() {
-+  return true;
-+}
-+
-+
- inline bool IsArchitectureArm() {
- #if defined(ARCH_CPU_ARM_FAMILY)
-   return true;
-@@ -484,6 +489,11 @@ std::vector<BrokerFilePermission> FilePermissionsForG=
pu(
-
-   AddVulkanICDPermissions(&permissions);
-
-+  if (IsGPUIMGRogue()) {
-+      // Add standard DRM permissions for snapdragon/PowerVR:
-+      AddDrmGpuPermissions(&permissions);
-+  }
-+
-   if (IsChromeOS()) {
-     // Permissions are additive, there can be multiple GPUs in the system=
.
-     AddStandardChromeOsPermissions(&permissions);
-@@ -552,6 +562,8 @@ void LoadArmGpuLibraries() {
-         DRI_DRIVER_DIR "/mediatek_dri.so",
-         DRI_DRIVER_DIR "/rockchip_dri.so",
-         DRI_DRIVER_DIR "/asahi_dri.so",
-+        DRI_DRIVER_DIR "/pvr_dri.so",
-+        DRI_DRIVER_DIR "/tidss_dri.so",
- #else
-         "/usr/lib64/dri/msm_dri.so",
-         "/usr/lib64/dri/panfrost_dri.so",
-@@ -559,6 +571,8 @@ void LoadArmGpuLibraries() {
-         "/usr/lib64/dri/rockchip_dri.so",
-         "/usr/lib64/dri/asahi_dri.so",
-         "/usr/lib/dri/msm_dri.so",
-+        "/usr/lib/dri/tidss_dri.so",
-+        "/usr/lib/dri/pvr_dri.so",
-         "/usr/lib/dri/panfrost_dri.so",
-         "/usr/lib/dri/mediatek_dri.so",
-         "/usr/lib/dri/rockchip_dri.so",
-@@ -655,7 +669,7 @@ sandbox::syscall_broker::BrokerCommandSet CommandSetFo=
rGPU(
-   command_set.set(sandbox::syscall_broker::COMMAND_ACCESS);
-   command_set.set(sandbox::syscall_broker::COMMAND_OPEN);
-   command_set.set(sandbox::syscall_broker::COMMAND_STAT);
--  if (IsChromeOS() &&
-+  if ((IsGPUIMGRogue() || IsChromeOS()) &&
-       (options.use_amd_specific_policies ||
-        options.use_intel_specific_policies ||
-        options.use_nvidia_specific_policies ||
---
-2.34.1
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-142.0.7444.175/0001-media-gpu-v4l=
2-Use-ChromeOS-style-dev-paths-for-all-.patch b/meta-arago-distro/dynamic-l=
ayers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-waylan=
d-142.0.7444.175/0001-media-gpu-v4l2-Use-ChromeOS-style-dev-paths-for-all-.=
patch
new file mode 100644
index 00000000..2089b8d2
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-142.0.7444.175/0001-media-gpu-v4l2-Use-C=
hromeOS-style-dev-paths-for-all-.patch
@@ -0,0 +1,89 @@
+From 262a19d57fccf1b27ede283398278b52820f4aae Mon Sep 17 00:00:00 2001
+From: Thorsten Lannynd <t-lannynd@ti.com>
+Date: Fri, 5 Dec 2025 12:40:27 -0600
+Subject: [PATCH] media/gpu/v4l2: Use ChromeOS-style dev paths for all
+ platforms
+
+Upstream-Status: Inappropriate [embedded-specific,
+  requires custom udev rules]
+
+Remove platform-specific conditionals and standardize on ChromeOS device
+naming (/dev/video-dec, /dev/video-enc, etc) instead of generic /dev/video=
*.
+Reduces device scanning from 256 to 10 devices for improved enumeration sp=
eed.
+
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ media/gpu/v4l2/v4l2_device.cc | 16 ----------------
+ media/gpu/v4l2/v4l2_utils.cc  | 10 ----------
+ 2 files changed, 26 deletions(-)
+
+diff --git a/media/gpu/v4l2/v4l2_device.cc b/media/gpu/v4l2/v4l2_device.cc
+index ea35d10be8..dee743ed48 100644
+--- a/media/gpu/v4l2/v4l2_device.cc
++++ b/media/gpu/v4l2/v4l2_device.cc
+@@ -874,20 +874,11 @@ void V4L2Device::CloseDevice() {
+ }
+
+ void V4L2Device::EnumerateDevicesForType(Type type) {
+-#if BUILDFLAG(IS_CHROMEOS)
+   static const std::string kDecoderDevicePattern =3D "/dev/video-dec";
+   static const std::string kEncoderDevicePattern =3D "/dev/video-enc";
+   static const std::string kImageProcessorDevicePattern =3D "/dev/image-p=
roc";
+   static const std::string kJpegDecoderDevicePattern =3D "/dev/jpeg-dec";
+   static const std::string kJpegEncoderDevicePattern =3D "/dev/jpeg-enc";
+-#else
+-  static const std::string kDecoderDevicePattern =3D "/dev/video";
+-  static const std::string kEncoderDevicePattern =3D "/dev/video";
+-  static const std::string kImageProcessorDevicePattern =3D "/dev/video";
+-  static const std::string kJpegDecoderDevicePattern =3D "/dev/video";
+-  static const std::string kJpegEncoderDevicePattern =3D "/dev/video";
+-#endif
+-
+   std::string device_pattern;
+   v4l2_buf_type input_buf_type;
+   v4l2_buf_type output_buf_type;
+@@ -924,19 +915,12 @@ void V4L2Device::EnumerateDevicesForType(Type type) =
{
+   // We are sandboxed, so we can't query directory contents to check whic=
h
+   // devices are actually available. Try to open the first 10; if not pre=
sent,
+   // we will just fail to open immediately.
+-#if BUILDFLAG(IS_CHROMEOS)
+   constexpr int kMaxDevices =3D 10;
+   candidate_paths.reserve(kMaxDevices + 1);
+
+   // TODO(posciak): Remove this legacy unnumbered device once
+   // all platforms are updated to use numbered devices.
+   candidate_paths.push_back(device_pattern);
+-#else
+-  // On mainline Linux we need to check a much larger number of devices, =
mainly
+-  // because the device pattern is shared with ISP devices.
+-  constexpr int kMaxDevices =3D 256;
+-  candidate_paths.reserve(kMaxDevices);
+-#endif
+   for (int i =3D 0; i < kMaxDevices; ++i) {
+     candidate_paths.push_back(
+         base::StringPrintf("%s%d", device_pattern.c_str(), i));
+diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
+index d4cac5573c..50d720a365 100644
+--- a/media/gpu/v4l2/v4l2_utils.cc
++++ b/media/gpu/v4l2/v4l2_utils.cc
+@@ -583,18 +583,8 @@ std::optional<SupportedVideoDecoderConfigs> GetSuppor=
tedV4L2DecoderConfigs() {
+   SupportedVideoDecoderConfigs supported_media_configs;
+   std::vector<std::string> candidate_paths;
+
+-#if BUILDFLAG(IS_CHROMEOS)
+   constexpr char kVideoDevicePattern[] =3D "/dev/video-dec0";
+   candidate_paths.push_back(kVideoDevicePattern);
+-#else
+-  constexpr char kVideoDevicePattern[] =3D "/dev/video";
+-  constexpr int kMaxDevices =3D 256;
+-  candidate_paths.reserve(kMaxDevices);
+-  for (int i =3D 0; i < kMaxDevices; ++i) {
+-    candidate_paths.push_back(
+-        base::StringPrintf("%s%d", kVideoDevicePattern, i));
+-  }
+-#endif
+
+   for (const auto& path : candidate_paths) {
+     base::ScopedFD device_fd(
+--
+2.34.1
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-s=
andbox-Allow-GPU-sandbox-access-to-V4L.patch b/meta-arago-distro/dynamic-la=
yers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland=
-142.0.7444.175/0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.p=
atch
similarity index 71%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-sa=
ndbox-Allow-GPU-sandbox-access-to-V4L.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland-142.0.7444.175/0002-chromium-gpu-san=
dbox-Allow-GPU-sandbox-access-to-V4L.patch
index 4ccb8fc1..a51fa322 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-sandbox-=
Allow-GPU-sandbox-access-to-V4L.patch
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-142.0.7444.175/0002-chromium-gpu-sandbox=
-Allow-GPU-sandbox-access-to-V4L.patch
@@ -1,6 +1,6 @@
-From 99c59368f9cdd43638dd30c2ea867a950a54b648 Mon Sep 17 00:00:00 2001
+From d6a8f091cebd265c0f7f681173d2aa218a0b89cd Mon Sep 17 00:00:00 2001
 From: Thorsten Lannynd <t-lannynd@ti.com>
-Date: Fri, 8 Aug 2025 23:05:18 -0500
+Date: Thu, 5 Mar 2026 12:02:31 -0600
 Subject: [PATCH] chromium: gpu: sandbox: Allow GPU sandbox access to V4L2
  devices
=20
@@ -13,27 +13,28 @@ Chromium with V4L2 for video processing.
=20
 Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
 ---
- content/common/gpu_pre_sandbox_hook_linux.cc | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
+ content/common/gpu_pre_sandbox_hook_linux.cc | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
=20
 diff --git a/content/common/gpu_pre_sandbox_hook_linux.cc b/content/common=
/gpu_pre_sandbox_hook_linux.cc
-index 2a3abc9775..1865246fa8 100644
+index 2e53794fa3..9dec7fa08b 100644
 --- a/content/common/gpu_pre_sandbox_hook_linux.cc
 +++ b/content/common/gpu_pre_sandbox_hook_linux.cc
-@@ -516,11 +521,14 @@ std::vector<BrokerFilePermission> FilePermissionsFor=
Gpu(
-       AddDrmGpuPermissions(&permissions);
-   }
+@@ -627,13 +627,14 @@ std::vector<BrokerFilePermission> FilePermissionsFor=
Gpu(
+       BrokerFilePermission::ReadOnly(kDriRcPath)};
=20
+   AddVulkanICDPermissions(&permissions);
++
 +  if (UseV4L2Codec(options)) {
-+      // Add V4L2 permissions for video decode/encode.
 +      AddV4L2GpuPermissions(&permissions, options);
 +  }
-+
+
    if (IsChromeOS()) {
      // Permissions are additive, there can be multiple GPUs in the system=
.
      AddStandardChromeOsPermissions(&permissions);
--    if (UseV4L2Codec(options))
+-    if (UseV4L2Codec(options)) {
 -      AddV4L2GpuPermissions(&permissions, options);
+-    }
      if (IsArchitectureArm()) {
        AddImgPvrGpuPermissions(&permissions);
        AddArmGpuPermissions(&permissions);
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-v=
4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch b/meta-arago-distro/dynamic-la=
yers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland=
-142.0.7444.175/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.p=
atch
similarity index 67%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-v4=
l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland-142.0.7444.175/0003-chromium-gpu-v4l=
2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
index 55a630eb..0a6c0f95 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-132.0.6834.83/0003-chromium-gpu-v4l2-Fix=
-OUTPUT-queue-streaming-in-V4L2.patch
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-142.0.7444.175/0003-chromium-gpu-v4l2-Fi=
x-OUTPUT-queue-streaming-in-V4L2.patch
@@ -1,7 +1,7 @@
-From 3f5cdbc3b1871b6b8cdfa96eccd96f59d66a8afc Mon Sep 17 00:00:00 2001
+From d1d9bcefa8fd299049e6e51855f41b67b27823ed Mon Sep 17 00:00:00 2001
 From: Thorsten Lannynd <t-lannynd@ti.com>
 Date: Sat, 9 Aug 2025 01:46:14 -0500
-Subject: [PATCH] chromium: gpu: v4l2: Fix OUTPUT queue streaming in
+Subject: [PATCH] media/gpu/v4l2: Fix OUTPUT queue streaming in
  V4L2StatefulVideoDecoder
=20
 Upstream-Status: Inappropriate [this change is needed to satisfy
@@ -24,15 +24,14 @@ Linux distribution to set the correct device node names=
.
=20
 Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
 ---
- media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 40 ++++++++++++++-----
- media/gpu/v4l2/v4l2_utils.cc                  |  2 +-
- 2 files changed, 32 insertions(+), 10 deletions(-)
+ media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 32 +++++++++++++------
+ 1 file changed, 23 insertions(+), 9 deletions(-)
=20
 diff --git a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc b/media/gpu/v4l=
2/v4l2_stateful_video_decoder.cc
-index e5069a3acf..6d11ea7e0f 100644
+index 359145244d..e3aeb060c2 100644
 --- a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
 +++ b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
-@@ -410,10 +414,6 @@ void V4L2StatefulVideoDecoder::Initialize(const Video=
DecoderConfig& config,
+@@ -417,10 +417,6 @@ void V4L2StatefulVideoDecoder::Initialize(const Video=
DecoderConfig& config,
      std::move(init_cb).Run(DecoderStatus::Codes::kFailedToCreateDecoder);
      return;
    }
@@ -43,7 +42,7 @@ index e5069a3acf..6d11ea7e0f 100644
    client_->NotifyEstimatedMaxDecodeRequests(base::checked_cast<int>(
        std::min(static_cast<size_t>(4), num_input_buffers)));
=20
-@@ -518,10 +518,22 @@ void V4L2StatefulVideoDecoder::Decode(scoped_refptr<=
DecoderBuffer> buffer,
+@@ -525,10 +521,22 @@ void V4L2StatefulVideoDecoder::Decode(scoped_refptr<=
DecoderBuffer> buffer,
                                            std::move(decode_cb));
    }
=20
@@ -70,7 +69,7 @@ index e5069a3acf..6d11ea7e0f 100644
    }
=20
    if (!event_task_runner_) {
-@@ -729,7 +741,13 @@ bool V4L2StatefulVideoDecoder::InitializeCAPTUREQueue=
() {
+@@ -743,7 +751,13 @@ bool V4L2StatefulVideoDecoder::InitializeCAPTUREQueue=
() {
    auto chosen_fourcc =3D output_format.fourcc;
    const auto chosen_size =3D output_format.size;
    const auto chosen_modifier =3D output_format.modifier;
@@ -85,32 +84,5 @@ index e5069a3acf..6d11ea7e0f 100644
    // If our |client_| has a VideoFramePool to allocate buffers for us, we=
'll
    // use it, otherwise we have to ask the driver.
    const bool use_v4l2_allocated_buffers =3D !client_->GetVideoFramePool()=
;
-diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
-index 9646e8be73..6a7feb49c9 100644
---- a/media/gpu/v4l2/v4l2_utils.cc
-+++ b/media/gpu/v4l2/v4l2_utils.cc
-@@ -572,18 +572,10 @@ std::optional<SupportedVideoDecoderConfigs> GetSuppo=
rtedV4L2DecoderConfigs() {
-   SupportedVideoDecoderConfigs supported_media_configs;
-   std::vector<std::string> candidate_paths;
-
--#if BUILDFLAG(IS_CHROMEOS)
--  constexpr char kVideoDevicePattern[] =3D "/dev/video-dec0";
--  candidate_paths.push_back(kVideoDevicePattern);
--#else
--  constexpr char kVideoDevicePattern[] =3D "/dev/video";
--  constexpr int kMaxDevices =3D 256;
--  candidate_paths.reserve(kMaxDevices);
--  for (int i =3D 0; i < kMaxDevices; ++i) {
--    candidate_paths.push_back(
--        base::StringPrintf("%s%d", kVideoDevicePattern, i));
--  }
--#endif
-+  constexpr char kVideoDevicePattern0[] =3D "/dev/video-dec0";
-+  constexpr char kVideoDevicePattern1[] =3D "/dev/video-dec1";
-+  candidate_paths.push_back(kVideoDevicePattern0);
-+  candidate_paths.push_back(kVideoDevicePattern1);
-
-   for (const auto& path : candidate_paths) {
-     base::ScopedFD device_fd(
 --
 2.34.1
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-Avoid-placing-=
incomplete-H264-access-units-in-buffer.patch b/meta-arago-distro/dynamic-la=
yers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland=
-142.0.7444.175/0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.p=
atch
similarity index 82%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0004-Avoid-placing-i=
ncomplete-H264-access-units-in-buffer.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland-142.0.7444.175/0004-media-gpu-v4l2-A=
void-placing-incomplete-H264-access-.patch
index e0ca7dfd..caa61545 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-132.0.6834.83/0004-Avoid-placing-incompl=
ete-H264-access-units-in-buffer.patch
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-142.0.7444.175/0004-media-gpu-v4l2-Avoid=
-placing-incomplete-H264-access-.patch
@@ -1,4 +1,4 @@
-From 8542b683ca6a0774a452eb3d7cadc834d4f41436 Mon Sep 17 00:00:00 2001
+From 942c5f57d34c2d1b077240147bb29be84c773e62 Mon Sep 17 00:00:00 2001
 From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
 Date: Wed, 11 Jun 2025 11:07:05 +0300
 Subject: [PATCH] media/gpu/v4l2: Avoid placing incomplete H264 access unit=
s in
@@ -14,10 +14,10 @@ and may confuse the decoder.
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc b/media/gpu/v4l=
2/v4l2_stateful_video_decoder.cc
-index 422cc72a34a83..61ab2f5bf1ab2 100644
+index e3aeb060c2..3657bc1d36 100644
 --- a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
 +++ b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
-@@ -1340,7 +1340,7 @@ H264FrameReassembler::FindFrameBoundary(const uint8_=
t* const data,
+@@ -1342,7 +1342,7 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
            return std::nullopt;
          }
          previous_slice_header_.reset();
@@ -26,7 +26,7 @@ index 422cc72a34a83..61ab2f5bf1ab2 100644
                                   .is_start_of_new_frame =3D true,
                                   .nalu_size =3D nalu_size};
        case H264NALU::kPPS:
-@@ -1350,7 +1350,7 @@ H264FrameReassembler::FindFrameBoundary(const uint8_=
t* const data,
+@@ -1352,7 +1352,7 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
            return std::nullopt;
          }
          previous_slice_header_.reset();
@@ -35,7 +35,7 @@ index 422cc72a34a83..61ab2f5bf1ab2 100644
                                   .is_start_of_new_frame =3D true,
                                   .nalu_size =3D nalu_size};
        case H264NALU::kNonIDRSlice:
-@@ -1389,7 +1389,7 @@ H264FrameReassembler::FindFrameBoundary(const uint8_=
t* const data,
+@@ -1391,7 +1391,7 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
        case H264NALU::kReserved18:
          // Anything else than SPS, PPS and Non/IDRs marks a new frame bou=
ndary.
          previous_slice_header_.reset();
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dyn=
amic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-=
wayland-arago.inc
index 53669cf5..e2d55180 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
@@ -1,15 +1,78 @@
 PR:append =3D ".arago0"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-wayland-132.0.6834=
.83:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-wayland-142.0.7444=
.175:"
=20
-PACKAGECONFIG[use-v4l2] =3D "use_v4l2_codec=3Dtrue,use_v4l2_codec=3Dfalse"
-PACKAGECONFIG:append =3D " proprietary-codecs use-v4l2"
+PACKAGECONFIG:append =3D " proprietary-codecs"
=20
-CHROMIUM_EXTRA_ARGS:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'us=
e-v4l2', '--ozone-platform-hint=3Dwayland --enable-features=3DAcceleratedVi=
deoDecoder,AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCop=
yGL', '', d)}"
+# Remove incompatible Rust 1.8x patch (for Rust 1.93+)
+SRC_URI:remove =3D "file://chromium-142-crabbyavif-rust18x.patch"
=20
 SRC_URI:append =3D " \
-                  file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR=
-GPU-fro.patch \
+                  file://0001-media-gpu-v4l2-Use-ChromeOS-style-dev-paths-=
for-all-.patch \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-acces=
s-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming=
-in-V4L2.patch \
-                  file://0004-Avoid-placing-incomplete-H264-access-units-i=
n-buffer.patch \
+                  file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264=
-access-.patch \
                   "
+
+# Disable ThinLTO to prevent linker OOM crashes
+GN_ARGS +=3D " use_thin_lto=3Dfalse"
+
+# Override do_copy_clang_library to handle both target and host architectu=
res
+do_copy_clang_library() {
+    cp -r "${STAGING_LIBDIR_NATIVE}/clang/latest" "${STAGING_DIR_HOST}${no=
narch_libdir}/clang/"
+    cd "${STAGING_DIR_HOST}${nonarch_libdir}/clang" || return
+
+    # Process both target arch (aarch64) and build arch (x86_64)
+    for ARCH in "${TARGET_ARCH}" "${BUILD_ARCH}"; do
+        echo "Processing clang libraries for architecture: $ARCH"
+        target_dir=3D"latest/lib/${ARCH}-unknown-linux-gnu"
+        mkdir -p "$target_dir"
+
+        # Determine source sysroot based on architecture
+        if [ "$ARCH" =3D "${TARGET_ARCH}" ]; then
+            search_path=3D"${STAGING_LIBDIR}"
+        else
+            search_path=3D"${STAGING_LIBDIR_NATIVE}"
+        fi
+
+        # Find and copy library files from the appropriate sysroot
+        for lib_pattern in "libclang_rt.builtins-${ARCH}.a" "liborc_rt-${A=
RCH}.a"; do
+            lib_files=3D$(find "$search_path/clang" -name "$lib_pattern" 2=
>/dev/null)
+            for lib_file in $lib_files; do
+                if [ -f "$lib_file" ]; then
+                    base_name=3D$(basename "$lib_file")
+                    echo "Copying $lib_file to $target_dir/"
+                    cp "$lib_file" "$target_dir/" 2>/dev/null || true
+                fi
+            done
+        done
+
+        # Create generic names without architecture suffix
+        if [ -d "$target_dir" ]; then
+            cd "$target_dir" || continue
+            for file in libclang_rt.builtins-*.a liborc_rt-*.a; do
+                if [ -f "$file" ]; then
+                    generic_name=3D$(echo "$file" | sed -E 's/-(x86_64|aar=
ch64|arm|i686)\.a$/.a/')
+                    if [ "$file" !=3D "$generic_name" ] && [ ! -f "$generi=
c_name" ]; then
+                        cp "$file" "$generic_name" 2>/dev/null || true
+                    fi
+                fi
+            done
+            cd "${STAGING_DIR_HOST}${nonarch_libdir}/clang" || return
+        fi
+
+        # Copy to native sysroot as well
+        native_arch_path=3D"${STAGING_LIBDIR_NATIVE}/clang/latest/lib/${AR=
CH}-unknown-linux-gnu/"
+        if [ -d "$target_dir" ] && [ -n "$(ls -A "$target_dir" 2>/dev/null=
)" ]; then
+            mkdir -p "$native_arch_path"
+            cp -n "$target_dir"/* "$native_arch_path/" 2>/dev/null || true
+        fi
+    done
+}
+
+# Add pkg-config setup for NSS detection
+do_configure:prepend() {
+    export PKG_CONFIG_PATH=3D"${STAGING_LIBDIR}/pkgconfig:${STAGING_DATADI=
R}/pkgconfig"
+    export PKG_CONFIG_SYSROOT_DIR=3D"${STAGING_DIR_TARGET}"
+    export PKG_CONFIG_LIBDIR=3D"${STAGING_LIBDIR}/pkgconfig"
+}
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland_132.0.6834.83.bbappend b/meta-ara=
go-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/ch=
romium-ozone-wayland_142.0.7444.175.bbappend
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes=
-browser/chromium/chromium-ozone-wayland_132.0.6834.83.bbappend
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland_142.0.7444.175.bbappend
--=20
2.34.1


