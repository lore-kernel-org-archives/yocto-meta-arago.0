Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81719CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 18:28:18 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3079.1779820094570679058
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 May 2026 11:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BZmXPy6b;
 spf=pass (domain: ti.com, ip: 40.107.208.61, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4n1WVOa85uhzGWhLh1ohEoBZh/xw0CsWCljx5UTSW4ARhdG+IJJi1Y0Aho7iwopchL2G7ngOWe1YaGqvvUjBIfEPKYHNeUu/CpQM7wr9SYNN2PLp989FCSp1yq3N5sV9NaDo/LHD8b4lEZoUKOHUqN+1vqFaxUXzJtySefamssAPOJxTZgfBBqkvA2EhMhqc6TRhXxHul7SgKVnhh5Y6CVuzJcAzxOqXSeFQOsUjcYGlzry6Jq1r6eySS2/1pQX8BhrM740tq9XIjWJfZpWL1HfIgRZVPqsmZUHgLJFjjwNTP7oGgvyupf0sEhaO/KbGS2pfPXDfrZtSUCkBeag+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk0UUnHLaP0R/EwXJX/ZeWpxKHI0QCm9AlRYLJwd/vg=;
 b=ywzYOvhP7BZbSvU/nbdBLsOsHa6wUJt6/o2jdsM5uQeGmffY7xvF0PbSMTrLpmKP2ol0lyqGxogVx1tgZQcnTGEEGuD2eeWfGQWGrn4R61TVGXps06r+C09BrwUjsD1SBHYYPvmLVD3knjEAkuR/5Tp82LFS7NNoG7C8vsfK3lZ7r/2rx4p7kHnDH7Qic0fQls7NJCLyrRNpgwQMMvJxuQnN5OpSYl9zU2IlsDjM3m/3La33a9EltnERlfO8Ti3kMo5vxGlsFo6NPxd5yuVJwmZM+ngxQxcPQA9MuE5eF20CapVOPTuNtaeA7cBljE7D4+gF20LCZRaUZRghOtT84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk0UUnHLaP0R/EwXJX/ZeWpxKHI0QCm9AlRYLJwd/vg=;
 b=BZmXPy6b3X/NmBcKHH1SRsHr8Ul8UblqN4fX9uMxlD58ouySp5QVRfxCPj9rG3YMDoLXeL86liN23NWffo3JkzESCqiVK5BwTdYKWkopXV1fUELey3Lk2zPyIwtLX+rdT9V3ImHiUn6thmLM+FiU/X65YOwcUjvsqRgWuz20AsU=
Received: from MN0PR02CA0018.namprd02.prod.outlook.com (2603:10b6:208:530::13)
 by IA3PR10MB8491.namprd10.prod.outlook.com (2603:10b6:208:576::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 26 May
 2026 18:28:12 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::35) by MN0PR02CA0018.outlook.office365.com
 (2603:10b6:208:530::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 18:28:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 18:28:10 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 13:28:03 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 13:28:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 13:28:02 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QIS2DT1990602;
	Tue, 26 May 2026 13:28:02 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] meta-arago: chromium: clean up and simplify V4L2 patch series
Date: Tue, 26 May 2026 13:27:53 -0500
Message-ID: <20260526182753.376138-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|IA3PR10MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e8087a-8872-4836-30a2-08debb548a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|4133799003|18002099003|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	wrITEomxoALO6a8QTXwRWNV8aRRZQM7kf38GCPWDIcy6C41dX7qRBZMB/p4b9sLU2t4DZhz+MGI+TPHlvwW0Q+3l+wja9YILBlbU+BzljzKaKA3oilYkLXRPEfA6iPzsBr5NXEmN5dwrt2g7xj+iaKdS/omVlLs0R4kNhSe2V9sFrK0EC3yK06GZthKq5PW4rSJbKuDVsptQsGox/nx4c5WeQPWEgwE0DTvgNVL0s7pcFkMTETkoJ0G7Mn6TvOQ9nocpVYOM3Jh06pqwX6gTG3qyW/OjO6AVP+btasSqH+SoSQo5cX35Ge4KziS9USYKmZD+RhlpxxIyn95e3ubn9+RvnroTypDABMwv3XvY61ghxmx6opfM0/NpRP8oFL//C6HCWpEv7PywTuDqnye7+aZKkMgo9ppV9016JD0m8QkDj3A8dWrJaRuPWzukAEPFIene8wgDTCkEiGHNeIKNbduDgHs5Y/Kp0x6ToXSwVkgvnpvf55/cmLNCUhD0L1s5+LlaY2tOzn/v9tC8QxtZDH1crwiUvc+BbHh9mPMM9MxbLg1AwRD5H52ZWyo5djbY0KnQ7B2jUXeNNSPU+p/JsyV6lpF58hi/Ht6C6CmfTt4esnrDq4WSNNraA6MOovVLCG9D1Kw/3YsMX8SsWrzrCsHjQpli+rZB1UsNRl4rscmTzx8plt9xgH7uRB35uCopNg5mOtIyi/58D2GrdQlAkMAxcdrgW0/dpB1UsJcvtHw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(4133799003)(18002099003)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nUtTL0VdRW3xMjl9sojNWtHVO7pLQP1YcS6fdQWD9HEJaG1iT7oUnKjdN7Gp3w9TJ7sQ4eH2MiB8OiayeI3xhbEyCfr1nC2S23jLG13dV0NvqmPy5cpfm0Tmq3R54r30feh/V6il0iPICgORnR2y5CcFxdUYknOnjDdx6y8Nr//VKjKyPNPJiOXDhYNmKWh4rUivUIrF6YNfHvO5hhADC4ekHth7uCpyYOnwlMfTXQjjyYkhKKtTwsb9Fy+9HoVyq/Ehr6VoTteyh5eVxB6xHE0VTh1akXp7tRPj4jENy6YWuDFtnOUrZNka8w0oSqmMdvESdmfUopg0I+On1/PhZsOkJ7+DRTnD7Fb3mCpAGrPtoymPkjA1qxfiZ0WCYFXSxho1/+N6aP045tFno6CP86AjQsW6uyp9feFDkD8oIXp7kzA30rmsfWRQ8GZUD0yF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 18:28:10.2798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e8087a-8872-4836-30a2-08debb548a3c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8491
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 May 2026 18:28:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17537

0001: Replace unconditional removal of IS_CHROMEOS guards with targeted
IS_LINUX extension. This keeps the guards intact and avoids diverging
unnecessarily from upstream, while still enabling named device paths
(/dev/video-dec, /dev/video-enc) on generic Linux.

0002: Minor formatting fix.

0003: Replace the previous OUTPUT queue approach (hardcoded NV12 format
with MiB-based size calculation) with two smaller,cleaner fixes:
- Add an NV12 fallback in PickDecoderOutputFormat() for platforms where
  renderable_fourccs_ contains only display formats (e.g. AR24) and none
  match the decoder's CAPTURE candidates.
- Call SetFormat() on the CAPTURE queue in InitializeCAPTUREQueue() using
  the fourcc selected above with buffer_size=3D0, letting the driver comput=
e
  the correct buffer size.

0004: Set is_start_of_new_frame=3Dfalse for SPS/PPS NALUs to combine them
with the first frame for efficiency.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...se-ChromeOS-style-dev-paths-for-all-.patch | 71 +++++--------------
 ...dbox-Allow-GPU-sandbox-access-to-V4L.patch | 11 ++-
 ...2-Fix-OUTPUT-queue-streaming-in-V4L2.patch | 65 +++++++++--------
 ...void-placing-incomplete-H264-access-.patch | 30 ++++----
 4 files changed, 79 insertions(+), 98 deletions(-)

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland/0001-media-gpu-v4l2-Use-ChromeOS-=
style-dev-paths-for-all-.patch b/meta-arago-distro/dynamic-layers/chromium-=
browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0001-media-gp=
u-v4l2-Use-ChromeOS-style-dev-paths-for-all-.patch
index 2089b8d2..c05ff63b 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/0001-media-gpu-v4l2-Use-ChromeOS-style-d=
ev-paths-for-all-.patch
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/0001-media-gpu-v4l2-Use-ChromeOS-style-d=
ev-paths-for-all-.patch
@@ -1,89 +1,56 @@
-From 262a19d57fccf1b27ede283398278b52820f4aae Mon Sep 17 00:00:00 2001
+From 7ccf158ac8742d3ffaaf9f39bc1b01108f4b88d4 Mon Sep 17 00:00:00 2001
 From: Thorsten Lannynd <t-lannynd@ti.com>
-Date: Fri, 5 Dec 2025 12:40:27 -0600
-Subject: [PATCH] media/gpu/v4l2: Use ChromeOS-style dev paths for all
- platforms
+Date: Sun, 17 May 2026 02:40:44 -0500
+Subject: [PATCH] media/gpu/v4l2: Extend ChromeOS-style dev paths to Linux
=20
 Upstream-Status: Inappropriate [embedded-specific,
   requires custom udev rules]
=20
-Remove platform-specific conditionals and standardize on ChromeOS device
-naming (/dev/video-dec, /dev/video-enc, etc) instead of generic /dev/video=
*.
-Reduces device scanning from 256 to 10 devices for improved enumeration sp=
eed.
+Extend the IS_CHROMEOS guards for device enumeration to also cover
+IS_LINUX. This standardizes on named device paths (/dev/video-dec,
+/dev/video-enc, etc.) instead of scanning up to 256 /dev/video* nodes,
+reducing enumeration from 256 to 10 candidates.
=20
 Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
 ---
- media/gpu/v4l2/v4l2_device.cc | 16 ----------------
- media/gpu/v4l2/v4l2_utils.cc  | 10 ----------
- 2 files changed, 26 deletions(-)
+ media/gpu/v4l2/v4l2_device.cc | 4 ++--
+ media/gpu/v4l2/v4l2_utils.cc  | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/media/gpu/v4l2/v4l2_device.cc b/media/gpu/v4l2/v4l2_device.cc
-index ea35d10be8..dee743ed48 100644
+index fecd6a9a70..5b56c87397 100644
 --- a/media/gpu/v4l2/v4l2_device.cc
 +++ b/media/gpu/v4l2/v4l2_device.cc
-@@ -874,20 +874,11 @@ void V4L2Device::CloseDevice() {
+@@ -861,7 +861,7 @@ void V4L2Device::CloseDevice() {
  }
=20
  void V4L2Device::EnumerateDevicesForType(Type type) {
 -#if BUILDFLAG(IS_CHROMEOS)
++#if BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX)
    static const std::string kDecoderDevicePattern =3D "/dev/video-dec";
    static const std::string kEncoderDevicePattern =3D "/dev/video-enc";
    static const std::string kImageProcessorDevicePattern =3D "/dev/image-p=
roc";
-   static const std::string kJpegDecoderDevicePattern =3D "/dev/jpeg-dec";
-   static const std::string kJpegEncoderDevicePattern =3D "/dev/jpeg-enc";
--#else
--  static const std::string kDecoderDevicePattern =3D "/dev/video";
--  static const std::string kEncoderDevicePattern =3D "/dev/video";
--  static const std::string kImageProcessorDevicePattern =3D "/dev/video";
--  static const std::string kJpegDecoderDevicePattern =3D "/dev/video";
--  static const std::string kJpegEncoderDevicePattern =3D "/dev/video";
--#endif
--
-   std::string device_pattern;
-   v4l2_buf_type input_buf_type;
-   v4l2_buf_type output_buf_type;
-@@ -924,19 +915,12 @@ void V4L2Device::EnumerateDevicesForType(Type type) =
{
+@@ -911,7 +911,7 @@ void V4L2Device::EnumerateDevicesForType(Type type) {
    // We are sandboxed, so we can't query directory contents to check whic=
h
    // devices are actually available. Try to open the first 10; if not pre=
sent,
    // we will just fail to open immediately.
 -#if BUILDFLAG(IS_CHROMEOS)
++#if BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX)
    constexpr int kMaxDevices =3D 10;
    candidate_paths.reserve(kMaxDevices + 1);
=20
-   // TODO(posciak): Remove this legacy unnumbered device once
-   // all platforms are updated to use numbered devices.
-   candidate_paths.push_back(device_pattern);
--#else
--  // On mainline Linux we need to check a much larger number of devices, =
mainly
--  // because the device pattern is shared with ISP devices.
--  constexpr int kMaxDevices =3D 256;
--  candidate_paths.reserve(kMaxDevices);
--#endif
-   for (int i =3D 0; i < kMaxDevices; ++i) {
-     candidate_paths.push_back(
-         base::StringPrintf("%s%d", device_pattern.c_str(), i));
 diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
-index d4cac5573c..50d720a365 100644
+index 94b2e3cfe8..039851c5a2 100644
 --- a/media/gpu/v4l2/v4l2_utils.cc
 +++ b/media/gpu/v4l2/v4l2_utils.cc
-@@ -583,18 +583,8 @@ std::optional<SupportedVideoDecoderConfigs> GetSuppor=
tedV4L2DecoderConfigs() {
+@@ -577,7 +577,7 @@ std::optional<SupportedVideoDecoderConfigs> GetSupport=
edV4L2DecoderConfigs() {
    SupportedVideoDecoderConfigs supported_media_configs;
    std::vector<std::string> candidate_paths;
=20
 -#if BUILDFLAG(IS_CHROMEOS)
++#if BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX)
    constexpr char kVideoDevicePattern[] =3D "/dev/video-dec0";
    candidate_paths.push_back(kVideoDevicePattern);
--#else
--  constexpr char kVideoDevicePattern[] =3D "/dev/video";
--  constexpr int kMaxDevices =3D 256;
--  candidate_paths.reserve(kMaxDevices);
--  for (int i =3D 0; i < kMaxDevices; ++i) {
--    candidate_paths.push_back(
--        base::StringPrintf("%s%d", kVideoDevicePattern, i));
--  }
--#endif
-
-   for (const auto& path : candidate_paths) {
-     base::ScopedFD device_fd(
+ #else
 --
 2.34.1
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland/0002-chromium-gpu-sandbox-Allow-G=
PU-sandbox-access-to-V4L.patch b/meta-arago-distro/dynamic-layers/chromium-=
browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0002-chromium=
-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch
index a51fa322..b2490883 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/0002-chromium-gpu-sandbox-Allow-GPU-sand=
box-access-to-V4L.patch
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/0002-chromium-gpu-sandbox-Allow-GPU-sand=
box-access-to-V4L.patch
@@ -1,4 +1,4 @@
-From d6a8f091cebd265c0f7f681173d2aa218a0b89cd Mon Sep 17 00:00:00 2001
+From c31cb261202bc96d9a0581c3efdba5279acc04ef Mon Sep 17 00:00:00 2001
 From: Thorsten Lannynd <t-lannynd@ti.com>
 Date: Thu, 5 Mar 2026 12:02:31 -0600
 Subject: [PATCH] chromium: gpu: sandbox: Allow GPU sandbox access to V4L2
@@ -17,18 +17,17 @@ Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
=20
 diff --git a/content/common/gpu_pre_sandbox_hook_linux.cc b/content/common=
/gpu_pre_sandbox_hook_linux.cc
-index 2e53794fa3..9dec7fa08b 100644
+index 2e53794fa3..e2facce9da 100644
 --- a/content/common/gpu_pre_sandbox_hook_linux.cc
 +++ b/content/common/gpu_pre_sandbox_hook_linux.cc
-@@ -627,13 +627,14 @@ std::vector<BrokerFilePermission> FilePermissionsFor=
Gpu(
-       BrokerFilePermission::ReadOnly(kDriRcPath)};
+@@ -628,12 +628,13 @@ std::vector<BrokerFilePermission> FilePermissionsFor=
Gpu(
=20
    AddVulkanICDPermissions(&permissions);
-+
+
 +  if (UseV4L2Codec(options)) {
 +      AddV4L2GpuPermissions(&permissions, options);
 +  }
-
++
    if (IsChromeOS()) {
      // Permissions are additive, there can be multiple GPUs in the system=
.
      AddStandardChromeOsPermissions(&permissions);
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland/0003-chromium-gpu-v4l2-Fix-OUTPUT=
-queue-streaming-in-V4L2.patch b/meta-arago-distro/dynamic-layers/chromium-=
browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0003-chromium=
-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch
index 0a6c0f95..fe9e52ca 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-=
streaming-in-V4L2.patch
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-=
streaming-in-V4L2.patch
@@ -1,12 +1,19 @@
-From d1d9bcefa8fd299049e6e51855f41b67b27823ed Mon Sep 17 00:00:00 2001
+From dd6b0301aa61a2d1440f1edc7f836f2612f9270f Mon Sep 17 00:00:00 2001
 From: Thorsten Lannynd <t-lannynd@ti.com>
-Date: Sat, 9 Aug 2025 01:46:14 -0500
+Date: Sun, 17 May 2026 02:29:10 -0500
 Subject: [PATCH] media/gpu/v4l2: Fix OUTPUT queue streaming in
  V4L2StatefulVideoDecoder
=20
 Upstream-Status: Inappropriate [this change is needed to satisfy
 Wave5 conditions, which isn't applicable upstream]
=20
+PickDecoderOutputFormat: Fall back to NV12 when no renderable format
+matches decoder candidates.
+
+InitializeCAPTUREQueue: Call SetFormat() on the CAPTURE queue using
+the fourcc selected by PickDecoderOutputFormat. Pass buffer_size=3D0
+so the driver calculates the correct size.
+
 This patch ensures that the OUTPUT queue in `V4L2StatefulVideoDecoder`
 is properly checked and started before attempting to enqueue buffers.
 Wave5 requires buffers to be enqueued before streaming.
@@ -15,23 +22,35 @@ It adds a check for `IsStreaming()` and attempts to sta=
rt streaming
 with `Streamon()` if necessary. This prevents potential failures
 during video decoding initialization.
=20
-`SetFormat()` needs to be called on the CAPTURE queue to ensure
-the raw output frames are in the correct pixel format and picture
-size.
-
 These changes rely on appropriate udev rules when running on a generic
 Linux distribution to set the correct device node names.
=20
 Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
 ---
- media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 32 +++++++++++++------
- 1 file changed, 23 insertions(+), 9 deletions(-)
+ media/gpu/chromeos/video_decoder_pipeline.cc  |  4 ++++
+ media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 22 ++++++++++++-------
+ 2 files changed, 18 insertions(+), 8 deletions(-)
=20
+diff --git a/media/gpu/chromeos/video_decoder_pipeline.cc b/media/gpu/chro=
meos/video_decoder_pipeline.cc
+index 742c94d7a0..b133147bc3 100644
+--- a/media/gpu/chromeos/video_decoder_pipeline.cc
++++ b/media/gpu/chromeos/video_decoder_pipeline.cc
+@@ -1148,6 +1148,10 @@ VideoDecoderPipeline::PickDecoderOutputFormat(
+   // Only tested with video_decode_accelerator_tests
+   // TODO(wenst@) Test with full Chromium Browser
+   CHECK(!allocator.has_value());
++  if (!viable_candidate && !candidates.empty()) {
++    viable_candidate =3D
++        PixelLayoutCandidate{Fourcc(Fourcc::NV12), candidates.front().siz=
e};
++  }
+   if (viable_candidate) {
+     // Instead, let V4L2 allocate the buffers if it can decode directly
+     // to the preferred formats. There's no need to allocate frames.
 diff --git a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc b/media/gpu/v4l=
2/v4l2_stateful_video_decoder.cc
-index 359145244d..e3aeb060c2 100644
+index b5d28d9a86..79c880f365 100644
 --- a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
 +++ b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
-@@ -417,10 +417,6 @@ void V4L2StatefulVideoDecoder::Initialize(const Video=
DecoderConfig& config,
+@@ -412,10 +412,6 @@ void V4L2StatefulVideoDecoder::Initialize(const Video=
DecoderConfig& config,
      std::move(init_cb).Run(DecoderStatus::Codes::kFailedToCreateDecoder);
      return;
    }
@@ -42,7 +61,7 @@ index 359145244d..e3aeb060c2 100644
    client_->NotifyEstimatedMaxDecodeRequests(base::checked_cast<int>(
        std::min(static_cast<size_t>(4), num_input_buffers)));
=20
-@@ -525,10 +521,22 @@ void V4L2StatefulVideoDecoder::Decode(scoped_refptr<=
DecoderBuffer> buffer,
+@@ -520,10 +516,15 @@ void V4L2StatefulVideoDecoder::Decode(scoped_refptr<=
DecoderBuffer> buffer,
                                            std::move(decode_cb));
    }
=20
@@ -54,33 +73,23 @@ index 359145244d..e3aeb060c2 100644
 +    TryAndEnqueueOUTPUTQueueBuffers();
 +    if(!OUTPUT_queue_->Streamon()) {
 +      VLOG(1) << "Failed to start OUTPUT queue streaming";
-+      while (!decoder_buffer_and_callbacks_.empty()) {
-+        auto cb =3D std::move(decoder_buffer_and_callbacks_.front().secon=
d);
-+        decoder_buffer_and_callbacks_.pop();
-+        std::move(cb).Run(DecoderStatus::Codes::kFailed);
-+      }
 +      return;
 +    }
-+    client_->NotifyEstimatedMaxDecodeRequests(base::checked_cast<int>(
-+        std::min(static_cast<size_t>(4), OUTPUT_queue_->AllocatedBuffersC=
ount())));
 +  }
 +  else {
 +    TryAndEnqueueOUTPUTQueueBuffers();
    }
=20
    if (!event_task_runner_) {
-@@ -743,7 +751,13 @@ bool V4L2StatefulVideoDecoder::InitializeCAPTUREQueue=
() {
-   auto chosen_fourcc =3D output_format.fourcc;
+@@ -739,6 +740,11 @@ bool V4L2StatefulVideoDecoder::InitializeCAPTUREQueue=
() {
    const auto chosen_size =3D output_format.size;
    const auto chosen_modifier =3D output_format.modifier;
--
-+  VLOG(1) << "Chosen |CAPTURE_queue_| format: " << chosen_fourcc.ToString=
() << " " << chosen_size.ToString() << " (modifier: 0x" << std::hex << chos=
en_modifier;
-+  constexpr size_t kMiB =3D 1024 * 1024;
-+  constexpr int kFullHDNumPixels =3D 1920 * 1080;
-+  const size_t kInputBufferInMBs =3D
-+      (chosen_size.GetArea() <=3D kFullHDNumPixels) ? 2 : 4;
-+  const auto capture_format =3D CAPTURE_queue_->SetFormat(
-+      V4L2_PIX_FMT_NV12, chosen_size, kInputBufferInMBs * kMiB);
+
++  if (!CAPTURE_queue_->SetFormat(chosen_fourcc.ToV4L2PixFmt(), chosen_siz=
e, /*buffer_size=3D*/0)
++           .has_value()) {
++    return false;
++  }
++
    // If our |client_| has a VideoFramePool to allocate buffers for us, we=
'll
    // use it, otherwise we have to ask the driver.
    const bool use_v4l2_allocated_buffers =3D !client_->GetVideoFramePool()=
;
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland/0004-media-gpu-v4l2-Avoid-placing=
-incomplete-H264-access-.patch b/meta-arago-distro/dynamic-layers/chromium-=
browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0004-media-gp=
u-v4l2-Avoid-placing-incomplete-H264-access-.patch
index caa61545..85450547 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/0004-media-gpu-v4l2-Avoid-placing-incomp=
lete-H264-access-.patch
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/0004-media-gpu-v4l2-Avoid-placing-incomp=
lete-H264-access-.patch
@@ -1,8 +1,8 @@
-From 942c5f57d34c2d1b077240147bb29be84c773e62 Mon Sep 17 00:00:00 2001
+From b6f490b43eebcc8aad7f9fecc01e4d59e827d547 Mon Sep 17 00:00:00 2001
 From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
 Date: Wed, 11 Jun 2025 11:07:05 +0300
-Subject: [PATCH] media/gpu/v4l2: Avoid placing incomplete H264 access unit=
s in
- buffers
+Subject: [PATCH] media/gpu/v4l2: Avoid placing incomplete H264 access
+ units in buffers
=20
 Upstream-Status: Pending
=20
@@ -10,39 +10,45 @@ Don't place SPS, PPS, etc NALUs in their own separate b=
uffers
 unconditionally, as they are not full access units by themselves,
 and may confuse the decoder.
 ---
- media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ media/gpu/v4l2/v4l2_stateful_video_decoder.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
=20
 diff --git a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc b/media/gpu/v4l=
2/v4l2_stateful_video_decoder.cc
-index e3aeb060c2..3657bc1d36 100644
+index 79c880f365..d29cef84d7 100644
 --- a/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
 +++ b/media/gpu/v4l2/v4l2_stateful_video_decoder.cc
-@@ -1342,7 +1342,7 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
+@@ -1332,8 +1332,8 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
            return std::nullopt;
          }
          previous_slice_header_.reset();
 -        return FrameBoundaryInfo{.is_whole_frame =3D true,
+-                                 .is_start_of_new_frame =3D true,
 +        return FrameBoundaryInfo{.is_whole_frame =3D false,
-                                  .is_start_of_new_frame =3D true,
++                                 .is_start_of_new_frame =3D false,
                                   .nalu_size =3D nalu_size};
        case H264NALU::kPPS:
-@@ -1352,7 +1352,7 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
+         result =3D h264_parser_.ParsePPS(&pps_id_);
+@@ -1342,8 +1342,8 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
            return std::nullopt;
          }
          previous_slice_header_.reset();
 -        return FrameBoundaryInfo{.is_whole_frame =3D true,
+-                                 .is_start_of_new_frame =3D true,
 +        return FrameBoundaryInfo{.is_whole_frame =3D false,
-                                  .is_start_of_new_frame =3D true,
++                                 .is_start_of_new_frame =3D false,
                                   .nalu_size =3D nalu_size};
        case H264NALU::kNonIDRSlice:
-@@ -1391,7 +1391,7 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
+       case H264NALU::kIDRSlice: {
+@@ -1381,8 +1381,8 @@ H264FrameReassembler::FindH264FrameBoundary(const ui=
nt8_t* const data,
        case H264NALU::kReserved18:
          // Anything else than SPS, PPS and Non/IDRs marks a new frame bou=
ndary.
          previous_slice_header_.reset();
 -        return FrameBoundaryInfo{.is_whole_frame =3D true,
+-                                 .is_start_of_new_frame =3D true,
 +        return FrameBoundaryInfo{.is_whole_frame =3D false,
-                                  .is_start_of_new_frame =3D true,
++                                 .is_start_of_new_frame =3D false,
                                   .nalu_size =3D nalu_size};
        default:
+         VLOGF(4) << "Unsupported NALU "
 --
 GitLab
--=20
2.34.1


