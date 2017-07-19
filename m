Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3B6CF529DA
	for <meta-arago@arago-project.org>;
	Wed, 19 Jul 2017 18:23:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6JINq25031838
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 13:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500488632;
	bh=ZU7/N3xVUfjZ2xEHuP2lYnXVrnqLkVYoE8ophcYmmQE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=slZnR6n6R27irFYOZy8BnsxJwu9jVRwuh34XE8Bg1sATcTFUcaaTcQOrDhAHUt9kK
	/bY7vukc7xp3LEMxot9WGUp+jTYNWvvmHg8HJvnNfVu0gqmI9jaLy18vopUMl6ugjr
	OYr8+F1ogUzmpDICeBtDSny6J2fgfhpmu1K8sT2k=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6JINqxK026876
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 13:23:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Jul 2017 13:23:51 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6JINoVJ017392;	Wed, 19 Jul 2017 13:23:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jul 2017 14:17:43 -0400
Message-ID: <1500488263-22611-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500488263-22611-1-git-send-email-j-stiffler@ti.com>
References: <1500488263-22611-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] iproute2: add hsr/prp support
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
X-List-Received-Date: Wed, 19 Jul 2017 18:23:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: add bbappend in meta-arago-distro for hsr/prp support patches

 .../0001-ip-HSR-Fix-cut-and-paste-error.patch      |  27 +++
 .../0002-add-support-for-prp-similar-to-hsr.patch  | 221 +++++++++++++++++++++
 .../iproute2/iproute2_4.9.0.bbappend               |   8 +
 3 files changed, 256 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-HSR-Fix-cut-and-paste-error.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-add-support-for-prp-similar-to-hsr.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-HSR-Fix-cut-and-paste-error.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-HSR-Fix-cut-and-paste-error.patch
new file mode 100644
index 0000000..25249ab
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-HSR-Fix-cut-and-paste-error.patch
@@ -0,0 +1,27 @@
+From 3f586aee3d617b1281d5c535caafd9f09d06f5fb Mon Sep 17 00:00:00 2001
+From: Ralf Baechle <ralf@linux-mips.org>
+Date: Mon, 6 Feb 2017 21:47:35 +0100
+Subject: [PATCH 1/2] ip: HSR: Fix cut and paste error
+
+Fixes: 5c0aec93a516 ("ip: Add HSR support")
+Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
+---
+ ip/iplink_hsr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
+index cb744eb..696b2c9 100644
+--- a/ip/iplink_hsr.c
++++ b/ip/iplink_hsr.c
+@@ -144,7 +144,7 @@ static void hsr_print_help(struct link_util *lu, int argc, char **argv,
+ 
+ struct link_util hsr_link_util = {
+ 	.id		= "hsr",
+-	.maxattr	= IFLA_VLAN_MAX,
++	.maxattr	= IFLA_HSR_MAX,
+ 	.parse_opt	= hsr_parse_opt,
+ 	.print_opt	= hsr_print_opt,
+ 	.print_help	= hsr_print_help,
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-add-support-for-prp-similar-to-hsr.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-add-support-for-prp-similar-to-hsr.patch
new file mode 100644
index 0000000..d0d74b5
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-add-support-for-prp-similar-to-hsr.patch
@@ -0,0 +1,221 @@
+From c245063217c7c27c3b324c1faba3b69b50c50fd1 Mon Sep 17 00:00:00 2001
+From: Murali Karicheri <m-karicheri2@ti.com>
+Date: Wed, 12 Apr 2017 16:23:37 -0400
+Subject: [PATCH 2/2] add support for prp similar to hsr
+
+prp protocol is similar to hsr in many aspects and this patch add a
+command type prp to create prp interface using two slave interfaces
+similar to hsr
+
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+
+Conflicts:
+	include/linux/if_link.h
+	ip/Makefile
+---
+ include/linux/if_link.h |  14 ++++-
+ ip/Makefile             |   2 +-
+ ip/iplink_prp.c         | 141 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 154 insertions(+), 3 deletions(-)
+ create mode 100644 ip/iplink_prp.c
+
+diff --git a/include/linux/if_link.h b/include/linux/if_link.h
+index 20965c9..6b9b59b 100644
+--- a/include/linux/if_link.h
++++ b/include/linux/if_link.h
+@@ -810,7 +810,6 @@ enum {
+ 
+ 
+ /* HSR section */
+-
+ enum {
+ 	IFLA_HSR_UNSPEC,
+ 	IFLA_HSR_SLAVE1,
+@@ -821,7 +820,6 @@ enum {
+ 	IFLA_HSR_VERSION,		/* HSR version */
+ 	__IFLA_HSR_MAX,
+ };
+-
+ #define IFLA_HSR_MAX (__IFLA_HSR_MAX - 1)
+ 
+ /* STATS section */
+@@ -881,4 +879,16 @@ enum {
+ 
+ #define IFLA_XDP_MAX (__IFLA_XDP_MAX - 1)
+ 
++/* PRP section */
++enum {
++	IFLA_PRP_UNSPEC,
++	IFLA_PRP_SLAVE1,
++	IFLA_PRP_SLAVE2,
++	IFLA_PRP_MULTICAST_SPEC,	/* Last byte of supervision addr */
++	IFLA_PRP_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
++	IFLA_PRP_SEQ_NR,
++	__IFLA_PRP_MAX,
++};
++#define IFLA_PRP_MAX (__IFLA_PRP_MAX - 1)
++
+ #endif /* _LINUX_IF_LINK_H */
+diff --git a/ip/Makefile b/ip/Makefile
+index 86c8cdc..95f0fa5 100644
+--- a/ip/Makefile
++++ b/ip/Makefile
+@@ -6,7 +6,7 @@ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o ipnetns.o \
+     iplink_macvlan.o ipl2tp.o link_vti.o link_vti6.o \
+     iplink_vxlan.o tcp_metrics.o iplink_ipoib.o ipnetconf.o link_ip6tnl.o \
+     link_iptnl.o link_gre6.o iplink_bond.o iplink_bond_slave.o iplink_hsr.o \
+-    iplink_bridge.o iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
++    iplink_prp.o iplink_bridge.o iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
+     iplink_geneve.o iplink_vrf.o iproute_lwtunnel.o ipmacsec.o ipila.o
+ 
+ RTMONOBJ=rtmon.o
+diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
+new file mode 100644
+index 0000000..c1e5a3b
+--- /dev/null
++++ b/ip/iplink_prp.c
+@@ -0,0 +1,141 @@
++/*
++ * iplink_prp.c	PRP device support
++ *
++ *		This program is free software; you can redistribute it and/or
++ *		modify it under the terms of the GNU General Public License
++ *		as published by the Free Software Foundation; either version
++ *		2 of the License, or (at your option) any later version.
++ *
++ * Authors:	Murali Karicheri <m-karicheri2@ti.com>
++ *
++ *		Based on iplink_hsr.c by Arvid Brodin <arvid.brodin@alten.se>
++ */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/socket.h>  /* Needed by linux/if.h for some reason */
++#include <linux/if.h>
++#include <linux/if_arp.h>
++#include "rt_names.h"
++#include "utils.h"
++#include "ip_common.h"
++
++static void print_usage(FILE *f)
++{
++	fprintf(f,
++"Usage:\tip link add name NAME type prp slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
++"\t[ supervision ADDR-BYTE ]\n"
++"\n"
++"NAME\n"
++"	name of new prp device (e.g. prp0)\n"
++"SLAVE1-IF, SLAVE2-IF\n"
++"	the two slave devices bound to the PRP device\n"
++"ADDR-BYTE\n"
++"	0-255; the last byte of the multicast address used for HSR supervision\n"
++"	frames (default = 0)\n");
++}
++
++static void usage(void)
++{
++	print_usage(stderr);
++}
++
++static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
++			 struct nlmsghdr *n)
++{
++	int ifindex;
++	unsigned char multicast_spec;
++
++	while (argc > 0) {
++		if (matches(*argv, "supervision") == 0) {
++			NEXT_ARG();
++			if (get_u8(&multicast_spec, *argv, 0))
++				invarg("ADDR-BYTE is invalid", *argv);
++			addattr_l(n, 1024, IFLA_HSR_MULTICAST_SPEC,
++				  &multicast_spec, 1);
++		} else if (matches(*argv, "slave1") == 0) {
++			NEXT_ARG();
++			ifindex = ll_name_to_index(*argv);
++			if (ifindex == 0)
++				invarg("No such interface", *argv);
++			addattr_l(n, 1024, IFLA_HSR_SLAVE1, &ifindex, 4);
++		} else if (matches(*argv, "slave2") == 0) {
++			NEXT_ARG();
++			ifindex = ll_name_to_index(*argv);
++			if (ifindex == 0)
++				invarg("No such interface", *argv);
++			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
++		} else if (matches(*argv, "help") == 0) {
++			usage();
++			return -1;
++		} else {
++			fprintf(stderr, "prp: what is \"%s\"?\n", *argv);
++			usage();
++			return -1;
++		}
++		argc--, argv++;
++	}
++
++	return 0;
++}
++
++static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
++{
++	SPRINT_BUF(b1);
++
++	if (!tb)
++		return;
++
++	if (tb[IFLA_HSR_SLAVE1] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
++		return;
++	if (tb[IFLA_HSR_SLAVE2] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE2]) < sizeof(__u32))
++		return;
++	if (tb[IFLA_HSR_SEQ_NR] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_SEQ_NR]) < sizeof(__u16))
++		return;
++	if (tb[IFLA_HSR_SUPERVISION_ADDR] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]) < ETH_ALEN)
++		return;
++
++	fprintf(f, "slave1 ");
++	if (tb[IFLA_HSR_SLAVE1])
++		fprintf(f, "%s ",
++			ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE1])));
++	else
++		fprintf(f, "<none> ");
++
++	fprintf(f, "slave2 ");
++	if (tb[IFLA_HSR_SLAVE2])
++		fprintf(f, "%s ",
++			ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE2])));
++	else
++		fprintf(f, "<none> ");
++
++	if (tb[IFLA_HSR_SEQ_NR])
++		fprintf(f, "sequence %d ",
++			rta_getattr_u16(tb[IFLA_HSR_SEQ_NR]));
++
++	if (tb[IFLA_HSR_SUPERVISION_ADDR])
++		fprintf(f, "supervision %s ",
++			ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_SUPERVISION_ADDR]),
++				    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
++				    ARPHRD_VOID,
++				    b1, sizeof(b1)));
++}
++
++static void prp_print_help(struct link_util *lu, int argc, char **argv,
++	FILE *f)
++{
++	print_usage(f);
++}
++
++struct link_util prp_link_util = {
++	.id		= "prp",
++	.maxattr	= IFLA_VLAN_MAX,
++	.parse_opt	= prp_parse_opt,
++	.print_opt	= prp_print_opt,
++	.print_help	= prp_print_help,
++};
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bbappend
new file mode 100644
index 0000000..65f5525
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append = " \
+           file://0001-ip-HSR-Fix-cut-and-paste-error.patch \
+           file://0002-add-support-for-prp-similar-to-hsr.patch \
+          "
-- 
2.7.4


