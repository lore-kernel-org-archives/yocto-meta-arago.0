Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7881552A61
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC65D40C8E;
	Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OXfGxASAl6w2; Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5B7140C94;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C66A1174586;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:29 -0400
Message-Id: <1617408644-2675-15-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 14/29] iproute2: drop upstreamed patch for HSR/PRP support
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:54 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

HSR/PRP support is now part of iproute2 5.11

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...add-support-for-creating-PRP-device-simil.patch | 109 ---------------------
 .../iproute2/iproute2_%.bbappend                   |   1 -
 2 files changed, 110 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch
deleted file mode 100644
index dfeaeb0..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From e3aa94814e9467af5829a04c335a615c0082a362 Mon Sep 17 00:00:00 2001
-From: Murali Karicheri <m-karicheri2@ti.com>
-Date: Fri, 5 Jun 2020 11:02:05 -0400
-Subject: [PATCH 1/2] iplink: hsr: add support for creating PRP device similar
- to HSR
-
-This patch enhances the iplink command to add a proto parameters to
-create PRP device/interface similar to HSR. Both protocols are
-quite similar and requires a pair of Ethernet interfaces. So re-use
-the existing HSR iplink command to create PRP device/interface as
-well. Use proto parameter to differentiate the two protocols.
-
-Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
----
- include/uapi/linux/if_link.h | 12 +++++++++++-
- ip/iplink_hsr.c              | 19 +++++++++++++++++--
- 2 files changed, 28 insertions(+), 3 deletions(-)
-
-diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
-index 1c49f436424d..de08704c5862 100644
---- a/include/uapi/linux/if_link.h
-+++ b/include/uapi/linux/if_link.h
-@@ -881,7 +881,14 @@ enum {
- #define IFLA_IPOIB_MAX (__IFLA_IPOIB_MAX - 1)
- 
- 
--/* HSR section */
-+/* HSR/PRP section, both uses same interface */
-+
-+/* Different redundancy protocols for hsr device */
-+enum {
-+	HSR_PROTOCOL_HSR,
-+	HSR_PROTOCOL_PRP,
-+	HSR_PROTOCOL_MAX,
-+};
- 
- enum {
- 	IFLA_HSR_UNSPEC,
-@@ -891,6 +898,9 @@ enum {
- 	IFLA_HSR_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
- 	IFLA_HSR_SEQ_NR,
- 	IFLA_HSR_VERSION,		/* HSR version */
-+	IFLA_HSR_PROTOCOL,		/* Indicate different protocol than
-+					 * HSR. For example PRP.
-+					 */
- 	__IFLA_HSR_MAX,
- };
- 
-diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
-index 7d9167d4e6a3..6ea138a23cbc 100644
---- a/ip/iplink_hsr.c
-+++ b/ip/iplink_hsr.c
-@@ -25,7 +25,7 @@ static void print_usage(FILE *f)
- {
- 	fprintf(f,
- 		"Usage:\tip link add name NAME type hsr slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
--		"\t[ supervision ADDR-BYTE ] [version VERSION]\n"
-+		"\t[ supervision ADDR-BYTE ] [version VERSION] [proto PROTOCOL]\n"
- 		"\n"
- 		"NAME\n"
- 		"	name of new hsr device (e.g. hsr0)\n"
-@@ -35,7 +35,9 @@ static void print_usage(FILE *f)
- 		"	0-255; the last byte of the multicast address used for HSR supervision\n"
- 		"	frames (default = 0)\n"
- 		"VERSION\n"
--		"	0,1; the protocol version to be used. (default = 0)\n");
-+		"	0,1; the protocol version to be used. (default = 0)\n"
-+		"PROTOCOL\n"
-+		"	0 - HSR, 1 - PRP. (default = 0 - HSR)\n");
- }
- 
- static void usage(void)
-@@ -49,6 +51,7 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
- 	int ifindex;
- 	unsigned char multicast_spec;
- 	unsigned char protocol_version;
-+	unsigned char protocol = HSR_PROTOCOL_HSR;
- 
- 	while (argc > 0) {
- 		if (matches(*argv, "supervision") == 0) {
-@@ -64,6 +67,13 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
- 				invarg("version is invalid", *argv);
- 			addattr_l(n, 1024, IFLA_HSR_VERSION,
- 				  &protocol_version, 1);
-+		} else if (matches(*argv, "proto") == 0) {
-+			NEXT_ARG();
-+			if (!(get_u8(&protocol, *argv, 0) == HSR_PROTOCOL_HSR ||
-+			      get_u8(&protocol, *argv, 0) == HSR_PROTOCOL_PRP))
-+				invarg("protocol is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_HSR_PROTOCOL,
-+				  &protocol, 1);
- 		} else if (matches(*argv, "slave1") == 0) {
- 			NEXT_ARG();
- 			ifindex = ll_name_to_index(*argv);
-@@ -140,6 +150,11 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 					 RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
- 					 ARPHRD_VOID,
- 					 b1, sizeof(b1)));
-+	if (tb[IFLA_HSR_PROTOCOL])
-+		print_int(PRINT_ANY,
-+			  "proto",
-+			  "proto %d ",
-+			  rta_getattr_u8(tb[IFLA_HSR_PROTOCOL]));
- }
- 
- static void hsr_print_help(struct link_util *lu, int argc, char **argv,
--- 
-2.17.1
-
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
index d6effcd..78b7847 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
@@ -3,6 +3,5 @@ PR_append = ".arago6"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append = " \
-    file://0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch \
     file://0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch \
 "
-- 
2.7.4


