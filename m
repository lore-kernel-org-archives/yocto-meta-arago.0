Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D375E5299C
	for <meta-arago@arago-project.org>;
	Fri,  9 Jul 2021 05:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CBBC640C88;
	Fri,  9 Jul 2021 05:10:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UMp2mwiAmL3U; Fri,  9 Jul 2021 05:10:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B0B5A40A77;
	Fri,  9 Jul 2021 05:10:33 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 09F7517462B;
	Fri,  9 Jul 2021 01:10:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  9 Jul 2021 01:10:32 -0400
Message-Id: <1625807432-30722-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] linux-libc-headers: handle removal of asm/kvm.h in kernel 5.8+
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
X-List-Received-Date: Fri, 09 Jul 2021 05:10:29 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Multilib handling is done in linux-libc-headers.inc in oe-core and the version
in dunfell handles the list for 5.4, while the list for 5.10 has no asm/kvm.h
due to kernel commit: 541ad0150ca4 [arm: Remove 32bit KVM host support].

Fixes this error on ARM32 platforms when using internal toolchain:
ERROR: linux-libc-headers-5.10-r0.arago0 do_install: oe_multilib_header: Unable to find header asm/kvm.h.

Also, dependency on rsync-native is now upstream.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
index 353d8b5..7f4343d 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
@@ -2,8 +2,6 @@ require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 
 PR_append = ".arago0"
 
-DEPENDS += "rsync-native"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 BRANCH = "ti-linux-5.10.y"
@@ -14,3 +12,9 @@ KERNEL_GIT_PROTOCOL = "git"
 SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
+
+# below overrides the multilib list - can be dropped for the next LTS
+do_install_armmultilib () {
+	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
+	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
+}
-- 
2.7.4


