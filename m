Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EA254529F6
	for <meta-arago@arago-project.org>;
	Fri, 17 Jan 2020 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A9F5E40C2D;
	Fri, 17 Jan 2020 21:03:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KCruaGnVkGRN; Fri, 17 Jan 2020 21:03:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89D0D40C2B;
	Fri, 17 Jan 2020 21:03:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 49F7817439E;
	Fri, 17 Jan 2020 16:03:15 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 17 Jan 2020 16:03:15 -0500
Message-Id: <1579294995-2988-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] chromium-wayland: remove deprecated chromium-wayland customizations/patches
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2020 21:05:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...t-paths-in-headers-to-include-libva-prefi.patch | 67 ----------------------
 ...-adjust-Mesa-version-to-work-with-TI-SGX-.patch | 27 ---------
 .../chromium/chromium-wayland_%.bbappend           | 12 ----
 3 files changed, 106 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-libva-adjust-paths-in-headers-to-include-libva-prefi.patch
 delete mode 100644 meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-wayland.gyp-adjust-Mesa-version-to-work-with-TI-SGX-.patch
 delete mode 100644 meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend

diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-libva-adjust-paths-in-headers-to-include-libva-prefi.patch b/meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-libva-adjust-paths-in-headers-to-include-libva-prefi.patch
deleted file mode 100644
index c9013cc..0000000
--- a/meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-libva-adjust-paths-in-headers-to-include-libva-prefi.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 1d875e3526357f6d2bb66ee07605f4d4271d5710 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 7 Mar 2017 15:22:41 -0500
-Subject: [PATCH] libva: adjust paths in headers to include libva prefix
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- third_party/libva/va/va.h          | 22 +++++++++++-----------
- third_party/libva/va/va_dec_jpeg.h |  2 +-
- 2 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/third_party/libva/va/va.h b/third_party/libva/va/va.h
-index 88fde4e..10b2e0b 100644
---- a/third_party/libva/va/va.h
-+++ b/third_party/libva/va/va.h
-@@ -80,7 +80,7 @@
- 
- #include <stddef.h>
- #include <stdint.h>
--#include <va/va_version.h>
-+#include <libva/va/va_version.h>
- 
- #ifdef __cplusplus
- extern "C" {
-@@ -2836,16 +2836,16 @@ typedef struct _VAPictureHEVC
-  */
- #define VA_PICTURE_HEVC_RPS_LT_CURR             0x00000040
- 
--#include <va/va_dec_hevc.h>
--#include <va/va_dec_jpeg.h>
--#include <va/va_dec_vp8.h>
--#include <va/va_dec_vp9.h>
--#include <va/va_enc_hevc.h>
--#include <va/va_enc_h264.h>
--#include <va/va_enc_jpeg.h>
--#include <va/va_enc_mpeg2.h>
--#include <va/va_enc_vp8.h>
--#include <va/va_vpp.h>
-+#include <libva/va/va_dec_hevc.h>
-+#include <libva/va/va_dec_jpeg.h>
-+#include <libva/va/va_dec_vp8.h>
-+#include <libva/va/va_dec_vp9.h>
-+#include <libva/va/va_enc_hevc.h>
-+#include <libva/va/va_enc_h264.h>
-+#include <libva/va/va_enc_jpeg.h>
-+#include <libva/va/va_enc_mpeg2.h>
-+#include <libva/va/va_enc_vp8.h>
-+#include <libva/va/va_vpp.h>
- 
- /**@}*/
- 
-diff --git a/third_party/libva/va/va_dec_jpeg.h b/third_party/libva/va/va_dec_jpeg.h
-index 644ce3b..c177aef 100644
---- a/third_party/libva/va/va_dec_jpeg.h
-+++ b/third_party/libva/va/va_dec_jpeg.h
-@@ -36,7 +36,7 @@
- extern "C" {
- #endif
- 
--#include <va/va.h>
-+#include <libva/va/va.h>
- 
- /**
-  * \defgroup api_dec_jpeg JPEG decoding API
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-wayland.gyp-adjust-Mesa-version-to-work-with-TI-SGX-.patch b/meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-wayland.gyp-adjust-Mesa-version-to-work-with-TI-SGX-.patch
deleted file mode 100644
index 5e8798a..0000000
--- a/meta-arago-distro/recipes-browser/chromium/chromium-wayland/0001-wayland.gyp-adjust-Mesa-version-to-work-with-TI-SGX-.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 17457ecbe62d174ad5b7e88f5dcdd2497540c0d9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 6 Mar 2017 20:15:37 -0500
-Subject: [PATCH] wayland.gyp: adjust Mesa version to work with TI SGX EGL
- provider
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- ozone/wayland/wayland.gyp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wayland/wayland.gyp b/wayland/wayland.gyp
-index ff2e210..933cbc8 100644
---- a/ozone/wayland/wayland.gyp
-+++ b/ozone/wayland/wayland.gyp
-@@ -24,7 +24,7 @@
-       'type': 'static_library',
-       'variables': {
-         'WAYLAND_VERSION': '1.4.0',
--        'MESA_VERSION': '9.1.3',
-+        'MESA_VERSION': '8.14',
-         'wayland_packages': [
-           'egl >= <(MESA_VERSION)',
-           'wayland-client >= <(WAYLAND_VERSION)',
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend b/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
deleted file mode 100644
index 923db03..0000000
--- a/meta-arago-distro/recipes-browser/chromium/chromium-wayland_%.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-OZONE_WAYLAND_EXTRA_PATCHES = " \
-	file://0001-wayland.gyp-adjust-Mesa-version-to-work-with-TI-SGX-.patch \
-	file://0001-libva-adjust-paths-in-headers-to-include-libva-prefi.patch \
-"
-
-USEGOLD = ""
-
-DEPENDS += "gperf-native bison-native"
-
-FULL_OPTIMIZATION = "-O2 -pipe"
-- 
2.7.4


