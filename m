Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2549452981
	for <meta-arago@arago-project.org>;
	Mon, 15 Oct 2018 03:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4303220CF6;
	Mon, 15 Oct 2018 03:01:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QIHY-eHbqByq; Mon, 15 Oct 2018 03:01:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 16DAE20CF2;
	Mon, 15 Oct 2018 03:01:20 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 92D89164772;
	Sun, 14 Oct 2018 23:01:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 14 Oct 2018 23:01:18 -0400
Message-Id: <1539572478-50128-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539572478-50128-1-git-send-email-denys@ti.com>
References: <1539572478-50128-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/2] libdrm: update local patch for new version
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
X-List-Received-Date: Mon, 15 Oct 2018 03:01:31 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...001-Add-option-to-run-a-test-indefinitely.patch | 35 +++++++++++-----------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index 1588e9a..2ebd6d8 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
@@ -1,4 +1,4 @@
-From babcb3f7fdc53c25f2c525eea1704498a19c126d Mon Sep 17 00:00:00 2001
+From eed389c68118fd673a462d7ac6738a1fe3aec217 Mon Sep 17 00:00:00 2001
 From: Alejandro Hernandez <ajhernandez@ti.com>
 Date: Wed, 15 Mar 2017 14:25:20 -0400
 Subject: [PATCH] Add option to run a test indefinitely
@@ -10,15 +10,16 @@ was not able to run in ltp-ddt because ltp-ddt sends data to stdin
 when a test is run
 
 Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  tests/modetest/modetest.c | 13 +++++++++----
  1 file changed, 9 insertions(+), 4 deletions(-)
 
 diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index 21d5438..76685da 100644
+index 975dcbc..654ce89 100644
 --- a/tests/modetest/modetest.c
 +++ b/tests/modetest/modetest.c
-@@ -1186,7 +1186,7 @@ static void clear_cursors(struct device *dev)
+@@ -1501,7 +1501,7 @@ static void clear_cursors(struct device *dev)
  		bo_destroy(dev->mode.cursor_bo);
  }
  
@@ -27,7 +28,7 @@ index 21d5438..76685da 100644
  {
  	uint32_t handles[4] = {0}, pitches[4] = {0}, offsets[4] = {0};
  	unsigned int other_fb_id;
-@@ -1255,7 +1255,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
+@@ -1570,7 +1570,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
  		fd_set fds;
  
  		FD_ZERO(&fds);
@@ -36,16 +37,16 @@ index 21d5438..76685da 100644
  		FD_SET(dev->fd, &fds);
  		ret = select(dev->fd + 1, &fds, NULL, NULL, &timeout);
  
-@@ -1497,7 +1497,7 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
+@@ -1818,7 +1818,7 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
  	return 0;
  }
  
--static char optstr[] = "cdD:efM:P:ps:Cvw:";
-+static char optstr[] = "cdD:efM:P:ps:Cvw:t";
+-static char optstr[] = "acdD:efM:P:ps:Cvw:";
++static char optstr[] = "acdD:efM:P:ps:Cvw:t";
  
  int main(int argc, char **argv)
  {
-@@ -1512,6 +1512,7 @@ int main(int argc, char **argv)
+@@ -1834,6 +1834,7 @@ int main(int argc, char **argv)
  	char *module = NULL;
  	unsigned int i;
  	unsigned int count = 0, plane_count = 0;
@@ -53,7 +54,7 @@ index 21d5438..76685da 100644
  	unsigned int prop_count = 0;
  	struct pipe_arg *pipe_args = NULL;
  	struct plane_arg *plane_args = NULL;
-@@ -1599,6 +1600,10 @@ int main(int argc, char **argv)
+@@ -1924,6 +1925,10 @@ int main(int argc, char **argv)
  
  			prop_count++;
  			break;
@@ -64,15 +65,15 @@ index 21d5438..76685da 100644
  		default:
  			usage(argv[0]);
  			break;
-@@ -1671,7 +1676,7 @@ int main(int argc, char **argv)
- 			set_cursors(&dev, pipe_args, count);
+@@ -2075,7 +2080,7 @@ int main(int argc, char **argv)
+ 				set_cursors(&dev, pipe_args, count);
  
- 		if (test_vsync)
--			test_page_flip(&dev, pipe_args, count);
-+			test_page_flip(&dev, pipe_args, count, dont_stop);
+ 			if (test_vsync)
+-				test_page_flip(&dev, pipe_args, count);
++				test_page_flip(&dev, pipe_args, count, dont_stop);
  
- 		if (drop_master)
- 			drmDropMaster(dev.fd);
+ 			if (drop_master)
+ 				drmDropMaster(dev.fd);
 -- 
-1.9.1
+2.7.4
 
-- 
2.7.4


