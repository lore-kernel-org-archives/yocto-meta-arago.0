Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4FAFD529FE
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 20:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E8B6420AA4;
	Wed,  7 Feb 2018 20:33:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 21XDu7EliiOn; Wed,  7 Feb 2018 20:33:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F39420B5E;
	Wed,  7 Feb 2018 20:33:20 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3F68F163290;
	Wed,  7 Feb 2018 15:33:18 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Feb 2018 15:33:13 -0500
Message-Id: <1518035594-38357-14-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518035594-38357-1-git-send-email-denys@ti.com>
References: <1518035594-38357-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 14/15] external-linaro-toolchain: install custom linux-libc-headers on top
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
X-List-Received-Date: Wed, 07 Feb 2018 20:33:33 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-linaro-toolchain.bbappend        | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend

diff --git a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
new file mode 100644
index 0000000..0120c12
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -0,0 +1,44 @@
+# This is a rather hacky way to install custom linux-libc-headers
+# on top of the external-linaro-toolchain, since simply depending
+# on linux-libc-headers creates circular dependencies now. Mostly
+# duplication of code from corresponding recipe.
+
+BRANCH = "ti-lsk-linux-4.9.y"
+SRCREV = "1c74e8801cf58a30394ae92236895599f2c77253"
+
+KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
+
+inherit kernel-arch pkgconfig multilib_header
+
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
+
+do_configure_append() {
+	cd ${WORKDIR}/git
+	oe_runmake allnoconfig
+}
+
+do_install_append() {
+	cd ${WORKDIR}/git
+	oe_runmake headers_install INSTALL_HDR_PATH=${B}${exec_prefix}
+
+	# The ..install.cmd conflicts between various configure runs
+	find ${B}${includedir} -name ..install.cmd | xargs rm -f
+
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+	cp ${CP_ARGS} ${B}${includedir} ${D}${exec_prefix}
+}
+
+do_install_append_aarch64 () {
+        do_install_asm_armmultilib
+}
+
+do_install_append_arm () {
+	do_install_asm_armmultilib
+}
+
+do_install_asm_armmultilib () {
+	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/mman.h asm/param.h asm/perf_regs.h
+	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
+}
-- 
2.7.4


