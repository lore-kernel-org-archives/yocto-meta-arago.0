Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDC1C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 20:13:43 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.21613.1737663217464407342
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 12:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ifRCZfL4;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: detheridge@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NKDaFW437913
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 14:13:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737663216;
	bh=FSTmwjJhvIuuVSVYsE1rOaH2nPrpJ3kPGeh90FczVdY=;
	h=From:To:Subject:Date;
	b=ifRCZfL4fQFHIEXDWwI7boDzn1RVgsS23vwetH05it5ar2ZA5RIVmKGE2wILJWWJJ
	 LJ0InSz5kcQVb5qoaEAzXCKl+x1aOofWzsMQWTl7Con7Fuq+PP3EPP3bnrlA2LMSjT
	 TlzYk0Q7+ht4ZagwLx7Ou4BQ+tRb4qBSwbgebFO8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NKDaqv021751
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 14:13:36 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 14:13:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 14:13:36 -0600
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NKDa4c031777;
	Thu, 23 Jan 2025 14:13:36 -0600
From: Darren Etheridge <detheridge@ti.com>
To: <rs@ti.com>, <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-distro: chromium: upgrade to 130.0.6723.91
Date: Thu, 23 Jan 2025 14:13:29 -0600
Message-ID: <20250123201329.2813794-1-detheridge@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 20:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15746

Upgrade the recipe to chromium v130.0.6723.91 to do this we needed to
drop a patch that is now in upstream Chromium, and also remove the
command line switch adjustment that is also now the default
in meta-browser yocto layer for Chromium startup.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---

This needs to be applied along with the update for the meta-browser
layer config.


 ...stream-fix-incorrect-size-allocation.patch | 79 -------------------
 ...dbox-allow-access-to-PowerVR-GPU-fro.patch |  0
 ...mium-ozone-wayland_130.0.6723.91.bbappend} |  4 -
 3 files changed, 83 deletions(-)
 delete mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0002-upstream-fix-incorrect-size-allocation.patch
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland-123.0.6312.122 => chromium-ozone-wayland-130.0.6723.91}/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch (100%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland_123.0.6312.122.bbappend => chromium-ozone-wayland_130.0.6723.91.bbappend} (55%)

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0002-upstream-fix-incorrect-size-allocation.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0002-upstream-fix-incorrect-size-allocation.patch
deleted file mode 100644
index 00f52eb7..00000000
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0002-upstream-fix-incorrect-size-allocation.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 7efb6857a17195f08b609129e92732e19aa1d54c Mon Sep 17 00:00:00 2001
-From: Reito <carolwolfking@gmail.com>
-Date: Sat, 09 Mar 2024 12:23:57 +0000
-Subject: [PATCH] fix: Use correct size when GbmBuffer::CreateBufferWithModifiers
-
-Upstream-Status: Backport [https://chromium.googlesource.com/chromium/src/+/7efb6857a17195f08b609129e92732e19aa1d54c]
-
-CreateBufferWithModifiers currently uses the wrong size used for
-verification when creating gfx::Buffer, which can be different
-(1x1) from the real size on linux due to a bug in nvidia driver.
-Use real size when creating gfx::Buffer instead.
-
-Bug: 327768768
-Change-Id: Ic3e619bd1dd5afd050c1f5a76f73638c6f350da3
-Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5338184
-Reviewed-by: Mitsuru Oshima <oshima@chromium.org>
-Reviewed-by: Nick Yamane <nickdiego@igalia.com>
-Commit-Queue: Reito OvO <carolwolfking@gmail.com>
-Cr-Commit-Position: refs/heads/main@{#1270603}
----
-
-diff --git a/ui/gfx/linux/gbm_wrapper.cc b/ui/gfx/linux/gbm_wrapper.cc
-index c0dfe4fd..58c3c0b 100644
---- a/ui/gfx/linux/gbm_wrapper.cc
-+++ b/ui/gfx/linux/gbm_wrapper.cc
-@@ -312,7 +312,7 @@
-     // do the create/import modifiers validation loop below using a separate set
-     // of 1x1 BOs which are destroyed before creating the final BO creation used
-     // to instantiate the returned GbmBuffer.
--    gfx::Size size =
-+    gfx::Size size_for_verification =
- #if BUILDFLAG(IS_LINUX)
-         gfx::Size(1, 1);
- #else
-@@ -324,16 +324,18 @@
-
-     while (!valid_modifiers && !filtered_modifiers.empty()) {
-       created_bo = gbm_bo_create_with_modifiers(
--          device_, size.width(), size.height(), format,
--          filtered_modifiers.data(), filtered_modifiers.size());
-+          device_, size_for_verification.width(),
-+          size_for_verification.height(), format, filtered_modifiers.data(),
-+          filtered_modifiers.size());
-       if (!created_bo) {
-         return nullptr;
-       }
-
-       const int planes_count = gbm_bo_get_plane_count(created_bo);
-       struct gbm_import_fd_modifier_data fd_data = {
--          .width = base::checked_cast<uint32_t>(size.width()),
--          .height = base::checked_cast<uint32_t>(size.height()),
-+          .width = base::checked_cast<uint32_t>(size_for_verification.width()),
-+          .height =
-+              base::checked_cast<uint32_t>(size_for_verification.height()),
-           .format = format,
-           .num_fds = base::checked_cast<uint32_t>(planes_count),
-           .modifier = gbm_bo_get_modifier(created_bo)};
-@@ -358,7 +360,7 @@
-             GetFilteredModifiers(format, flags, filtered_modifiers);
-       }
-
--      if (!valid_modifiers || size != requested_size) {
-+      if (!valid_modifiers || size_for_verification != requested_size) {
-         gbm_bo_destroy(created_bo);
-         created_bo = nullptr;
-       }
-@@ -374,8 +376,10 @@
-       PLOG_IF(ERROR, !created_bo) << "Failed to create BO with modifiers.";
-     }
-
--    return created_bo ? CreateBufferForBO(created_bo, format, size, flags)
--                      : nullptr;
-+    // TODO(327768768): Add a test for this about size.
-+    return created_bo
-+               ? CreateBufferForBO(created_bo, format, requested_size, flags)
-+               : nullptr;
-   }
-
-   std::unique_ptr<ui::GbmBuffer> CreateBufferFromHandle(
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-130.0.6723.91/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-123.0.6312.122/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-130.0.6723.91/0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_123.0.6312.122.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
similarity index 55%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_123.0.6312.122.bbappend
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
index 3612228b..66cdd00a 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_123.0.6312.122.bbappend
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
@@ -2,10 +2,6 @@ PR:append = ".arago0"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
 
-CHROMIUM_EXTRA_ARGS:remove = " --use-gl=egl"
-CHROMIUM_EXTRA_ARGS:append = " --use-gl=angle"
-
 SRC_URI:append = " \
                   file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
-                  file://0002-upstream-fix-incorrect-size-allocation.patch \
                   "
-- 
2.34.1


