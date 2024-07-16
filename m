Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BE8C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 15:53:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.98.1721145207645571865
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 08:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 847E940C67;
	Tue, 16 Jul 2024 15:53:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMwuaVRc-TiO; Tue, 16 Jul 2024 15:53:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63FC340B66;
	Tue, 16 Jul 2024 15:53:24 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B54FB163FF0;
	Tue, 16 Jul 2024 11:53:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] libdrm: refresh local patches to remove fuzz
Date: Tue, 16 Jul 2024 11:53:22 -0400
Message-Id: <20240716155322.3123233-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 15:53:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15447

From: Denys Dmytriyenko <denys@konsulko.com>

Fuzz in patches is now an error.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...-Add-option-to-run-a-test-indefinitely.patch | 17 ++++++++---------
 ...bsync-add-support-for-pre-v4.7-kernels.patch | 10 +++-------
 ...map-fix-omap_bo_size-for-tiled-buffers.patch | 11 ++++-------
 ...2-Add-sync_fence_info-and-sync_pt_info.patch | 12 ++++--------
 ...P_BO-flags-to-affect-buffer-allocation.patch |  7 ++-----
 5 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-optio=
n-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/d=
rm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index 0172f8a4..2abe5045 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-ru=
n-a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-ru=
n-a-test-indefinitely.patch
@@ -1,4 +1,4 @@
-From 035ea52b3c9f8b9d4d82c78e2e5f9d974da4d018 Mon Sep 17 00:00:00 2001
+From 115aa882abeb6db92c7588f3fb0953593fa2f634 Mon Sep 17 00:00:00 2001
 From: Alejandro Hernandez <ajhernandez@ti.com>
 Date: Tue, 3 Mar 2020 09:52:06 -0500
 Subject: [PATCH] Add option to run a test indefinitely
@@ -13,16 +13,15 @@ Upstream-Status: Pending
=20
 Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
 Signed-off-by: Denys Dmytriyenko <denis@denix.org>
-
 ---
  tests/modetest/modetest.c | 12 ++++++++----
  1 file changed, 8 insertions(+), 4 deletions(-)
=20
 diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index fc75383..8e59acc 100644
+index d9e761e..687f7a4 100644
 --- a/tests/modetest/modetest.c
 +++ b/tests/modetest/modetest.c
-@@ -1767,7 +1767,7 @@ static void clear_cursors(struct device *dev)
+@@ -1887,7 +1887,7 @@ static void clear_cursors(struct device *dev)
  		bo_destroy(dev->mode.cursor_bo);
  }
 =20
@@ -31,7 +30,7 @@ index fc75383..8e59acc 100644
  {
  	unsigned int other_fb_id;
  	struct bo *other_bo;
-@@ -1825,7 +1825,7 @@ static void test_page_flip(struct device *dev, str=
uct pipe_arg *pipes, unsigned
+@@ -1945,7 +1945,7 @@ static void test_page_flip(struct device *dev, str=
uct pipe_arg *pipes, unsigned
  		fd_set fds;
 =20
  		FD_ZERO(&fds);
@@ -40,7 +39,7 @@ index fc75383..8e59acc 100644
  		FD_SET(dev->fd, &fds);
  		ret =3D select(dev->fd + 1, &fds, NULL, NULL, &timeout);
 =20
-@@ -2032,7 +2032,7 @@ static void usage(char *name)
+@@ -2179,7 +2179,7 @@ static void usage(char *name)
  	exit(0);
  }
 =20
@@ -49,7 +48,7 @@ index fc75383..8e59acc 100644
 =20
  int main(int argc, char **argv)
  {
-@@ -2049,6 +2049,7 @@ int main(int argc, char **argv)
+@@ -2196,6 +2196,7 @@ int main(int argc, char **argv)
  	char *module =3D NULL;
  	unsigned int i;
  	unsigned int count =3D 0, plane_count =3D 0;
@@ -57,7 +56,7 @@ index fc75383..8e59acc 100644
  	unsigned int prop_count =3D 0;
  	struct pipe_arg *pipe_args =3D NULL;
  	struct plane_arg *plane_args =3D NULL;
-@@ -2148,6 +2149,9 @@ int main(int argc, char **argv)
+@@ -2299,6 +2300,9 @@ int main(int argc, char **argv)
 =20
  			prop_count++;
  			break;
@@ -67,7 +66,7 @@ index fc75383..8e59acc 100644
  		default:
  			usage(argv[0]);
  			break;
-@@ -2275,7 +2279,7 @@ int main(int argc, char **argv)
+@@ -2449,7 +2453,7 @@ int main(int argc, char **argv)
  				set_cursors(&dev, pipe_args, count);
 =20
  			if (test_vsync)
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-a=
dd-support-for-pre-v4.7-kernels.patch b/meta-arago-distro/recipes-graphic=
s/drm/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
index d645bab6..d3ac5593 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-supp=
ort-for-pre-v4.7-kernels.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-supp=
ort-for-pre-v4.7-kernels.patch
@@ -1,18 +1,17 @@
-From 900afd25d9a35b2b8fd29f8c424aa3c3cd170d6f Mon Sep 17 00:00:00 2001
+From 74dc4b57e9d539944edf61ec7466ce029cf993d7 Mon Sep 17 00:00:00 2001
 From: Brendan King <Brendan.King@imgtec.com>
 Date: Tue, 13 Jun 2017 15:52:44 +0100
-Subject: [PATCH 1/2] libsync: add support for pre-v4.7 kernels
+Subject: [PATCH] libsync: add support for pre-v4.7 kernels
=20
 Add support for the the sync merge ioctl supported by older kernels.
=20
 Upstream-Status: Pending
-
 ---
  libsync.h | 44 +++++++++++++++++++++++++++++++++++++++++---
  1 file changed, 41 insertions(+), 3 deletions(-)
=20
 diff --git a/libsync.h b/libsync.h
-index f1a2f96d..c3b8a385 100644
+index c6b64ed..465871c 100644
 --- a/libsync.h
 +++ b/libsync.h
 @@ -40,6 +40,10 @@
@@ -90,6 +89,3 @@ index f1a2f96d..c3b8a385 100644
 =20
  	return data.fence;
  }
---=20
-2.17.1
-
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-=
omap_bo_size-for-tiled-buffers.patch b/meta-arago-distro/recipes-graphics=
/drm/libdrm/0001-omap-fix-omap_bo_size-for-tiled-buffers.patch
index 52349190..3f47243d 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-omap_bo=
_size-for-tiled-buffers.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-omap-fix-omap_bo=
_size-for-tiled-buffers.patch
@@ -1,7 +1,7 @@
-From 6554635378ef4c6ee5f1bf8521b1cf4fe7911fa1 Mon Sep 17 00:00:00 2001
+From 999fa7f4c79f9502b4f9d9e6d380f82bf839a250 Mon Sep 17 00:00:00 2001
 From: Tomi Valkeinen <tomi.valkeinen@ti.com>
 Date: Thu, 18 May 2017 12:18:28 +0300
-Subject: [PATCH 1/2] omap: fix omap_bo_size for tiled buffers
+Subject: [PATCH] omap: fix omap_bo_size for tiled buffers
=20
 The buffer size is calculated using pixels, not bytes as it should. The
 result is often correct, though, as the stride is aligned to page size,
@@ -19,10 +19,10 @@ Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
  1 file changed, 2 insertions(+), 4 deletions(-)
=20
 diff --git a/omap/omap_drm.c b/omap/omap_drm.c
-index 08ba64e..a6f8a21 100644
+index 42d35ef..06221b7 100644
 --- a/omap/omap_drm.c
 +++ b/omap/omap_drm.c
-@@ -215,11 +215,9 @@ static struct omap_bo * omap_bo_new_impl(struct oma=
p_device *dev,
+@@ -207,11 +207,9 @@ static struct omap_bo * omap_bo_new_impl(struct oma=
p_device *dev,
  	bo =3D bo_from_handle(dev, req.handle);
  	pthread_mutex_unlock(&table_lock);
 =20
@@ -36,6 +36,3 @@ index 08ba64e..a6f8a21 100644
 =20
  	return bo;
 =20
---=20
-2.7.4
-
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_=
fence_info-and-sync_pt_info.patch b/meta-arago-distro/recipes-graphics/dr=
m/libdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
index 2786c04d..57a282ef 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_i=
nfo-and-sync_pt_info.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_i=
nfo-and-sync_pt_info.patch
@@ -1,20 +1,19 @@
-From 09da458d04e048a80500feb7d167a4faac56f84e Mon Sep 17 00:00:00 2001
+From 34d420f46a49d059d55f5b9ed87306207b76c15b Mon Sep 17 00:00:00 2001
 From: Brendan King <Brendan.King@imgtec.com>
 Date: Thu, 24 Aug 2017 13:28:38 +0100
-Subject: [PATCH 2/2] Add sync_fence_info and sync_pt_info
+Subject: [PATCH] Add sync_fence_info and sync_pt_info
=20
 For pre-4.7 kernels, sync_fence_info returns the data from the
 SYNC_IOC_FENCE_INFO ioctl. For newer kernels, the SYNC_IOC_FILE_INFO
 ioctl is called, and the data converted to SYNC_IOC_FENCE_INFO form.
=20
 Upstream-Status: Pending
-
 ---
  libsync.h | 172 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 172 insertions(+)
=20
 diff --git a/libsync.h b/libsync.h
-index c3b8a385..44f7330d 100644
+index 465871c..103b488 100644
 --- a/libsync.h
 +++ b/libsync.h
 @@ -31,6 +31,7 @@
@@ -24,7 +23,7 @@ index c3b8a385..44f7330d 100644
 +#include <stdlib.h>
  #include <string.h>
  #include <sys/ioctl.h>
- #include <sys/poll.h>
+ #include <poll.h>
 @@ -74,6 +75,54 @@ struct sync_legacy_merge_data {
  	struct sync_legacy_merge_data)
  #endif
@@ -210,6 +209,3 @@ index c3b8a385..44f7330d 100644
  #if defined(__cplusplus)
  }
  #endif
---=20
-2.17.1
-
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-=
OMAP_BO-flags-to-affect-buffer-allocation.patch b/meta-arago-distro/recip=
es-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-alloc=
ation.patch
index a06ac798..5daa9be2 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO=
-flags-to-affect-buffer-allocation.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO=
-flags-to-affect-buffer-allocation.patch
@@ -1,7 +1,7 @@
-From 2473eabe24af25dd2127c5e84048f90e4ded000c Mon Sep 17 00:00:00 2001
+From 9810d176a7947a6e8f432e1610da15937765fa06 Mon Sep 17 00:00:00 2001
 From: Tomi Valkeinen <tomi.valkeinen@ti.com>
 Date: Thu, 18 May 2017 10:37:11 +0300
-Subject: [PATCH 2/2] omap: add OMAP_BO flags to affect buffer allocation
+Subject: [PATCH] omap: add OMAP_BO flags to affect buffer allocation
=20
 Import the kernel header changes from "drm/omap: add OMAP_BO flags to
 affect buffer allocation".
@@ -54,6 +54,3 @@ index 9c6c0e4..d991b85 100644
 =20
  /* cache modes */
  #define OMAP_BO_CACHED		0x00000000	/* default */
---=20
-2.7.4
-
--=20
2.25.1


