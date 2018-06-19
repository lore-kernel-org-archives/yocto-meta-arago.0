Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id F2437529E3
	for <meta-arago@arago-project.org>;
	Tue, 19 Jun 2018 20:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 283EA20BFB;
	Tue, 19 Jun 2018 20:49:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id k6VXy-7r5p3E; Tue, 19 Jun 2018 20:49:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EFAA02017D;
	Tue, 19 Jun 2018 20:49:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 664561634AC;
	Tue, 19 Jun 2018 16:49:16 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 19 Jun 2018 16:49:15 -0400
Message-Id: <1529441355-31101-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] devmem2: ensure word is 32-bit and add support for 64-bit double
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
X-List-Received-Date: Tue, 19 Jun 2018 20:49:24 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/devmem2/devmem2.bbappend       |  5 ++
 ...sure-word-is-32-bit-and-add-support-for-6.patch | 70 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
 create mode 100644 meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch

diff --git a/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend b/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
new file mode 100644
index 0000000..c0a2460
--- /dev/null
+++ b/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
+"
diff --git a/meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch b/meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
new file mode 100644
index 0000000..ad8ae67
--- /dev/null
+++ b/meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
@@ -0,0 +1,70 @@
+From 1360a907879dd24041797a3b709d49aeac2ab444 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 29 May 2018 16:55:42 -0400
+Subject: [PATCH] devmem.c: ensure word is 32-bit and add support for 64-bit
+ double
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ devmem2.c | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/devmem2.c b/devmem2.c
+index 5845381..68131b2 100644
+--- a/devmem2.c
++++ b/devmem2.c
+@@ -39,6 +39,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <errno.h>
+@@ -69,7 +70,7 @@ int main(int argc, char **argv) {
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+ 			"\taddress : memory address to act upon\n"
+-			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord\n"
++			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord, [d]ouble\n"
+ 			"\tdata    : data to be written\n\n",
+ 			argv[0]);
+ 		exit(1);
+@@ -103,9 +104,14 @@ int main(int argc, char **argv) {
+ 			read_result = *((unsigned short *) virt_addr);
+ 			break;
+ 		case 'w':
+-			data_size = sizeof(unsigned long);
++			data_size = sizeof(uint32_t);
+ 			virt_addr = fixup_addr(virt_addr, data_size);
+-			read_result = *((unsigned long *) virt_addr);
++			read_result = *((uint32_t *) virt_addr);
++			break;
++		case 'd':
++			data_size = sizeof(uint64_t);
++			virt_addr = fixup_addr(virt_addr, data_size);
++			read_result = *((uint64_t *) virt_addr);
+ 			break;
+ 		default:
+ 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
+@@ -129,9 +135,14 @@ int main(int argc, char **argv) {
+ 				read_result = *((unsigned short *) virt_addr);
+ 				break;
+ 			case 'w':
+-				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
+-				*((unsigned long *) virt_addr) = write_val;
+-				read_result = *((unsigned long *) virt_addr);
++				virt_addr = fixup_addr(virt_addr, sizeof(uint32_t));
++				*((uint32_t *) virt_addr) = write_val;
++				read_result = *((uint32_t *) virt_addr);
++				break;
++			case 'd':
++				virt_addr = fixup_addr(virt_addr, sizeof(uint64_t));
++				*((uint64_t *) virt_addr) = write_val;
++				read_result = *((uint64_t *) virt_addr);
+ 				break;
+ 		}
+ 		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
+-- 
+2.7.4
+
-- 
2.7.4


