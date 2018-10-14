Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 08AB152A06
	for <meta-arago@arago-project.org>;
	Sun, 14 Oct 2018 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0BD8C20CE1;
	Sun, 14 Oct 2018 20:03:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nX61BdSr_IZi; Sun, 14 Oct 2018 20:03:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C4EDA20CE9;
	Sun, 14 Oct 2018 20:03:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4C85A16476A;
	Sun, 14 Oct 2018 16:03:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 14 Oct 2018 16:03:08 -0400
Message-Id: <1539547389-5881-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539547389-5881-1-git-send-email-denys@ti.com>
References: <1539547389-5881-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 5/6] linux-libc-headers: fix compatibility with 4.14
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
X-List-Received-Date: Sun, 14 Oct 2018 20:03:24 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
index c313ca2..b8d3f62 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.bb
@@ -1,5 +1,8 @@
 require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 
+# upstream moved to 4.18 with updated SPDX license files, use old checksum
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
 PR_append = ".arago0"
 
 BRANCH = "ti-lsk-linux-4.14.y"
@@ -10,3 +13,9 @@ KERNEL_GIT_PROTOCOL = "git"
 SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
+
+# upstream added few more headers that aren't in 4.14, reduce the list for 4.14
+do_install_armmultilib () {
+    oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/mman.h asm/param.h asm/perf_regs.h
+    oe_multilib_header asm/posix_types.h asm/ptrace.h asm/setup.h asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h asm/statfs.h asm/swab.h asm/types.h asm/unistd.h
+}
-- 
2.7.4


