Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C1F0C529E5
	for <meta-arago@arago-project.org>;
	Mon, 20 May 2019 14:22:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4KEMP62101208
	for <meta-arago@arago-project.org>; Mon, 20 May 2019 09:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558362145;
	bh=MInLIpKlGx+RX6+mTXn/ENniPmA/zxWiNMGd9SV8sCk=;
	h=From:To:CC:Subject:Date;
	b=Ap9wkNRuAblj29zOPLL9w3LTp+lTpBjzhZ4W8qWFvEaOvSD/dbQH8HyM0SregRlEN
	oF4fgiRCD7ZtfgzeUJG3rUEEYCaLt3jjmEzLINZvAiPPMy21+mZJQUEY4TdmElEqww
	fEjhtRDOxlqnyWTUAsF0adZuNhlroE4Urg+iqtcw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4KEMP5H018819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 20 May 2019 09:22:25 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 20 May 2019 09:22:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 20 May 2019 09:22:25 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4KEMOw4056686;
	Mon, 20 May 2019 09:22:24 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 May 2019 10:10:07 -0400
Message-ID: <1558361407-21947-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] iproute2: rework patches for v4.19.0
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
X-List-Received-Date: Mon, 20 May 2019 14:22:59 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../0001-add-support-for-prp-similar-to-hsr.patch  | 119 +++---
 ...-prp-remove-the-debug-print-from-the-code.patch |  33 --
 ...oduce-common-definitions-for-netlink-int.patch} | 371 +++++++++-------
 .../iproute2/0002-prp-invalid-maxattr.patch        |  31 --
 ...tch => 0003-hsr-prp-refactor-common-code.patch} | 473 +++++++++++++++++++--
 ...support-for-vlan-tagged-supervision-fram.patch} | 296 +++----------
 .../iproute2/iproute2_4.19.0.bbappend              |  16 +-
 7 files changed, 783 insertions(+), 556 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-remove-the-debug-print-from-the-code.patch
 rename meta-arago-distro/recipes-connectivity/iproute2/iproute2/{0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch => 0002-hsr-prp-introduce-common-definitions-for-netlink-int.patch} (8%)
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-prp-invalid-maxattr.patch
 rename meta-arago-distro/recipes-connectivity/iproute2/iproute2/{0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch => 0003-hsr-prp-refactor-common-code.patch} (3%)
 rename meta-arago-distro/recipes-connectivity/iproute2/iproute2/{0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch => 0004-hsr-prp-add-support-for-vlan-tagged-supervision-fram.patch} (23%)

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-add-support-for-prp-similar-to-hsr.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-add-support-for-prp-similar-to-hsr.patch
index 1ef6292..8cb1047 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-add-support-for-prp-similar-to-hsr.patch
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-add-support-for-prp-similar-to-hsr.patch
@@ -1,26 +1,27 @@
-From cd61c6eec1fc9d86484d529bfe42da7a00a1534a Mon Sep 17 00:00:00 2001
+From 8cce18533dff81eb72c07acb20775576b8bd2c25 Mon Sep 17 00:00:00 2001
 From: Murali Karicheri <m-karicheri2@ti.com>
-Date: Wed, 12 Apr 2017 16:23:37 -0400
-Subject: [PATCH] add support for prp similar to hsr
+Date: Wed, 19 Sep 2018 16:41:30 -0400
+Subject: [PATCH 1/4] add support for prp similar to hsr
 
 prp protocol is similar to hsr in many aspects and this patch add a
 command type prp to create prp interface using two slave interfaces
 similar to hsr
 
+Upstream-Status: Pending
+
 Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- include/linux/if_link.h |  14 ++++-
- ip/Makefile             |   2 +-
- ip/iplink_prp.c         | 141 ++++++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 154 insertions(+), 3 deletions(-)
+ include/uapi/linux/if_link.h |  14 ++++-
+ ip/Makefile                  |   2 +-
+ ip/iplink_prp.c              | 147 +++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 160 insertions(+), 3 deletions(-)
  create mode 100644 ip/iplink_prp.c
 
-diff --git a/include/linux/if_link.h b/include/linux/if_link.h
-index b0bdbd6..41c1e91 100644
---- a/include/linux/if_link.h
-+++ b/include/linux/if_link.h
-@@ -814,7 +814,6 @@ enum {
+diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
+index f4a9715..5a6d728 100644
+--- a/include/uapi/linux/if_link.h
++++ b/include/uapi/linux/if_link.h
+@@ -852,7 +852,6 @@ enum {
  
  
  /* HSR section */
@@ -28,7 +29,7 @@ index b0bdbd6..41c1e91 100644
  enum {
  	IFLA_HSR_UNSPEC,
  	IFLA_HSR_SLAVE1,
-@@ -825,7 +824,6 @@ enum {
+@@ -863,7 +862,6 @@ enum {
  	IFLA_HSR_VERSION,		/* HSR version */
  	__IFLA_HSR_MAX,
  };
@@ -36,9 +37,9 @@ index b0bdbd6..41c1e91 100644
  #define IFLA_HSR_MAX (__IFLA_HSR_MAX - 1)
  
  /* STATS section */
-@@ -890,4 +888,16 @@ enum {
- 
- #define IFLA_XDP_MAX (__IFLA_XDP_MAX - 1)
+@@ -997,4 +995,16 @@ struct ifla_rmnet_flags {
+ 	__u32	mask;
+ };
  
 +/* PRP section */
 +enum {
@@ -54,24 +55,24 @@ index b0bdbd6..41c1e91 100644
 +
  #endif /* _LINUX_IF_LINK_H */
 diff --git a/ip/Makefile b/ip/Makefile
-index 035d42c..9836e64 100644
+index a88f936..c0efc3a 100644
 --- a/ip/Makefile
 +++ b/ip/Makefile
-@@ -7,7 +7,7 @@ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o ipnetns.o \
+@@ -8,7 +8,7 @@ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o ipnetns.o \
      iplink_macvlan.o ipl2tp.o link_vti.o link_vti6.o \
      iplink_vxlan.o tcp_metrics.o iplink_ipoib.o ipnetconf.o link_ip6tnl.o \
      link_iptnl.o link_gre6.o iplink_bond.o iplink_bond_slave.o iplink_hsr.o \
 -    iplink_bridge.o iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
 +    iplink_prp.o iplink_bridge.o iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
      iplink_geneve.o iplink_vrf.o iproute_lwtunnel.o ipmacsec.o ipila.o \
-     ipvrf.o iplink_xstats.o
+     ipvrf.o iplink_xstats.o ipseg6.o iplink_netdevsim.o iplink_rmnet.o
  
 diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
 new file mode 100644
-index 0000000..c1e5a3b
+index 0000000..46533e9
 --- /dev/null
 +++ b/ip/iplink_prp.c
-@@ -0,0 +1,141 @@
+@@ -0,0 +1,147 @@
 +/*
 + * iplink_prp.c	PRP device support
 + *
@@ -106,7 +107,7 @@ index 0000000..c1e5a3b
 +"SLAVE1-IF, SLAVE2-IF\n"
 +"	the two slave devices bound to the PRP device\n"
 +"ADDR-BYTE\n"
-+"	0-255; the last byte of the multicast address used for HSR supervision\n"
++"	0-255; the last byte of the multicast address used for PRP supervision\n"
 +"	frames (default = 0)\n");
 +}
 +
@@ -126,20 +127,20 @@ index 0000000..c1e5a3b
 +			NEXT_ARG();
 +			if (get_u8(&multicast_spec, *argv, 0))
 +				invarg("ADDR-BYTE is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_HSR_MULTICAST_SPEC,
++			addattr_l(n, 1024, IFLA_PRP_MULTICAST_SPEC,
 +				  &multicast_spec, 1);
 +		} else if (matches(*argv, "slave1") == 0) {
 +			NEXT_ARG();
 +			ifindex = ll_name_to_index(*argv);
 +			if (ifindex == 0)
 +				invarg("No such interface", *argv);
-+			addattr_l(n, 1024, IFLA_HSR_SLAVE1, &ifindex, 4);
++			addattr_l(n, 1024, IFLA_PRP_SLAVE1, &ifindex, 4);
 +		} else if (matches(*argv, "slave2") == 0) {
 +			NEXT_ARG();
 +			ifindex = ll_name_to_index(*argv);
 +			if (ifindex == 0)
 +				invarg("No such interface", *argv);
-+			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
++			addattr_l(n, 1024, IFLA_PRP_SLAVE2, &ifindex, 4);
 +		} else if (matches(*argv, "help") == 0) {
 +			usage();
 +			return -1;
@@ -161,43 +162,49 @@ index 0000000..c1e5a3b
 +	if (!tb)
 +		return;
 +
-+	if (tb[IFLA_HSR_SLAVE1] &&
-+	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
++	if (tb[IFLA_PRP_SLAVE1] &&
++	    RTA_PAYLOAD(tb[IFLA_PRP_SLAVE1]) < sizeof(__u32))
 +		return;
-+	if (tb[IFLA_HSR_SLAVE2] &&
-+	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE2]) < sizeof(__u32))
++	if (tb[IFLA_PRP_SLAVE2] &&
++	    RTA_PAYLOAD(tb[IFLA_PRP_SLAVE2]) < sizeof(__u32))
 +		return;
-+	if (tb[IFLA_HSR_SEQ_NR] &&
-+	    RTA_PAYLOAD(tb[IFLA_HSR_SEQ_NR]) < sizeof(__u16))
++	if (tb[IFLA_PRP_SEQ_NR] &&
++	    RTA_PAYLOAD(tb[IFLA_PRP_SEQ_NR]) < sizeof(__u16))
 +		return;
-+	if (tb[IFLA_HSR_SUPERVISION_ADDR] &&
-+	    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]) < ETH_ALEN)
++	if (tb[IFLA_PRP_SUPERVISION_ADDR] &&
++	    RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]) < ETH_ALEN)
 +		return;
 +
-+	fprintf(f, "slave1 ");
-+	if (tb[IFLA_HSR_SLAVE1])
-+		fprintf(f, "%s ",
-+			ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE1])));
++	if (tb[IFLA_PRP_SLAVE1])
++		print_string(PRINT_ANY,
++			     "slave1",
++			     "slave1 %s ",
++			     ll_index_to_name(rta_getattr_u32(tb[IFLA_PRP_SLAVE1])));
 +	else
-+		fprintf(f, "<none> ");
++		print_null(PRINT_ANY, "slave1", "slave1 %s ", "<none>");
 +
-+	fprintf(f, "slave2 ");
-+	if (tb[IFLA_HSR_SLAVE2])
-+		fprintf(f, "%s ",
-+			ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE2])));
++	if (tb[IFLA_PRP_SLAVE2])
++		print_string(PRINT_ANY,
++			     "slave2",
++			     "slave2 %s ",
++			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE2])));
 +	else
-+		fprintf(f, "<none> ");
-+
-+	if (tb[IFLA_HSR_SEQ_NR])
-+		fprintf(f, "sequence %d ",
-+			rta_getattr_u16(tb[IFLA_HSR_SEQ_NR]));
-+
-+	if (tb[IFLA_HSR_SUPERVISION_ADDR])
-+		fprintf(f, "supervision %s ",
-+			ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_SUPERVISION_ADDR]),
-+				    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
-+				    ARPHRD_VOID,
-+				    b1, sizeof(b1)));
++		print_null(PRINT_ANY, "slave2", "slave2 %s ", "<none>");
++
++	if (tb[IFLA_PRP_SEQ_NR])
++		print_int(PRINT_ANY,
++			  "seq_nr",
++			  "sequence %d ",
++			  rta_getattr_u16(tb[IFLA_PRP_SEQ_NR]));
++
++	if (tb[IFLA_PRP_SUPERVISION_ADDR])
++		print_string(PRINT_ANY,
++			     "supervision_addr",
++			     "supervision %s ",
++			     ll_addr_n2a(RTA_DATA(tb[IFLA_PRP_SUPERVISION_ADDR]),
++					 RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]),
++					 ARPHRD_VOID,
++					 b1, sizeof(b1)));
 +}
 +
 +static void prp_print_help(struct link_util *lu, int argc, char **argv,
@@ -208,7 +215,7 @@ index 0000000..c1e5a3b
 +
 +struct link_util prp_link_util = {
 +	.id		= "prp",
-+	.maxattr	= IFLA_VLAN_MAX,
++	.maxattr	= IFLA_PRP_MAX,
 +	.parse_opt	= prp_parse_opt,
 +	.print_opt	= prp_print_opt,
 +	.print_help	= prp_print_help,
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-remove-the-debug-print-from-the-code.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-remove-the-debug-print-from-the-code.patch
deleted file mode 100644
index e6dc8b3..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-remove-the-debug-print-from-the-code.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From dafdd0fd2bf7ce1aa2806a02a40aa5b8350e9ca0 Mon Sep 17 00:00:00 2001
-From: Murali Karicheri <m-karicheri2@ti.com>
-Date: Fri, 21 Sep 2018 16:10:55 -0400
-Subject: [PATCH] hsr/prp: remove the debug print from the code.
-
-This debug print causes a parser error in iec62439 mib parser
-that expects the iplink -d output to be in a certain format to
-extract the hsr/prp interface details. This was a left over
-code from debugging which is removed to fix the issue. This print
-appears when iplink -d command is executed causing the issue.
-
-Upstream-Status: Pending
-
-Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
----
- ip/iplink_hsr.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
-index 2153494..34e9167 100644
---- a/ip/iplink_hsr.c
-+++ b/ip/iplink_hsr.c
-@@ -134,7 +134,6 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 	if (!tb)
- 		return;
- 
--	printf("%s\n", __func__);
- 	if (tb[IFLA_HSR_SLAVE1] &&
- 	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
- 		return;
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-hsr-prp-introduce-common-definitions-for-netlink-int.patch
similarity index 8%
rename from meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch
rename to meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-hsr-prp-introduce-common-definitions-for-netlink-int.patch
index 8e1cc2c..78988c6 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-hsr-prp-introduce-common-definitions-for-netlink-int.patch
@@ -1,178 +1,259 @@
-From da07e28264d0bfec96cfb83e3628640dce2ec7ce Mon Sep 17 00:00:00 2001
+From d8a98010127fabf4898d6fca67d14c21ad7e1f62 Mon Sep 17 00:00:00 2001
 From: Murali Karicheri <m-karicheri2@ti.com>
-Date: Tue, 30 Oct 2018 15:41:51 -0400
-Subject: [PATCH] hsr/prp: replace cfi use in code with dei
+Date: Fri, 12 Apr 2019 10:11:28 -0400
+Subject: [PATCH 2/4] hsr/prp: introduce common definitions for netlink
+ interface
 
-cfi in vlan tag is an older name for dei and is deprecated. So use
-dei instead to refer the field in VLAN tag.
+HSR and PRP interfaces are setup in a similar way in kernel as
+the protocols shares many similar attributes. So introduce a common
+definitions for netlink interface and modify hsr/prp code to re-use
+the same.
 
 Upstream-Status: Pending
 
 Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
 ---
- include/linux/if_link.h |  4 ++--
- ip/iplink_hsr.c         | 28 ++++++++++++++--------------
- ip/iplink_prp.c         | 28 ++++++++++++++--------------
- 3 files changed, 30 insertions(+), 30 deletions(-)
+ include/uapi/linux/if_link.h | 20 +++++++++++---------
+ ip/iplink_hsr.c              | 42 +++++++++++++++++++++---------------------
+ ip/iplink_prp.c              | 40 ++++++++++++++++++++--------------------
+ 3 files changed, 52 insertions(+), 50 deletions(-)
 
-diff --git a/include/linux/if_link.h b/include/linux/if_link.h
-index 31230df..a2abe0f 100644
---- a/include/linux/if_link.h
-+++ b/include/linux/if_link.h
-@@ -823,7 +823,7 @@ enum {
- 	IFLA_HSR_SEQ_NR,
- 	IFLA_HSR_VERSION,		/* HSR version */
- 	IFLA_HSR_SV_VID,
--	IFLA_HSR_SV_CFI,
-+	IFLA_HSR_SV_DEI,
- 	IFLA_HSR_SV_PCP,
- 	__IFLA_HSR_MAX,
+diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
+index 5a6d728..ba78aaf 100644
+--- a/include/uapi/linux/if_link.h
++++ b/include/uapi/linux/if_link.h
+@@ -995,16 +995,18 @@ struct ifla_rmnet_flags {
+ 	__u32	mask;
  };
-@@ -900,7 +900,7 @@ enum {
- 	IFLA_PRP_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
- 	IFLA_PRP_SEQ_NR,
- 	IFLA_PRP_SV_VID,
--	IFLA_PRP_SV_CFI,
-+	IFLA_PRP_SV_DEI,
- 	IFLA_PRP_SV_PCP,
- 	__IFLA_PRP_MAX,
+ 
+-/* PRP section */
++/* HSR-PRP section */
+ enum {
+-	IFLA_PRP_UNSPEC,
+-	IFLA_PRP_SLAVE1,
+-	IFLA_PRP_SLAVE2,
+-	IFLA_PRP_MULTICAST_SPEC,	/* Last byte of supervision addr */
+-	IFLA_PRP_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
+-	IFLA_PRP_SEQ_NR,
+-	__IFLA_PRP_MAX,
++	IFLA_HSR_PRP_UNSPEC,
++	IFLA_HSR_PRP_SLAVE1,
++	IFLA_HSR_PRP_SLAVE2,
++	IFLA_HSR_PRP_SF_MC_ADDR_LSB,	/* Last byte of supervision addr */
++	IFLA_HSR_PRP_SF_MC_ADDR,	/* Supervision frame multicast addr */
++	IFLA_HSR_PRP_SEQ_NR,
++	IFLA_HSR_PRP_VERSION,		/* HSR version */
++	__IFLA_HSR_PRP_MAX,
  };
+-#define IFLA_PRP_MAX (__IFLA_PRP_MAX - 1)
++
++#define IFLA_HSR_PRP_MAX (__IFLA_HSR_PRP_MAX - 1)
+ 
+ #endif /* _LINUX_IF_LINK_H */
 diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
-index e713cb7..a30bd05 100644
+index c673ccf..1281e09 100644
 --- a/ip/iplink_hsr.c
 +++ b/ip/iplink_hsr.c
-@@ -26,7 +26,7 @@ static void print_usage(FILE *f)
- 	fprintf(f,
- "Usage:\tip link add name NAME type hsr slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
- "\t[ supervision ADDR-BYTE ] [version VERSION] [ sv_vid SV-VID ] \n"
--"\t[ sv_pcp SV-PCP ] [ sv_cfi SV-CFI ] \n"
-+"\t[ sv_pcp SV-PCP ] [ sv_dei SV-DEI ] \n"
- "\n"
- "NAME\n"
- "	name of new hsr device (e.g. hsr0)\n"
-@@ -41,9 +41,9 @@ static void print_usage(FILE *f)
- "	0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
- "SV-PCP\n"
- "	0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
--"SV-CFI\n"
--"	0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
--"Use VLAN tag if one of sv_vid, sv_pcp or sv_cfi is specified. Default value\n"
-+"SV-DEI\n"
-+"	0-1; DEI value to be used in the VLAN tag of SV frames (default 0)\n"
-+"Use VLAN tag if one of sv_vid, sv_pcp or sv_dei is specified. Default value\n"
- "used for unspecified ones\n");
- }
- 
-@@ -59,7 +59,7 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
- 	unsigned char multicast_spec;
- 	unsigned char protocol_version;
- 	unsigned short sv_vid;
--	unsigned char sv_cfi;
-+	unsigned char sv_dei;
- 	unsigned char sv_pcp;
- 
- 	while (argc > 0) {
-@@ -105,14 +105,14 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
- 				invarg("SV-PCP is invalid", *argv);
- 			addattr_l(n, 1024, IFLA_HSR_SV_PCP,
- 				  &sv_pcp, sizeof(sv_pcp));
--		} else if (matches(*argv, "sv_cfi") == 0) {
-+		} else if (matches(*argv, "sv_dei") == 0) {
+@@ -55,7 +55,7 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+ 			NEXT_ARG();
+ 			if (get_u8(&multicast_spec, *argv, 0))
+ 				invarg("ADDR-BYTE is invalid", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_MULTICAST_SPEC,
++			addattr_l(n, 1024, IFLA_HSR_PRP_SF_MC_ADDR_LSB,
+ 				  &multicast_spec, 1);
+ 		} else if (matches(*argv, "version") == 0) {
  			NEXT_ARG();
--			if (get_u8(&sv_cfi, *argv, 0))
--				invarg("SV-CFI is invalid", *argv);
--			if (sv_cfi > 1)
--				invarg("SV-CFI is invalid", *argv);
--			addattr_l(n, 1024, IFLA_HSR_SV_CFI,
--				  &sv_cfi, sizeof(sv_cfi));
-+			if (get_u8(&sv_dei, *argv, 0))
-+				invarg("SV-DEI is invalid", *argv);
-+			if (sv_dei > 1)
-+				invarg("SV-DEI is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_HSR_SV_DEI,
-+				  &sv_dei, sizeof(sv_dei));
+@@ -69,13 +69,13 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+ 			ifindex = ll_name_to_index(*argv);
+ 			if (ifindex == 0)
+ 				invarg("No such interface", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_SLAVE1, &ifindex, 4);
++			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE1, &ifindex, 4);
+ 		} else if (matches(*argv, "slave2") == 0) {
+ 			NEXT_ARG();
+ 			ifindex = ll_name_to_index(*argv);
+ 			if (ifindex == 0)
+ 				invarg("No such interface", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
++			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE2, &ifindex, 4);
  		} else if (matches(*argv, "help") == 0) {
  			usage();
  			return -1;
-@@ -152,8 +152,8 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 	if (tb[IFLA_HSR_SV_PCP] &&
- 	    RTA_PAYLOAD(tb[IFLA_HSR_SV_PCP]) < sizeof(__u8))
+@@ -97,47 +97,47 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+ 	if (!tb)
  		return;
--	if (tb[IFLA_HSR_SV_CFI] &&
--	    RTA_PAYLOAD(tb[IFLA_HSR_SV_CFI]) < sizeof(__u8))
-+	if (tb[IFLA_HSR_SV_DEI] &&
-+	    RTA_PAYLOAD(tb[IFLA_HSR_SV_DEI]) < sizeof(__u8))
+ 
+-	if (tb[IFLA_HSR_SLAVE1] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
++	if (tb[IFLA_HSR_PRP_SLAVE1] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE1]) < sizeof(__u32))
  		return;
+-	if (tb[IFLA_HSR_SLAVE2] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE2]) < sizeof(__u32))
++	if (tb[IFLA_HSR_PRP_SLAVE2] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE2]) < sizeof(__u32))
+ 		return;
+-	if (tb[IFLA_HSR_SEQ_NR] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_SEQ_NR]) < sizeof(__u16))
++	if (tb[IFLA_HSR_PRP_SEQ_NR] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SEQ_NR]) < sizeof(__u16))
+ 		return;
+-	if (tb[IFLA_HSR_SUPERVISION_ADDR] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]) < ETH_ALEN)
++	if (tb[IFLA_HSR_PRP_SF_MC_ADDR] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]) < ETH_ALEN)
+ 		return;
+ 
+-	if (tb[IFLA_HSR_SLAVE1])
++	if (tb[IFLA_HSR_PRP_SLAVE1])
+ 		print_string(PRINT_ANY,
+ 			     "slave1",
+ 			     "slave1 %s ",
+-			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE1])));
++			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_PRP_SLAVE1])));
+ 	else
+ 		print_null(PRINT_ANY, "slave1", "slave1 %s ", "<none>");
+ 
+-	if (tb[IFLA_HSR_SLAVE2])
++	if (tb[IFLA_HSR_PRP_SLAVE2])
+ 		print_string(PRINT_ANY,
+ 			     "slave2",
+ 			     "slave2 %s ",
+-			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE2])));
++			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_PRP_SLAVE2])));
+ 	else
+ 		print_null(PRINT_ANY, "slave2", "slave2 %s ", "<none>");
+ 
+-	if (tb[IFLA_HSR_SEQ_NR])
++	if (tb[IFLA_HSR_PRP_SEQ_NR])
+ 		print_int(PRINT_ANY,
+ 			  "seq_nr",
+ 			  "sequence %d ",
+-			  rta_getattr_u16(tb[IFLA_HSR_SEQ_NR]));
++			  rta_getattr_u16(tb[IFLA_HSR_PRP_SEQ_NR]));
+ 
+-	if (tb[IFLA_HSR_SUPERVISION_ADDR])
++	if (tb[IFLA_HSR_PRP_SF_MC_ADDR])
+ 		print_string(PRINT_ANY,
+ 			     "supervision_addr",
+ 			     "supervision %s ",
+-			     ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_SUPERVISION_ADDR]),
+-					 RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
++			     ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
++					 RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
+ 					 ARPHRD_VOID,
+ 					 b1, sizeof(b1)));
+ }
+@@ -150,7 +150,7 @@ static void hsr_print_help(struct link_util *lu, int argc, char **argv,
  
- 	fprintf(f, "slave1 ");
+ struct link_util hsr_link_util = {
+ 	.id		= "hsr",
+-	.maxattr	= IFLA_HSR_MAX,
++	.maxattr	= IFLA_HSR_PRP_MAX,
+ 	.parse_opt	= hsr_parse_opt,
+ 	.print_opt	= hsr_print_opt,
+ 	.print_help	= hsr_print_help,
 diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
-index beef603..31f589e 100644
+index 46533e9..062c1c7 100644
 --- a/ip/iplink_prp.c
 +++ b/ip/iplink_prp.c
-@@ -26,7 +26,7 @@ static void print_usage(FILE *f)
- 	fprintf(f,
- "Usage:\tip link add name NAME type prp slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
- "\t[ supervision ADDR-BYTE ] [ sv_vid SV-VID ] [ sv_pcp SV-PCP ] \n"
--"\t [ sv_cfi SV-CFI ] \n"
-+"\t [ sv_dei SV-DEI ] \n"
- "\n"
- "NAME\n"
- "	name of new prp device (e.g. prp0)\n"
-@@ -39,9 +39,9 @@ static void print_usage(FILE *f)
- "	0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
- "SV-PCP\n"
- "	0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
--"SV-CFI\n"
--"	0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
--"Use VLAN tag if one of sv_vid, sv_pcp or sv_cfi is specified. Default value\n"
-+"SV-DEI\n"
-+"	0-1; DEI value to be used in the VLAN tag of SV frames (default 0)\n"
-+"Use VLAN tag if one of sv_vid, sv_pcp or sv_dei is specified. Default value\n"
- "used for unspecified ones\n");
- }
- 
-@@ -56,7 +56,7 @@ static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
- 	int ifindex;
- 	unsigned char multicast_spec;
- 	unsigned short sv_vid;
--	unsigned char sv_cfi;
-+	unsigned char sv_dei;
- 	unsigned char sv_pcp;
- 
- 	while (argc > 0) {
-@@ -95,14 +95,14 @@ static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
- 				invarg("SV-PCP is invalid", *argv);
- 			addattr_l(n, 1024, IFLA_PRP_SV_PCP,
- 				  &sv_pcp, sizeof(sv_pcp));
--		} else if (matches(*argv, "sv_cfi") == 0) {
-+		} else if (matches(*argv, "sv_dei") == 0) {
+@@ -52,20 +52,20 @@ static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
  			NEXT_ARG();
--			if (get_u8(&sv_cfi, *argv, 0))
--				   invarg("SV-CFI is invalid", *argv);
--			if (sv_cfi > 1)
--				   invarg("SV-CFI is invalid", *argv);
--			addattr_l(n, 1024, IFLA_PRP_SV_CFI,
--				  &sv_cfi, sizeof(sv_cfi));
-+			if (get_u8(&sv_dei, *argv, 0))
-+				   invarg("SV-DEI is invalid", *argv);
-+			if (sv_dei > 1)
-+				   invarg("SV-DEI is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_PRP_SV_DEI,
-+				  &sv_dei, sizeof(sv_dei));
+ 			if (get_u8(&multicast_spec, *argv, 0))
+ 				invarg("ADDR-BYTE is invalid", *argv);
+-			addattr_l(n, 1024, IFLA_PRP_MULTICAST_SPEC,
++			addattr_l(n, 1024, IFLA_HSR_PRP_SF_MC_ADDR_LSB,
+ 				  &multicast_spec, 1);
+ 		} else if (matches(*argv, "slave1") == 0) {
+ 			NEXT_ARG();
+ 			ifindex = ll_name_to_index(*argv);
+ 			if (ifindex == 0)
+ 				invarg("No such interface", *argv);
+-			addattr_l(n, 1024, IFLA_PRP_SLAVE1, &ifindex, 4);
++			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE1, &ifindex, 4);
+ 		} else if (matches(*argv, "slave2") == 0) {
+ 			NEXT_ARG();
+ 			ifindex = ll_name_to_index(*argv);
+ 			if (ifindex == 0)
+ 				invarg("No such interface", *argv);
+-			addattr_l(n, 1024, IFLA_PRP_SLAVE2, &ifindex, 4);
++			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE2, &ifindex, 4);
  		} else if (matches(*argv, "help") == 0) {
  			usage();
  			return -1;
-@@ -142,8 +142,8 @@ static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 	if (tb[IFLA_PRP_SV_PCP] &&
- 	    RTA_PAYLOAD(tb[IFLA_PRP_SV_PCP]) < sizeof(__u8))
+@@ -87,28 +87,28 @@ static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+ 	if (!tb)
+ 		return;
+ 
+-	if (tb[IFLA_PRP_SLAVE1] &&
+-	    RTA_PAYLOAD(tb[IFLA_PRP_SLAVE1]) < sizeof(__u32))
++	if (tb[IFLA_HSR_PRP_SLAVE1] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE1]) < sizeof(__u32))
  		return;
--	if (tb[IFLA_PRP_SV_CFI] &&
--	    RTA_PAYLOAD(tb[IFLA_PRP_SV_CFI]) < sizeof(__u8))
-+	if (tb[IFLA_PRP_SV_DEI] &&
-+	    RTA_PAYLOAD(tb[IFLA_PRP_SV_DEI]) < sizeof(__u8))
+-	if (tb[IFLA_PRP_SLAVE2] &&
+-	    RTA_PAYLOAD(tb[IFLA_PRP_SLAVE2]) < sizeof(__u32))
++	if (tb[IFLA_HSR_PRP_SLAVE2] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE2]) < sizeof(__u32))
  		return;
+-	if (tb[IFLA_PRP_SEQ_NR] &&
+-	    RTA_PAYLOAD(tb[IFLA_PRP_SEQ_NR]) < sizeof(__u16))
++	if (tb[IFLA_HSR_PRP_SEQ_NR] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SEQ_NR]) < sizeof(__u16))
+ 		return;
+-	if (tb[IFLA_PRP_SUPERVISION_ADDR] &&
+-	    RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]) < ETH_ALEN)
++	if (tb[IFLA_HSR_PRP_SF_MC_ADDR] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]) < ETH_ALEN)
+ 		return;
+ 
+-	if (tb[IFLA_PRP_SLAVE1])
++	if (tb[IFLA_HSR_PRP_SLAVE1])
+ 		print_string(PRINT_ANY,
+ 			     "slave1",
+ 			     "slave1 %s ",
+-			     ll_index_to_name(rta_getattr_u32(tb[IFLA_PRP_SLAVE1])));
++			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_PRP_SLAVE1])));
+ 	else
+ 		print_null(PRINT_ANY, "slave1", "slave1 %s ", "<none>");
+ 
+-	if (tb[IFLA_PRP_SLAVE2])
++	if (tb[IFLA_HSR_PRP_SLAVE2])
+ 		print_string(PRINT_ANY,
+ 			     "slave2",
+ 			     "slave2 %s ",
+@@ -116,18 +116,18 @@ static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+ 	else
+ 		print_null(PRINT_ANY, "slave2", "slave2 %s ", "<none>");
+ 
+-	if (tb[IFLA_PRP_SEQ_NR])
++	if (tb[IFLA_HSR_PRP_SEQ_NR])
+ 		print_int(PRINT_ANY,
+ 			  "seq_nr",
+ 			  "sequence %d ",
+-			  rta_getattr_u16(tb[IFLA_PRP_SEQ_NR]));
++			  rta_getattr_u16(tb[IFLA_HSR_PRP_SEQ_NR]));
+ 
+-	if (tb[IFLA_PRP_SUPERVISION_ADDR])
++	if (tb[IFLA_HSR_PRP_SF_MC_ADDR])
+ 		print_string(PRINT_ANY,
+ 			     "supervision_addr",
+ 			     "supervision %s ",
+-			     ll_addr_n2a(RTA_DATA(tb[IFLA_PRP_SUPERVISION_ADDR]),
+-					 RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]),
++			     ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
++					 RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
+ 					 ARPHRD_VOID,
+ 					 b1, sizeof(b1)));
+ }
+@@ -140,7 +140,7 @@ static void prp_print_help(struct link_util *lu, int argc, char **argv,
  
- 	fprintf(f, "slave1 ");
+ struct link_util prp_link_util = {
+ 	.id		= "prp",
+-	.maxattr	= IFLA_PRP_MAX,
++	.maxattr	= IFLA_HSR_PRP_MAX,
+ 	.parse_opt	= prp_parse_opt,
+ 	.print_opt	= prp_print_opt,
+ 	.print_help	= prp_print_help,
 -- 
 2.7.4
 
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-prp-invalid-maxattr.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-prp-invalid-maxattr.patch
deleted file mode 100644
index cd3dd92..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-prp-invalid-maxattr.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 755328f9c9d45149cad1a8e6c371d2020b99f18e Mon Sep 17 00:00:00 2001
-From: Murali Karicheri <m-karicheri2@ti.com>
-Date: Thu, 27 Sep 2018 14:54:48 -0400
-Subject: [PATCH 2/2] prp: invalid maxattr
-
-Fix the cut and paste error of using IFLA_VLAN_MAX instead of IFLA_PRP_MAX.
-
-Upstream-Status: Pending
-
-Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
----
- ip/iplink_prp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
-index b09528a5..beef603b 100644
---- a/ip/iplink_prp.c
-+++ b/ip/iplink_prp.c
-@@ -180,7 +180,7 @@ static void prp_print_help(struct link_util *lu, int argc, char **argv,
- 
- struct link_util prp_link_util = {
- 	.id		= "prp",
--	.maxattr	= IFLA_VLAN_MAX,
-+	.maxattr	= IFLA_PRP_MAX,
- 	.parse_opt	= prp_parse_opt,
- 	.print_opt	= prp_print_opt,
- 	.print_help	= prp_print_help,
--- 
-2.17.0
-
-
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0003-hsr-prp-refactor-common-code.patch
similarity index 3%
rename from meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch
rename to meta-arago-distro/recipes-connectivity/iproute2/iproute2/0003-hsr-prp-refactor-common-code.patch
index de90a1e..26cca27 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0003-hsr-prp-refactor-common-code.patch
@@ -1,65 +1,452 @@
-From b893b6e581785fd4a458d5cf1a8178e858636db2 Mon Sep 17 00:00:00 2001
+From 87e8845929c0f42ebaba4341580d58de19296ba3 Mon Sep 17 00:00:00 2001
 From: Murali Karicheri <m-karicheri2@ti.com>
-Date: Thu, 27 Sep 2018 11:56:00 -0400
-Subject: [PATCH 1/2] hsr/prp: disable display for vlan params in ip -d link
- command
+Date: Fri, 17 May 2019 16:59:38 -0400
+Subject: [PATCH 3/4] hsr/prp: refactor common code
 
-Seeing a crash with ip -d link command for prp. Disable it for now
-as a trial to check if that is causing the segmentation fault
-for prp. These values are not coming from kernel anyways. So it
-doesn't correctly display it currently. So this has no impact on
-the functionality. Can add it later once kernel provide the right
-values in the response.
+As there is similar code between the hsr and prp device support,
+move them to a common file and re-use
 
 Upstream-Status: Pending
 
 Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
 ---
- ip/iplink_hsr.c | 9 ---------
- ip/iplink_prp.c | 9 ---------
- 2 files changed, 18 deletions(-)
+ ip/Makefile                |   5 +-
+ ip/iplink_hsr.c            | 109 +++----------------------------------------
+ ip/iplink_hsr_prp_common.c | 114 +++++++++++++++++++++++++++++++++++++++++++++
+ ip/iplink_hsr_prp_common.h |  24 ++++++++++
+ ip/iplink_prp.c            | 101 +++------------------------------------
+ 5 files changed, 155 insertions(+), 198 deletions(-)
+ create mode 100644 ip/iplink_hsr_prp_common.c
+ create mode 100644 ip/iplink_hsr_prp_common.h
 
+diff --git a/ip/Makefile b/ip/Makefile
+index c0efc3a..130e1ae 100644
+--- a/ip/Makefile
++++ b/ip/Makefile
+@@ -7,8 +7,9 @@ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o ipnetns.o \
+     iplink_vlan.o link_veth.o link_gre.o iplink_can.o iplink_xdp.o \
+     iplink_macvlan.o ipl2tp.o link_vti.o link_vti6.o \
+     iplink_vxlan.o tcp_metrics.o iplink_ipoib.o ipnetconf.o link_ip6tnl.o \
+-    link_iptnl.o link_gre6.o iplink_bond.o iplink_bond_slave.o iplink_hsr.o \
+-    iplink_prp.o iplink_bridge.o iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
++    link_iptnl.o link_gre6.o iplink_bond.o iplink_bond_slave.o \
++    iplink_hsr_prp_common.o iplink_hsr.o iplink_prp.o iplink_bridge.o \
++    iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
+     iplink_geneve.o iplink_vrf.o iproute_lwtunnel.o ipmacsec.o ipila.o \
+     ipvrf.o iplink_xstats.o ipseg6.o iplink_netdevsim.o iplink_rmnet.o
+ 
 diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
-index 34e91679..e713cb7b 100644
+index 1281e09..2e83af0 100644
 --- a/ip/iplink_hsr.c
 +++ b/ip/iplink_hsr.c
-@@ -180,15 +180,6 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 				    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
- 				    ARPHRD_VOID,
- 				    b1, sizeof(b1)));
--	if (tb[IFLA_HSR_SV_VID])
--		fprintf(f, "SV_VID %d ",
--			rta_getattr_u16(tb[IFLA_HSR_SV_VID]));
--	if (tb[IFLA_HSR_SV_PCP])
--		fprintf(f, "SV_PCP %d ",
--			rta_getattr_u8(tb[IFLA_HSR_SV_PCP]));
--	if (tb[IFLA_HSR_SV_CFI])
--		fprintf(f, "SV_CFI %d ",
--			rta_getattr_u8(tb[IFLA_HSR_SV_CFI]));
+@@ -11,15 +11,7 @@
+  *		Based on iplink_vlan.c by Patrick McHardy <kaber@trash.net>
+  */
+ 
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include <sys/socket.h>  /* Needed by linux/if.h for some reason */
+-#include <linux/if.h>
+-#include <linux/if_arp.h>
+-#include "rt_names.h"
+-#include "utils.h"
+-#include "ip_common.h"
++#include "iplink_hsr_prp_common.h"
+ 
+ static void print_usage(FILE *f)
+ {
+@@ -46,100 +38,13 @@ static void usage(void)
+ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+ 			 struct nlmsghdr *n)
+ {
+-	int ifindex;
+-	unsigned char multicast_spec;
+-	unsigned char protocol_version;
++	int ret;
+ 
+-	while (argc > 0) {
+-		if (matches(*argv, "supervision") == 0) {
+-			NEXT_ARG();
+-			if (get_u8(&multicast_spec, *argv, 0))
+-				invarg("ADDR-BYTE is invalid", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_PRP_SF_MC_ADDR_LSB,
+-				  &multicast_spec, 1);
+-		} else if (matches(*argv, "version") == 0) {
+-			NEXT_ARG();
+-			if (!(get_u8(&protocol_version, *argv, 0) == 0 ||
+-			      get_u8(&protocol_version, *argv, 0) == 1))
+-				invarg("version is invalid", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_VERSION,
+-				  &protocol_version, 1);
+-		} else if (matches(*argv, "slave1") == 0) {
+-			NEXT_ARG();
+-			ifindex = ll_name_to_index(*argv);
+-			if (ifindex == 0)
+-				invarg("No such interface", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE1, &ifindex, 4);
+-		} else if (matches(*argv, "slave2") == 0) {
+-			NEXT_ARG();
+-			ifindex = ll_name_to_index(*argv);
+-			if (ifindex == 0)
+-				invarg("No such interface", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE2, &ifindex, 4);
+-		} else if (matches(*argv, "help") == 0) {
+-			usage();
+-			return -1;
+-		} else {
+-			fprintf(stderr, "hsr: what is \"%s\"?\n", *argv);
+-			usage();
+-			return -1;
+-		}
+-		argc--, argv++;
+-	}
++	ret = hsr_prp_parse_opt(true, lu, argc, argv, n);
++	if (ret < 0)
++		usage();
+ 
+-	return 0;
+-}
+-
+-static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+-{
+-	SPRINT_BUF(b1);
+-
+-	if (!tb)
+-		return;
+-
+-	if (tb[IFLA_HSR_PRP_SLAVE1] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE1]) < sizeof(__u32))
+-		return;
+-	if (tb[IFLA_HSR_PRP_SLAVE2] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE2]) < sizeof(__u32))
+-		return;
+-	if (tb[IFLA_HSR_PRP_SEQ_NR] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SEQ_NR]) < sizeof(__u16))
+-		return;
+-	if (tb[IFLA_HSR_PRP_SF_MC_ADDR] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]) < ETH_ALEN)
+-		return;
+-
+-	if (tb[IFLA_HSR_PRP_SLAVE1])
+-		print_string(PRINT_ANY,
+-			     "slave1",
+-			     "slave1 %s ",
+-			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_PRP_SLAVE1])));
+-	else
+-		print_null(PRINT_ANY, "slave1", "slave1 %s ", "<none>");
+-
+-	if (tb[IFLA_HSR_PRP_SLAVE2])
+-		print_string(PRINT_ANY,
+-			     "slave2",
+-			     "slave2 %s ",
+-			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_PRP_SLAVE2])));
+-	else
+-		print_null(PRINT_ANY, "slave2", "slave2 %s ", "<none>");
+-
+-	if (tb[IFLA_HSR_PRP_SEQ_NR])
+-		print_int(PRINT_ANY,
+-			  "seq_nr",
+-			  "sequence %d ",
+-			  rta_getattr_u16(tb[IFLA_HSR_PRP_SEQ_NR]));
+-
+-	if (tb[IFLA_HSR_PRP_SF_MC_ADDR])
+-		print_string(PRINT_ANY,
+-			     "supervision_addr",
+-			     "supervision %s ",
+-			     ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
+-					 RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
+-					 ARPHRD_VOID,
+-					 b1, sizeof(b1)));
++	return ret;
  }
  
  static void hsr_print_help(struct link_util *lu, int argc, char **argv,
+@@ -152,6 +57,6 @@ struct link_util hsr_link_util = {
+ 	.id		= "hsr",
+ 	.maxattr	= IFLA_HSR_PRP_MAX,
+ 	.parse_opt	= hsr_parse_opt,
+-	.print_opt	= hsr_print_opt,
++	.print_opt	= hsr_prp_print_opt,
+ 	.print_help	= hsr_print_help,
+ };
+diff --git a/ip/iplink_hsr_prp_common.c b/ip/iplink_hsr_prp_common.c
+new file mode 100644
+index 0000000..780c1cb
+--- /dev/null
++++ b/ip/iplink_hsr_prp_common.c
+@@ -0,0 +1,114 @@
++/*
++ * iplink_hsr_prp_common.c  Common utilities for hsr and prp
++ *
++ *		This program is free software; you can redistribute it and/or
++ *		modify it under the terms of the GNU General Public License
++ *		as published by the Free Software Foundation; either version
++ *		2 of the License, or (at your option) any later version.
++ *
++ * Authors:	Murali Karicheri <m-karicheri2@ti.com>
++ *
++ *
++ */
++
++#include "iplink_hsr_prp_common.h"
++
++int hsr_prp_parse_opt(bool hsr, struct link_util *lu, int argc, char **argv,
++		      struct nlmsghdr *n)
++{
++	int ifindex;
++	unsigned char multicast_spec;
++	unsigned char protocol_version;
++
++	while (argc > 0) {
++		if (matches(*argv, "supervision") == 0) {
++			NEXT_ARG();
++			if (get_u8(&multicast_spec, *argv, 0))
++				invarg("ADDR-BYTE is invalid", *argv);
++			addattr_l(n, 1024, IFLA_HSR_PRP_SF_MC_ADDR_LSB,
++				  &multicast_spec, 1);
++		} else if (hsr && matches(*argv, "version") == 0) {
++			NEXT_ARG();
++			if (!(get_u8(&protocol_version, *argv, 0) == 0 ||
++			      get_u8(&protocol_version, *argv, 0) == 1))
++				invarg("version is invalid", *argv);
++			addattr_l(n, 1024, IFLA_HSR_PRP_VERSION,
++				  &protocol_version, 1);
++		} else if (matches(*argv, "slave1") == 0) {
++			NEXT_ARG();
++			ifindex = ll_name_to_index(*argv);
++			if (ifindex == 0)
++				invarg("No such interface", *argv);
++			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE1, &ifindex, 4);
++		} else if (matches(*argv, "slave2") == 0) {
++			NEXT_ARG();
++			ifindex = ll_name_to_index(*argv);
++			if (ifindex == 0)
++				invarg("No such interface", *argv);
++			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE2, &ifindex, 4);
++		} else if (matches(*argv, "help") == 0) {
++			return -1;
++		} else {
++			if (hsr)
++				fprintf(stderr, "hsr: what is \"%s\"?\n", *argv);
++			else
++				fprintf(stderr, "prp: what is \"%s\"?\n", *argv);
++			return -1;
++		}
++		argc--, argv++;
++	}
++
++	return 0;
++}
++
++void hsr_prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
++{
++	SPRINT_BUF(b1);
++
++	if (!tb)
++		return;
++
++	if (tb[IFLA_HSR_PRP_SLAVE1] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE1]) < sizeof(__u32))
++		return;
++	if (tb[IFLA_HSR_PRP_SLAVE2] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE2]) < sizeof(__u32))
++		return;
++	if (tb[IFLA_HSR_PRP_SEQ_NR] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SEQ_NR]) < sizeof(__u16))
++		return;
++	if (tb[IFLA_HSR_PRP_SF_MC_ADDR] &&
++	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]) < ETH_ALEN)
++		return;
++
++	if (tb[IFLA_HSR_PRP_SLAVE1])
++		print_string(PRINT_ANY,
++			     "slave1",
++			     "slave1 %s ",
++			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_PRP_SLAVE1])));
++	else
++		print_null(PRINT_ANY, "slave1", "slave1 %s ", "<none>");
++
++	if (tb[IFLA_HSR_PRP_SLAVE2])
++		print_string(PRINT_ANY,
++			     "slave2",
++			     "slave2 %s ",
++			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_PRP_SLAVE2])));
++	else
++		print_null(PRINT_ANY, "slave2", "slave2 %s ", "<none>");
++
++	if (tb[IFLA_HSR_PRP_SEQ_NR])
++		print_int(PRINT_ANY,
++			  "seq_nr",
++			  "sequence %d ",
++			  rta_getattr_u16(tb[IFLA_HSR_PRP_SEQ_NR]));
++
++	if (tb[IFLA_HSR_PRP_SF_MC_ADDR])
++		print_string(PRINT_ANY,
++			     "supervision_addr",
++			     "supervision %s ",
++			     ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
++					 RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
++					 ARPHRD_VOID,
++					 b1, sizeof(b1)));
++}
+diff --git a/ip/iplink_hsr_prp_common.h b/ip/iplink_hsr_prp_common.h
+new file mode 100644
+index 0000000..a50bd7e
+--- /dev/null
++++ b/ip/iplink_hsr_prp_common.h
+@@ -0,0 +1,24 @@
++/*
++ * iplink_hsr_prp_common.h	HSR/PRP common header file
++ *
++ *		This program is free software; you can redistribute it and/or
++ *		modify it under the terms of the GNU General Public License
++ *		as published by the Free Software Foundation; either version
++ *		2 of the License, or (at your option) any later version.
++ *
++ * Authors:	Murali Karicheri <m-karicheri2@ti.com>
++ *
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
++int hsr_prp_parse_opt(bool hsr, struct link_util *lu, int argc, char **argv,
++		      struct nlmsghdr *n);
++void hsr_prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[]);
 diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
-index e25ae82d..b09528a5 100644
+index 062c1c7..eff8a0d 100644
 --- a/ip/iplink_prp.c
 +++ b/ip/iplink_prp.c
-@@ -170,15 +170,6 @@ static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 				    RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]),
- 				    ARPHRD_VOID,
- 				    b1, sizeof(b1)));
--	if (tb[IFLA_PRP_SV_VID])
--		fprintf(f, "SV_VID %d ",
--			rta_getattr_u16(tb[IFLA_PRP_SV_VID]));
--	if (tb[IFLA_PRP_SV_PCP])
--		fprintf(f, "SV_PCP %d ",
--			rta_getattr_u8(tb[IFLA_PRP_SV_PCP]));
--	if (tb[IFLA_PRP_SV_CFI])
--		fprintf(f, "SV_CFI %d ",
--			rta_getattr_u8(tb[IFLA_PRP_SV_CFI]));
+@@ -11,15 +11,7 @@
+  *		Based on iplink_hsr.c by Arvid Brodin <arvid.brodin@alten.se>
+  */
+ 
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include <sys/socket.h>  /* Needed by linux/if.h for some reason */
+-#include <linux/if.h>
+-#include <linux/if_arp.h>
+-#include "rt_names.h"
+-#include "utils.h"
+-#include "ip_common.h"
++#include "iplink_hsr_prp_common.h"
+ 
+ static void print_usage(FILE *f)
+ {
+@@ -44,92 +36,13 @@ static void usage(void)
+ static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
+ 			 struct nlmsghdr *n)
+ {
+-	int ifindex;
+-	unsigned char multicast_spec;
++	int ret;
+ 
+-	while (argc > 0) {
+-		if (matches(*argv, "supervision") == 0) {
+-			NEXT_ARG();
+-			if (get_u8(&multicast_spec, *argv, 0))
+-				invarg("ADDR-BYTE is invalid", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_PRP_SF_MC_ADDR_LSB,
+-				  &multicast_spec, 1);
+-		} else if (matches(*argv, "slave1") == 0) {
+-			NEXT_ARG();
+-			ifindex = ll_name_to_index(*argv);
+-			if (ifindex == 0)
+-				invarg("No such interface", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE1, &ifindex, 4);
+-		} else if (matches(*argv, "slave2") == 0) {
+-			NEXT_ARG();
+-			ifindex = ll_name_to_index(*argv);
+-			if (ifindex == 0)
+-				invarg("No such interface", *argv);
+-			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE2, &ifindex, 4);
+-		} else if (matches(*argv, "help") == 0) {
+-			usage();
+-			return -1;
+-		} else {
+-			fprintf(stderr, "prp: what is \"%s\"?\n", *argv);
+-			usage();
+-			return -1;
+-		}
+-		argc--, argv++;
+-	}
++	ret = hsr_prp_parse_opt(false, lu, argc, argv, n);
++	if (ret < 0)
++		usage();
+ 
+-	return 0;
+-}
+-
+-static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+-{
+-	SPRINT_BUF(b1);
+-
+-	if (!tb)
+-		return;
+-
+-	if (tb[IFLA_HSR_PRP_SLAVE1] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE1]) < sizeof(__u32))
+-		return;
+-	if (tb[IFLA_HSR_PRP_SLAVE2] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SLAVE2]) < sizeof(__u32))
+-		return;
+-	if (tb[IFLA_HSR_PRP_SEQ_NR] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SEQ_NR]) < sizeof(__u16))
+-		return;
+-	if (tb[IFLA_HSR_PRP_SF_MC_ADDR] &&
+-	    RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]) < ETH_ALEN)
+-		return;
+-
+-	if (tb[IFLA_HSR_PRP_SLAVE1])
+-		print_string(PRINT_ANY,
+-			     "slave1",
+-			     "slave1 %s ",
+-			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_PRP_SLAVE1])));
+-	else
+-		print_null(PRINT_ANY, "slave1", "slave1 %s ", "<none>");
+-
+-	if (tb[IFLA_HSR_PRP_SLAVE2])
+-		print_string(PRINT_ANY,
+-			     "slave2",
+-			     "slave2 %s ",
+-			     ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE2])));
+-	else
+-		print_null(PRINT_ANY, "slave2", "slave2 %s ", "<none>");
+-
+-	if (tb[IFLA_HSR_PRP_SEQ_NR])
+-		print_int(PRINT_ANY,
+-			  "seq_nr",
+-			  "sequence %d ",
+-			  rta_getattr_u16(tb[IFLA_HSR_PRP_SEQ_NR]));
+-
+-	if (tb[IFLA_HSR_PRP_SF_MC_ADDR])
+-		print_string(PRINT_ANY,
+-			     "supervision_addr",
+-			     "supervision %s ",
+-			     ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
+-					 RTA_PAYLOAD(tb[IFLA_HSR_PRP_SF_MC_ADDR]),
+-					 ARPHRD_VOID,
+-					 b1, sizeof(b1)));
++	return ret;
  }
  
  static void prp_print_help(struct link_util *lu, int argc, char **argv,
+@@ -142,6 +55,6 @@ struct link_util prp_link_util = {
+ 	.id		= "prp",
+ 	.maxattr	= IFLA_HSR_PRP_MAX,
+ 	.parse_opt	= prp_parse_opt,
+-	.print_opt	= prp_print_opt,
++	.print_opt	= hsr_prp_print_opt,
+ 	.print_help	= prp_print_help,
+ };
 -- 
-2.17.0
-
+2.7.4
 
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0004-hsr-prp-add-support-for-vlan-tagged-supervision-fram.patch
similarity index 23%
rename from meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch
rename to meta-arago-distro/recipes-connectivity/iproute2/iproute2/0004-hsr-prp-add-support-for-vlan-tagged-supervision-fram.patch
index 93a21b6..9757645 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0004-hsr-prp-add-support-for-vlan-tagged-supervision-fram.patch
@@ -1,12 +1,12 @@
-From 9cb64f217a6c7c4720c0dd408ce71874a04252da Mon Sep 17 00:00:00 2001
+From 87877ac34fd4656dd61e3f8d4b37fa458cf7015a Mon Sep 17 00:00:00 2001
 From: Murali Karicheri <m-karicheri2@ti.com>
-Date: Wed, 12 Sep 2018 14:30:13 -0400
-Subject: [PATCH] hsr/prp: add support for vlan tagged sv frames
+Date: Fri, 17 May 2019 17:06:29 -0400
+Subject: [PATCH 4/4] hsr/prp: add support for vlan tagged supervision frames
 
 This patch adds support to configure vlan tag information
-(vid, pcp and cfi) at the hsr/prp lre device. This tag values
+(vid, pcp and dei) at the hsr/prp lre device. This tag values
 will be used by the lre device to generate a VLAN tagged
-SV frames. This is done by adding 3 additional attributes
+Supervision frames. This is done by adding 3 additional attributes
 to the hsr/prp link type and passing this to Linux HSR/PRP
 device through the ip link command.
 
@@ -14,40 +14,31 @@ Upstream-Status: Pending
 
 Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
 ---
- include/linux/if_link.h |   6 +++
- ip/iplink_hsr.c         |  60 +++++++++++++++++++++++++++-
- ip/iplink_prp.c         | 101 +++++++++++++++++++++++++++++++++++++-----------
- 3 files changed, 142 insertions(+), 25 deletions(-)
+ include/uapi/linux/if_link.h |  3 +++
+ ip/iplink_hsr.c              | 13 +++++++++++--
+ ip/iplink_hsr_prp_common.c   | 28 ++++++++++++++++++++++++++++
+ ip/iplink_prp.c              | 15 ++++++++++++---
+ 4 files changed, 54 insertions(+), 5 deletions(-)
 
-diff --git a/include/linux/if_link.h b/include/linux/if_link.h
-index 6b9b59b..233b7dc 100644
---- a/include/linux/if_link.h
-+++ b/include/linux/if_link.h
-@@ -818,6 +818,9 @@ enum {
- 	IFLA_HSR_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
- 	IFLA_HSR_SEQ_NR,
- 	IFLA_HSR_VERSION,		/* HSR version */
-+	IFLA_HSR_SV_VID,
-+	IFLA_HSR_SV_CFI,
-+	IFLA_HSR_SV_PCP,
- 	__IFLA_HSR_MAX,
+diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
+index ba78aaf..9b02642 100644
+--- a/include/uapi/linux/if_link.h
++++ b/include/uapi/linux/if_link.h
+@@ -1004,6 +1004,9 @@ enum {
+ 	IFLA_HSR_PRP_SF_MC_ADDR,	/* Supervision frame multicast addr */
+ 	IFLA_HSR_PRP_SEQ_NR,
+ 	IFLA_HSR_PRP_VERSION,		/* HSR version */
++	IFLA_HSR_PRP_SV_VID,
++	IFLA_HSR_PRP_SV_DEI,
++	IFLA_HSR_PRP_SV_PCP,
+ 	__IFLA_HSR_PRP_MAX,
  };
- #define IFLA_HSR_MAX (__IFLA_HSR_MAX - 1)
-@@ -887,6 +890,9 @@ enum {
- 	IFLA_PRP_MULTICAST_SPEC,	/* Last byte of supervision addr */
- 	IFLA_PRP_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
- 	IFLA_PRP_SEQ_NR,
-+	IFLA_PRP_SV_VID,
-+	IFLA_PRP_SV_CFI,
-+	IFLA_PRP_SV_PCP,
- 	__IFLA_PRP_MAX,
- };
- #define IFLA_PRP_MAX (__IFLA_PRP_MAX - 1)
+ 
 diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
-index 696b2c9..2153494 100644
+index 2e83af0..0190e12 100644
 --- a/ip/iplink_hsr.c
 +++ b/ip/iplink_hsr.c
-@@ -25,7 +25,8 @@ static void print_usage(FILE *f)
+@@ -17,7 +17,8 @@ static void print_usage(FILE *f)
  {
  	fprintf(f,
  "Usage:\tip link add name NAME type hsr slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
@@ -57,37 +48,41 @@ index 696b2c9..2153494 100644
  "\n"
  "NAME\n"
  "	name of new hsr device (e.g. hsr0)\n"
-@@ -35,7 +36,15 @@ static void print_usage(FILE *f)
+@@ -27,7 +28,15 @@ static void print_usage(FILE *f)
  "	0-255; the last byte of the multicast address used for HSR supervision\n"
  "	frames (default = 0)\n"
  "VERSION\n"
 -"	0,1; the protocol version to be used. (default = 0)\n");
-+"	0,1; the protocol version to be used. (default = 0)\n"
++"      0,1; the protocol version to be used. (default = 0)\n"
 +"SV-VID\n"
-+"	0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
++"      0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
 +"SV-PCP\n"
-+"	0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
++"      0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
 +"SV-CFI\n"
-+"	0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
++"      0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
 +"Use VLAN tag if one of sv_vid, sv_pcp or sv_cfi is specified. Default value\n"
 +"used for unspecified ones\n");
  }
  
  static void usage(void)
-@@ -49,6 +58,9 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+diff --git a/ip/iplink_hsr_prp_common.c b/ip/iplink_hsr_prp_common.c
+index 780c1cb..734cc56 100644
+--- a/ip/iplink_hsr_prp_common.c
++++ b/ip/iplink_hsr_prp_common.c
+@@ -19,6 +19,9 @@ int hsr_prp_parse_opt(bool hsr, struct link_util *lu, int argc, char **argv,
  	int ifindex;
  	unsigned char multicast_spec;
  	unsigned char protocol_version;
 +	unsigned short sv_vid;
-+	unsigned char sv_cfi;
++	unsigned char sv_dei;
 +	unsigned char sv_pcp;
  
  	while (argc > 0) {
  		if (matches(*argv, "supervision") == 0) {
-@@ -76,6 +88,31 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+@@ -46,6 +49,31 @@ int hsr_prp_parse_opt(bool hsr, struct link_util *lu, int argc, char **argv,
  			if (ifindex == 0)
  				invarg("No such interface", *argv);
- 			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
+ 			addattr_l(n, 1024, IFLA_HSR_PRP_SLAVE2, &ifindex, 4);
 +		} else if (matches(*argv, "sv_vid") == 0) {
 +			NEXT_ARG();
 +			if (get_u16(&sv_vid, *argv, 0))
@@ -95,72 +90,32 @@ index 696b2c9..2153494 100644
 +			/* exclude reserved 4095 */
 +			if (sv_vid >= 4095)
 +				invarg("SV-VID is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_HSR_SV_VID,
++			addattr_l(n, 1024, IFLA_HSR_PRP_SV_VID,
 +				  &sv_vid, sizeof(sv_vid));
 +		} else if (matches(*argv, "sv_pcp") == 0) {
 +			NEXT_ARG();
-+		        if (get_u8(&sv_pcp, *argv, 0))
++			if (get_u8(&sv_pcp, *argv, 0))
 +				invarg("SV-PCP is invalid", *argv);
 +			if (sv_pcp > 7)
 +				invarg("SV-PCP is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_HSR_SV_PCP,
++			addattr_l(n, 1024, IFLA_HSR_PRP_SV_PCP,
 +				  &sv_pcp, sizeof(sv_pcp));
-+		} else if (matches(*argv, "sv_cfi") == 0) {
++		} else if (matches(*argv, "sv_dei") == 0) {
 +			NEXT_ARG();
-+			if (get_u8(&sv_cfi, *argv, 0))
-+				invarg("SV-CFI is invalid", *argv);
-+			if (sv_cfi > 1)
-+				invarg("SV-CFI is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_HSR_SV_CFI,
-+				  &sv_cfi, sizeof(sv_cfi));
++			if (get_u8(&sv_dei, *argv, 0))
++				invarg("SV-DEI is invalid", *argv);
++			if (sv_dei > 1)
++				invarg("SV-DEI is invalid", *argv);
++			addattr_l(n, 1024, IFLA_HSR_PRP_SV_DEI,
++				  &sv_dei, sizeof(sv_dei));
  		} else if (matches(*argv, "help") == 0) {
- 			usage();
  			return -1;
-@@ -97,6 +134,7 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 	if (!tb)
- 		return;
- 
-+	printf("%s\n", __func__);
- 	if (tb[IFLA_HSR_SLAVE1] &&
- 	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
- 		return;
-@@ -109,6 +147,15 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 	if (tb[IFLA_HSR_SUPERVISION_ADDR] &&
- 	    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]) < ETH_ALEN)
- 		return;
-+	if (tb[IFLA_HSR_SV_VID] &&
-+	    RTA_PAYLOAD(tb[IFLA_HSR_SV_VID]) < sizeof(__u16))
-+		return;
-+	if (tb[IFLA_HSR_SV_PCP] &&
-+	    RTA_PAYLOAD(tb[IFLA_HSR_SV_PCP]) < sizeof(__u8))
-+		return;
-+	if (tb[IFLA_HSR_SV_CFI] &&
-+	    RTA_PAYLOAD(tb[IFLA_HSR_SV_CFI]) < sizeof(__u8))
-+		return;
- 
- 	fprintf(f, "slave1 ");
- 	if (tb[IFLA_HSR_SLAVE1])
-@@ -134,6 +181,15 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 				    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
- 				    ARPHRD_VOID,
- 				    b1, sizeof(b1)));
-+	if (tb[IFLA_HSR_SV_VID])
-+		fprintf(f, "SV_VID %d ",
-+			rta_getattr_u16(tb[IFLA_HSR_SV_VID]));
-+	if (tb[IFLA_HSR_SV_PCP])
-+		fprintf(f, "SV_PCP %d ",
-+			rta_getattr_u8(tb[IFLA_HSR_SV_PCP]));
-+	if (tb[IFLA_HSR_SV_CFI])
-+		fprintf(f, "SV_CFI %d ",
-+			rta_getattr_u8(tb[IFLA_HSR_SV_CFI]));
- }
- 
- static void hsr_print_help(struct link_util *lu, int argc, char **argv,
+ 		} else {
 diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
-index c1e5a3b..e25ae82 100644
+index eff8a0d..52c4cf6 100644
 --- a/ip/iplink_prp.c
 +++ b/ip/iplink_prp.c
-@@ -25,15 +25,24 @@ static void print_usage(FILE *f)
+@@ -17,15 +17,24 @@ static void print_usage(FILE *f)
  {
  	fprintf(f,
  "Usage:\tip link add name NAME type prp slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
@@ -173,158 +128,21 @@ index c1e5a3b..e25ae82 100644
  "SLAVE1-IF, SLAVE2-IF\n"
  "	the two slave devices bound to the PRP device\n"
  "ADDR-BYTE\n"
--"	0-255; the last byte of the multicast address used for HSR supervision\n"
+-"	0-255; the last byte of the multicast address used for PRP supervision\n"
 -"	frames (default = 0)\n");
-+"	0-255; the last byte of the multicast address used for PRP supervision\n"
-+"	frames (default = 0) \n"
++"      0-255; the last byte of the multicast address used for PRP supervision\n"
++"      frames (default = 0) \n"
 +"SV-VID\n"
-+"	0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
++"      0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
 +"SV-PCP\n"
-+"	0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
++"      0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
 +"SV-CFI\n"
-+"	0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
++"      0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
 +"Use VLAN tag if one of sv_vid, sv_pcp or sv_cfi is specified. Default value\n"
 +"used for unspecified ones\n");
  }
  
  static void usage(void)
-@@ -46,26 +55,54 @@ static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
- {
- 	int ifindex;
- 	unsigned char multicast_spec;
-+	unsigned short sv_vid;
-+	unsigned char sv_cfi;
-+	unsigned char sv_pcp;
- 
- 	while (argc > 0) {
- 		if (matches(*argv, "supervision") == 0) {
- 			NEXT_ARG();
- 			if (get_u8(&multicast_spec, *argv, 0))
- 				invarg("ADDR-BYTE is invalid", *argv);
--			addattr_l(n, 1024, IFLA_HSR_MULTICAST_SPEC,
-+			addattr_l(n, 1024, IFLA_PRP_MULTICAST_SPEC,
- 				  &multicast_spec, 1);
- 		} else if (matches(*argv, "slave1") == 0) {
- 			NEXT_ARG();
- 			ifindex = ll_name_to_index(*argv);
- 			if (ifindex == 0)
- 				invarg("No such interface", *argv);
--			addattr_l(n, 1024, IFLA_HSR_SLAVE1, &ifindex, 4);
-+			addattr_l(n, 1024, IFLA_PRP_SLAVE1, &ifindex, 4);
- 		} else if (matches(*argv, "slave2") == 0) {
- 			NEXT_ARG();
- 			ifindex = ll_name_to_index(*argv);
- 			if (ifindex == 0)
- 				invarg("No such interface", *argv);
--			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
-+			addattr_l(n, 1024, IFLA_PRP_SLAVE2, &ifindex, 4);
-+		} else if (matches(*argv, "sv_vid") == 0) {
-+			NEXT_ARG();
-+			if (get_u16(&sv_vid, *argv, 0))
-+				invarg("SV-VID is invalid", *argv);
-+			/* exclude reserved 4095 */
-+			if (sv_vid >= 4095)
-+				invarg("SV-VID is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_PRP_SV_VID,
-+				  &sv_vid, sizeof(sv_vid));
-+		} else if (matches(*argv, "sv_pcp") == 0) {
-+			NEXT_ARG();
-+		        if (get_u8(&sv_pcp, *argv, 0))
-+				invarg("SV-PCP is invalid", *argv);
-+			if (sv_pcp > 7)
-+				invarg("SV-PCP is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_PRP_SV_PCP,
-+				  &sv_pcp, sizeof(sv_pcp));
-+		} else if (matches(*argv, "sv_cfi") == 0) {
-+			NEXT_ARG();
-+			if (get_u8(&sv_cfi, *argv, 0))
-+				   invarg("SV-CFI is invalid", *argv);
-+			if (sv_cfi > 1)
-+				   invarg("SV-CFI is invalid", *argv);
-+			addattr_l(n, 1024, IFLA_PRP_SV_CFI,
-+				  &sv_cfi, sizeof(sv_cfi));
- 		} else if (matches(*argv, "help") == 0) {
- 			usage();
- 			return -1;
-@@ -87,43 +124,61 @@ static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
- 	if (!tb)
- 		return;
- 
--	if (tb[IFLA_HSR_SLAVE1] &&
--	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
-+	if (tb[IFLA_PRP_SLAVE1] &&
-+	    RTA_PAYLOAD(tb[IFLA_PRP_SLAVE1]) < sizeof(__u32))
-+		return;
-+	if (tb[IFLA_PRP_SLAVE2] &&
-+	    RTA_PAYLOAD(tb[IFLA_PRP_SLAVE2]) < sizeof(__u32))
-+		return;
-+	if (tb[IFLA_PRP_SEQ_NR] &&
-+	    RTA_PAYLOAD(tb[IFLA_PRP_SEQ_NR]) < sizeof(__u16))
-+		return;
-+	if (tb[IFLA_PRP_SUPERVISION_ADDR] &&
-+	    RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]) < ETH_ALEN)
- 		return;
--	if (tb[IFLA_HSR_SLAVE2] &&
--	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE2]) < sizeof(__u32))
-+	if (tb[IFLA_PRP_SV_VID] &&
-+	    RTA_PAYLOAD(tb[IFLA_PRP_SV_VID]) < sizeof(__u16))
- 		return;
--	if (tb[IFLA_HSR_SEQ_NR] &&
--	    RTA_PAYLOAD(tb[IFLA_HSR_SEQ_NR]) < sizeof(__u16))
-+	if (tb[IFLA_PRP_SV_PCP] &&
-+	    RTA_PAYLOAD(tb[IFLA_PRP_SV_PCP]) < sizeof(__u8))
- 		return;
--	if (tb[IFLA_HSR_SUPERVISION_ADDR] &&
--	    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]) < ETH_ALEN)
-+	if (tb[IFLA_PRP_SV_CFI] &&
-+	    RTA_PAYLOAD(tb[IFLA_PRP_SV_CFI]) < sizeof(__u8))
- 		return;
- 
- 	fprintf(f, "slave1 ");
--	if (tb[IFLA_HSR_SLAVE1])
-+	if (tb[IFLA_PRP_SLAVE1])
- 		fprintf(f, "%s ",
--			ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE1])));
-+			ll_index_to_name(rta_getattr_u32(tb[IFLA_PRP_SLAVE1])));
- 	else
- 		fprintf(f, "<none> ");
- 
- 	fprintf(f, "slave2 ");
--	if (tb[IFLA_HSR_SLAVE2])
-+	if (tb[IFLA_PRP_SLAVE2])
- 		fprintf(f, "%s ",
--			ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE2])));
-+			ll_index_to_name(rta_getattr_u32(tb[IFLA_PRP_SLAVE2])));
- 	else
- 		fprintf(f, "<none> ");
- 
--	if (tb[IFLA_HSR_SEQ_NR])
-+	if (tb[IFLA_PRP_SEQ_NR])
- 		fprintf(f, "sequence %d ",
--			rta_getattr_u16(tb[IFLA_HSR_SEQ_NR]));
-+			rta_getattr_u16(tb[IFLA_PRP_SEQ_NR]));
- 
--	if (tb[IFLA_HSR_SUPERVISION_ADDR])
-+	if (tb[IFLA_PRP_SUPERVISION_ADDR])
- 		fprintf(f, "supervision %s ",
--			ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_SUPERVISION_ADDR]),
--				    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
-+			ll_addr_n2a(RTA_DATA(tb[IFLA_PRP_SUPERVISION_ADDR]),
-+				    RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]),
- 				    ARPHRD_VOID,
- 				    b1, sizeof(b1)));
-+	if (tb[IFLA_PRP_SV_VID])
-+		fprintf(f, "SV_VID %d ",
-+			rta_getattr_u16(tb[IFLA_PRP_SV_VID]));
-+	if (tb[IFLA_PRP_SV_PCP])
-+		fprintf(f, "SV_PCP %d ",
-+			rta_getattr_u8(tb[IFLA_PRP_SV_PCP]));
-+	if (tb[IFLA_PRP_SV_CFI])
-+		fprintf(f, "SV_CFI %d ",
-+			rta_getattr_u8(tb[IFLA_PRP_SV_CFI]));
- }
- 
- static void prp_print_help(struct link_util *lu, int argc, char **argv,
 -- 
 2.7.4
 
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend
index a921274..2100f49 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend
@@ -1,12 +1,10 @@
-PR_append = ".arago4"
+PR_append = ".arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-#SRC_URI_append = " \
-#           file://0001-add-support-for-prp-similar-to-hsr.patch \
-#           file://0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch \
-#           file://0001-hsr-prp-remove-the-debug-print-from-the-code.patch \
-#           file://0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch \
-#           file://0002-prp-invalid-maxattr.patch \
-#           file://0001-hsr-prp-replace-cfi-use-in-code-with-dei.patch \
-#          "
+SRC_URI_append = " \
+    file://0001-add-support-for-prp-similar-to-hsr.patch \
+    file://0002-hsr-prp-introduce-common-definitions-for-netlink-int.patch \
+    file://0003-hsr-prp-refactor-common-code.patch \
+    file://0004-hsr-prp-add-support-for-vlan-tagged-supervision-fram.patch \
+"
-- 
2.7.4


