Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 685AF52A4C
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2019 05:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D077C40AF7;
	Thu, 28 Feb 2019 05:04:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZZcuySDLwVf5; Thu, 28 Feb 2019 05:04:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6F3D40A55;
	Thu, 28 Feb 2019 05:04:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 60B9616BA10;
	Thu, 28 Feb 2019 00:04:54 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2019 00:04:41 -0500
Message-Id: <1551330281-32330-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551330281-32330-1-git-send-email-denys@ti.com>
References: <1551330281-32330-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/2] external-arm-toolchain: update linux-libc-headers to 4.19
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
X-List-Received-Date: Thu, 28 Feb 2019 05:05:00 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-arm-toolchain.bbappend           | 23 ++++++----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
index 8b947d1..46c44cb 100644
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -3,20 +3,22 @@
 # on linux-libc-headers creates circular dependencies now. Mostly
 # duplication of code from corresponding recipe.
 
-BRANCH = "ti-lsk-linux-4.14.y"
-SRCREV = "3e50654361c34b75784ab7c8c9aa8e96b3a37fc1"
+BRANCH = "ti-linux-4.19.y"
+SRCREV = "8de817772462078a064b70d368eeae3b92a31439"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
-PKGV_linux-libc-headers-dev = "4.14"
-PKGV_linux-libc-headers = "4.14"
+PKGV_linux-libc-headers-dev = "4.19"
+PKGV_linux-libc-headers = "4.19"
 
 inherit kernel-arch pkgconfig multilib_header
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
 
+DEPENDS += "bison-native"
+
 do_configure_append() {
 	cd ${WORKDIR}/git
 	oe_runmake allnoconfig
@@ -32,16 +34,3 @@ do_install_append() {
 	# The ..install.cmd conflicts between various configure runs
 	find ${D}${exec_prefix} -name ..install.cmd | xargs rm -f
 }
-
-do_install_append_aarch64 () {
-        do_install_asm_armmultilib
-}
-
-do_install_append_arm () {
-	do_install_asm_armmultilib
-}
-
-do_install_asm_armmultilib () {
-	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/mman.h asm/param.h asm/perf_regs.h
-	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
-}
-- 
2.7.4


