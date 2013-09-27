Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTP id 7E08652090
	for <meta-arago@arago-project.org>;
	Fri, 27 Sep 2013 06:06:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTR007INSY9LI60@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 27 Sep 2013 01:06:15 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 523D920033; Fri,
	27 Sep 2013 02:06:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 27 Sep 2013 02:06:08 -0400
Message-id: <1380261968-27765-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] external-linaro-toolchain: add a way to use specific linux-libc-headers provider and version
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
X-List-Received-Date: Fri, 27 Sep 2013 06:06:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Use it by default in our distro - the preferred version may need to be adjusted
based on the kernel version used by individual platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc  |  7 +++++++
 .../recipes-core/meta/external-linaro-toolchain.bbappend    | 13 ++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 1ab13ee..cc12f08 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -15,6 +15,11 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-t
 TOOLCHAIN_SYS := "${ELT_TARGET_SYS}"
 TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
 
+# Use specific libc headers instead of ones provided by toolchain
+PREFERRED_PROVIDER_linux-libc-headers_forcevariable = "linux-libc-headers"
+PREFERRED_PROVIDER_linux-libc-headers-dev_forcevariable = "linux-libc-headers"
+PREFERRED_PROVIDER_virtual/linux-libc-headers_forcevariable = "linux-libc-headers"
+
 PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-linaro-sdk-toolchain"
 PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-linaro-sdk-toolchain"
 #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "external-linaro-sdk-toolchain"
@@ -27,6 +32,7 @@ SDKGCCVERSION ?= "4.7%"
 SDKBINUVERSION ?= "2.23%"
 SDKEGLIBCVERSION ?= "2.17%"
 SDKLINUXLIBCVERSION ?= "3.8%"
+LINUXLIBCVERSION ?= "3.8%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
@@ -34,6 +40,7 @@ PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
+PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc ?= "${SDKEGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${SDKEGLIBCVERSION}"
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 09f68d8..f8ad2cc 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -2,12 +2,20 @@ INSANE_SKIP_libstdc++-dev += "staticdev"
 
 ALLOW_EMPTY_${PN}-utils = "1"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
+PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
+PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES += "virtual/${TARGET_PREFIX}gcc-intermediate"
+PROVIDES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', 'linux-libc-headers linux-libc-headers-dev', '', d)}"
 
+PACKAGES := "${@oe_filter_out('linux-libc-headers', '${PACKAGES}', d)}"
+PACKAGES := "${@oe_filter_out('linux-libc-headers-dev', '${PACKAGES}', d)}"
 PACKAGES := "${@oe_filter_out('libsegfault', '${PACKAGES}', d)}"
 PACKAGES =+ "libsegfault"
+PACKAGES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', 'linux-libc-headers-dev', '', d)}"
+
+DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
 
 RDEPENDS_${PN}-utils = ""
 
@@ -90,6 +98,9 @@ do_install_append() {
 	install -d ${D}/include
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}/include
 
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/scsi/.install; rm -rf ${D}${includedir}/scsi/scsi_netlink*; rm -rf ${D}${includedir}/scsi/scsi_bsg*', d)}
+
 	rm -rf ${D}/lib/libgfortran*
 	rm -rf ${D}/lib/ldscripts
 	rm -rf ${D}${datadir}/lintian
-- 
1.8.3.2


