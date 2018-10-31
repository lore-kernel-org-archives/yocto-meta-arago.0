Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9A2DD520C0
	for <meta-arago@arago-project.org>;
	Wed, 31 Oct 2018 13:16:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9VDGa45026323
	for <meta-arago@arago-project.org>; Wed, 31 Oct 2018 08:16:36 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id w9VDGaVx027673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 31 Oct 2018 08:16:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 31 Oct 2018 08:16:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 31 Oct 2018 08:16:35 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9VDGZjY007781;
	Wed, 31 Oct 2018 08:16:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 31 Oct 2018 09:04:09 -0400
Message-ID: <1540991049-1333-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] iproute2: hsr/prp: replace cfi use in code with dei
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
X-List-Received-Date: Wed, 31 Oct 2018 13:16:46 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...-hsr-prp-replace-cfi-use-in-code-with-dei.patch | 178 +++++++++++++++++++++
 .../iproute2/iproute2_4.11.0.bbappend              |   3 +-
 2 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch
new file mode 100644
index 0000000..8e1cc2c
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch
@@ -0,0 +1,178 @@
+From da07e28264d0bfec96cfb83e3628640dce2ec7ce Mon Sep 17 00:00:00 2001
+From: Murali Karicheri <m-karicheri2@ti.com>
+Date: Tue, 30 Oct 2018 15:41:51 -0400
+Subject: [PATCH] hsr/prp: replace cfi use in code with dei
+
+cfi in vlan tag is an older name for dei and is deprecated. So use
+dei instead to refer the field in VLAN tag.
+
+Upstream-Status: Pending
+
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ include/linux/if_link.h |  4 ++--
+ ip/iplink_hsr.c         | 28 ++++++++++++++--------------
+ ip/iplink_prp.c         | 28 ++++++++++++++--------------
+ 3 files changed, 30 insertions(+), 30 deletions(-)
+
+diff --git a/include/linux/if_link.h b/include/linux/if_link.h
+index 31230df..a2abe0f 100644
+--- a/include/linux/if_link.h
++++ b/include/linux/if_link.h
+@@ -823,7 +823,7 @@ enum {
+ 	IFLA_HSR_SEQ_NR,
+ 	IFLA_HSR_VERSION,		/* HSR version */
+ 	IFLA_HSR_SV_VID,
+-	IFLA_HSR_SV_CFI,
++	IFLA_HSR_SV_DEI,
+ 	IFLA_HSR_SV_PCP,
+ 	__IFLA_HSR_MAX,
+ };
+@@ -900,7 +900,7 @@ enum {
+ 	IFLA_PRP_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
+ 	IFLA_PRP_SEQ_NR,
+ 	IFLA_PRP_SV_VID,
+-	IFLA_PRP_SV_CFI,
++	IFLA_PRP_SV_DEI,
+ 	IFLA_PRP_SV_PCP,
+ 	__IFLA_PRP_MAX,
+ };
+diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
+index e713cb7..a30bd05 100644
+--- a/ip/iplink_hsr.c
++++ b/ip/iplink_hsr.c
+@@ -26,7 +26,7 @@ static void print_usage(FILE *f)
+ 	fprintf(f,
+ "Usage:\tip link add name NAME type hsr slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
+ "\t[ supervision ADDR-BYTE ] [version VERSION] [ sv_vid SV-VID ] \n"
+-"\t[ sv_pcp SV-PCP ] [ sv_cfi SV-CFI ] \n"
++"\t[ sv_pcp SV-PCP ] [ sv_dei SV-DEI ] \n"
+ "\n"
+ "NAME\n"
+ "	name of new hsr device (e.g. hsr0)\n"
+@@ -41,9 +41,9 @@ static void print_usage(FILE *f)
+ "	0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
+ "SV-PCP\n"
+ "	0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
+-"SV-CFI\n"
+-"	0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
+-"Use VLAN tag if one of sv_vid, sv_pcp or sv_cfi is specified. Default value\n"
++"SV-DEI\n"
++"	0-1; DEI value to be used in the VLAN tag of SV frames (default 0)\n"
++"Use VLAN tag if one of sv_vid, sv_pcp or sv_dei is specified. Default value\n"
+ "used for unspecified ones\n");
+ }
+ 
+@@ -59,7 +59,7 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+ 	unsigned char multicast_spec;
+ 	unsigned char protocol_version;
+ 	unsigned short sv_vid;
+-	unsigned char sv_cfi;
++	unsigned char sv_dei;
+ 	unsigned char sv_pcp;
+ 
+ 	while (argc > 0) {
+@@ -105,14 +105,14 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+ 				invarg("SV-PCP is invalid", *argv);
+ 			addattr_l(n, 1024, IFLA_HSR_SV_PCP,
+ 				  &sv_pcp, sizeof(sv_pcp));
+-		} else if (matches(*argv, "sv_cfi") == 0) {
++		} else if (matches(*argv, "sv_dei") == 0) {
+ 			NEXT_ARG();
+-			if (get_u8(&sv_cfi, *argv, 0))
+-				invarg("SV-CFI is invalid", *argv);
+-			if (sv_cfi > 1)
+-				invarg("SV-CFI is invalid", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_SV_CFI,
+-				  &sv_cfi, sizeof(sv_cfi));
++			if (get_u8(&sv_dei, *argv, 0))
++				invarg("SV-DEI is invalid", *argv);
++			if (sv_dei > 1)
++				invarg("SV-DEI is invalid", *argv);
++			addattr_l(n, 1024, IFLA_HSR_SV_DEI,
++				  &sv_dei, sizeof(sv_dei));
+ 		} else if (matches(*argv, "help") == 0) {
+ 			usage();
+ 			return -1;
+@@ -152,8 +152,8 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+ 	if (tb[IFLA_HSR_SV_PCP] &&
+ 	    RTA_PAYLOAD(tb[IFLA_HSR_SV_PCP]) < sizeof(__u8))
+ 		return;
+-	if (tb[IFLA_HSR_SV_CFI] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_SV_CFI]) < sizeof(__u8))
++	if (tb[IFLA_HSR_SV_DEI] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_SV_DEI]) < sizeof(__u8))
+ 		return;
+ 
+ 	fprintf(f, "slave1 ");
+diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
+index beef603..31f589e 100644
+--- a/ip/iplink_prp.c
++++ b/ip/iplink_prp.c
+@@ -26,7 +26,7 @@ static void print_usage(FILE *f)
+ 	fprintf(f,
+ "Usage:\tip link add name NAME type prp slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
+ "\t[ supervision ADDR-BYTE ] [ sv_vid SV-VID ] [ sv_pcp SV-PCP ] \n"
+-"\t [ sv_cfi SV-CFI ] \n"
++"\t [ sv_dei SV-DEI ] \n"
+ "\n"
+ "NAME\n"
+ "	name of new prp device (e.g. prp0)\n"
+@@ -39,9 +39,9 @@ static void print_usage(FILE *f)
+ "	0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
+ "SV-PCP\n"
+ "	0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
+-"SV-CFI\n"
+-"	0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
+-"Use VLAN tag if one of sv_vid, sv_pcp or sv_cfi is specified. Default value\n"
++"SV-DEI\n"
++"	0-1; DEI value to be used in the VLAN tag of SV frames (default 0)\n"
++"Use VLAN tag if one of sv_vid, sv_pcp or sv_dei is specified. Default value\n"
+ "used for unspecified ones\n");
+ }
+ 
+@@ -56,7 +56,7 @@ static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
+ 	int ifindex;
+ 	unsigned char multicast_spec;
+ 	unsigned short sv_vid;
+-	unsigned char sv_cfi;
++	unsigned char sv_dei;
+ 	unsigned char sv_pcp;
+ 
+ 	while (argc > 0) {
+@@ -95,14 +95,14 @@ static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
+ 				invarg("SV-PCP is invalid", *argv);
+ 			addattr_l(n, 1024, IFLA_PRP_SV_PCP,
+ 				  &sv_pcp, sizeof(sv_pcp));
+-		} else if (matches(*argv, "sv_cfi") == 0) {
++		} else if (matches(*argv, "sv_dei") == 0) {
+ 			NEXT_ARG();
+-			if (get_u8(&sv_cfi, *argv, 0))
+-				   invarg("SV-CFI is invalid", *argv);
+-			if (sv_cfi > 1)
+-				   invarg("SV-CFI is invalid", *argv);
+-			addattr_l(n, 1024, IFLA_PRP_SV_CFI,
+-				  &sv_cfi, sizeof(sv_cfi));
++			if (get_u8(&sv_dei, *argv, 0))
++				   invarg("SV-DEI is invalid", *argv);
++			if (sv_dei > 1)
++				   invarg("SV-DEI is invalid", *argv);
++			addattr_l(n, 1024, IFLA_PRP_SV_DEI,
++				  &sv_dei, sizeof(sv_dei));
+ 		} else if (matches(*argv, "help") == 0) {
+ 			usage();
+ 			return -1;
+@@ -142,8 +142,8 @@ static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+ 	if (tb[IFLA_PRP_SV_PCP] &&
+ 	    RTA_PAYLOAD(tb[IFLA_PRP_SV_PCP]) < sizeof(__u8))
+ 		return;
+-	if (tb[IFLA_PRP_SV_CFI] &&
+-	    RTA_PAYLOAD(tb[IFLA_PRP_SV_CFI]) < sizeof(__u8))
++	if (tb[IFLA_PRP_SV_DEI] &&
++	    RTA_PAYLOAD(tb[IFLA_PRP_SV_DEI]) < sizeof(__u8))
+ 		return;
+ 
+ 	fprintf(f, "slave1 ");
+-- 
+2.7.4
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
index 26949c4..84c2f0d 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago3"
+PR_append = ".arago4"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -8,4 +8,5 @@ SRC_URI_append = " \
            file://0001-hsr-prp-remove-the-debug-print-from-the-code.patch \
            file://0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch \
            file://0002-prp-invalid-maxattr.patch \
+           file://0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch \
           "
-- 
2.7.4


