Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0AFF352A5F
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D909F40C82;
	Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id h1kKo6pEuOvT; Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD2ED40C8E;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AF0FF174584;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:27 -0400
Message-Id: <1617408644-2675-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 12/29] libdrm: massage test patch to apply against latest version
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:52 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...001-Add-option-to-run-a-test-indefinitely.patch | 29 +++++++++++-----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index e7c8d09..719c8f7 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
@@ -1,4 +1,4 @@
-From 6a16a6381082d870037aa4aedffa3f7d01406015 Mon Sep 17 00:00:00 2001
+From 035ea52b3c9f8b9d4d82c78e2e5f9d974da4d018 Mon Sep 17 00:00:00 2001
 From: Alejandro Hernandez <ajhernandez@ti.com>
 Date: Tue, 3 Mar 2020 09:52:06 -0500
 Subject: [PATCH] Add option to run a test indefinitely
@@ -10,24 +10,26 @@ was not able to run in ltp-ddt because ltp-ddt sends data to stdin
 when a test is run
 
 Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
+Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+
 ---
  tests/modetest/modetest.c | 12 ++++++++----
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index e66be660..9bd24acd 100644
+index fc75383..8e59acc 100644
 --- a/tests/modetest/modetest.c
 +++ b/tests/modetest/modetest.c
-@@ -1563,7 +1563,7 @@ static void clear_cursors(struct device *dev)
+@@ -1767,7 +1767,7 @@ static void clear_cursors(struct device *dev)
  		bo_destroy(dev->mode.cursor_bo);
  }
  
 -static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count)
 +static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count, int dont_stop)
  {
- 	uint32_t handles[4] = {0}, pitches[4] = {0}, offsets[4] = {0};
  	unsigned int other_fb_id;
-@@ -1632,7 +1632,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
+ 	struct bo *other_bo;
+@@ -1825,7 +1825,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
  		fd_set fds;
  
  		FD_ZERO(&fds);
@@ -36,16 +38,16 @@ index e66be660..9bd24acd 100644
  		FD_SET(dev->fd, &fds);
  		ret = select(dev->fd + 1, &fds, NULL, NULL, &timeout);
  
-@@ -1890,7 +1890,7 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
- 	return 0;
+@@ -2032,7 +2032,7 @@ static void usage(char *name)
+ 	exit(0);
  }
  
--static char optstr[] = "acdD:efF:M:P:ps:Cvw:";
-+static char optstr[] = "acdD:efF:M:P:ps:Cvw:t";
+-static char optstr[] = "acdD:efF:M:P:ps:Cvrw:";
++static char optstr[] = "acdD:efF:M:P:ps:Cvrw:t";
  
  int main(int argc, char **argv)
  {
-@@ -1906,6 +1906,7 @@ int main(int argc, char **argv)
+@@ -2049,6 +2049,7 @@ int main(int argc, char **argv)
  	char *module = NULL;
  	unsigned int i;
  	unsigned int count = 0, plane_count = 0;
@@ -53,7 +55,7 @@ index e66be660..9bd24acd 100644
  	unsigned int prop_count = 0;
  	struct pipe_arg *pipe_args = NULL;
  	struct plane_arg *plane_args = NULL;
-@@ -1999,6 +2000,9 @@ int main(int argc, char **argv)
+@@ -2148,6 +2149,9 @@ int main(int argc, char **argv)
  
  			prop_count++;
  			break;
@@ -63,7 +65,7 @@ index e66be660..9bd24acd 100644
  		default:
  			usage(argv[0]);
  			break;
-@@ -2150,7 +2154,7 @@ int main(int argc, char **argv)
+@@ -2275,7 +2279,7 @@ int main(int argc, char **argv)
  				set_cursors(&dev, pipe_args, count);
  
  			if (test_vsync)
@@ -72,6 +74,3 @@ index e66be660..9bd24acd 100644
  
  			if (drop_master)
  				drmDropMaster(dev.fd);
--- 
-2.17.1
-
-- 
2.7.4


