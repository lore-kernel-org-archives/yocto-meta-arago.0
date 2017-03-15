Return-Path: <ajhernandez@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DE97752A36
	for <meta-arago@arago-project.org>;
	Wed, 15 Mar 2017 19:03:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2FJ3PT7025057
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 14:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489604605;
	bh=rUIOKGXQsxBfgsz8spi50e5FkFKuwdx3CzLOtq9R1/s=;
	h=From:To:CC:Subject:Date;
	b=bafqGnyLbhBQyFs5MkwWgbl3lwsbQQ6j/0cIhRdfOZNabcMCvtrlQhdyYMKU0dsn8
	8U0VtXrfLX8rolcMVcVLtoEcG25K8loWx9W9UnFiMWrrt7ISNnguK83K9aGPIK9yFR
	AVWyhvqWrOJxI+YreRmbh5uMjsAkD5YgMz+niP4I=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2FJ3KGP012854
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 14:03:20 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Mar 2017 14:03:20 -0500
Received: from a0133055-desktop.am.dhcp.ti.com.am.dhcp.ti.com
	(ileax41-snat.itg.ti.com [10.172.224.153])	by dflp32.itg.ti.com
	(8.14.3/8.13.8) with ESMTP id v2FJ3K6L009986;
	Wed, 15 Mar 2017 14:03:20 -0500
From: Alejandro Hernandez <ajhernandez@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Mar 2017 15:04:27 -0400
Message-ID: <1489604667-26712-1-git-send-email-ajhernandez@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v1 1/1] Update indefinite run option for modetest
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
X-List-Received-Date: Wed, 15 Mar 2017 19:03:36 -0000
Content-Type: text/plain

This patch updates the implementation of the -t option.
The previous patch was based on a noop processing of
stdin events which caused some performance problem due
to the overhead of processing the event itself. The new
patch is based on disabling stdin events which avoids
the overhead

Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
---
 ...001-Add-option-to-run-a-test-indefinitely.patch | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index 6e3dfd4..1588e9a 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
@@ -1,6 +1,6 @@
-From ca0a8795495a3b99c841e5a91dfa5de5c56758c6 Mon Sep 17 00:00:00 2001
+From babcb3f7fdc53c25f2c525eea1704498a19c126d Mon Sep 17 00:00:00 2001
 From: Alejandro Hernandez <ajhernandez@ti.com>
-Date: Tue, 23 Sep 2014 09:30:24 -0400
+Date: Wed, 15 Mar 2017 14:25:20 -0400
 Subject: [PATCH] Add option to run a test indefinitely
 
 This patch adds option -t to the modetest cli. When this option is
@@ -10,16 +10,15 @@ was not able to run in ltp-ddt because ltp-ddt sends data to stdin
 when a test is run
 
 Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- tests/modetest/modetest.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
+ tests/modetest/modetest.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
 
 diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index 22e3e81..a74e39a 100644
+index 21d5438..76685da 100644
 --- a/tests/modetest/modetest.c
 +++ b/tests/modetest/modetest.c
-@@ -1181,7 +1181,7 @@ static void clear_cursors(struct device *dev)
+@@ -1186,7 +1186,7 @@ static void clear_cursors(struct device *dev)
  		bo_destroy(dev->mode.cursor_bo);
  }
  
@@ -28,16 +27,16 @@ index 22e3e81..a74e39a 100644
  {
  	uint32_t handles[4] = {0}, pitches[4] = {0}, offsets[4] = {0};
  	unsigned int other_fb_id;
-@@ -1258,7 +1258,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
- 			fprintf(stderr, "select timed out or error (ret %d)\n",
- 				ret);
- 			continue;
--		} else if (FD_ISSET(0, &fds)) {
-+		} else if (!dont_stop && FD_ISSET(0, &fds)) {
- 			break;
- 		}
- #endif
-@@ -1492,7 +1492,7 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
+@@ -1255,7 +1255,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
+ 		fd_set fds;
+ 
+ 		FD_ZERO(&fds);
+-		FD_SET(0, &fds);
++		if (!dont_stop) FD_SET(0, &fds);
+ 		FD_SET(dev->fd, &fds);
+ 		ret = select(dev->fd + 1, &fds, NULL, NULL, &timeout);
+ 
+@@ -1497,7 +1497,7 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
  	return 0;
  }
  
@@ -46,7 +45,7 @@ index 22e3e81..a74e39a 100644
  
  int main(int argc, char **argv)
  {
-@@ -1507,6 +1507,7 @@ int main(int argc, char **argv)
+@@ -1512,6 +1512,7 @@ int main(int argc, char **argv)
  	char *module = NULL;
  	unsigned int i;
  	unsigned int count = 0, plane_count = 0;
@@ -54,17 +53,18 @@ index 22e3e81..a74e39a 100644
  	unsigned int prop_count = 0;
  	struct pipe_arg *pipe_args = NULL;
  	struct plane_arg *plane_args = NULL;
-@@ -1594,6 +1595,9 @@ int main(int argc, char **argv)
+@@ -1599,6 +1600,10 @@ int main(int argc, char **argv)
  
  			prop_count++;
  			break;
-+		case 't':
++                case 't':
 +			dont_stop = 1;
++			setvbuf(stdout, (char *)NULL, _IOLBF, 0);
 +			break;
  		default:
  			usage(argv[0]);
  			break;
-@@ -1666,7 +1670,7 @@ int main(int argc, char **argv)
+@@ -1671,7 +1676,7 @@ int main(int argc, char **argv)
  			set_cursors(&dev, pipe_args, count);
  
  		if (test_vsync)
@@ -74,5 +74,5 @@ index 22e3e81..a74e39a 100644
  		if (drop_master)
  			drmDropMaster(dev.fd);
 -- 
-2.2.0
+1.9.1
 
-- 
1.9.1


