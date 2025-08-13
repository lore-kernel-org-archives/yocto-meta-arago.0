Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4E7CA0EE5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:52:01 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1530.1755103914276698342
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 09:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IJPDNkjE;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: t-lannynd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DGprLc2191838
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755103913;
	bh=mbXC3A+utcHNR1ntsucVr5UVqO4UWYi0kBv7XaTLicA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IJPDNkjEKznmTM/Q1H7JlP54k7tMMCSg57xxxWYzB2l13uxa8e9jwQco5QFlwf44A
	 kVI4hIHSlws7+//1OXE2+zJ7z7TwqP7kAi7XJYyzlttKX7oFStoB0qIFKnvLDLwHvh
	 12CHx7d6n07G8KmM2rzcLP/OLNstRRRYX/bRqesM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DGpred527027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 11:51:53 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 11:51:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 11:51:53 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DGpoA02292823;
	Wed, 13 Aug 2025 11:51:53 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 2/5] meta-arago-distro: chromium: enable V4L2 stateful decoder
Date: Wed, 13 Aug 2025 11:51:45 -0500
Message-ID: <20250813165148.220012-3-t-lannynd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16363

Add patch that enables the V4L2 stateful decoder in Chromium
by making sure that Chromium is opening the right V4L2
device path for Linux.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...pu-v4l2-enable-V4L2-stateful-decoder.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
new file mode 100644
index 00000000..ca94d2ab
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-132.0.6834.83/0002-chromium-gpu-v4l2-enable-V4L2-stateful-decoder.patch
@@ -0,0 +1,34 @@
+From c9a81537eb0bc1f11ea902cb9abe4d98b7be74a9 Mon Sep 17 00:00:00 2001
+From: Thorsten Lannynd <t-lannynd@ti.com>
+Date: Thu, 7 Aug 2025 14:48:31 -0500
+Subject: [PATCH] chromium: gpu: v4l2: enable V4L2 stateful decoder
+
+Upstream-Status: Pending
+
+Setting the video device path to /dev/video0 for linux allows
+Chromium to find the decoder and also check that it is stateful.
+This patch setups the correct V4L2 pipeline.
+
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ media/gpu/v4l2/v4l2_utils.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/media/gpu/v4l2/v4l2_utils.cc b/media/gpu/v4l2/v4l2_utils.cc
+index 9646e8be73..8bc88e938f 100644
+--- a/media/gpu/v4l2/v4l2_utils.cc
++++ b/media/gpu/v4l2/v4l2_utils.cc
+@@ -633,7 +633,11 @@ std::optional<SupportedVideoDecoderConfigs> GetSupportedV4L2DecoderConfigs() {
+ }
+
+ bool IsV4L2DecoderStateful() {
++#if BUILDFLAG(IS_LINUX)
++  constexpr char kVideoDeviceDriverPath[] = "/dev/video0";
++#else
+   constexpr char kVideoDeviceDriverPath[] = "/dev/video-dec0";
++#endif
+   base::ScopedFD device_fd(HANDLE_EINTR(
+       open(kVideoDeviceDriverPath, O_RDWR | O_NONBLOCK | O_CLOEXEC)));
+   if (!device_fd.is_valid()) {
+--
+2.34.1

