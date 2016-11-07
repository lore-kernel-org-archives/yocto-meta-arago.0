Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9795652AD1
	for <meta-arago@arago-project.org>;
	Mon,  7 Nov 2016 19:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6913A209E0;
	Mon,  7 Nov 2016 19:26:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fFDtbkKMOBXP; Mon,  7 Nov 2016 19:26:51 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49B0B20567;
	Mon,  7 Nov 2016 19:26:50 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 969E316219A;
	Mon,  7 Nov 2016 14:26:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  7 Nov 2016 14:26:48 -0500
Message-Id: <1478546808-2271-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] external-linaro-toolchain: set license to individual packages properly
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
X-List-Received-Date: Mon, 07 Nov 2016 19:26:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Re-use old code from the Arago toolchain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../meta/external-linaro-toolchain.bbappend        | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 85fec2a..dad8192 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -6,7 +6,7 @@ ALLOW_EMPTY_ldd = "1"
 ALLOW_EMPTY_libstdc++ = "1"
 ALLOW_EMPTY_libgomp = "1"
 
-PR_append = ".arago31"
+PR_append = ".arago32"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -103,6 +103,37 @@ FILES_libgomp-dev += "\
 	${libdir}/gcc/${ELT_TARGET_SYS} \
 "
 
+# Licenses set for main components of the toolchain:
+# (g)libc is always LGPL version 2 (or later)
+# gcc has switched from GPL version 2 (or later) to version 3 (or later) after 4.2.1,
+#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg00003.html
+# libgcc and libstdc++ always had exceptions to GPL called Runtime Library Exception, but
+#    it was based on GPL version 2 (or later), until new GPL version 3 (or later) exception
+#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/2009/msg00000.html
+#    and http://www.gnu.org/licenses/gcc-exception.html, which was several days after
+#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
+# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or later), according
+#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
+# binutils version 2.17 was the last one under GPL version 2 (or later), according
+#    to the published releases - http://ftp.gnu.org/gnu/binutils/
+ELT_LIC_LIBC := "LGPLv2.1+"
+ELT_LIC_GCC := "${@["GPLv3+", "GPLv2+"][elt_get_gcc_version(d) <= "4.2.1"]}"
+ELT_LIC_RLE := "${@["GPLv3+ with GCC RLE", "GPLv2+ with GCC RLE"][elt_get_gcc_version(d) <= "4.3.3"]}"
+ELT_LIC_GDB := "${@["GPLv3+", "GPLv2+"][elt_get_gdb_version(d) <= "6.6"]}"
+#ELT_LIC_BFD := "${@["GPLv3+", "GPLv2+"][elt_get_bfd_version(d) <= "2.17"]}"
+
+LICENSE = "${ELT_LIC_LIBC}"
+LICENSE_ldd = "${ELT_LIC_LIBC}"
+LICENSE_glibc = "${ELT_LIC_LIBC}"
+LICENSE_glibc-thread-db = "${ELT_LIC_LIBC}"
+LICENSE_libgcc = "${ELT_LIC_RLE}"
+LICENSE_libgcc-dev = "${ELT_LIC_RLE}"
+LICENSE_libstdc++ = "${ELT_LIC_RLE}"
+LICENSE_libstdc++-dev = "${ELT_LIC_RLE}"
+LICENSE_libstdc++-staticdev = "${ELT_LIC_RLE}"
+LICENSE_gdbserver = "${ELT_LIC_GDB}"
+#LICENSE_binutils-dev = "${ELT_LIC_BFD}"
+
 do_install_append() {
 	sed -i -e "s# /lib/${ELT_TARGET_SYS}# ../../lib#g" -e "s# /usr/lib/${ELT_TARGET_SYS}# .#g" -e "s# /lib/ld-linux# ../../lib/ld-linux#g" ${D}${libdir}/libc.so
 	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libc.so
-- 
2.7.4


