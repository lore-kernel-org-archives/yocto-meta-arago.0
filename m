Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E2F1C52975
	for <meta-arago@arago-project.org>;
	Mon,  2 Apr 2018 22:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B1F13209AE;
	Mon,  2 Apr 2018 22:47:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gnuiVHLXkgH6; Mon,  2 Apr 2018 22:47:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6BEA320992;
	Mon,  2 Apr 2018 22:47:24 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DAD0A163387;
	Mon,  2 Apr 2018 18:47:18 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  2 Apr 2018 18:47:15 -0400
Message-Id: <1522709238-24760-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/4] external-linaro-toolchain: cleanup ..install.cmd and overwrite PV with correct version
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
X-List-Received-Date: Mon, 02 Apr 2018 22:47:30 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend         | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
index 306c547..8addc91 100644
--- a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -10,6 +10,9 @@ KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
+PKGV_linux-libc-headers-dev = "4.14"
+PKGV_linux-libc-headers = "4.14"
+
 inherit kernel-arch pkgconfig multilib_header
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
@@ -23,11 +26,11 @@ do_install_append() {
 	cd ${WORKDIR}/git
 	oe_runmake headers_install INSTALL_HDR_PATH=${B}${exec_prefix}
 
-	# The ..install.cmd conflicts between various configure runs
-	find ${B}${includedir} -name ..install.cmd | xargs rm -f
-
 	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
 	cp ${CP_ARGS} ${B}${includedir} ${D}${exec_prefix}
+
+	# The ..install.cmd conflicts between various configure runs
+	find ${D}${exec_prefix} -name ..install.cmd | xargs rm -f
 }
 
 do_install_append_aarch64 () {
-- 
2.7.4


