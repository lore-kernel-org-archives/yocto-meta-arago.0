Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 08CBF52ABA
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 21:27:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29LRl1v008507
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489094868;
	bh=EjFokNd8bkyoNz6VIMNBtliWKBfvB7mSz/AcFeI2G4A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gfLQ494rhY0Z+H5s3qj0zIVA+0NqJPy9ncMapZuuFEP7E8oCnidIBBOZwX4D73yLz
	suVpBzrbtuqbuuXdB9eqqnr3vachRUe4Uzyyl3pd1FbCCm+PbU/qoKqUSCtcNjmdQW
	LaGUi9hdHQUlf2whK85auvzm52bIOwpJn42dUzl4=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29LRlPg021911
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 15:27:47 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v29LRfEt025736	for <meta-arago@arago-project.org>;
	Thu, 9 Mar 2017 15:27:47 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 16:27:37 -0500
Message-ID: <1489094857-27497-6-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
References: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty][PATCH V2 5/5] weston: add RGB565 support for pixman renderer
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
X-List-Received-Date: Thu, 09 Mar 2017 21:27:48 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...positor-drm-support-RGB565-with-pixman-renderer.patch | 16 ++++++++--------
 .../recipes-graphics/wayland/weston_1.11.0.bbappend      |  3 ++-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
index add2b48..0d77f52 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
@@ -1,6 +1,6 @@
-From 4d81723304c8260a295ed8be50e9b6cc6cc45543 Mon Sep 17 00:00:00 2001
+From 91b452fa515b94928d32af6e1b1b0405469747fd Mon Sep 17 00:00:00 2001
 From: Tomi Valkeinen <tomi.valkeinen@ti.com>
-Date: Sat, 13 Aug 2016 21:30:23 -0400
+Date: Wed, 8 Mar 2017 13:05:38 -0500
 Subject: [PATCH] compositor-drm: support RGB565 with pixman renderer
 
 At the moment only XRGB8888 is supported when using pixman renderer.
@@ -15,10 +15,10 @@ Signed-off-by: Daniel Stone <daniels@collabora.com>
  1 file changed, 55 insertions(+), 7 deletions(-)
 
 diff --git a/src/compositor-drm.c b/src/compositor-drm.c
-index a06c98a..6485b39 100644
+index fd89627..443b69a 100644
 --- a/src/compositor-drm.c
 +++ b/src/compositor-drm.c
-@@ -270,10 +270,12 @@ drm_fb_destroy_callback(struct gbm_bo *bo, void *data)
+@@ -262,10 +262,12 @@ drm_fb_destroy_callback(struct gbm_bo *bo, void *data)
  }
  
  static struct drm_fb *
@@ -32,7 +32,7 @@ index a06c98a..6485b39 100644
  
  	struct drm_mode_create_dumb create_arg;
  	struct drm_mode_destroy_dumb destroy_arg;
-@@ -283,8 +285,20 @@ drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
+@@ -275,8 +277,20 @@ drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
  	if (!fb)
  		return NULL;
  
@@ -54,7 +54,7 @@ index a06c98a..6485b39 100644
  	create_arg.width = width;
  	create_arg.height = height;
  
-@@ -297,8 +311,29 @@ drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
+@@ -289,8 +303,29 @@ drm_fb_create_dumb(struct drm_backend *b, unsigned width, unsigned height)
  	fb->size = create_arg.size;
  	fb->fd = b->drm.fd;
  
@@ -86,11 +86,11 @@ index a06c98a..6485b39 100644
  	if (ret)
  		goto err_bo;
  
-@@ -1874,17 +1909,30 @@ drm_output_init_pixman(struct drm_output *output, struct drm_backend *b)
+@@ -1879,17 +1914,30 @@ drm_output_init_pixman(struct drm_output *output, struct drm_backend *b)
  {
  	int w = output->base.current_mode->width;
  	int h = output->base.current_mode->height;
-+	uint32_t format = output->format;
++	uint32_t format = output->gbm_format;
 +	uint32_t pixman_format;
  	unsigned int i;
  
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index 55484b7..f8329c8 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago21"
+PR_append = ".arago22"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -15,4 +15,5 @@ SRC_URI += " \
 	file://0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
 	file://0004-Weston-Fix-touch-screen-crash-issue.patch \
 	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
+	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
 "
-- 
1.9.1


