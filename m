Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8070F52993
	for <meta-arago@arago-project.org>;
	Wed,  8 Aug 2018 18:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6043720C29;
	Wed,  8 Aug 2018 18:54:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DYRvu2i20fW6; Wed,  8 Aug 2018 18:54:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3BBEC2014D;
	Wed,  8 Aug 2018 18:54:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A423A16356A;
	Wed,  8 Aug 2018 14:54:36 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  8 Aug 2018 14:54:34 -0400
Message-Id: <1533754474-20716-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] devmem2: support different page sizes at run-time
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
X-List-Received-Date: Wed, 08 Aug 2018 18:54:45 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/devmem2/devmem2.bbappend       |  1 +
 ...-support-different-page-sizes-at-run-time.patch | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch

diff --git a/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend b/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
index c0a2460..1e30c9b 100644
--- a/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
+++ b/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
@@ -2,4 +2,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " \
 file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
+file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
 "
diff --git a/meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch b/meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
new file mode 100644
index 0000000..0da0732
--- /dev/null
+++ b/meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
@@ -0,0 +1,35 @@
+From 0f6af48b2fbc71ec8abe862d3e9eb6da7b03538b Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Wed, 8 Aug 2018 14:38:00 -0400
+Subject: [PATCH] devmem2: support different page sizes at run-time
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ devmem2.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/devmem2.c b/devmem2.c
+index 68131b2..76af2d6 100644
+--- a/devmem2.c
++++ b/devmem2.c
+@@ -53,8 +53,6 @@
+ #define FATAL do { fprintf(stderr, "Error at line %d, file %s (%d) [%s]\n", \
+   __LINE__, __FILE__, errno, strerror(errno)); exit(1); } while(0)
+  
+-#define MAP_SIZE 4096UL
+-#define MAP_MASK (MAP_SIZE - 1)
+ 
+ static inline void *fixup_addr(void *addr, size_t size);
+ 
+@@ -66,6 +64,8 @@ int main(int argc, char **argv) {
+ 	int access_type = 'w';
+ 	char fmt_str[128];
+ 	size_t data_size;
++	unsigned long MAP_SIZE = sysconf(_SC_PAGE_SIZE);
++	unsigned long MAP_MASK = (MAP_SIZE - 1);
+ 	
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+-- 
+2.7.4
+
-- 
2.7.4


