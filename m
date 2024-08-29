Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFFACA0EC7
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 22:13:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.33691.1724969630500875009
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 15:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jpRi6oRk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47TMDnM1006533;
	Thu, 29 Aug 2024 17:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724969629;
	bh=mFkrEjyUV1SKvFTWJymsTuqMXaGvcdFBziaLdMt1J/A=;
	h=From:To:Subject:Date;
	b=jpRi6oRkqL5jiRFf7l5+JfLPfdM6ciRTYJkoZr2foh5eb7cVi11SBy/YFZkqA+Lv4
	 dqjaiDfc2FxeLP+RB6HCXIp1PELCbSHFzPbOR6mDjwn7q8sH50dOmccLlNbzib6RER
	 XtP7IJBbLVh1jUSM2cptbKQ+Sr2p7KPuRWcOhhXM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47TMDnaG026365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Aug 2024 17:13:49 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Aug 2024 17:13:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Aug 2024 17:13:48 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47TMDn1J098223;
	Thu, 29 Aug 2024 17:13:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sjnOm-0001yi-Rt; Thu, 29 Aug 2024 17:13:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] iproute2: Update patch for 6.10.0
Date: Thu, 29 Aug 2024 17:13:48 -0500
Message-ID: <20240829221348.7079-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Aug 2024 22:13:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15548

The patch no longer applied cleanly due to changes in upstream.  Update
the patch to apply cleanly to the 6.10.0 source.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...dd-support-for-vlan-tagged-supervisi.patch | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
index c538afdc..b451dc03 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
@@ -23,10 +23,10 @@ diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
 index de08704c5862..94a381769e5a 100644
 --- a/include/uapi/linux/if_link.h
 +++ b/include/uapi/linux/if_link.h
-@@ -901,6 +901,9 @@ enum {
- 	IFLA_HSR_PROTOCOL,		/* Indicate different protocol than
+@@ -1772,6 +1772,9 @@ enum {
  					 * HSR. For example PRP.
  					 */
+	IFLA_HSR_INTERLINK,		/* HSR interlink network device */
 +	IFLA_HSR_SV_VID,		/* Supervision frames VLAN ID */
 +	IFLA_HSR_SV_DEI,		/* Supervision frames VLAN DEI */
 +	IFLA_HSR_SV_PCP,		/* Supervision frames VLAN PCP */
@@ -34,18 +34,18 @@ index de08704c5862..94a381769e5a 100644
  };
  
 diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
-index 6ea138a23cbc..f38c752c0065 100644
+index 42adb430..d7fbbd62 100644
 --- a/ip/iplink_hsr.c
 +++ b/ip/iplink_hsr.c
-@@ -26,6 +26,7 @@ static void print_usage(FILE *f)
- 	fprintf(f,
+@@ -23,6 +23,7 @@ static void print_usage(FILE *f)
  		"Usage:\tip link add name NAME type hsr slave1 SLAVE1-IF slave2 SLAVE2-IF\n"
- 		"\t[ supervision ADDR-BYTE ] [version VERSION] [proto PROTOCOL]\n"
+ 		"\t[ interlink INTERLINK-IF ] [ supervision ADDR-BYTE ] [ version VERSION ]\n"
+ 		"\t[ proto PROTOCOL ]\n"
 +		"\t[ sv_vid SV-VID ] [ sv_pcp SV-PCP ] [ sv_dei SV-DEI ]\n"
  		"\n"
  		"NAME\n"
  		"	name of new hsr device (e.g. hsr0)\n"
-@@ -37,7 +38,15 @@ static void print_usage(FILE *f)
+@@ -36,7 +37,15 @@ static void print_usage(FILE *f)
  		"VERSION\n"
  		"	0,1; the protocol version to be used. (default = 0)\n"
  		"PROTOCOL\n"
@@ -62,7 +62,7 @@ index 6ea138a23cbc..f38c752c0065 100644
  }
  
  static void usage(void)
-@@ -52,6 +61,9 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+@@ -51,6 +60,9 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
  	unsigned char multicast_spec;
  	unsigned char protocol_version;
  	unsigned char protocol = HSR_PROTOCOL_HSR;
@@ -72,10 +72,10 @@ index 6ea138a23cbc..f38c752c0065 100644
  
  	while (argc > 0) {
  		if (matches(*argv, "supervision") == 0) {
-@@ -86,6 +98,32 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
+@@ -91,6 +103,31 @@ static int hsr_parse_opt(struct link_util *lu, int argc, char **argv,
  			if (ifindex == 0)
  				invarg("No such interface", *argv);
- 			addattr_l(n, 1024, IFLA_HSR_SLAVE2, &ifindex, 4);
+ 			addattr_l(n, 1024, IFLA_HSR_INTERLINK, &ifindex, 4);
 +		} else if (matches(*argv, "sv_vid") == 0) {
 +			NEXT_ARG();
 +			if (get_u16(&sv_vid, *argv, 0))
@@ -101,7 +101,6 @@ index 6ea138a23cbc..f38c752c0065 100644
 +				invarg("SV-DEI is invalid", *argv);
 +			addattr_l(n, 1024, IFLA_HSR_SV_DEI,
 +				  &sv_dei, sizeof(sv_dei));
-+
  		} else if (matches(*argv, "help") == 0) {
  			usage();
  			return -1;
-- 
2.17.1


