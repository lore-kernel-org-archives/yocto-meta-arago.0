Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3278652A35
	for <meta-arago@arago-project.org>;
	Wed, 19 Jul 2017 17:14:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6JHE3mE010413
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 12:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500484443;
	bh=bZEuUFICIYH4SuQW5orpF9aXjdWQsbuUtUYn+AllKTI=;
	h=From:To:CC:Subject:Date;
	b=URwWF+aBQBT3CM3l56VA/FrJNVF4K+ClM/blTJyoNqCBD49FMGyWytanO1hkQGuhR
	wGfAvNhsup+3vkCeZ93OCu1QkdAr/4UiB4G1TKUNbF7G9pWmWlKELT6/8pLsQ6xhXh
	2qXG+6+LkfzeLpP6aK7Y8to7ERe+Fe44qKGk5WbA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6JHDvjB016494
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 12:13:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Jul 2017 12:13:57 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6JHDvBj016462;	Wed, 19 Jul 2017 12:13:57 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jul 2017 13:07:47 -0400
Message-ID: <1500484068-17107-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] iproute2: backport version 4.9.0
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
X-List-Received-Date: Wed, 19 Jul 2017 17:14:13 -0000
Content-Type: text/plain

* Backport iproute2 4.9.0 from oe-core.
* Recipes were directly copied from commit
  eac08770b1ea3ca6640941dc8fd03fc3fa5ff869

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-connectivity/iproute2/iproute2.inc     |  48 ++++++++
 .../iproute2/0001-iproute2-de-bash-scripts.patch   |  64 ++++++++++
 .../iproute2/iproute2/configure-cross.patch        |  32 +++++
 .../iproute2/iproute2/iproute2-4.9.0-musl.patch    | 131 +++++++++++++++++++++
 .../iproute2/iproute2_4.9.0.bb                     |  14 +++
 5 files changed, 289 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bb

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc b/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
new file mode 100644
index 0000000..ce64888
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
@@ -0,0 +1,48 @@
+SUMMARY = "TCP / IP networking and traffic control utilities"
+DESCRIPTION = "Iproute2 is a collection of utilities for controlling \
+TCP / IP networking and traffic control in Linux.  Of the utilities ip \
+and tc are the most important.  ip controls IPv4 and IPv6 \
+configuration and tc stands for traffic control."
+HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
+SECTION = "base"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
+
+DEPENDS = "flex-native bison-native iptables elfutils"
+
+inherit update-alternatives bash-completion pkgconfig
+
+EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
+
+do_configure_append () {
+    sh configure ${STAGING_INCDIR}
+    # Explicitly disable ATM support
+    sed -i -e '/TC_CONFIG_ATM/d' Config
+}
+
+do_install () {
+    oe_runmake DESTDIR=${D} install
+    mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
+    install -d ${D}${datadir}
+    mv ${D}/share/* ${D}${datadir}/ || true
+    rm ${D}/share -rf || true
+}
+
+# The .so files in iproute2-tc are modules, not traditional libraries
+INSANE_SKIP_${PN}-tc = "dev-so"
+
+PACKAGES =+ "${PN}-tc ${PN}-lnstat ${PN}-ifstat ${PN}-genl ${PN}-rtacct ${PN}-nstat ${PN}-ss"
+FILES_${PN}-tc = "${base_sbindir}/tc* \
+                  ${libdir}/tc/*.so"
+FILES_${PN}-lnstat = "${base_sbindir}/lnstat ${base_sbindir}/ctstat ${base_sbindir}/rtstat"
+FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
+FILES_${PN}-genl = "${base_sbindir}/genl"
+FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
+FILES_${PN}-nstat = "${base_sbindir}/nstat"
+FILES_${PN}-ss = "${base_sbindir}/ss"
+
+ALTERNATIVE_${PN} = "ip"
+ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
+ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
+ALTERNATIVE_PRIORITY = "100"
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
new file mode 100644
index 0000000..39c7d40
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
@@ -0,0 +1,64 @@
+Subject: [PATCH] iproute2: de-bash scripts
+
+de-bash these two scripts to make iproute2 not depend on bash.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ ip/ifcfg |   15 ++++++++-------
+ ip/rtpr  |    2 +-
+ 2 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/ip/ifcfg b/ip/ifcfg
+index 083d9df..60bcf1f 100644
+--- a/ip/ifcfg
++++ b/ip/ifcfg
+@@ -1,12 +1,13 @@
+-#! /bin/bash
++#! /bin/sh
+ 
+ CheckForwarding () {
+-  local sbase fwd
++  local sbase fwd forwarding
+   sbase=/proc/sys/net/ipv4/conf
+   fwd=0
+   if [ -d $sbase ]; then
+     for dir in $sbase/*/forwarding; do
+-      fwd=$[$fwd + `cat $dir`]
++      forwarding=`cat $dir`
++      fwd=$(($fwd+$forwarding))
+     done
+   else
+     fwd=2
+@@ -127,12 +128,12 @@ fi
+ arping -q -A -c 1 -I $dev $ipaddr
+ noarp=$?
+ ( sleep 2 ;
+-  arping -q -U -c 1 -I $dev $ipaddr ) >& /dev/null </dev/null &
++  arping -q -U -c 1 -I $dev $ipaddr ) > /dev/null 2>&1 </dev/null &
+ 
+-ip route add unreachable 224.0.0.0/24 >& /dev/null
+-ip route add unreachable 255.255.255.255 >& /dev/null
++ip route add unreachable 224.0.0.0/24 > /dev/null 2>&1
++ip route add unreachable 255.255.255.255 > /dev/null 2>&1
+ if [ `ip link ls $dev | grep -c MULTICAST` -ge 1 ]; then
+-  ip route add 224.0.0.0/4 dev $dev scope global >& /dev/null
++  ip route add 224.0.0.0/4 dev $dev scope global > /dev/null 2>&1
+ fi
+ 
+ if [ $fwd -eq 0 ]; then
+diff --git a/ip/rtpr b/ip/rtpr
+index c3629fd..674198d 100644
+--- a/ip/rtpr
++++ b/ip/rtpr
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ 
+ exec tr "[\\\\]" "[
+ ]"
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch
new file mode 100644
index 0000000..866609c
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch
@@ -0,0 +1,32 @@
+From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 3 Nov 2011 10:46:16 +0100
+Subject: [PATCH] make configure cross compile safe
+
+According to Kevin Tian:
+Upstream-Status: Pending
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+
+Index: iproute2-3.7.0/configure
+===================================================================
+--- iproute2-3.7.0.orig/configure
++++ iproute2-3.7.0/configure
+@@ -2,6 +2,7 @@
+ # This is not an autconf generated configure
+ #
+ INCLUDE=${1:-"$PWD/include"}
++SYSROOT=$1
+ 
+ # Make a temp directory in build tree.
+ TMPDIR=$(mktemp -d config.XXXXXX)
+@@ -158,7 +159,7 @@ check_ipt_lib_dir()
+ 		return
+ 	fi
+ 
+-	for dir in /lib /usr/lib /usr/local/lib
++	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
+ 	do
+ 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
+ 			if [ -f $file ]; then
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
new file mode 100644
index 0000000..737a90c
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
@@ -0,0 +1,131 @@
+Subject: [PATCH] Avoid in6_addr redefinition
+
+Due to both <netinet/in.h> and <linux/in6.h> being included, the 
+in6_addr is being redefined: once from the C library headers and once
+from the kernel headers. This causes some build failures with for 
+example the musl C library.
+
+In order to fix this, use just the C library header <netinet/in.h>.
+Original patch taken from
+http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
+
+(Refreshed the patch for 4.9 release)
+
+Upstream-Status: Pending
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ include/libiptc/ipt_kernel_headers.h     | 1 -
+ include/linux/if_bridge.h                | 1 -
+ include/linux/if_tunnel.h                | 2 --
+ include/linux/netfilter.h                | 2 --
+ include/linux/netfilter_ipv4/ip_tables.h | 1 -
+ include/linux/xfrm.h                     | 1 -
+ include/utils.h                          | 1 +
+ ip/ip6tunnel.c                           | 1 -
+ 8 files changed, 1 insertion(+), 9 deletions(-)
+
+diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
+index a5963e9..42f8610 100644
+--- a/include/libiptc/ipt_kernel_headers.h
++++ b/include/libiptc/ipt_kernel_headers.h
+@@ -6,7 +6,6 @@
+ #include <limits.h>
+ 
+ #include <netinet/ip.h>
+-#include <netinet/in.h>
+ #include <netinet/ip_icmp.h>
+ #include <netinet/tcp.h>
+ #include <netinet/udp.h>
+diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
+index b7393dd..a7028ab 100644
+--- a/include/linux/if_bridge.h
++++ b/include/linux/if_bridge.h
+@@ -15,7 +15,6 @@
+ 
+ #include <linux/types.h>
+ #include <linux/if_ether.h>
+-#include <linux/in6.h>
+ 
+ #define SYSFS_BRIDGE_ATTR	"bridge"
+ #define SYSFS_BRIDGE_FDB	"brforward"
+diff --git a/include/linux/if_tunnel.h b/include/linux/if_tunnel.h
+index 4f975f5..2680646 100644
+--- a/include/linux/if_tunnel.h
++++ b/include/linux/if_tunnel.h
+@@ -2,9 +2,7 @@
+ #define _IF_TUNNEL_H_
+ 
+ #include <linux/types.h>
+-#include <linux/if.h>
+ #include <linux/ip.h>
+-#include <linux/in6.h>
+ #include <asm/byteorder.h>
+ 
+ 
+diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
+index b71b4c9..3e4e6ae 100644
+--- a/include/linux/netfilter.h
++++ b/include/linux/netfilter.h
+@@ -4,8 +4,6 @@
+ #include <linux/types.h>
+ 
+ #include <linux/sysctl.h>
+-#include <linux/in.h>
+-#include <linux/in6.h>
+ 
+ /* Responses from hook functions. */
+ #define NF_DROP 0
+diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
+index 456fb86..38542b4 100644
+--- a/include/linux/netfilter_ipv4/ip_tables.h
++++ b/include/linux/netfilter_ipv4/ip_tables.h
+@@ -17,7 +17,6 @@
+ 
+ #include <linux/types.h>
+ 
+-#include <linux/if.h>
+ #include <linux/netfilter_ipv4.h>
+ 
+ #include <linux/netfilter/x_tables.h>
+diff --git a/include/linux/xfrm.h b/include/linux/xfrm.h
+index d2dd1fd..8c72966 100644
+--- a/include/linux/xfrm.h
++++ b/include/linux/xfrm.h
+@@ -1,7 +1,6 @@
+ #ifndef _LINUX_XFRM_H
+ #define _LINUX_XFRM_H
+ 
+-#include <linux/in6.h>
+ #include <linux/types.h>
+ 
+ /* All of the structures in this file may not change size as they are
+diff --git a/include/utils.h b/include/utils.h
+index 1b4f939..d10840b 100644
+--- a/include/utils.h
++++ b/include/utils.h
+@@ -1,6 +1,7 @@
+ #ifndef __UTILS_H__
+ #define __UTILS_H__ 1
+ 
++#include <sys/param.h>  /* MAXPATHLEN */
+ #include <sys/types.h>
+ #include <asm/types.h>
+ #include <resolv.h>
+diff --git a/ip/ip6tunnel.c b/ip/ip6tunnel.c
+index b1c0ae6..8fa4eb2 100644
+--- a/ip/ip6tunnel.c
++++ b/ip/ip6tunnel.c
+@@ -28,7 +28,6 @@
+ #include <arpa/inet.h>
+ #include <sys/ioctl.h>
+ #include <linux/ip.h>
+-#include <linux/if.h>
+ #include <linux/if_arp.h>
+ #include <linux/if_tunnel.h>
+ #include <linux/ip6_tunnel.h>
+-- 
+2.7.4
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bb b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bb
new file mode 100644
index 0000000..808e550
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bb
@@ -0,0 +1,14 @@
+require iproute2.inc
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
+           file://configure-cross.patch \
+           file://0001-iproute2-de-bash-scripts.patch \
+           file://iproute2-4.9.0-musl.patch \
+          "
+
+SRC_URI[md5sum] = "44a8371a4b2c40e48e4c9f98cbd41391"
+SRC_URI[sha256sum] = "c0f30f043f7767cc1b2cd2197b08d4e9b2392c95823fabe30bbce308c30116c4"
+
+# CFLAGS are computed in Makefile and reference CCOPTS
+#
+EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
-- 
2.7.4


