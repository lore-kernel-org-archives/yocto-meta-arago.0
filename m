Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A7726529DE
	for <meta-arago@arago-project.org>;
	Tue, 30 May 2017 18:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A8C5A208B1;
	Tue, 30 May 2017 18:26:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 37ilRzs9wOz6; Tue, 30 May 2017 18:26:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7ABF4207AF;
	Tue, 30 May 2017 18:26:46 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0202A1624D2;
	Tue, 30 May 2017 14:26:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 30 May 2017 14:26:45 -0400
Message-Id: <1496168805-23259-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [morty/master][PATCH] libdrm: add patches for tiler rotation and cma/tiler memory option
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
X-List-Received-Date: Tue, 30 May 2017 18:26:49 -0000

These will be upstreamed, when corresponding kernel changes land in mainline.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 ...1-omap-fix-omap_bo_size-for-tiled-buffers.patch | 41 +++++++++++++++
 ...OMAP_BO-flags-to-affect-buffer-allocation.patch | 59 ++++++++++++++++++++++
 .../recipes-graphics/drm/libdrm_%.bbappend         |  8 ++-
 3 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-omap_bo_size-for-tiled-buffers.patch
 create mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-omap_bo_size-for-tiled-buffers.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-omap_bo_size-for-tiled-buffers.patch
new file mode 100644
index 0000000..5234919
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-omap_bo_size-for-tiled-buffers.patch
@@ -0,0 +1,41 @@
+From 6554635378ef4c6ee5f1bf8521b1cf4fe7911fa1 Mon Sep 17 00:00:00 2001
+From: Tomi Valkeinen <tomi.valkeinen@ti.com>
+Date: Thu, 18 May 2017 12:18:28 +0300
+Subject: [PATCH 1/2] omap: fix omap_bo_size for tiled buffers
+
+The buffer size is calculated using pixels, not bytes as it should. The
+result is often correct, though, as the stride is aligned to page size,
+but there are still many cases where the size ends up being wrong.
+
+Fix this by not calculating the size at all, as in that case
+DRM_OMAP_GEM_INFO ioctl is used to get the correct size from the kernel.
+This is better in any case as then the userspace library doesn't need to
+know how the tiled buffers need to be aligned.
+
+Upstream-Status: Pending
+Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
+---
+ omap/omap_drm.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/omap/omap_drm.c b/omap/omap_drm.c
+index 08ba64e..a6f8a21 100644
+--- a/omap/omap_drm.c
++++ b/omap/omap_drm.c
+@@ -215,11 +215,9 @@ static struct omap_bo * omap_bo_new_impl(struct omap_device *dev,
+ 	bo = bo_from_handle(dev, req.handle);
+ 	pthread_mutex_unlock(&table_lock);
+ 
+-	if (flags & OMAP_BO_TILED) {
+-		bo->size = round_up(size.tiled.width, PAGE_SIZE) * size.tiled.height;
+-	} else {
++	/* for tiled buffers we get the size with DRM_OMAP_GEM_INFO later */
++	if (!(flags & OMAP_BO_TILED))
+ 		bo->size = size.bytes;
+-	}
+ 
+ 	return bo;
+ 
+-- 
+2.7.4
+
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch
new file mode 100644
index 0000000..a06ac79
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch
@@ -0,0 +1,59 @@
+From 2473eabe24af25dd2127c5e84048f90e4ded000c Mon Sep 17 00:00:00 2001
+From: Tomi Valkeinen <tomi.valkeinen@ti.com>
+Date: Thu, 18 May 2017 10:37:11 +0300
+Subject: [PATCH 2/2] omap: add OMAP_BO flags to affect buffer allocation
+
+Import the kernel header changes from "drm/omap: add OMAP_BO flags to
+affect buffer allocation".
+
+On SoCs with TILER, we have to ways to allocate buffers: normal
+dma_alloc or via TILER (which basically functions as an IOMMU). TILER
+can map 128MB at a time, and we only map the TILER buffers when they are
+used (i.e. not at alloc time). If TILER is present, omapdrm always
+uses TILER.
+
+There are use cases that require lots of big buffers that are being used
+at the same time by different IPs. At the moment the userspace has a
+hard maximum of 128MB.
+
+This patch adds three new flags that can be used by the userspace to
+solve the situation:
+
+OMAP_BO_MEM_CONTIG: The driver will use dma_alloc to get the memory.
+This can be used to avoid TILER if the userspace knows it needs more
+than 128M of memory at the same time.
+
+OMAP_BO_MEM_TILER: The driver will use TILER to get the memory. There's
+nto much use for this flag at the moment, but it's here for
+completeness.
+
+OMAP_BO_MEM_PIN: The driver will pin the memory at alloc time, and keep
+it pinned. This can be used to 1) get an error at alloc time if TILER
+space is full, and 2) get rid of the constant pin/unpin operations which
+may have some effect on performance.
+
+If none of the flags are given, the behavior is the same as currently.
+
+Upstream-Status: Pending
+Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
+---
+ omap/omap_drm.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/omap/omap_drm.h b/omap/omap_drm.h
+index 9c6c0e4..d991b85 100644
+--- a/omap/omap_drm.h
++++ b/omap/omap_drm.h
+@@ -52,6 +52,9 @@ struct drm_omap_get_base {
+ #define OMAP_BO_SCANOUT		0x00000001	/* scanout capable (phys contiguous) */
+ #define OMAP_BO_CACHE_MASK	0x00000006	/* cache type mask, see cache modes */
+ #define OMAP_BO_TILED_MASK	0x00000f00	/* tiled mapping mask, see tiled modes */
++#define OMAP_BO_MEM_CONTIG	0x00000008	/* only use contiguous dma mem */
++#define OMAP_BO_MEM_TILER	0x00000010	/* only use TILER mem */
++#define OMAP_BO_MEM_PIN		0x00000020	/* pin the buffer when allocating */
+ 
+ /* cache modes */
+ #define OMAP_BO_CACHED		0x00000000	/* default */
+-- 
+2.7.4
+
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
index 978231f..9945149 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
@@ -1,8 +1,12 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://0001-Add-option-to-run-a-test-indefinitely.patch"
+SRC_URI += " \
+file://0001-Add-option-to-run-a-test-indefinitely.patch \
+file://0001-omap-fix-omap_bo_size-for-tiled-buffers.patch \
+file://0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch \
+"
 
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 inherit update-alternatives
 
-- 
2.7.4


