Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id AFA5B52A76
	for <meta-arago@arago-project.org>;
	Tue, 28 Apr 2020 23:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE98F40BDF;
	Tue, 28 Apr 2020 23:22:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4TIzADprUxiS; Tue, 28 Apr 2020 23:22:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D35C940AB5;
	Tue, 28 Apr 2020 23:22:34 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 92D5F16E905;
	Tue, 28 Apr 2020 19:22:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 28 Apr 2020 19:22:34 -0400
Message-Id: <1588116154-42139-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] iproute2: drop previously overlayed 4.19 version
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
X-List-Received-Date: Tue, 28 Apr 2020 23:24:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/iproute2/iproute2.inc     | 54 ----------------------
 .../iproute2/0001-ip-Remove-unneed-header.patch    | 30 ------------
 .../0001-libc-compat.h-add-musl-workaround.patch   | 41 ----------------
 .../iproute2/iproute2/configure-cross.patch        | 32 -------------
 .../iproute2/iproute2_4.19.0.bb                    | 14 ------
 5 files changed, 171 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bb

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc b/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
deleted file mode 100644
index b283589..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
+++ /dev/null
@@ -1,54 +0,0 @@
-SUMMARY = "TCP / IP networking and traffic control utilities"
-DESCRIPTION = "Iproute2 is a collection of utilities for controlling \
-TCP / IP networking and traffic control in Linux.  Of the utilities ip \
-and tc are the most important.  ip controls IPv4 and IPv6 \
-configuration and tc stands for traffic control."
-HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
-SECTION = "base"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
-
-DEPENDS = "flex-native bison-native iptables elfutils libcap"
-
-inherit update-alternatives bash-completion pkgconfig
-
-CLEANBROKEN = "1"
-
-PACKAGECONFIG ??= "tipc"
-PACKAGECONFIG[tipc] = ",,libmnl,"
-
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
-
-do_configure_append () {
-    sh configure ${STAGING_INCDIR}
-    # Explicitly disable ATM support
-    sed -i -e '/TC_CONFIG_ATM/d' config.mk
-}
-
-do_install () {
-    oe_runmake DESTDIR=${D} install
-    mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
-    install -d ${D}${datadir}
-    mv ${D}/share/* ${D}${datadir}/ || true
-    rm ${D}/share -rf || true
-}
-
-# The .so files in iproute2-tc are modules, not traditional libraries
-INSANE_SKIP_${PN}-tc = "dev-so"
-
-PACKAGES =+ "${PN}-tc ${PN}-lnstat ${PN}-ifstat ${PN}-genl ${PN}-rtacct ${PN}-nstat ${PN}-ss ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
-FILES_${PN}-tc = "${base_sbindir}/tc* \
-                  ${libdir}/tc/*.so"
-FILES_${PN}-lnstat = "${base_sbindir}/lnstat ${base_sbindir}/ctstat ${base_sbindir}/rtstat"
-FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
-FILES_${PN}-genl = "${base_sbindir}/genl"
-FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
-FILES_${PN}-nstat = "${base_sbindir}/nstat"
-FILES_${PN}-ss = "${base_sbindir}/ss"
-FILES_${PN}-tipc = "${base_sbindir}/tipc"
-
-ALTERNATIVE_${PN} = "ip"
-ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
-ALTERNATIVE_PRIORITY = "100"
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
deleted file mode 100644
index a9027c5..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 02ed10fc5215c4a32e6740b0a0c2439659be6801 Mon Sep 17 00:00:00 2001
-From: Changhyeok Bae <changhyeok.bae@gmail.com>
-Date: Mon, 13 Nov 2017 15:59:35 +0000
-Subject: [PATCH] ip: Remove unneed header
-
-Fix redefinition of struct ethhdr with a suitably patched musl libc
-that suppresses the kernel if_ether.h.
-
-Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
-
-Upstream-Status: Pending [netdev@vger.kernel.org]
----
- ip/iplink_bridge.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/ip/iplink_bridge.c b/ip/iplink_bridge.c
-index cccdec1..f065b22 100644
---- a/ip/iplink_bridge.c
-+++ b/ip/iplink_bridge.c
-@@ -13,7 +13,6 @@
- #include <stdlib.h>
- #include <string.h>
- #include <netinet/in.h>
--#include <netinet/ether.h>
- #include <linux/if_link.h>
- #include <linux/if_bridge.h>
- #include <net/if.h>
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
deleted file mode 100644
index 50c4bfb..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b7d96340c55afb7023ded0041107c63dbd886196 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 22 Dec 2016 15:26:30 +0200
-Subject: [PATCH] libc-compat.h: add musl workaround
-
-The libc-compat.h kernel header uses glibc specific macros (__GLIBC__ and
-__USE_MISC) to solve conflicts with libc provided headers. This patch makes
-libc-compat.h work for musl libc as well.
-
-Upstream-Status: Pending
-
-Taken From:
-https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- include/uapi/linux/libc-compat.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
-index f38571d..30f0b67 100644
---- a/include/uapi/linux/libc-compat.h
-+++ b/include/uapi/linux/libc-compat.h
-@@ -49,10 +49,12 @@
- #define _LIBC_COMPAT_H
- 
- /* We have included glibc headers... */
--#if defined(__GLIBC__)
-+#if 1
-+#define __USE_MISC
- 
- /* Coordinate with glibc net/if.h header. */
- #if defined(_NET_IF_H) && defined(__USE_MISC)
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
- 
- /* GLIBC headers included first so don't define anything
-  * that would already be defined. */
--- 
-2.4.0
-
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch
deleted file mode 100644
index 8b75a2a..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 3 Nov 2011 10:46:16 +0100
-Subject: [PATCH] make configure cross compile safe
-
-According to Kevin Tian:
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
-Index: iproute2-4.14.1/configure
-===================================================================
---- iproute2-4.14.1.orig/configure
-+++ iproute2-4.14.1/configure
-@@ -2,6 +2,7 @@
- # This is not an autoconf generated configure
- #
- INCLUDE=${1:-"$PWD/include"}
-+SYSROOT=$1
- 
- # Output file which is input to Makefile
- CONFIG=config.mk
-@@ -195,7 +196,7 @@ check_ipt_lib_dir()
- 		return
- 	fi
- 
--	for dir in /lib /usr/lib /usr/local/lib
-+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
- 	do
- 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
- 			if [ -f $file ]; then
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bb b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bb
deleted file mode 100644
index 6db4062..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require iproute2.inc
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
-           file://configure-cross.patch \
-           file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-ip-Remove-unneed-header.patch \
-          "
-
-SRC_URI[md5sum] = "67eeebacaac4515cab73dfd2fc796af3"
-SRC_URI[sha256sum] = "d9ec5ca1f47d8a85416fa26e7dc1cbf5d067640eb60e90bdc1c7e5bdc6a29984"
-
-# CFLAGS are computed in Makefile and reference CCOPTS
-#
-EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
-- 
2.7.4


