Return-Path: <m-karicheri2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BC0C8529E5
	for <meta-arago@arago-project.org>;
	Wed,  8 Jul 2020 15:57:43 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 068Ft4c9081687
	for <meta-arago@arago-project.org>; Wed, 8 Jul 2020 10:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594223704;
	bh=MFFeF4+hWET+mn6vn0PtRi2D7ifsv2KDDTTxIY1qwGU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=pSR0R86Pd1Hi6vpNFJuDUSQfyam1ctXsAjitDa0u05JgPcAS1LG1G9s1u4npr89HZ
	4cJ6O2vNBTuTn0yqRuycSxlFKBHUjUJl1LPJUFln6hHRm6fMQ488PrH8RJs7BapjYz
	kx8vJnXAGRzqVF2DTeo5nK/gBugJNDtd3hlENo10=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 068Ft4gN042814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 8 Jul 2020 10:55:04 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 8 Jul 2020 10:55:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 8 Jul 2020 10:55:03 -0500
Received: from [10.250.74.234] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 068Ft3Br113602;
	Wed, 8 Jul 2020 10:55:03 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20200707174402.31294-1-m-karicheri2@ti.com>
	<20200708152800.GA26110@beryl>
From: Murali Karicheri <m-karicheri2@ti.com>
Message-ID: <add2eaf7-d842-ba55-3333-7fbd9e619ed0@ti.com>
Date: Wed, 8 Jul 2020 11:55:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708152800.GA26110@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago PATCH] iproute2: update recipe for prp and supervision vlan support
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
X-List-Received-Date: Wed, 08 Jul 2020 15:57:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys,

On 7/8/20 11:28 AM, Denys Dmytriyenko wrote:
> On Tue, Jul 07, 2020 at 01:44:02PM -0400, Murali Karicheri wrote:
>> This recipe includes the patches required in iproute2 to add
>> PRP ip link support as well as allow use of VLAN for supervision
>> frames.
> 
> What is the Upstream-status for both of these patches?
> 
RFC patch send to upstream and can be viewed at
https://www.spinics.net/lists/netdev/msg650413.html

> 
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> ---
>>   ...upport-for-creating-PRP-device-simil.patch | 109 ++++++++++++++++++
>>   ...dd-support-for-vlan-tagged-supervisi.patch | 108 +++++++++++++++++
>>   .../iproute2/iproute2_5.5.0.bbappend          |   8 ++
>>   3 files changed, 225 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch
>>   create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
>>   create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch
>> new file mode 100644
>> index 000000000000..dfeaeb01b485
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch
>> @@ -0,0 +1,109 @@
>> +From e3aa94814e9467af5829a04c335a615c0082a362 Mon Sep 17 00:00:00 2001
>> +From: Murali Karicheri <m-karicheri2@ti.com>
>> +Date: Fri, 5 Jun 2020 11:02:05 -0400
>> +Subject: [PATCH 1/2] iplink: hsr: add support for creating PRP device similar
>> + to HSR
>> +
>> +This patch enhances the iplink command to add a proto parameters to
>> +create PRP device/interface similar to HSR. Both protocols are
>> +quite similar and requires a pair of Ethernet interfaces. So re-use
>> +the existing HSR iplink command to create PRP device/interface as
>> +well. Use proto parameter to differentiate the two protocols.
>> +
>> +Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> +---
>> + include/uapi/linux/if_link.h | 12 +++++++++++-
>> + ip/iplink_hsr.c              | 19 +++++++++++++++++--
>> + 2 files changed, 28 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
>> +index 1c49f436424d..de08704c5862 100644
>> +--- a/include/uapi/linux/if_link.h
>> ++++ b/include/uapi/linux/if_link.h
>> +@@ -881,7 +881,14 @@ enum {
>> + #define IFLA_IPOIB_MAX (__IFLA_IPOIB_MAX - 1)
>> +
>> +
>> +-/* HSR section */
>> ++/* HSR/PRP section, both uses same interface */
>> ++
>> ++/* Different redundancy protocols for hsr device */
>> ++enum {
>> ++	HSR_PROTOCOL_HSR,
>> ++	HSR_PROTOCOL_PRP,
>> ++	HSR_PROTOCOL_MAX,
>> ++};
>> +
>> + enum {
>> + 	IFLA_HSR_UNSPEC,
>> +@@ -891,6 +898,9 @@ enum {
>> + 	IFLA_HSR_SUPERVISION_ADDR,	/* Supervision frame multicast addr */
>> + 	IFLA_HSR_SEQ_NR,
>> + 	IFLA_HSR_VERSION,		/* HSR version */
>> ++	IFLA_HSR_PROTOCOL,		/* Indicate different protocol than
>> ++					 * HSR. For example PRP.
>> ++					 */
>> + 	__IFLA_HSR_MAX,
>> + };
>> +
>> +diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
>> +index 7d9167d4e6a3..6ea138a23cbc 100644
>> +--- a/ip/iplink_hsr.c
>> ++++ b/ip/iplink_hsr.c
>> +@@ -25,7 +25,7 @@ static void print_usage(FILE *f)
>> + {
>> + 	fprintf(f,
>> + 		"Usage:\tip link add name NAME type hsr slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
>> +-		"\t[ supervision ADDR-BYTE ] [version VERSION]\n"
>> ++		"\t[ supervision ADDR-BYTE ] [version VERSION] [proto PROTOCOL]\n"
>> + 		"\n"
>> + 		"NAME\n"
>> + 		"	name of new hsr device (e.g. hsr0)\n"
>> +@@ -35,7 +35,9 @@ static void print_usage(FILE *f)
>> + 		"	0-255; the last byte of the multicast address used for HSR supervision\n"
>> + 		"	frames (default = 0)\n"
>> + 		"VERSION\n"
>> +-		"	0,1; the protocol version to be used. (default = 0)\n");
>> ++		"	0,1; the protocol version to be used. (default = 0)\n"
>> ++		"PROTOCOL\n"
>> ++		"	0 - HSR, 1 - PRP. (default = 0 - HSR)\n");
>> + }
>> +
>> + static void usage(void)
>> +@@ -49,6 +51,7 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
>> + 	int ifindex;
>> + 	unsigned char multicast_spec;
>> + 	unsigned char protocol_version;
>> ++	unsigned char protocol = HSR_PROTOCOL_HSR;
>> +
>> + 	while (argc > 0) {
>> + 		if (matches(*argv, "supervision") == 0) {
>> +@@ -64,6 +67,13 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
>> + 				invarg("version is invalid", *argv);
>> + 			addattr_l(n, 1024, IFLA_HSR_VERSION,
>> + 				  &protocol_version, 1);
>> ++		} else if (matches(*argv, "proto") == 0) {
>> ++			NEXT_ARG();
>> ++			if (!(get_u8(&protocol, *argv, 0) == HSR_PROTOCOL_HSR ||
>> ++			      get_u8(&protocol, *argv, 0) == HSR_PROTOCOL_PRP))
>> ++				invarg("protocol is invalid", *argv);
>> ++			addattr_l(n, 1024, IFLA_HSR_PROTOCOL,
>> ++				  &protocol, 1);
>> + 		} else if (matches(*argv, "slave1") == 0) {
>> + 			NEXT_ARG();
>> + 			ifindex = ll_name_to_index(*argv);
>> +@@ -140,6 +150,11 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
>> + 					 RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
>> + 					 ARPHRD_VOID,
>> + 					 b1, sizeof(b1)));
>> ++	if (tb[IFLA_HSR_PROTOCOL])
>> ++		print_int(PRINT_ANY,
>> ++			  "proto",
>> ++			  "proto %d ",
>> ++			  rta_getattr_u8(tb[IFLA_HSR_PROTOCOL]));
>> + }
>> +
>> + static void hsr_print_help(struct link_util *lu, int argc, char **argv,
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
>> new file mode 100644
>> index 000000000000..fa0eecccdf59
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
>> @@ -0,0 +1,108 @@
>> +From 6e48ed61da3b03da415a87bfbd3651fde8742647 Mon Sep 17 00:00:00 2001
>> +From: Murali Karicheri <m-karicheri2@ti.com>
>> +Date: Fri, 5 Jun 2020 12:07:43 -0400
>> +Subject: [PATCH 2/2] iplink: hsr/prp: add support for vlan tagged supervision
>> + frames
>> +
>> +This patch adds support to configure vlan tag information
>> +(vid, pcp and dei) at the hsr/prp lre device. This tag values
>> +will be used by the lre device to generate a VLAN tagged
>> +Supervision frames. This is done by adding 3 additional attributes
>> +to the hsr/prp link type and passing this to Linux HSR/PRP
>> +device through the ip link command.
>> +
>> +Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> +---
>> + include/uapi/linux/if_link.h |  3 +++
>> + ip/iplink_hsr.c              | 40 +++++++++++++++++++++++++++++++++++-
>> + 2 files changed, 42 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
>> +index de08704c5862..94a381769e5a 100644
>> +--- a/include/uapi/linux/if_link.h
>> ++++ b/include/uapi/linux/if_link.h
>> +@@ -901,6 +901,9 @@ enum {
>> + 	IFLA_HSR_PROTOCOL,		/* Indicate different protocol than
>> + 					 * HSR. For example PRP.
>> + 					 */
>> ++	IFLA_HSR_SV_VID,		/* Supervision frames VLAN ID */
>> ++	IFLA_HSR_SV_DEI,		/* Supervision frames VLAN DEI */
>> ++	IFLA_HSR_SV_PCP,		/* Supervision frames VLAN PCP */
>> + 	__IFLA_HSR_MAX,
>> + };
>> +
>> +diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
>> +index 6ea138a23cbc..f38c752c0065 100644
>> +--- a/ip/iplink_hsr.c
>> ++++ b/ip/iplink_hsr.c
>> +@@ -26,6 +26,7 @@ static void print_usage(FILE *f)
>> + 	fprintf(f,
>> + 		"Usage:\tip link add name NAME type hsr slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
>> + 		"\t[ supervision ADDR-BYTE ] [version VERSION] [proto PROTOCOL]\n"
>> ++		"\t[ sv_vid SV-VID ] [ sv_pcp SV-PCP ] [ sv_dei SV-DEI ]\n"
>> + 		"\n"
>> + 		"NAME\n"
>> + 		"	name of new hsr device (e.g. hsr0)\n"
>> +@@ -37,7 +38,15 @@ static void print_usage(FILE *f)
>> + 		"VERSION\n"
>> + 		"	0,1; the protocol version to be used. (default = 0)\n"
>> + 		"PROTOCOL\n"
>> +-		"	0 - HSR, 1 - PRP. (default = 0 - HSR)\n");
>> ++		"	0 - HSR, 1 - PRP. (default = 0 - HSR)\n"
>> ++		"SV-VID\n"
>> ++		"      0-4094; VLAN ID to be used in the VLAN tag of SV frames (default 0)\n"
>> ++		"SV-PCP\n"
>> ++		"      0-7; PCP value to be used in the VLAN tag of SV frames (default 0)\n"
>> ++		"SV-DEI\n"
>> ++		"      0-1;  DEI value to be used in the VLAN tag of SV frames (default 0)\n"
>> ++		"      Use VLAN tag if one of sv_vid, sv_pcp or sv_dei is specified. Default value\n"
>> ++		"      used for unspecified ones\n");
>> + }
>> +
>> + static void usage(void)
>> +@@ -52,6 +61,9 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
>> + 	unsigned char multicast_spec;
>> + 	unsigned char protocol_version;
>> + 	unsigned char protocol = HSR_PROTOCOL_HSR;
>> ++	unsigned short sv_vid;
>> ++	unsigned char sv_dei;
>> ++	unsigned char sv_pcp;
>> +
>> + 	while (argc > 0) {
>> + 		if (matches(*argv, "supervision") == 0) {
>> +@@ -86,6 +98,32 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
>> + 			if (ifindex == 0)
>> + 				invarg("No such interface", *argv);
>> + 			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
>> ++		} else if (matches(*argv, "sv_vid") == 0) {
>> ++			NEXT_ARG();
>> ++			if (get_u16(&sv_vid, *argv, 0))
>> ++				invarg("SV-VID is invalid", *argv);
>> ++			/* exclude reserved 4095 */
>> ++			if (sv_vid >= 4095)
>> ++				invarg("SV-VID is invalid", *argv);
>> ++			addattr_l(n, 1024, IFLA_HSR_SV_VID,
>> ++				  &sv_vid, sizeof(sv_vid));
>> ++		} else if (matches(*argv, "sv_pcp") == 0) {
>> ++			NEXT_ARG();
>> ++			if (get_u8(&sv_pcp, *argv, 0))
>> ++				invarg("SV-PCP is invalid", *argv);
>> ++			if (sv_pcp > 7)
>> ++				invarg("SV-PCP is invalid", *argv);
>> ++			addattr_l(n, 1024, IFLA_HSR_SV_PCP,
>> ++				  &sv_pcp, sizeof(sv_pcp));
>> ++		} else if (matches(*argv, "sv_dei") == 0) {
>> ++			NEXT_ARG();
>> ++			if (get_u8(&sv_dei, *argv, 0))
>> ++				invarg("SV-DEI is invalid", *argv);
>> ++			if (sv_dei > 1)
>> ++				invarg("SV-DEI is invalid", *argv);
>> ++			addattr_l(n, 1024, IFLA_HSR_SV_DEI,
>> ++				  &sv_dei, sizeof(sv_dei));
>> ++
>> + 		} else if (matches(*argv, "help") == 0) {
>> + 			usage();
>> + 			return -1;
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbappend
>> new file mode 100644
>> index 000000000000..d6effcd7ca81
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbappend
>> @@ -0,0 +1,8 @@
>> +PR_append = ".arago6"
>> +
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> +
>> +SRC_URI_append = " \
>> +    file://0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch \
>> +    file://0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch \
>> +"
>> -- 
>> 2.17.1
>>

-- 
Murali Karicheri
Texas Instruments

