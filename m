Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EAE5C52094
	for <meta-arago@arago-project.org>;
	Fri, 21 Sep 2018 17:37:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8LHbRGA108738
	for <meta-arago@arago-project.org>; Fri, 21 Sep 2018 12:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537551447;
	bh=ukjBMN4bsPiBUUrIEKgrjZqd4sNxmDxs+dB5aM1q6OI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mVCKmWd5jR66UotZv56PlBU25FbQaanhr7/cOCv+7eg0VjkT41hZAQteu1SQL13cj
	jPH6dRBuHcydZzst3pgeHyo0I47ctO9ImltUXlb+BgQWEdAjcsYGxR8s3uQ74+xMVQ
	lbptFdIXGYTWXkI49LG1zS4IF5jG8sfENAPhxWWQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8LHbRj0007627
	for <meta-arago@arago-project.org>; Fri, 21 Sep 2018 12:37:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 21 Sep 2018 12:37:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 21 Sep 2018 12:37:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8LHbQxf010779;
	Fri, 21 Sep 2018 12:37:27 -0500
Date: Fri, 21 Sep 2018 13:36:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180921173609.GA18392@beryl>
References: <1537460792-23185-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1537460792-23185-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master][PATCH] iproute2: hsr/prp: add support for vlan tagged sv frames
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
X-List-Received-Date: Fri, 21 Sep 2018 17:37:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

FYI, I also merged the patch to master, but it's currently disabled, as master 
has 4.17 version.


On Thu, Sep 20, 2018 at 12:26:32PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  ...prp-add-support-for-vlan-tagged-sv-frames.patch | 330 +++++++++++++++++++++
>  .../iproute2/iproute2_4.11.0.bbappend              |   3 +-
>  2 files changed, 332 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch
> 
> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch
> new file mode 100644
> index 0000000..93a21b6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch
> @@ -0,0 +1,330 @@
> +From 9cb64f217a6c7c4720c0dd408ce71874a04252da Mon Sep 17 00:00:00 2001
> +From: Murali Karicheri <m-karicheri2@ti.com>
> +Date: Wed, 12 Sep 2018 14:30:13 -0400
> +Subject: [PATCH] hsr/prp: add support for vlan tagged sv frames
> +
> +This patch adds support to configure vlan tag information
> +(vid, pcp and cfi) at the hsr/prp lre device. This tag values
> +will be used by the lre device to generate a VLAN tagged
> +SV frames. This is done by adding 3 additional attributes
> +to the hsr/prp link type and passing this to Linux HSR/PRP
> +device through the ip link command.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> +---
> + include/linux/if_link.h |   6 +++
> + ip/iplink_hsr.c         |  60 +++++++++++++++++++++++++++-
> + ip/iplink_prp.c         | 101 +++++++++++++++++++++++++++++++++++++-----------
> + 3 files changed, 142 insertions(+), 25 deletions(-)
> +
> +diff --git a/include/linux/if_link.h b/include/linux/if_link.h
> +index 6b9b59b..233b7dc 100644
> +--- a/include/linux/if_link.h
> ++++ b/include/linux/if_link.h
> +@@ -818,6 +818,9 @@ enum {
> + 	IFLA_HSR_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
> + 	IFLA_HSR_SEQ_NR,
> + 	IFLA_HSR_VERSION,		/* HSR version */
> ++	IFLA_HSR_SV_VID,
> ++	IFLA_HSR_SV_CFI,
> ++	IFLA_HSR_SV_PCP,
> + 	__IFLA_HSR_MAX,
> + };
> + #define IFLA_HSR_MAX (__IFLA_HSR_MAX - 1)
> +@@ -887,6 +890,9 @@ enum {
> + 	IFLA_PRP_MULTICAST_SPEC,	/* Last byte of supervision addr */
> + 	IFLA_PRP_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
> + 	IFLA_PRP_SEQ_NR,
> ++	IFLA_PRP_SV_VID,
> ++	IFLA_PRP_SV_CFI,
> ++	IFLA_PRP_SV_PCP,
> + 	__IFLA_PRP_MAX,
> + };
> + #define IFLA_PRP_MAX (__IFLA_PRP_MAX - 1)
> +diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
> +index 696b2c9..2153494 100644
> +--- a/ip/iplink_hsr.c
> ++++ b/ip/iplink_hsr.c
> +@@ -25,7 +25,8 @@ static void print_usage(FILE *f)
> + {
> + 	fprintf(f,
> + "Usage:\tip link add name NAME type hsr slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
> +-"\t[ supervision ADDR-BYTE ] [version VERSION]\n"
> ++"\t[ supervision ADDR-BYTE ] [version VERSION] [ sv_vid SV-VID ] \n"
> ++"\t[ sv_pcp SV-PCP ] [ sv_cfi SV-CFI ] \n"
> + "\n"
> + "NAME\n"
> + "	name of new hsr device (e.g. hsr0)\n"
> +@@ -35,7 +36,15 @@ static void print_usage(FILE *f)
> + "	0-255; the last byte of the multicast address used for HSR supervision\n"
> + "	frames (default = 0)\n"
> + "VERSION\n"
> +-"	0,1; the protocol version to be used. (default = 0)\n");
> ++"	0,1; the protocol version to be used. (default = 0)\n"
> ++"SV-VID\n"
> ++"	0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
> ++"SV-PCP\n"
> ++"	0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
> ++"SV-CFI\n"
> ++"	0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
> ++"Use VLAN tag if one of sv_vid, sv_pcp or sv_cfi is specified. Default value\n"
> ++"used for unspecified ones\n");
> + }
> + 
> + static void usage(void)
> +@@ -49,6 +58,9 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
> + 	int ifindex;
> + 	unsigned char multicast_spec;
> + 	unsigned char protocol_version;
> ++	unsigned short sv_vid;
> ++	unsigned char sv_cfi;
> ++	unsigned char sv_pcp;
> + 
> + 	while (argc > 0) {
> + 		if (matches(*argv, "supervision") == 0) {
> +@@ -76,6 +88,31 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
> + 			if (ifindex == 0)
> + 				invarg("No such interface", *argv);
> + 			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
> ++		} else if (matches(*argv, "sv_vid") == 0) {
> ++			NEXT_ARG();
> ++			if (get_u16(&sv_vid, *argv, 0))
> ++				invarg("SV-VID is invalid", *argv);
> ++			/* exclude reserved 4095 */
> ++			if (sv_vid >= 4095)
> ++				invarg("SV-VID is invalid", *argv);
> ++			addattr_l(n, 1024, IFLA_HSR_SV_VID,
> ++				  &sv_vid, sizeof(sv_vid));
> ++		} else if (matches(*argv, "sv_pcp") == 0) {
> ++			NEXT_ARG();
> ++		        if (get_u8(&sv_pcp, *argv, 0))
> ++				invarg("SV-PCP is invalid", *argv);
> ++			if (sv_pcp > 7)
> ++				invarg("SV-PCP is invalid", *argv);
> ++			addattr_l(n, 1024, IFLA_HSR_SV_PCP,
> ++				  &sv_pcp, sizeof(sv_pcp));
> ++		} else if (matches(*argv, "sv_cfi") == 0) {
> ++			NEXT_ARG();
> ++			if (get_u8(&sv_cfi, *argv, 0))
> ++				invarg("SV-CFI is invalid", *argv);
> ++			if (sv_cfi > 1)
> ++				invarg("SV-CFI is invalid", *argv);
> ++			addattr_l(n, 1024, IFLA_HSR_SV_CFI,
> ++				  &sv_cfi, sizeof(sv_cfi));
> + 		} else if (matches(*argv, "help") == 0) {
> + 			usage();
> + 			return -1;
> +@@ -97,6 +134,7 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
> + 	if (!tb)
> + 		return;
> + 
> ++	printf("%s\n", __func__);
> + 	if (tb[IFLA_HSR_SLAVE1] &&
> + 	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
> + 		return;
> +@@ -109,6 +147,15 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
> + 	if (tb[IFLA_HSR_SUPERVISION_ADDR] &&
> + 	    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]) < ETH_ALEN)
> + 		return;
> ++	if (tb[IFLA_HSR_SV_VID] &&
> ++	    RTA_PAYLOAD(tb[IFLA_HSR_SV_VID]) < sizeof(__u16))
> ++		return;
> ++	if (tb[IFLA_HSR_SV_PCP] &&
> ++	    RTA_PAYLOAD(tb[IFLA_HSR_SV_PCP]) < sizeof(__u8))
> ++		return;
> ++	if (tb[IFLA_HSR_SV_CFI] &&
> ++	    RTA_PAYLOAD(tb[IFLA_HSR_SV_CFI]) < sizeof(__u8))
> ++		return;
> + 
> + 	fprintf(f, "slave1 ");
> + 	if (tb[IFLA_HSR_SLAVE1])
> +@@ -134,6 +181,15 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
> + 				    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
> + 				    ARPHRD_VOID,
> + 				    b1, sizeof(b1)));
> ++	if (tb[IFLA_HSR_SV_VID])
> ++		fprintf(f, "SV_VID %d ",
> ++			rta_getattr_u16(tb[IFLA_HSR_SV_VID]));
> ++	if (tb[IFLA_HSR_SV_PCP])
> ++		fprintf(f, "SV_PCP %d ",
> ++			rta_getattr_u8(tb[IFLA_HSR_SV_PCP]));
> ++	if (tb[IFLA_HSR_SV_CFI])
> ++		fprintf(f, "SV_CFI %d ",
> ++			rta_getattr_u8(tb[IFLA_HSR_SV_CFI]));
> + }
> + 
> + static void hsr_print_help(struct link_util *lu, int argc, char **argv,
> +diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
> +index c1e5a3b..e25ae82 100644
> +--- a/ip/iplink_prp.c
> ++++ b/ip/iplink_prp.c
> +@@ -25,15 +25,24 @@ static void print_usage(FILE *f)
> + {
> + 	fprintf(f,
> + "Usage:\tip link add name NAME type prp slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
> +-"\t[ supervision ADDR-BYTE ]\n"
> ++"\t[ supervision ADDR-BYTE ] [ sv_vid SV-VID ] [ sv_pcp SV-PCP ] \n"
> ++"\t [ sv_cfi SV-CFI ] \n"
> + "\n"
> + "NAME\n"
> + "	name of new prp device (e.g. prp0)\n"
> + "SLAVE1-IF, SLAVE2-IF\n"
> + "	the two slave devices bound to the PRP device\n"
> + "ADDR-BYTE\n"
> +-"	0-255; the last byte of the multicast address used for HSR supervision\n"
> +-"	frames (default = 0)\n");
> ++"	0-255; the last byte of the multicast address used for PRP supervision\n"
> ++"	frames (default = 0) \n"
> ++"SV-VID\n"
> ++"	0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
> ++"SV-PCP\n"
> ++"	0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
> ++"SV-CFI\n"
> ++"	0-1; CFI value to be used in the VLAN tag of SV frames (default 0)\n"
> ++"Use VLAN tag if one of sv_vid, sv_pcp or sv_cfi is specified. Default value\n"
> ++"used for unspecified ones\n");
> + }
> + 
> + static void usage(void)
> +@@ -46,26 +55,54 @@ static int prp_parse_opt(struct link_util *lu, int argc, char **argv,
> + {
> + 	int ifindex;
> + 	unsigned char multicast_spec;
> ++	unsigned short sv_vid;
> ++	unsigned char sv_cfi;
> ++	unsigned char sv_pcp;
> + 
> + 	while (argc > 0) {
> + 		if (matches(*argv, "supervision") == 0) {
> + 			NEXT_ARG();
> + 			if (get_u8(&multicast_spec, *argv, 0))
> + 				invarg("ADDR-BYTE is invalid", *argv);
> +-			addattr_l(n, 1024, IFLA_HSR_MULTICAST_SPEC,
> ++			addattr_l(n, 1024, IFLA_PRP_MULTICAST_SPEC,
> + 				  &multicast_spec, 1);
> + 		} else if (matches(*argv, "slave1") == 0) {
> + 			NEXT_ARG();
> + 			ifindex = ll_name_to_index(*argv);
> + 			if (ifindex == 0)
> + 				invarg("No such interface", *argv);
> +-			addattr_l(n, 1024, IFLA_HSR_SLAVE1, &ifindex, 4);
> ++			addattr_l(n, 1024, IFLA_PRP_SLAVE1, &ifindex, 4);
> + 		} else if (matches(*argv, "slave2") == 0) {
> + 			NEXT_ARG();
> + 			ifindex = ll_name_to_index(*argv);
> + 			if (ifindex == 0)
> + 				invarg("No such interface", *argv);
> +-			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
> ++			addattr_l(n, 1024, IFLA_PRP_SLAVE2, &ifindex, 4);
> ++		} else if (matches(*argv, "sv_vid") == 0) {
> ++			NEXT_ARG();
> ++			if (get_u16(&sv_vid, *argv, 0))
> ++				invarg("SV-VID is invalid", *argv);
> ++			/* exclude reserved 4095 */
> ++			if (sv_vid >= 4095)
> ++				invarg("SV-VID is invalid", *argv);
> ++			addattr_l(n, 1024, IFLA_PRP_SV_VID,
> ++				  &sv_vid, sizeof(sv_vid));
> ++		} else if (matches(*argv, "sv_pcp") == 0) {
> ++			NEXT_ARG();
> ++		        if (get_u8(&sv_pcp, *argv, 0))
> ++				invarg("SV-PCP is invalid", *argv);
> ++			if (sv_pcp > 7)
> ++				invarg("SV-PCP is invalid", *argv);
> ++			addattr_l(n, 1024, IFLA_PRP_SV_PCP,
> ++				  &sv_pcp, sizeof(sv_pcp));
> ++		} else if (matches(*argv, "sv_cfi") == 0) {
> ++			NEXT_ARG();
> ++			if (get_u8(&sv_cfi, *argv, 0))
> ++				   invarg("SV-CFI is invalid", *argv);
> ++			if (sv_cfi > 1)
> ++				   invarg("SV-CFI is invalid", *argv);
> ++			addattr_l(n, 1024, IFLA_PRP_SV_CFI,
> ++				  &sv_cfi, sizeof(sv_cfi));
> + 		} else if (matches(*argv, "help") == 0) {
> + 			usage();
> + 			return -1;
> +@@ -87,43 +124,61 @@ static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
> + 	if (!tb)
> + 		return;
> + 
> +-	if (tb[IFLA_HSR_SLAVE1] &&
> +-	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
> ++	if (tb[IFLA_PRP_SLAVE1] &&
> ++	    RTA_PAYLOAD(tb[IFLA_PRP_SLAVE1]) < sizeof(__u32))
> ++		return;
> ++	if (tb[IFLA_PRP_SLAVE2] &&
> ++	    RTA_PAYLOAD(tb[IFLA_PRP_SLAVE2]) < sizeof(__u32))
> ++		return;
> ++	if (tb[IFLA_PRP_SEQ_NR] &&
> ++	    RTA_PAYLOAD(tb[IFLA_PRP_SEQ_NR]) < sizeof(__u16))
> ++		return;
> ++	if (tb[IFLA_PRP_SUPERVISION_ADDR] &&
> ++	    RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]) < ETH_ALEN)
> + 		return;
> +-	if (tb[IFLA_HSR_SLAVE2] &&
> +-	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE2]) < sizeof(__u32))
> ++	if (tb[IFLA_PRP_SV_VID] &&
> ++	    RTA_PAYLOAD(tb[IFLA_PRP_SV_VID]) < sizeof(__u16))
> + 		return;
> +-	if (tb[IFLA_HSR_SEQ_NR] &&
> +-	    RTA_PAYLOAD(tb[IFLA_HSR_SEQ_NR]) < sizeof(__u16))
> ++	if (tb[IFLA_PRP_SV_PCP] &&
> ++	    RTA_PAYLOAD(tb[IFLA_PRP_SV_PCP]) < sizeof(__u8))
> + 		return;
> +-	if (tb[IFLA_HSR_SUPERVISION_ADDR] &&
> +-	    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]) < ETH_ALEN)
> ++	if (tb[IFLA_PRP_SV_CFI] &&
> ++	    RTA_PAYLOAD(tb[IFLA_PRP_SV_CFI]) < sizeof(__u8))
> + 		return;
> + 
> + 	fprintf(f, "slave1 ");
> +-	if (tb[IFLA_HSR_SLAVE1])
> ++	if (tb[IFLA_PRP_SLAVE1])
> + 		fprintf(f, "%s ",
> +-			ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE1])));
> ++			ll_index_to_name(rta_getattr_u32(tb[IFLA_PRP_SLAVE1])));
> + 	else
> + 		fprintf(f, "<none> ");
> + 
> + 	fprintf(f, "slave2 ");
> +-	if (tb[IFLA_HSR_SLAVE2])
> ++	if (tb[IFLA_PRP_SLAVE2])
> + 		fprintf(f, "%s ",
> +-			ll_index_to_name(rta_getattr_u32(tb[IFLA_HSR_SLAVE2])));
> ++			ll_index_to_name(rta_getattr_u32(tb[IFLA_PRP_SLAVE2])));
> + 	else
> + 		fprintf(f, "<none> ");
> + 
> +-	if (tb[IFLA_HSR_SEQ_NR])
> ++	if (tb[IFLA_PRP_SEQ_NR])
> + 		fprintf(f, "sequence %d ",
> +-			rta_getattr_u16(tb[IFLA_HSR_SEQ_NR]));
> ++			rta_getattr_u16(tb[IFLA_PRP_SEQ_NR]));
> + 
> +-	if (tb[IFLA_HSR_SUPERVISION_ADDR])
> ++	if (tb[IFLA_PRP_SUPERVISION_ADDR])
> + 		fprintf(f, "supervision %s ",
> +-			ll_addr_n2a(RTA_DATA(tb[IFLA_HSR_SUPERVISION_ADDR]),
> +-				    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
> ++			ll_addr_n2a(RTA_DATA(tb[IFLA_PRP_SUPERVISION_ADDR]),
> ++				    RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]),
> + 				    ARPHRD_VOID,
> + 				    b1, sizeof(b1)));
> ++	if (tb[IFLA_PRP_SV_VID])
> ++		fprintf(f, "SV_VID %d ",
> ++			rta_getattr_u16(tb[IFLA_PRP_SV_VID]));
> ++	if (tb[IFLA_PRP_SV_PCP])
> ++		fprintf(f, "SV_PCP %d ",
> ++			rta_getattr_u8(tb[IFLA_PRP_SV_PCP]));
> ++	if (tb[IFLA_PRP_SV_CFI])
> ++		fprintf(f, "SV_CFI %d ",
> ++			rta_getattr_u8(tb[IFLA_PRP_SV_CFI]));
> + }
> + 
> + static void prp_print_help(struct link_util *lu, int argc, char **argv,
> +-- 
> +2.7.4
> +
> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
> index 327b85b..e65d90e 100644
> --- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
> @@ -1,7 +1,8 @@
> -PR_append = ".arago0"
> +PR_append = ".arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  SRC_URI_append = " \
>             file://0001-add-support-for-prp-similar-to-hsr.patch \
> +           file://0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch \
>            "
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

