Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id D589652ACE
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00K4K5S3LGD0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:32 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=I0UOvqnDKYVQyjtRYD4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 23976161AE6;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:56 -0400
Message-id: <1435892533-6046-38-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 37/54] libdrm: update bbappend and patch to the new 2.4.59 version
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...001-Add-option-to-run-a-test-indefinitely.patch | 29 +++++++++++-----------
 ...bdrm_2.4.52.bbappend => libdrm_2.4.59.bbappend} |  0
 2 files changed, 15 insertions(+), 14 deletions(-)
 rename meta-arago-distro/recipes-graphics/drm/{libdrm_2.4.52.bbappend => libdrm_2.4.59.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index 5aba3ed..d74d713 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
@@ -1,4 +1,4 @@
-From 73c1849ac1492cd527263e9ef5033601018f52bf Mon Sep 17 00:00:00 2001
+From ca0a8795495a3b99c841e5a91dfa5de5c56758c6 Mon Sep 17 00:00:00 2001
 From: Alejandro Hernandez <ajhernandez@ti.com>
 Date: Tue, 23 Sep 2014 09:30:24 -0400
 Subject: [PATCH] Add option to run a test indefinitely
@@ -10,16 +10,17 @@ was not able to run in ltp-ddt because ltp-ddt sends data to stdin
 when a test is run
 
 Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  tests/modetest/modetest.c | 12 ++++++++----
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index bc9c998..d847508 100644
+index 4b9cf2f..208af86 100644
 --- a/tests/modetest/modetest.c
 +++ b/tests/modetest/modetest.c
-@@ -1104,7 +1104,7 @@ static void set_planes(struct device *dev, struct plane_arg *p, unsigned int cou
- 			return;
+@@ -1163,7 +1163,7 @@ static void clear_cursors(struct device *dev)
+ 	cursor_stop();
  }
  
 -static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count)
@@ -27,7 +28,7 @@ index bc9c998..d847508 100644
  {
  	uint32_t handles[4], pitches[4], offsets[4] = {0}; /* we only use [0] */
  	unsigned int other_fb_id;
-@@ -1182,7 +1182,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
+@@ -1241,7 +1241,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
  			fprintf(stderr, "select timed out or error (ret %d)\n",
  				ret);
  			continue;
@@ -36,16 +37,16 @@ index bc9c998..d847508 100644
  			break;
  		}
  #endif
-@@ -1376,7 +1376,7 @@ static int page_flipping_supported(void)
- #endif
+@@ -1442,7 +1442,7 @@ static int cursor_supported(void)
+ 	return 1;
  }
  
--static char optstr[] = "cdD:efM:P:ps:vw:";
-+static char optstr[] = "cdD:efM:P:ps:vw:t";
+-static char optstr[] = "cdD:efM:P:ps:Cvw:";
++static char optstr[] = "cdD:efM:P:ps:Cvw:t";
  
  int main(int argc, char **argv)
  {
-@@ -1391,6 +1391,7 @@ int main(int argc, char **argv)
+@@ -1458,6 +1458,7 @@ int main(int argc, char **argv)
  	char *module = NULL;
  	unsigned int i;
  	int count = 0, plane_count = 0;
@@ -53,7 +54,7 @@ index bc9c998..d847508 100644
  	unsigned int prop_count = 0;
  	struct pipe_arg *pipe_args = NULL;
  	struct plane_arg *plane_args = NULL;
-@@ -1472,6 +1473,9 @@ int main(int argc, char **argv)
+@@ -1542,6 +1543,9 @@ int main(int argc, char **argv)
  
  			prop_count++;
  			break;
@@ -63,8 +64,8 @@ index bc9c998..d847508 100644
  		default:
  			usage(argv[0]);
  			break;
-@@ -1547,7 +1551,7 @@ int main(int argc, char **argv)
- 			set_planes(&dev, plane_args, plane_count);
+@@ -1626,7 +1630,7 @@ int main(int argc, char **argv)
+ 			set_cursors(&dev, pipe_args, count);
  
  		if (test_vsync)
 -			test_page_flip(&dev, pipe_args, count);
@@ -73,5 +74,5 @@ index bc9c998..d847508 100644
  		if (drop_master)
  			drmDropMaster(dev.fd);
 -- 
-1.9.1
+2.2.0
 
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.59.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappend
rename to meta-arago-distro/recipes-graphics/drm/libdrm_2.4.59.bbappend
-- 
2.2.0


