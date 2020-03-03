Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 81942529A5
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2020 15:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 907AD40C2C;
	Tue,  3 Mar 2020 15:47:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9Iru2dmgkTpH; Tue,  3 Mar 2020 15:47:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2DB8340C1E;
	Tue,  3 Mar 2020 15:47:41 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 083FA16BA7B;
	Tue,  3 Mar 2020 10:47:41 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  3 Mar 2020 10:47:40 -0500
Message-Id: <1583250460-54884-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] libdrm: rebase testing patch for the latest version
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
X-List-Received-Date: Tue, 03 Mar 2020 15:49:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Cc: Alejandro Hernandez <ajhernandez@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...001-Add-option-to-run-a-test-indefinitely.patch | 34 ++++++++++------------
 .../recipes-graphics/drm/libdrm_%.bbappend         |  3 +-
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index 2ebd6d8..e7c8d09 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
@@ -1,6 +1,6 @@
-From eed389c68118fd673a462d7ac6738a1fe3aec217 Mon Sep 17 00:00:00 2001
+From 6a16a6381082d870037aa4aedffa3f7d01406015 Mon Sep 17 00:00:00 2001
 From: Alejandro Hernandez <ajhernandez@ti.com>
-Date: Wed, 15 Mar 2017 14:25:20 -0400
+Date: Tue, 3 Mar 2020 09:52:06 -0500
 Subject: [PATCH] Add option to run a test indefinitely
 
 This patch adds option -t to the modetest cli. When this option is
@@ -10,16 +10,15 @@ was not able to run in ltp-ddt because ltp-ddt sends data to stdin
 when a test is run
 
 Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- tests/modetest/modetest.c | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
+ tests/modetest/modetest.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index 975dcbc..654ce89 100644
+index e66be660..9bd24acd 100644
 --- a/tests/modetest/modetest.c
 +++ b/tests/modetest/modetest.c
-@@ -1501,7 +1501,7 @@ static void clear_cursors(struct device *dev)
+@@ -1563,7 +1563,7 @@ static void clear_cursors(struct device *dev)
  		bo_destroy(dev->mode.cursor_bo);
  }
  
@@ -28,7 +27,7 @@ index 975dcbc..654ce89 100644
  {
  	uint32_t handles[4] = {0}, pitches[4] = {0}, offsets[4] = {0};
  	unsigned int other_fb_id;
-@@ -1570,7 +1570,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
+@@ -1632,7 +1632,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
  		fd_set fds;
  
  		FD_ZERO(&fds);
@@ -37,35 +36,34 @@ index 975dcbc..654ce89 100644
  		FD_SET(dev->fd, &fds);
  		ret = select(dev->fd + 1, &fds, NULL, NULL, &timeout);
  
-@@ -1818,7 +1818,7 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
+@@ -1890,7 +1890,7 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
  	return 0;
  }
  
--static char optstr[] = "acdD:efM:P:ps:Cvw:";
-+static char optstr[] = "acdD:efM:P:ps:Cvw:t";
+-static char optstr[] = "acdD:efF:M:P:ps:Cvw:";
++static char optstr[] = "acdD:efF:M:P:ps:Cvw:t";
  
  int main(int argc, char **argv)
  {
-@@ -1834,6 +1834,7 @@ int main(int argc, char **argv)
+@@ -1906,6 +1906,7 @@ int main(int argc, char **argv)
  	char *module = NULL;
  	unsigned int i;
  	unsigned int count = 0, plane_count = 0;
-+	int dont_stop= 0;
++	int dont_stop = 0;
  	unsigned int prop_count = 0;
  	struct pipe_arg *pipe_args = NULL;
  	struct plane_arg *plane_args = NULL;
-@@ -1924,6 +1925,10 @@ int main(int argc, char **argv)
+@@ -1999,6 +2000,9 @@ int main(int argc, char **argv)
  
  			prop_count++;
  			break;
-+                case 't':
++		case 't':
 +			dont_stop = 1;
-+			setvbuf(stdout, (char *)NULL, _IOLBF, 0);
 +			break;
  		default:
  			usage(argv[0]);
  			break;
-@@ -2075,7 +2080,7 @@ int main(int argc, char **argv)
+@@ -2150,7 +2154,7 @@ int main(int argc, char **argv)
  				set_cursors(&dev, pipe_args, count);
  
  			if (test_vsync)
@@ -75,5 +73,5 @@ index 975dcbc..654ce89 100644
  			if (drop_master)
  				drmDropMaster(dev.fd);
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
index 2624319..99d2fa7 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
@@ -1,8 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-# file://0001-Add-option-to-run-a-test-indefinitely.patch
-
 SRC_URI += " \
+file://0001-Add-option-to-run-a-test-indefinitely.patch \
 file://0001-omap-fix-omap_bo_size-for-tiled-buffers.patch \
 file://0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch \
 file://0001-libsync-add-support-for-pre-v4.7-kernels.patch \
-- 
2.7.4


