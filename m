Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 5F75052A73
	for <meta-arago@arago-project.org>;
	Tue, 18 Aug 2015 00:00:44 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NT900FZD40RA6E0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 17 Aug 2015 19:00:28 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=9FJNbSiB49EZO2zrBRcA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BC787161B46;	Mon,
	17 Aug 2015 20:00:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Aug 2015 20:00:27 -0400
Message-id: <1439856027-14275-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux-libc-headers: overlay 4.1
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
X-List-Received-Date: Tue, 18 Aug 2015 00:00:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux-libc-headers/linux-libc-headers.inc      | 75 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |  7 ++
 2 files changed, 82 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
new file mode 100644
index 0000000..566bc1e
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -0,0 +1,75 @@
+SUMMARY = "Sanitized set of kernel headers for the C library's use"
+SECTION = "devel"
+LICENSE = "GPLv2"
+
+#########################################################################
+####                        PLEASE READ 
+#########################################################################
+#
+# You're probably looking here thinking you need to create some new copy
+# of linux-libc-headers since you have your own custom kernel. To put 
+# this simply, you DO NOT.
+#
+# Why? These headers are used to build the libc. If you customise the 
+# headers you are customising the libc and the libc becomes machine
+# specific. Most people do not add custom libc extensions to the kernel
+# and have a machine specific libc.
+#
+# But you have some kernel headers you need for some driver? That is fine
+# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
+# This will make the package using them machine specific but this is much
+# better than having a machine specific C library. This does mean your 
+# recipe needs a DEPENDS += "virtual/kernel" but again, that is fine and
+# makes total sense.
+#
+# There can also be a case where your kernel extremely old and you want
+# an older libc ABI for that old kernel. The headers installed by this
+# recipe should still be a standard mainline kernel, not your own custom 
+# one.
+#
+# -- RP
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+python __anonymous () {
+    major = d.getVar("PV",True).split('.')[0]
+    if major == "3":
+        d.setVar("HEADER_FETCH_VER", "3.0")
+    elif major == "4":
+        d.setVar("HEADER_FETCH_VER", "4.x")
+    else:
+        d.setVar("HEADER_FETCH_VER", "2.6")
+}
+
+inherit kernel-arch
+
+KORG_ARCHIVE_COMPRESSION ?= "bz2"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.${KORG_ARCHIVE_COMPRESSION}"
+
+S = "${WORKDIR}/linux-${PV}"
+
+do_configure() {
+	oe_runmake allnoconfig
+}
+
+do_compile () {
+}
+
+do_install() {
+	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix}
+	# Kernel should not be exporting this header
+	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
+
+	# The ..install.cmd conflicts between various configure runs
+	find ${D}${includedir} -name ..install.cmd | xargs rm -f
+}
+
+BBCLASSEXTEND = "nativesdk"
+
+#DEPENDS = "cross-linkage"
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "unifdef-native"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
new file mode 100644
index 0000000..d816e5e
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
@@ -0,0 +1,7 @@
+KORG_ARCHIVE_COMPRESSION = "xz"
+
+require linux-libc-headers.inc
+
+SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
+SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
+
-- 
2.2.0


