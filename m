Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C318C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.55573.1751879243468272150
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 02:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AuxlPYrS;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-limaye@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56797M7T817503
	for <meta-arago@lists.yoctoproject.org>; Mon, 7 Jul 2025 04:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751879242;
	bh=zkEj+zIF1VlZBW4bHiR7veTc3rtPaMMor16JtmyKiIg=;
	h=From:To:CC:Subject:Date;
	b=AuxlPYrSzn77XQsFVGaAEYSHsIGcHmr0mWXUbloGlP/JCq3vzG7Q5AghpfsUKv/I5
	 c+VOYYHmseOff7XE7rZ+w4vn7D5YDpHTuZnxBlMuS2LQI2ViiUKNAqLi66EunH1RC4
	 DmOiRGkL87ZyqX0U+OtpTVqVucAXnG5odc+P0ZMU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56797MN64058321
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 7 Jul 2025 04:07:22 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 04:07:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 04:07:22 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.69.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56797KFX3789343;
	Mon, 7 Jul 2025 04:07:21 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-distro: ethtool: Add patch to dump CPSW registers for K3 SoCs
Date: Mon, 7 Jul 2025 14:37:20 +0530
Message-ID: <20250707090720.750031-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16277

Add support for TI K3 CPSW register and ALE table dump through the
ethtool userspace utility.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../ethtool/ethtool-arago.inc                 |   8 +
 ...k3-cpsw-registers-and-ale-table-dump.patch | 574 ++++++++++++++++++
 .../ethtool/ethtool_%.bbappend                |   4 +
 3 files changed, 586 insertions(+)
 create mode 100644 meta-arago-distro/recipes-extended/ethtool/ethtool-arag=
o.inc
 create mode 100644 meta-arago-distro/recipes-extended/ethtool/ethtool/pret=
ty-add-support-for-ti-k3-cpsw-registers-and-ale-table-dump.patch
 create mode 100644 meta-arago-distro/recipes-extended/ethtool/ethtool_%.bb=
append

diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool-arago.inc b=
/meta-arago-distro/recipes-extended/ethtool/ethtool-arago.inc
new file mode 100644
index 00000000..5fd05a85
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool-arago.inc
@@ -0,0 +1,8 @@
+PR:append =3D ".arago0"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/ethtool:"
+
+SRC_URI:append =3D " \
+                  file://pretty-add-support-for-ti-k3-cpsw-registers-and-a=
le-table-dump.patch \
+                  "
+
diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool/pretty-add-=
support-for-ti-k3-cpsw-registers-and-ale-table-dump.patch b/meta-arago-dist=
ro/recipes-extended/ethtool/ethtool/pretty-add-support-for-ti-k3-cpsw-regis=
ters-and-ale-table-dump.patch
new file mode 100644
index 00000000..a14089b4
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool/pretty-add-support=
-for-ti-k3-cpsw-registers-and-ale-table-dump.patch
@@ -0,0 +1,574 @@
+From: Chintan Vankar <c-vankar@ti.com>=0D
+Subject: [PATCH] pretty: Add support for TI K3 CPSW registers and ALE tabl=
e dump=0D
+Date: Thu, 3 Jul 2025 12:02:46 +0530=0D
+=0D
+Add support to dump CPSW registers and ALE table for the CPSW instances on=
=0D
+K3 SoCs that are configured using the am65-cpsw-nuss.c device-driver in=0D
+Linux.=0D
+=0D
+Upstream-Status: Submitted [https://lore.kernel.org/all/20250705134807.351=
4891-1-c-vankar@ti.com/]=0D
+Signed-off-by: Chintan Vankar <c-vankar@ti.com>=0D
+---=0D
+ Makefile.am      |   2 +-=0D
+ am65-cpsw-nuss.c | 510 +++++++++++++++++++++++++++++++++++++++++++++++=0D
+ ethtool.c        |   1 +=0D
+ internal.h       |   3 +=0D
+ 4 files changed, 515 insertions(+), 1 deletion(-)=0D
+ create mode 100644 am65-cpsw-nuss.c=0D
+=0D
+diff --git a/Makefile.am b/Makefile.am=0D
+index b9e06ad..fe6afcb 100644=0D
+--- a/Makefile.am=0D
++++ b/Makefile.am=0D
+@@ -23,7 +23,7 @@ ethtool_SOURCES +=3D \=0D
+ 		  smsc911x.c at76c50x-usb.c sfc.c stmmac.c	\=0D
+ 		  sff-common.c sff-common.h sfpid.c sfpdiag.c	\=0D
+ 		  ixgbevf.c tse.c vmxnet3.c qsfp.c qsfp.h fjes.c lan78xx.c \=0D
+-		  igc.c cmis.c cmis.h bnxt.c cpsw.c lan743x.c hns3.c=0D
++		  igc.c cmis.c cmis.h bnxt.c cpsw.c lan743x.c hns3.c am65-cpsw-nuss.c=0D
+ endif=0D
+ =0D
+ if ENABLE_BASH_COMPLETION=0D
+diff --git a/am65-cpsw-nuss.c b/am65-cpsw-nuss.c=0D
+new file mode 100644=0D
+index 0000000..de8e3e9=0D
+--- /dev/null=0D
++++ b/am65-cpsw-nuss.c=0D
+@@ -0,0 +1,510 @@=0D
++// SPDX-License-Identifier: GPL-2.0-only OR MIT=0D
++/* Code to dump registers and ALE table for the CPSW instances on K3 SoCs=
 that are configured using=0D
++ * the am65-cpsw-nuss device-driver in Linux.=0D
++ *=0D
++ * Copyright (C) 2025 Texas Instruments=0D
++ * Author: Chintan Vankar <c-vankar@ti.com>=0D
++ */=0D
++=0D
++#include <stdio.h>=0D
++#include <string.h>=0D
++=0D
++#include "internal.h"=0D
++=0D
++#define ALE_ENTRY_BITS          74=0D
++#define ALE_ENTRY_WORDS         DIV_ROUND_UP(ALE_ENTRY_BITS, 32)=0D
++=0D
++#define ALE_ENTRY_FREE		0x0=0D
++#define ALE_ENTRY_ADDR		0x1=0D
++#define ALE_ENTRY_VLAN		0x2=0D
++#define ALE_ENTRY_VLAN_ADDR	0x3=0D
++=0D
++#define BIT(nr)			(1 << (nr))=0D
++#define BITMASK(bits)		(BIT(bits) - 1)=0D
++=0D
++/* ALE word specifiers */=0D
++#define NUM_ALE_WORDS	2=0D
++#define ALE_WORD_LEN	32=0D
++=0D
++/* MAC address specifiers */=0D
++#define MAC_START_BIT	40=0D
++#define MAC_OCTET_LEN	8=0D
++#define NUM_MAC_OCTET	6=0D
++=0D
++/* RTL version specifiers */=0D
++#define RTL_VERSION_MASK	0xF800=0D
++#define CPSW2G_RTL_VERSION	0x3800=0D
++#define CPSW3G_RTL_VERSION	0x0=0D
++=0D
++/* OUI address uses format xx:xx:xx, use OUI shift as 16 bits and MASK as=
 0xFF to parse the same*/=0D
++#define OUI_ADDR_SHIFT		16=0D
++#define OUI_ADDR_MASK		0xFF=0D
++=0D
++/* VLAN entry specifiers */=0D
++#define VLAN_INNER_ENTRY	0x0=0D
++#define VLAN_OUTER_ENTRY	0x2=0D
++#define VLAN_ETHERTYPE_ENTRY	0x4=0D
++#define VLAN_IPV4_ENTRY		0x6=0D
++#define VLAN_IPV6_ENTRY_MASK	0x1=0D
++=0D
++/* VLAN Inner/Outer table entry MASKs and SHIFTs*/=0D
++#define NOLEARN_FLAG_SHIFT		2=0D
++#define NOLEARN_FLAG_MASK		0x1FF=0D
++#define INGRESS_CHECK_SHIFT		1=0D
++#define INGRESS_CHECK_MASK		0x1=0D
++#define VLAN_ID_SHIFT			16=0D
++#define VLAN_ID_MASK			0xFFF=0D
++#define NOFRAG_FLAG_SHIFT_2G		12=0D
++#define NOFRAG_FLAG_MASK_2G		0x1=0D
++#define NOFRAG_FLAG_SHIFT		15=0D
++#define NOFRAG_FLAG_MASK		0x1=0D
++#define REG_MASK_SHIFT			4=0D
++#define REG_MASK_MASK			0x1FF=0D
++#define PKT_EGRESS_W1_MASK		0x1=0D
++#define PKT_EGRESS_W1_OFFSET		512=0D
++#define PKT_EGRESS_SHIFT		24=0D
++#define PKT_EGRESS_MASK_2G		0x3=0D
++#define PKT_EGRESS_MASK			0x1FF=0D
++#define UNREG_MASK_SHIFT_2G		20=0D
++#define UNREG_MASK_MASK_2G		0x7=0D
++#define UNREG_MASK_SHIFT		12=0D
++#define UNREG_MASK_MASK			0x1FF=0D
++#define NXT_HDR_CTRL_SHIFT_2G		19=0D
++#define NXT_HDR_CTRL_MASK_2G		0x1=0D
++#define NXT_HDR_CTRL_SHIFT		23=0D
++#define NXT_HDR_CTRL_MASK		0x1=0D
++#define VLAN_MEMBER_LIST_MASK_2G	0x3=0D
++#define VLAN_MEMBER_LIST_MASK		0x1FF=0D
++=0D
++/* VLAN IPv4 entry MASKs and SHIFTs*/=0D
++#define IPV4_ADDR_OCT1_SHIFT	24=0D
++#define IPV4_ADDR_OCT2_SHIFT	16=0D
++#define IPV4_ADDR_OCT3_SHIFT	8=0D
++#define IPV4_ADDR_MASK		0xFF=0D
++=0D
++/* VLAN IPv6 entry MASKs and SHIFTs*/=0D
++#define IPV6_HIGH_ENTRY_FLAG	0x40=0D
++#define IPV6_IGNMCBITS_MASK	0xFF=0D
++#define IPV6_HADDR_W1_SHIFT	12=0D
++#define IPV6_HADDR_W1_MASK_1	0xFFFF=0D
++#define IPV6_HADDR_W1_MASK_2	0xFFF=0D
++#define IPV6_HADDR_W0_SHIFT_1	28=0D
++#define IPV6_HADDR_W0_MASK_1	0xF=0D
++#define IPV6_HADDR_W0_SHIFT_2	12=0D
++#define IPV6_HADDR_W0_MASK_2	0xFFFF=0D
++#define IPV6_LADDR_W2_SHIFT	4=0D
++#define IPV6_LADDR_W2_MAKS	0xF=0D
++#define IPV6_LADDR_W1_SHIFT	16=0D
++#define IPV6_LADDR_W1_MASK_1	0xFFF=0D
++#define IPV6_LADDR_W1_MASK	0xFFFF=0D
++#define IPV6_LADDR_W0_SHIFT	16=0D
++#define IPV6_LADDR_W0_MASK	0xFFFF=0D
++=0D
++/**=0D
++ * Since there are different instances of CPSW (namely cpsw2g, cpsw3g, cp=
sw5g and cpsw9g)=0D
++ * some register offsets differ to get some parameters for ALE table, par=
se rtl_version=0D
++ * from ALE_MOD_VER register to determine which instance is being used.=0D
++ */=0D
++u32 rtl_version;=0D
++=0D
++static inline int cpsw_ale_get_field(u32 *ale_entry, u32 start, u32 bits)=
=0D
++{=0D
++	int idx;=0D
++=0D
++	idx    =3D start / ALE_WORD_LEN;=0D
++	start -=3D idx * ALE_WORD_LEN;=0D
++=0D
++	/**=0D
++	 * ALE words are stored in order word2, word1 and word0, flip the word t=
o parse in numeric=0D
++	 * order=0D
++	 */=0D
++	idx    =3D NUM_ALE_WORDS - idx; /* flip */=0D
++	return (ale_entry[idx] >> start) & BITMASK(bits);=0D
++}=0D
++=0D
++#define DEFINE_ALE_FIELD(name, start, bits)				\=0D
++static inline int cpsw_ale_get_##name(u32 *ale_entry)			\=0D
++{									\=0D
++	return cpsw_ale_get_field(ale_entry, start, bits);		\=0D
++}=0D
++=0D
++DEFINE_ALE_FIELD(entry_type,		60,	2)=0D
++DEFINE_ALE_FIELD(vlan_id,		48,	12)=0D
++DEFINE_ALE_FIELD(mcast_state,		62,	2)=0D
++DEFINE_ALE_FIELD(port_mask,		66,	9)=0D
++DEFINE_ALE_FIELD(super,			65,	1)=0D
++DEFINE_ALE_FIELD(agable,		62,	1)=0D
++DEFINE_ALE_FIELD(touched,		63,	1)=0D
++DEFINE_ALE_FIELD(ucast_type,		62,	2)=0D
++DEFINE_ALE_FIELD(port_num,		66,	4)=0D
++DEFINE_ALE_FIELD(port_num_2g,		66,	1)=0D
++DEFINE_ALE_FIELD(port_num_3g,		66,	2)=0D
++DEFINE_ALE_FIELD(blocked,		65,	1)=0D
++DEFINE_ALE_FIELD(secure,		64,	1)=0D
++DEFINE_ALE_FIELD(oui_entry,		62,	2)=0D
++DEFINE_ALE_FIELD(oui_addr,		4,	24)=0D
++DEFINE_ALE_FIELD(mcast,			40,	1)=0D
++DEFINE_ALE_FIELD(vlan_entry_type,	62,	3)=0D
++DEFINE_ALE_FIELD(ethertype,		0,	16)=0D
++DEFINE_ALE_FIELD(ipv4_addr,		0,	32)=0D
++DEFINE_ALE_FIELD(ingress_bits,		65,	5)=0D
++DEFINE_ALE_FIELD(ipv6_addr_low,		0,	60)=0D
++DEFINE_ALE_FIELD(ipv6_addr_mid,		63,	8)=0D
++DEFINE_ALE_FIELD(ipv6_addr_high,	0,	60)=0D
++DEFINE_ALE_FIELD(entry_word0,		0,	32)=0D
++DEFINE_ALE_FIELD(entry_word1,		32,	32)=0D
++DEFINE_ALE_FIELD(entry_word2,		64,	12)=0D
++=0D
++static inline void cpsw_ale_get_addr(u32 *ale_entry, u8 *addr)=0D
++{=0D
++	int i;=0D
++=0D
++	for (i =3D 0; i < NUM_MAC_OCTET; i++)=0D
++		addr[i] =3D cpsw_ale_get_field(ale_entry, MAC_START_BIT - MAC_OCTET_LEN=
 * i,=0D
++					     MAC_OCTET_LEN);=0D
++}=0D
++=0D
++struct k3_cpsw_regdump_hdr {=0D
++	u32 module_id;=0D
++	u32 len;=0D
++};=0D
++=0D
++enum {=0D
++	K3_CPSW_REGDUMP_MOD_NUSS =3D 1,=0D
++	K3_CPSW_REGDUMP_MOD_RGMII_STATUS =3D 2,=0D
++	K3_CPSW_REGDUMP_MOD_MDIO =3D 3,=0D
++	K3_CPSW_REGDUMP_MOD_CPSW =3D 4,=0D
++	K3_CPSW_REGDUMP_MOD_CPSW_P0 =3D 5,=0D
++	K3_CPSW_REGDUMP_MOD_CPSW_PN =3D 6,=0D
++	K3_CPSW_REGDUMP_MOD_CPSW_CPTS =3D 7,=0D
++	K3_CPSW_REGDUMP_MOD_CPSW_ALE =3D 8,=0D
++	K3_CPSW_REGDUMP_MOD_CPSW_ALE_TBL =3D 9,=0D
++	K3_CPSW_REGDUMP_MOD_LAST,=0D
++};=0D
++=0D
++static const char *mod_names[K3_CPSW_REGDUMP_MOD_LAST] =3D {=0D
++	[K3_CPSW_REGDUMP_MOD_NUSS] =3D "cpsw-nuss",=0D
++	[K3_CPSW_REGDUMP_MOD_RGMII_STATUS] =3D "cpsw-nuss-rgmii-status",=0D
++	[K3_CPSW_REGDUMP_MOD_MDIO] =3D "cpsw-nuss-mdio",=0D
++	[K3_CPSW_REGDUMP_MOD_CPSW] =3D "cpsw-nu",=0D
++	[K3_CPSW_REGDUMP_MOD_CPSW_P0] =3D "cpsw-nu-p0",=0D
++	[K3_CPSW_REGDUMP_MOD_CPSW_PN] =3D "cpsw-nu-pn",=0D
++	[K3_CPSW_REGDUMP_MOD_CPSW_CPTS] =3D "cpsw-nu-cpts",=0D
++	[K3_CPSW_REGDUMP_MOD_CPSW_ALE] =3D "cpsw-nu-ale",=0D
++	[K3_CPSW_REGDUMP_MOD_CPSW_ALE_TBL] =3D "cpsw-nu-ale-tbl",=0D
++};=0D
++=0D
++static void cpsw_ale_dump_oui_entry(int index, u32 *ale_entry)=0D
++{=0D
++	u32 oui_addr;=0D
++=0D
++	oui_addr =3D cpsw_ale_get_oui_addr(ale_entry);=0D
++=0D
++	fprintf(stdout, "%d: Type: OUI Unicast\n, \tOUI =3D %02x:%02x:%02x\n",=0D
++		index, (oui_addr >> OUI_ADDR_SHIFT) & OUI_ADDR_MASK,=0D
++		(oui_addr >> OUI_ADDR_SHIFT) & OUI_ADDR_MASK, oui_addr & OUI_ADDR_MASK)=
;=0D
++}=0D
++=0D
++static void cpsw_ale_dump_addr(int index, u32 *ale_entry)=0D
++{=0D
++	u8 addr[NUM_MAC_OCTET];=0D
++=0D
++	cpsw_ale_get_addr(ale_entry, addr);=0D
++=0D
++	if (cpsw_ale_get_mcast(ale_entry)) {=0D
++		static const char * const str_mcast_state[] =3D {"Forwarding",=0D
++							       "Blocking/Forwarding/Learning",=0D
++							       "Learning/Forwarding",=0D
++							       "Forwarding"};=0D
++		u16 port_mask =3D cpsw_ale_get_port_mask(ale_entry);=0D
++		u8 state =3D cpsw_ale_get_mcast_state(ale_entry);=0D
++		u8 super =3D cpsw_ale_get_super(ale_entry);=0D
++=0D
++		fprintf(stdout, "%d: Type: Multicast\n \tAddress =3D %02x:%02x:%02x:%02=
x:%02x:%02x, Multicast_State =3D %s, %sSuper, port_mask =3D 0x%x\n",=0D
++			index, addr[0], addr[1], addr[2], addr[3], addr[4], addr[5],=0D
++			str_mcast_state[state], super ? "" : "No ", port_mask);=0D
++	} else {=0D
++		static const char * const s_ucast_type[] =3D {"Persistent", "Untouched"=
, "OUI",=0D
++							    "Touched"};=0D
++		u8 ucast_type =3D cpsw_ale_get_ucast_type(ale_entry);=0D
++		u8 port_num =3D cpsw_ale_get_port_num(ale_entry);=0D
++		u8 blocked =3D cpsw_ale_get_blocked(ale_entry);=0D
++		u8 touched =3D cpsw_ale_get_touched(ale_entry);=0D
++		u8 secure =3D cpsw_ale_get_secure(ale_entry);=0D
++		u8 agable =3D cpsw_ale_get_agable(ale_entry);=0D
++=0D
++		fprintf(stdout, "%d: Type: Unicast\n \tUpdated Address =3D %02x:%02x:%0=
2x:%02x:%02x:%02x, Unicast Type =3D %s, Port_num =3D 0x%x, Secure: %d, Bloc=
ked: %d, Touch =3D %d, Agable =3D %d\n",=0D
++			index, addr[0], addr[1], addr[2], addr[3], addr[4], addr[5],=0D
++			s_ucast_type[ucast_type], port_num, secure, blocked, touched, agable);=
=0D
++	}=0D
++}=0D
++=0D
++static void cpsw_ale_dump_inner_vlan_entry(int index, u32 *ale_entry)=0D
++{=0D
++	u32 vlan_entry_word0 =3D cpsw_ale_get_entry_word0(ale_entry);=0D
++	u32 vlan_entry_word1 =3D cpsw_ale_get_entry_word1(ale_entry);=0D
++	u16 vlan_entry_word2 =3D cpsw_ale_get_entry_word2(ale_entry);=0D
++=0D
++	fprintf(stdout, "%d: Type: Inner VLAN\n \tNolearn Mask =3D 0x%x, Ingress=
 Check =3D %d\n",=0D
++		index, (vlan_entry_word2 >> NOLEARN_FLAG_SHIFT) & NOLEARN_FLAG_MASK,=0D
++		(vlan_entry_word2 >> INGRESS_CHECK_SHIFT) & INGRESS_CHECK_MASK);=0D
++=0D
++	if (rtl_version =3D=3D CPSW2G_RTL_VERSION) {=0D
++		fprintf(stdout, "\tVLAN ID =3D %d, No Frag =3D %d, Registered Mask =3D =
0x%x\n",=0D
++			(vlan_entry_word1 >> VLAN_ID_SHIFT) & VLAN_ID_MASK,=0D
++			(vlan_entry_word1 >> NOFRAG_FLAG_SHIFT_2G) & NOFRAG_FLAG_MASK_2G,=0D
++			(vlan_entry_word1 >> REG_MASK_SHIFT) & REG_MASK_MASK);=0D
++=0D
++		fprintf(stdout, "\tForce Untagged Packet Egress =3D 0x%x, Unregistered =
Mask =3D 0x%x, Limit Next Header Control =3D %d, Members =3D 0x%x\n",=0D
++			(vlan_entry_word0 >> PKT_EGRESS_SHIFT) & PKT_EGRESS_MASK_2G,=0D
++			(vlan_entry_word0 >> UNREG_MASK_SHIFT_2G) & UNREG_MASK_MASK_2G,=0D
++			(vlan_entry_word0 >> NXT_HDR_CTRL_SHIFT_2G) & NXT_HDR_CTRL_MASK_2G,=0D
++			(vlan_entry_word0 & VLAN_MEMBER_LIST_MASK_2G));=0D
++	} else {=0D
++		fprintf(stdout, "\tVLAN ID =3D %d, Registered Mask =3D 0x%x, No Frag =
=3D %d\n",=0D
++			(vlan_entry_word1 >> VLAN_ID_SHIFT) & VLAN_ID_MASK,=0D
++			(vlan_entry_word1 >> REG_MASK_SHIFT) & REG_MASK_MASK,=0D
++			(vlan_entry_word1 >> NOFRAG_FLAG_SHIFT) & NOFRAG_FLAG_MASK);=0D
++=0D
++		fprintf(stdout, "\tForce Untagged Packet Egress =3D 0x%x, Limit Next He=
ader Control =3D %d, Unregistered Mask =3D 0x%x, Members =3D 0x%x\n",=0D
++			(vlan_entry_word1 & PKT_EGRESS_W1_MASK) * PKT_EGRESS_W1_OFFSET +=0D
++			((vlan_entry_word0 >> PKT_EGRESS_SHIFT) & PKT_EGRESS_MASK),=0D
++			(vlan_entry_word0 >> NXT_HDR_CTRL_SHIFT) & NXT_HDR_CTRL_MASK,=0D
++			(vlan_entry_word0 >> UNREG_MASK_SHIFT) & UNREG_MASK_MASK,=0D
++			(vlan_entry_word0 & VLAN_MEMBER_LIST_MASK));=0D
++	}=0D
++}=0D
++=0D
++static void cpsw_ale_dump_outer_vlan_entry(int index, u32 *ale_entry)=0D
++{=0D
++	u32 vlan_entry_word0 =3D cpsw_ale_get_entry_word0(ale_entry);=0D
++	u32 vlan_entry_word1 =3D cpsw_ale_get_entry_word1(ale_entry);=0D
++	u16 vlan_entry_word2 =3D cpsw_ale_get_entry_word2(ale_entry);=0D
++=0D
++	fprintf(stdout, "%d: Type: Outer VLAN\n \tNolearn Mask =3D 0x%x, Ingress=
 Check =3D %d\n",=0D
++		index, (vlan_entry_word2 >> NOLEARN_FLAG_SHIFT) & NOLEARN_FLAG_MASK,=0D
++		(vlan_entry_word2 >> INGRESS_CHECK_SHIFT) & INGRESS_CHECK_MASK);=0D
++=0D
++	if (rtl_version =3D=3D CPSW2G_RTL_VERSION) {=0D
++		fprintf(stdout, "\tVLAN ID =3D %d, No Frag =3D %d, Registered Mask =3D =
0x%x\n",=0D
++			(vlan_entry_word1 >> VLAN_ID_SHIFT) & VLAN_ID_MASK,=0D
++			(vlan_entry_word1 >> NOFRAG_FLAG_SHIFT_2G) & NOFRAG_FLAG_MASK_2G,=0D
++			(vlan_entry_word1 >> REG_MASK_SHIFT) & REG_MASK_MASK);=0D
++=0D
++		fprintf(stdout, "\tForce Untagged Packet Egress =3D 0x%x, Unregistered =
Mask =3D 0x%x, Limit Next Header Control =3D %d, Members =3D 0x%x\n",=0D
++			(vlan_entry_word0 >> PKT_EGRESS_SHIFT) & PKT_EGRESS_MASK_2G,=0D
++			(vlan_entry_word0 >> UNREG_MASK_SHIFT_2G) & UNREG_MASK_MASK_2G,=0D
++			(vlan_entry_word0 >> NXT_HDR_CTRL_SHIFT_2G) & NXT_HDR_CTRL_MASK_2G,=0D
++			(vlan_entry_word0 & VLAN_MEMBER_LIST_MASK_2G));=0D
++	} else {=0D
++		fprintf(stdout, "\tVLAN ID =3D %d, No Frag =3D %d, Registered Mask =3D =
0x%x\n",=0D
++			(vlan_entry_word1 >> VLAN_ID_SHIFT) & VLAN_ID_MASK,=0D
++			(vlan_entry_word1 >> NOFRAG_FLAG_SHIFT) & NOFRAG_FLAG_MASK,=0D
++			(vlan_entry_word1 >> REG_MASK_SHIFT) & REG_MASK_MASK);=0D
++=0D
++		fprintf(stdout, "\tForce Untagged Packet Egress =3D 0x%x, Limit Next He=
ader Control =3D %d, Unregistered Mask =3D 0x%x Members =3D 0x%x\n",=0D
++			(vlan_entry_word1 & PKT_EGRESS_W1_MASK) * PKT_EGRESS_W1_OFFSET +=0D
++			((vlan_entry_word0 >> PKT_EGRESS_SHIFT) & PKT_EGRESS_MASK),=0D
++			(vlan_entry_word0 >> NXT_HDR_CTRL_SHIFT) & NXT_HDR_CTRL_MASK,=0D
++			(vlan_entry_word0 >> UNREG_MASK_SHIFT) & UNREG_MASK_MASK,=0D
++			(vlan_entry_word0 & VLAN_MEMBER_LIST_MASK));=0D
++	}=0D
++}=0D
++=0D
++static void cpsw_ale_dump_ethertype_entry(int index, u32 *ale_entry)=0D
++{=0D
++	u16 ethertype =3D cpsw_ale_get_ethertype(ale_entry);=0D
++=0D
++	fprintf(stdout, "%d: Type: VLAN Ethertype\n \tEthertype =3D 0x%x\n", ind=
ex, ethertype);=0D
++}=0D
++=0D
++static void cpsw_ale_dump_ipv4_entry(int index, u32 *ale_entry)=0D
++{=0D
++	u8 ingress_bits =3D cpsw_ale_get_ingress_bits(ale_entry);=0D
++	u32 ipv4_addr =3D cpsw_ale_get_ipv4_addr(ale_entry);=0D
++=0D
++	fprintf(stdout, "%d: Type: VLAN IPv4\n \tIngress Bits: 0x%x IPv4 Address=
 =3D %u.%u.%u.%u\n",=0D
++		index, ingress_bits, ipv4_addr >> IPV4_ADDR_OCT1_SHIFT & IPV4_ADDR_MASK=
,=0D
++		ipv4_addr >> IPV4_ADDR_OCT2_SHIFT & IPV4_ADDR_MASK,=0D
++		ipv4_addr >> IPV4_ADDR_OCT3_SHIFT & IPV4_ADDR_MASK, ipv4_addr & IPV4_AD=
DR_MASK);=0D
++}=0D
++=0D
++static void cpsw_ale_dump_ipv6_entry(int index, u32 *ale_entry)=0D
++{=0D
++	u32 vlan_entry_word0 =3D cpsw_ale_get_entry_word0(ale_entry);=0D
++	u32 vlan_entry_word1 =3D cpsw_ale_get_entry_word1(ale_entry);=0D
++	u16 vlan_entry_word2 =3D cpsw_ale_get_entry_word2(ale_entry);=0D
++=0D
++	if (index & IPV6_HIGH_ENTRY_FLAG) {=0D
++		fprintf(stdout, "%d: Type: VLAN IPv6 Higher Entry (Lower Bit entry at %=
04u)\n \tIgnored Multicast bits: 0x%x, IPv6 Address (Bits [127:68]) =3D %04=
x:%03x%01x:%04x:%03x\n",=0D
++			index, (index & (~IPV6_HIGH_ENTRY_FLAG)),=0D
++			vlan_entry_word2 & IPV6_IGNMCBITS_MASK,=0D
++			(vlan_entry_word1 >> IPV6_HADDR_W1_SHIFT) & IPV6_HADDR_W1_MASK_1,=0D
++			vlan_entry_word1 & IPV6_HADDR_W1_MASK_2,=0D
++			(vlan_entry_word0 >> IPV6_HADDR_W0_SHIFT_1) & IPV6_HADDR_W0_MASK_1,=0D
++			(vlan_entry_word0 >> IPV6_HADDR_W0_SHIFT_2) & IPV6_HADDR_W0_MASK_2,=0D
++			vlan_entry_word0 & IPV6_HADDR_W0_MASK_2);=0D
++	} else {=0D
++		fprintf(stdout, "%d: Type: VLAN IPv6 Lower Entry (Higher Bit entry at %=
04u)\n \tIPv6 Address (Bits [127:68]) =3D %01x:%01x%03x:%04x:%04x:%04x\n",=
=0D
++			index, (index | IPV6_HIGH_ENTRY_FLAG),=0D
++			(vlan_entry_word2 >> IPV6_LADDR_W2_SHIFT) & IPV6_LADDR_W2_MAKS,=0D
++			vlan_entry_word2 & IPV6_LADDR_W2_MAKS,=0D
++			(vlan_entry_word1 >> IPV6_LADDR_W1_SHIFT) & IPV6_LADDR_W1_MASK_1,=0D
++			vlan_entry_word1 & IPV6_LADDR_W1_MASK,=0D
++			(vlan_entry_word0 >> IPV6_LADDR_W0_SHIFT) & IPV6_LADDR_W0_MASK,=0D
++			vlan_entry_word0 & IPV6_LADDR_W0_MASK);=0D
++	}=0D
++}=0D
++=0D
++static void cpsw_ale_dump_vlan_addr(int index, u32 *ale_entry)=0D
++{=0D
++	u8 addr[NUM_MAC_OCTET];=0D
++	int vlan =3D cpsw_ale_get_vlan_id(ale_entry);=0D
++=0D
++	cpsw_ale_get_addr(ale_entry, addr);=0D
++	if (cpsw_ale_get_mcast(ale_entry)) {=0D
++		static const char * const str_mcast_state[] =3D {"Forwarding",=0D
++							       "Blocking/Forwarding/Learning",=0D
++							       "Learning/Forwarding",=0D
++							       "Forwarding"};=0D
++		u16 port_mask =3D cpsw_ale_get_port_mask(ale_entry);=0D
++		u8 state =3D cpsw_ale_get_mcast_state(ale_entry);=0D
++		u8 super =3D cpsw_ale_get_super(ale_entry);=0D
++=0D
++		fprintf(stdout, "%d: Type: Multicast\n \tVID =3D %d, Address =3D %02x:%=
02x:%02x:%02x:%02x:%02x, Multicast_state =3D %s, %s Super, port_mask =3D 0x=
%x\n",=0D
++			index, vlan, addr[0], addr[1], addr[2], addr[3], addr[4], addr[5],=0D
++			str_mcast_state[state], super ? "" : "No ", port_mask);=0D
++	} else {=0D
++		static const char * const s_ucast_type[] =3D {"Persistent", "Untouched"=
, "OUI",=0D
++							    "Touched"};=0D
++		u8 ucast_type =3D cpsw_ale_get_ucast_type(ale_entry);=0D
++		u8 blocked =3D cpsw_ale_get_blocked(ale_entry);=0D
++		u8 touched =3D cpsw_ale_get_touched(ale_entry);=0D
++		u8 secure =3D cpsw_ale_get_secure(ale_entry);=0D
++		u8 agable =3D cpsw_ale_get_agable(ale_entry);=0D
++=0D
++		int port_num;=0D
++=0D
++		if (rtl_version =3D=3D CPSW2G_RTL_VERSION)=0D
++			port_num =3D cpsw_ale_get_port_num_2g(ale_entry);=0D
++		else if (rtl_version =3D=3D CPSW3G_RTL_VERSION)=0D
++			port_num =3D cpsw_ale_get_port_num_3g(ale_entry);=0D
++		else=0D
++			port_num =3D cpsw_ale_get_port_num(ale_entry);=0D
++=0D
++		fprintf(stdout, "%d: Type: Unicast\n \tVID =3D %d, Address =3D %02x:%02=
x:%02x:%02x:%02x:%02x, Unicast_type =3D %s, port_num =3D 0x%x, Secure =3D %=
d, Blocked =3D %d, Touch =3D %d, Agable =3D %d\n",=0D
++			index, vlan, addr[0], addr[1], addr[2], addr[3], addr[4], addr[5],=0D
++			s_ucast_type[ucast_type], port_num, secure, blocked, touched, agable);=
=0D
++	}=0D
++}=0D
++=0D
++void cpsw_dump_ale(struct k3_cpsw_regdump_hdr *ale_hdr, u32 *ale_pos)=0D
++{=0D
++	int i, ale_entries;=0D
++=0D
++	if (!ale_hdr)=0D
++		return;=0D
++=0D
++	ale_entries =3D (ale_hdr->len - sizeof(struct k3_cpsw_regdump_hdr)) /=0D
++		      ALE_ENTRY_WORDS / sizeof(u32);=0D
++=0D
++	printf("Number of ALE entries: %d\n", ale_entries);=0D
++	ale_pos +=3D 2;=0D
++	for (i =3D 0; i < ale_entries; i++) {=0D
++		int type;=0D
++=0D
++		type =3D cpsw_ale_get_entry_type(ale_pos);=0D
++=0D
++		switch (type) {=0D
++		case ALE_ENTRY_FREE:=0D
++			break;=0D
++=0D
++		case ALE_ENTRY_ADDR:=0D
++			u32 oui_entry =3D cpsw_ale_get_oui_addr(ale_pos);=0D
++=0D
++			if (oui_entry =3D=3D 0x2)=0D
++				cpsw_ale_dump_oui_entry(i, ale_pos);=0D
++			else=0D
++				cpsw_ale_dump_addr(i, ale_pos);=0D
++			break;=0D
++=0D
++		case ALE_ENTRY_VLAN:=0D
++			u32 vlan_entry_type =3D cpsw_ale_get_vlan_entry_type(ale_pos);=0D
++=0D
++			if (vlan_entry_type =3D=3D VLAN_INNER_ENTRY)=0D
++				cpsw_ale_dump_inner_vlan_entry(i, ale_pos);=0D
++			else if (vlan_entry_type =3D=3D VLAN_OUTER_ENTRY)=0D
++				cpsw_ale_dump_outer_vlan_entry(i, ale_pos);=0D
++			else if (vlan_entry_type =3D=3D VLAN_ETHERTYPE_ENTRY)=0D
++				cpsw_ale_dump_ethertype_entry(i, ale_pos);=0D
++			else if (vlan_entry_type =3D=3D VLAN_IPV4_ENTRY)=0D
++				cpsw_ale_dump_ipv4_entry(i, ale_pos);=0D
++			else if (vlan_entry_type & VLAN_IPV6_ENTRY_MASK)=0D
++				cpsw_ale_dump_ipv6_entry(i, ale_pos);=0D
++			break;=0D
++=0D
++		case ALE_ENTRY_VLAN_ADDR:=0D
++			cpsw_ale_dump_vlan_addr(i, ale_pos);=0D
++			break;=0D
++=0D
++		default:=0D
++			break;=0D
++		}=0D
++=0D
++		ale_pos +=3D ALE_ENTRY_WORDS;=0D
++	}=0D
++}=0D
++=0D
++int am65_cpsw_dump_regs(struct  ethtool_drvinfo *info __maybe_unused,=0D
++			struct ethtool_regs *regs)=0D
++{=0D
++	struct k3_cpsw_regdump_hdr *dump_hdr, *ale_hdr =3D NULL;=0D
++	u32 *reg =3D (u32 *)regs->data, *ale_pos;=0D
++	u32 mod_id;=0D
++	int i, regdump_len =3D info->regdump_len;=0D
++=0D
++	fprintf(stdout, "K3 CPSW dump version: %d, len: %d\n",=0D
++		regs->version, info->regdump_len);=0D
++	fprintf(stdout, "(Missing registers in memory space can be considered as=
 zero valued)\n");=0D
++=0D
++	/* Line break before register dump */=0D
++	fprintf(stdout, "-------------------------------------------------------=
-------------\n");=0D
++	i =3D 0;=0D
++	do {=0D
++		u32 *tmp, j;=0D
++		u32 num_items;=0D
++=0D
++		dump_hdr =3D (struct k3_cpsw_regdump_hdr *)reg;=0D
++		mod_id =3D dump_hdr->module_id;=0D
++=0D
++		num_items =3D dump_hdr->len / sizeof(u32);=0D
++=0D
++		if (mod_id =3D=3D K3_CPSW_REGDUMP_MOD_CPSW_ALE)=0D
++			rtl_version =3D reg[3] & RTL_VERSION_MASK;=0D
++=0D
++		if (mod_id =3D=3D K3_CPSW_REGDUMP_MOD_CPSW_ALE_TBL) {=0D
++			ale_hdr =3D dump_hdr;=0D
++			ale_pos =3D reg;=0D
++			break;=0D
++		}=0D
++=0D
++		fprintf(stdout, "%s regdump: number of Registers:(%d)\n",=0D
++			mod_names[mod_id], num_items - 2);=0D
++		tmp =3D reg;=0D
++		/* Values are stored in pair as reg_offset-reg_val, hence parse the sam=
e way*/=0D
++		for (j =3D 2; j < num_items; j +=3D 2) {=0D
++			if (tmp[j + 1] !=3D 0x0)=0D
++				fprintf(stdout, "%08x:reg(%08X)\n", tmp[j], tmp[j + 1]);=0D
++		}=0D
++=0D
++		reg +=3D num_items;=0D
++		i +=3D dump_hdr->len;=0D
++	} while (i < regdump_len);=0D
++=0D
++	/* Adding a boundary in between Register dump and ALE table */=0D
++	fprintf(stdout, "--------------------------\n");=0D
++=0D
++	cpsw_dump_ale(ale_hdr, ale_pos);=0D
++=0D
++	return 0;=0D
++};=0D
+diff --git a/ethtool.c b/ethtool.c=0D
+index 3ac15a7..a383eb6 100644=0D
+--- a/ethtool.c=0D
++++ b/ethtool.c=0D
+@@ -1162,6 +1162,7 @@ static const struct {=0D
+ 	{ "fsl_enetc", fsl_enetc_dump_regs },=0D
+ 	{ "fsl_enetc_vf", fsl_enetc_dump_regs },=0D
+ 	{ "hns3", hns3_dump_regs },=0D
++	{ "am65-cpsw-nuss", am65_cpsw_dump_regs },=0D
+ };=0D
+ #endif=0D
+ =0D
+diff --git a/internal.h b/internal.h=0D
+index 4b994f5..81212b4 100644=0D
+--- a/internal.h=0D
++++ b/internal.h=0D
+@@ -410,4 +410,7 @@ int cpsw_dump_regs(struct ethtool_drvinfo *info, struc=
t ethtool_regs *regs);=0D
+ /* Microchip Ethernet Controller */=0D
+ int lan743x_dump_regs(struct ethtool_drvinfo *info, struct ethtool_regs *=
regs);=0D
+ =0D
++/* TI K3 CPSW Ethernet Switch */=0D
++int am65_cpsw_dump_regs(struct ethtool_drvinfo *info, struct ethtool_regs=
 *regs);=0D
++=0D
+ #endif /* ETHTOOL_INTERNAL_H__ */=0D
+-- =0D
+2.34.1=0D
+=0D
diff --git a/meta-arago-distro/recipes-extended/ethtool/ethtool_%.bbappend =
b/meta-arago-distro/recipes-extended/ethtool/ethtool_%.bbappend
new file mode 100644
index 00000000..3b388151
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ethtool/ethtool_%.bbappend
@@ -0,0 +1,4 @@
+ETHTOOL_ARAGO =3D ""
+ETHTOOL_ARAGO:arago =3D "ethtool-arago.inc"
+
+require ${ETHTOOL_ARAGO}
--=20
2.34.1


