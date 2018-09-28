Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 55E2C52092
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2018 16:08:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SG7tYY054437
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 11:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538150875;
	bh=DuLbGZwwj6mV3dLFCsIpTemSXp+7ZE1yy6CKHmAbLrg=;
	h=From:To:CC:Subject:Date;
	b=CyRo+Fc1U+qqFHQBF+LiN7DmLmzdRSET19ruIfA7cJBW/oBKm5xQF5Nb2BIRkjVtS
	ib2xxvJWFN8IdXJeVJo+WL0f4kNgL5s5up1vgAVq7BvZLfg0gAE6FDKjQ49sQdYOzq
	2pmR2MwD0FryPKmHh9FV5n740IdlHquiD6yTD/AU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SG7t5U032426
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 11:07:55 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:07:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:07:55 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SG7tNq015197;
	Fri, 28 Sep 2018 11:07:55 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Sep 2018 12:07:50 -0400
Message-ID: <1538150870-27795-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, Murali Karicheri <m-karicheri2@ti.com>
Subject: [rocko/master/ti2018.03] [PATCH] iproute2: add patches to fix segmentation fault for prp
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
X-List-Received-Date: Fri, 28 Sep 2018 16:08:05 -0000
Content-Type: text/plain

When ip -d link command is executed with prp interface setup,
it encounters a segmentation fault. This causes snmpwalk command
to time out since it uses the above command to list the
interfaces. This patch fixes the issue.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...able-display-for-vlan-params-in-ip-d-link.patch | 63 ++++++++++++++++++++++
 .../iproute2/0002-prp-invalid-maxattr.patch        | 29 ++++++++++
 .../iproute2/iproute2_4.11.0.bbappend              |  4 +-
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-prp-invalid-maxattr.patch

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch
new file mode 100644
index 0000000..cb5a6b9
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch
@@ -0,0 +1,63 @@
+From b893b6e581785fd4a458d5cf1a8178e858636db2 Mon Sep 17 00:00:00 2001
+From: Murali Karicheri <m-karicheri2@ti.com>
+Date: Thu, 27 Sep 2018 11:56:00 -0400
+Subject: [PATCH 1/2] hsr/prp: disable display for vlan params in ip -d link
+ command
+
+Seeing a crash with ip -d link command for prp. Disable it for now
+as a trial to check if that is causing the segmentation fault
+for prp. These values are not coming from kernel anyways. So it
+doesn't correctly display it currently. So this has no impact on
+the functionality. Can add it later once kernel provide the right
+values in the response.
+
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ ip/iplink_hsr.c | 9 ---------
+ ip/iplink_prp.c | 9 ---------
+ 2 files changed, 18 deletions(-)
+
+diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
+index 34e91679..e713cb7b 100644
+--- a/ip/iplink_hsr.c
++++ b/ip/iplink_hsr.c
+@@ -180,15 +180,6 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+ 				    RTA_PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
+ 				    ARPHRD_VOID,
+ 				    b1, sizeof(b1)));
+-	if (tb[IFLA_HSR_SV_VID])
+-		fprintf(f, "SV_VID %d ",
+-			rta_getattr_u16(tb[IFLA_HSR_SV_VID]));
+-	if (tb[IFLA_HSR_SV_PCP])
+-		fprintf(f, "SV_PCP %d ",
+-			rta_getattr_u8(tb[IFLA_HSR_SV_PCP]));
+-	if (tb[IFLA_HSR_SV_CFI])
+-		fprintf(f, "SV_CFI %d ",
+-			rta_getattr_u8(tb[IFLA_HSR_SV_CFI]));
+ }
+ 
+ static void hsr_print_help(struct link_util *lu, int argc, char **argv,
+diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
+index e25ae82d..b09528a5 100644
+--- a/ip/iplink_prp.c
++++ b/ip/iplink_prp.c
+@@ -170,15 +170,6 @@ static void prp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+ 				    RTA_PAYLOAD(tb[IFLA_PRP_SUPERVISION_ADDR]),
+ 				    ARPHRD_VOID,
+ 				    b1, sizeof(b1)));
+-	if (tb[IFLA_PRP_SV_VID])
+-		fprintf(f, "SV_VID %d ",
+-			rta_getattr_u16(tb[IFLA_PRP_SV_VID]));
+-	if (tb[IFLA_PRP_SV_PCP])
+-		fprintf(f, "SV_PCP %d ",
+-			rta_getattr_u8(tb[IFLA_PRP_SV_PCP]));
+-	if (tb[IFLA_PRP_SV_CFI])
+-		fprintf(f, "SV_CFI %d ",
+-			rta_getattr_u8(tb[IFLA_PRP_SV_CFI]));
+ }
+ 
+ static void prp_print_help(struct link_util *lu, int argc, char **argv,
+-- 
+2.17.0
+
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-prp-invalid-maxattr.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-prp-invalid-maxattr.patch
new file mode 100644
index 0000000..cfd0106
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-prp-invalid-maxattr.patch
@@ -0,0 +1,29 @@
+From 755328f9c9d45149cad1a8e6c371d2020b99f18e Mon Sep 17 00:00:00 2001
+From: Murali Karicheri <m-karicheri2@ti.com>
+Date: Thu, 27 Sep 2018 14:54:48 -0400
+Subject: [PATCH 2/2] prp: invalid maxattr
+
+Fix the cut and paste error of using IFLA_VLAN_MAX instead of IFLA_PRP_MAX.
+
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ ip/iplink_prp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
+index b09528a5..beef603b 100644
+--- a/ip/iplink_prp.c
++++ b/ip/iplink_prp.c
+@@ -180,7 +180,7 @@ static void prp_print_help(struct link_util *lu, int argc, char **argv,
+ 
+ struct link_util prp_link_util = {
+ 	.id		= "prp",
+-	.maxattr	= IFLA_VLAN_MAX,
++	.maxattr	= IFLA_PRP_MAX,
+ 	.parse_opt	= prp_parse_opt,
+ 	.print_opt	= prp_print_opt,
+ 	.print_help	= prp_print_help,
+-- 
+2.17.0
+
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
index 2b2d6d2..26949c4 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago2"
+PR_append = ".arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -6,4 +6,6 @@ SRC_URI_append = " \
            file://0001-add-support-for-prp-similar-to-hsr.patch \
            file://0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch \
            file://0001-hsr-prp-remove-the-debug-print-from-the-code.patch \
+           file://0001-hsr-prp-disable-display-for-vlan-params-in-ip-d-link.patch \
+           file://0002-prp-invalid-maxattr.patch \
           "
-- 
1.9.1


