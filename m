Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 8A829529CF
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 20:06:36 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD002D1EIK7070@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 23 Sep 2014 15:06:21 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 78D1120086; Tue,
	23 Sep 2014 16:06:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 23 Sep 2014 16:06:20 -0400
Message-id: <1411502780-6569-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] libdrm: patch modetest for indefinite test execution
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
X-List-Received-Date: Tue, 23 Sep 2014 20:06:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...001-Add-option-to-run-a-test-indefinitely.patch | 77 ++++++++++++++++++++++
 .../recipes-graphics/drm/libdrm_2.4.52.bbappend    |  5 ++
 2 files changed, 82 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
 create mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappend

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
new file mode 100644
index 0000000..5aba3ed
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
@@ -0,0 +1,77 @@
+From 73c1849ac1492cd527263e9ef5033601018f52bf Mon Sep 17 00:00:00 2001
+From: Alejandro Hernandez <ajhernandez@ti.com>
+Date: Tue, 23 Sep 2014 09:30:24 -0400
+Subject: [PATCH] Add option to run a test indefinitely
+
+This patch adds option -t to the modetest cli. When this option is
+speficied modetest will not stop on stdin input. This patch
+allows using modetest within ltp-ddt, before this patch modetest
+was not able to run in ltp-ddt because ltp-ddt sends data to stdin
+when a test is run
+
+Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
+---
+ tests/modetest/modetest.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
+index bc9c998..d847508 100644
+--- a/tests/modetest/modetest.c
++++ b/tests/modetest/modetest.c
+@@ -1104,7 +1104,7 @@ static void set_planes(struct device *dev, struct plane_arg *p, unsigned int cou
+ 			return;
+ }
+ 
+-static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count)
++static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count, int dont_stop)
+ {
+ 	uint32_t handles[4], pitches[4], offsets[4] = {0}; /* we only use [0] */
+ 	unsigned int other_fb_id;
+@@ -1182,7 +1182,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
+ 			fprintf(stderr, "select timed out or error (ret %d)\n",
+ 				ret);
+ 			continue;
+-		} else if (FD_ISSET(0, &fds)) {
++		} else if (!dont_stop && FD_ISSET(0, &fds)) {
+ 			break;
+ 		}
+ #endif
+@@ -1376,7 +1376,7 @@ static int page_flipping_supported(void)
+ #endif
+ }
+ 
+-static char optstr[] = "cdD:efM:P:ps:vw:";
++static char optstr[] = "cdD:efM:P:ps:vw:t";
+ 
+ int main(int argc, char **argv)
+ {
+@@ -1391,6 +1391,7 @@ int main(int argc, char **argv)
+ 	char *module = NULL;
+ 	unsigned int i;
+ 	int count = 0, plane_count = 0;
++  int dont_stop= 0;
+ 	unsigned int prop_count = 0;
+ 	struct pipe_arg *pipe_args = NULL;
+ 	struct plane_arg *plane_args = NULL;
+@@ -1472,6 +1473,9 @@ int main(int argc, char **argv)
+ 
+ 			prop_count++;
+ 			break;
++    case 't':
++      dont_stop = 1;
++      break;
+ 		default:
+ 			usage(argv[0]);
+ 			break;
+@@ -1547,7 +1551,7 @@ int main(int argc, char **argv)
+ 			set_planes(&dev, plane_args, plane_count);
+ 
+ 		if (test_vsync)
+-			test_page_flip(&dev, pipe_args, count);
++			test_page_flip(&dev, pipe_args, count, dont_stop);
+ 
+ 		if (drop_master)
+ 			drmDropMaster(dev.fd);
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappend
new file mode 100644
index 0000000..f593fb9
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-Add-option-to-run-a-test-indefinitely.patch"
+
+PR_append = "-arago0"
-- 
2.0.4


