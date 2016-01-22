Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 6C8F15298C
	for <meta-arago@arago-project.org>;
	Fri, 22 Jan 2016 04:35:22 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1C00BK57EWIRK0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 21 Jan 2016 22:35:21 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=z97URBAEcLwSniDkDKUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A221F161E06;	Thu,
	21 Jan 2016 23:35:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 21 Jan 2016 23:35:19 -0500
Message-id: <1453437320-801-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1453437320-801-1-git-send-email-denis@denix.org>
References: <1453437320-801-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] libdrm: update bbappend and the patch for the new version
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
X-List-Received-Date: Fri, 22 Jan 2016 04:35:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...001-Add-option-to-run-a-test-indefinitely.patch | 30 +++++++++++-----------
 ...bdrm_2.4.59.bbappend => libdrm_2.4.66.bbappend} |  0
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta-arago-distro/recipes-graphics/drm/{libdrm_2.4.59.bbappend => libdrm_2.4.66.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index d74d713..6e3dfd4 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
@@ -16,19 +16,19 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index 4b9cf2f..208af86 100644
+index 22e3e81..a74e39a 100644
 --- a/tests/modetest/modetest.c
 +++ b/tests/modetest/modetest.c
-@@ -1163,7 +1163,7 @@ static void clear_cursors(struct device *dev)
- 	cursor_stop();
+@@ -1181,7 +1181,7 @@ static void clear_cursors(struct device *dev)
+ 		bo_destroy(dev->mode.cursor_bo);
  }
  
 -static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count)
 +static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count, int dont_stop)
  {
- 	uint32_t handles[4], pitches[4], offsets[4] = {0}; /* we only use [0] */
+ 	uint32_t handles[4] = {0}, pitches[4] = {0}, offsets[4] = {0};
  	unsigned int other_fb_id;
-@@ -1241,7 +1241,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
+@@ -1258,7 +1258,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
  			fprintf(stderr, "select timed out or error (ret %d)\n",
  				ret);
  			continue;
@@ -37,8 +37,8 @@ index 4b9cf2f..208af86 100644
  			break;
  		}
  #endif
-@@ -1442,7 +1442,7 @@ static int cursor_supported(void)
- 	return 1;
+@@ -1492,7 +1492,7 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
+ 	return 0;
  }
  
 -static char optstr[] = "cdD:efM:P:ps:Cvw:";
@@ -46,25 +46,25 @@ index 4b9cf2f..208af86 100644
  
  int main(int argc, char **argv)
  {
-@@ -1458,6 +1458,7 @@ int main(int argc, char **argv)
+@@ -1507,6 +1507,7 @@ int main(int argc, char **argv)
  	char *module = NULL;
  	unsigned int i;
- 	int count = 0, plane_count = 0;
-+  int dont_stop= 0;
+ 	unsigned int count = 0, plane_count = 0;
++	int dont_stop= 0;
  	unsigned int prop_count = 0;
  	struct pipe_arg *pipe_args = NULL;
  	struct plane_arg *plane_args = NULL;
-@@ -1542,6 +1543,9 @@ int main(int argc, char **argv)
+@@ -1594,6 +1595,9 @@ int main(int argc, char **argv)
  
  			prop_count++;
  			break;
-+    case 't':
-+      dont_stop = 1;
-+      break;
++		case 't':
++			dont_stop = 1;
++			break;
  		default:
  			usage(argv[0]);
  			break;
-@@ -1626,7 +1630,7 @@ int main(int argc, char **argv)
+@@ -1666,7 +1670,7 @@ int main(int argc, char **argv)
  			set_cursors(&dev, pipe_args, count);
  
  		if (test_vsync)
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.59.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.66.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/drm/libdrm_2.4.59.bbappend
rename to meta-arago-distro/recipes-graphics/drm/libdrm_2.4.66.bbappend
-- 
2.2.0


