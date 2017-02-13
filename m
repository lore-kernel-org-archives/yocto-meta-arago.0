Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2D47852A8E
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 23:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0BA3520B52;
	Mon, 13 Feb 2017 23:04:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id B5chBU1UJ4HI; Mon, 13 Feb 2017 23:04:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BEA4320B55;
	Mon, 13 Feb 2017 23:04:25 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 06CC1162325;
	Mon, 13 Feb 2017 18:04:25 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 13 Feb 2017 18:04:05 -0500
Message-Id: <1487027048-101336-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/4] toolchain-linaro: move license code to handler due to elt_get_*_version() scope
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
X-List-Received-Date: Mon, 13 Feb 2017 23:04:30 -0000

Since elt_get_*_version() functions are only available when building with Linaro
toolchain, invoking them to set licenses inside the recipe breaks parsing when
other toolchains are used. Mimic setting version variables in a handler and set
license variables similarly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/toolchain-linaro.inc       | 37 ++++++++++++++++++++++
 .../meta/external-linaro-toolchain.bbappend        | 28 +++++-----------
 2 files changed, 45 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 65b7beb..c1a57f7 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -59,3 +59,40 @@ PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial ?= "${GLIBCINITVERSION}"
+
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
+
+python external_linaro_toolchain_license_handler () {
+	if not isinstance(e, bb.event.ConfigParsed):
+		return
+	d = e.data
+	ld = d.createCopy()
+	ld.finalize()
+
+	lc_libc = "LGPL-2.1"
+	lc_gcc = ["GPL-3.0", "GPL-2.0"][elt_get_gcc_version(ld) <= "4.2.1"]
+	lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][elt_get_gcc_version(ld) <= "4.3.3"]
+	lc_gdb = ["GPL-3.0", "GPL-2.0"][elt_get_gdb_version(ld) <= "6.6"]
+#	lc_bfd = ["GPL-3.0", "GPL-2.0"][elt_get_bfd_version(ld) <= "2.17"]
+
+	d.setVar('ELT_LIC_LIBC', lc_libc)
+	d.setVar('ELT_LIC_GCC', lc_gcc)
+	d.setVar('ELT_LIC_RLE', lc_rle)
+	d.setVar('ELT_LIC_GDB', lc_gdb)
+#	d.setVar('ELT_LIC_BFD', lc_bfd)
+
+	d.setVar('ELT_LICENSE', "%s&%s&%s&%s" % (lc_libc, lc_gcc, lc_rle, lc_gdb))
+}
+addhandler external_linaro_toolchain_license_handler
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index aefa99e..5f42413 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -103,26 +103,14 @@ FILES_libgomp-dev += "\
 	${libdir}/gcc/${ELT_TARGET_SYS} \
 "
 
-# Licenses set for main components of the toolchain:
-# (g)libc is always LGPL version 2 (or later)
-# gcc has switched from GPL version 2 (or later) to version 3 (or later) after 4.2.1,
-#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg00003.html
-# libgcc and libstdc++ always had exceptions to GPL called Runtime Library Exception, but
-#    it was based on GPL version 2 (or later), until new GPL version 3 (or later) exception
-#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/2009/msg00000.html
-#    and http://www.gnu.org/licenses/gcc-exception.html, which was several days after
-#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
-# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or later), according
-#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
-# binutils version 2.17 was the last one under GPL version 2 (or later), according
-#    to the published releases - http://ftp.gnu.org/gnu/binutils/
-ELT_LIC_LIBC := "LGPL-2.1"
-ELT_LIC_GCC := "${@["GPL-3", "GPL-2"][elt_get_gcc_version(d) <= "4.2.1"]}"
-ELT_LIC_RLE := "${@["GPL-3-with-GCC-exception", "GPL-2-with-GCC-exception"][elt_get_gcc_version(d) <= "4.3.3"]}"
-ELT_LIC_GDB := "${@["GPL-3", "GPL-2"][elt_get_gdb_version(d) <= "6.6"]}"
-#ELT_LIC_BFD := "${@["GPL-3", "GPL-2"][elt_get_bfd_version(d) <= "2.17"]}"
-
-LICENSE = "${ELT_LIC_LIBC}&${ELT_LIC_GCC}&${ELT_LIC_RLE}&${ELT_LIC_GDB}"
+ELT_LIC_LIBC ?= ""
+ELT_LIC_GCC ?= ""
+ELT_LIC_RLE ?= ""
+ELT_LIC_GDB ?= ""
+ELT_LIC_BFD ?= ""
+ELT_LICENSE ?= "MIT"
+
+LICENSE = "${ELT_LICENSE}"
 LICENSE_ldd = "${ELT_LIC_LIBC}"
 LICENSE_glibc = "${ELT_LIC_LIBC}"
 LICENSE_glibc-thread-db = "${ELT_LIC_LIBC}"
-- 
2.7.4


