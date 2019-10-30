Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8B4AF52A31
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 19:57:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtvxd122947
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572465357;
	bh=5LLlhZjYO/sS8uFbC66qM7YtR+rrOY9Ul9ZlZLPqW8w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=rHic3fgLXMK0qyxHTAe0g3FFp9XKnuf+rme1Y8NwjljHOBIYz8V/0Yd1pIvnQBFcf
	gJXE9/45Syow16WxqoI64FT0/9RX79WcFKmZVC/6sehncPHnyFBX6imv1v9hbzgtZo
	B2fZfYpdpUKRKWuLWijAsu5QD1JxtDqs012ZMXnA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UJtvTZ026252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 14:55:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 14:55:44 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtuwo112935
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 15:55:46 -0400
Message-ID: <20191030195550.17767-4-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030195550.17767-1-e-ruei1@ti.com>
References: <20191030195550.17767-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 3/7] HACK: weston: undefine HAVE_GBM_MODIFIERS explicitly
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
X-List-Received-Date: Wed, 30 Oct 2019 19:57:20 -0000
Content-Type: text/plain

This hack is required tentatively until GBM_MODIFIERS is fully supported
by Mesa-based EGL.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...rm-undef-HAVE_GBM_MODIFIERS-explicit.patch | 31 +++++++++++++++++++
 .../wayland/weston_5.0.0.bbappend             |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch
new file mode 100644
index 00000000..0c1b3b94
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch
@@ -0,0 +1,31 @@
+From fb7f77c7b039344f736c77fe85b68f0f49083fae Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Sun, 1 Sep 2019 08:28:27 -0400
+Subject: [PATCH] HACK: composito-drm: undef HAVE_GBM_MODIFIERS explicitly
+
+GBM_MODIFIERS is expected for Mesa/gbm 19.1.6, but is not fully supported
+yet.
+
+Upstream-Status: Inappropriate [tentative workaround only]
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ libweston/compositor-drm.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
+index d92ecfcd..88f845a8 100644
+--- a/libweston/compositor-drm.c
++++ b/libweston/compositor-drm.c
+@@ -68,6 +68,8 @@
+ #include "linux-dmabuf-unstable-v1-server-protocol.h"
+ #include "linux-explicit-synchronization.h"
+ 
++#undef HAVE_GBM_MODIFIERS
++
+ #ifndef DRM_CLIENT_CAP_ASPECT_RATIO
+ #define DRM_CLIENT_CAP_ASPECT_RATIO	4
+ #endif
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
index 1bdcf7e4..edb4b54c 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/libgbm mtdev"
 
-PR_append = ".arago34"
+PR_append = ".arago35"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -26,6 +26,7 @@ SRC_URI += " \
         file://0011-compositor-Add-scene-graph-debug-scope.patch \
         file://0012-compositor-drm-Add-backend-pointer-to-drm_output.patch \
         file://0013-compositor-drm-Add-drm-backend-log-debug-scope.patch \
+	file://0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch \
 "
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.17.1


