Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2B410529AB
	for <meta-arago@arago-project.org>;
	Fri, 26 Apr 2019 23:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3EDA040A18;
	Fri, 26 Apr 2019 23:27:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mtHkapETaN52; Fri, 26 Apr 2019 23:27:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26914407DA;
	Fri, 26 Apr 2019 23:27:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7265116E589;
	Fri, 26 Apr 2019 19:27:57 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 26 Apr 2019 19:27:57 -0400
Message-Id: <1556321277-27463-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] linux-libc-headers: update 4.14 -> 4.19 for internal toolchain
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
X-List-Received-Date: Fri, 26 Apr 2019 23:28:25 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...inux-libc-headers_4.14.bb => linux-libc-headers_4.19.bb} | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)
 rename meta-arago-distro/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.14.bb => linux-libc-headers_4.19.bb} (30%)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
similarity index 30%
rename from meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
rename to meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
index 35ba3c1..4239437 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
@@ -1,21 +1,12 @@
 require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 
-# upstream moved to 4.18 with updated SPDX license files, use old checksum
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
 PR_append = ".arago0"
 
-BRANCH = "ti-lsk-linux-4.14.y"
-SRCREV = "3e50654361c34b75784ab7c8c9aa8e96b3a37fc1"
+BRANCH = "ti-linux-4.19.y"
+SRCREV = "8de817772462078a064b70d368eeae3b92a31439"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-
-# upstream added few more headers that aren't in 4.14, reduce the list for 4.14
-do_install_armmultilib () {
-    oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/mman.h asm/param.h asm/perf_regs.h
-    oe_multilib_header asm/posix_types.h asm/ptrace.h asm/setup.h asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h asm/statfs.h asm/swab.h asm/types.h asm/unistd.h
-}
-- 
2.7.4


