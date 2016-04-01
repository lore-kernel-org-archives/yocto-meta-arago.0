Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id B18FC52A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:42:05 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X00MDWRLQ0W30@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:50 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=LuNggPYUmckMftmGYWMA:9
Received: by 100.15.86.14 with SMTP id 0e79dc79; Fri, 01 Apr 2016 03:41:50 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B6571161F5B;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:23 -0400
Message-id: <1459482106-27723-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 03/26] linux-libc-headers: remove version 4.1, default to 4.4
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
X-List-Received-Date: Fri, 01 Apr 2016 03:42:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux-libc-headers/linux-libc-headers.inc      | 75 ----------------------
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |  7 --
 2 files changed, 82 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 delete mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
deleted file mode 100644
index 566bc1e..0000000
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ /dev/null
@@ -1,75 +0,0 @@
-SUMMARY = "Sanitized set of kernel headers for the C library's use"
-SECTION = "devel"
-LICENSE = "GPLv2"
-
-#########################################################################
-####                        PLEASE READ 
-#########################################################################
-#
-# You're probably looking here thinking you need to create some new copy
-# of linux-libc-headers since you have your own custom kernel. To put 
-# this simply, you DO NOT.
-#
-# Why? These headers are used to build the libc. If you customise the 
-# headers you are customising the libc and the libc becomes machine
-# specific. Most people do not add custom libc extensions to the kernel
-# and have a machine specific libc.
-#
-# But you have some kernel headers you need for some driver? That is fine
-# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
-# This will make the package using them machine specific but this is much
-# better than having a machine specific C library. This does mean your 
-# recipe needs a DEPENDS += "virtual/kernel" but again, that is fine and
-# makes total sense.
-#
-# There can also be a case where your kernel extremely old and you want
-# an older libc ABI for that old kernel. The headers installed by this
-# recipe should still be a standard mainline kernel, not your own custom 
-# one.
-#
-# -- RP
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-python __anonymous () {
-    major = d.getVar("PV",True).split('.')[0]
-    if major == "3":
-        d.setVar("HEADER_FETCH_VER", "3.0")
-    elif major == "4":
-        d.setVar("HEADER_FETCH_VER", "4.x")
-    else:
-        d.setVar("HEADER_FETCH_VER", "2.6")
-}
-
-inherit kernel-arch
-
-KORG_ARCHIVE_COMPRESSION ?= "bz2"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.${KORG_ARCHIVE_COMPRESSION}"
-
-S = "${WORKDIR}/linux-${PV}"
-
-do_configure() {
-	oe_runmake allnoconfig
-}
-
-do_compile () {
-}
-
-do_install() {
-	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix}
-	# Kernel should not be exporting this header
-	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
-
-	# The ..install.cmd conflicts between various configure runs
-	find ${D}${includedir} -name ..install.cmd | xargs rm -f
-}
-
-BBCLASSEXTEND = "nativesdk"
-
-#DEPENDS = "cross-linkage"
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-
-INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS += "unifdef-native"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
deleted file mode 100644
index d816e5e..0000000
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-KORG_ARCHIVE_COMPRESSION = "xz"
-
-require linux-libc-headers.inc
-
-SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
-SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
-
-- 
2.2.0


