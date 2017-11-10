Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A4E2E52A93
	for <meta-arago@arago-project.org>;
	Fri, 10 Nov 2017 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EB4320A40;
	Fri, 10 Nov 2017 20:01:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0OvkOTPSNCPv; Fri, 10 Nov 2017 20:01:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 76972204B1;
	Fri, 10 Nov 2017 20:01:21 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EEB03162717;
	Fri, 10 Nov 2017 15:01:20 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 10 Nov 2017 15:01:20 -0500
Message-Id: <1510344080-42205-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] iproute2: update to version 4.11, drop backport, massage PRP patch
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
X-List-Received-Date: Fri, 10 Nov 2017 20:01:27 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ... 0001-add-support-for-prp-similar-to-hsr.patch} | 27 ++++++++++------------
 .../0001-ip-HSR-Fix-cut-and-paste-error.patch      | 27 ----------------------
 ...te2_4.9.0.bbappend => iproute2_4.11.0.bbappend} |  3 +--
 3 files changed, 13 insertions(+), 44 deletions(-)
 rename meta-arago-distro/recipes-connectivity/iproute2/iproute2/{0002-add-support-for-prp-similar-to-hsr.patch => 0001-add-support-for-prp-similar-to-hsr.patch} (93%)
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-HSR-Fix-cut-and-paste-error.patch
 rename meta-arago-distro/recipes-connectivity/iproute2/{iproute2_4.9.0.bbappend => iproute2_4.11.0.bbappend} (45%)

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-add-support-for-prp-similar-to-hsr.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-add-support-for-prp-similar-to-hsr.patch
similarity index 93%
rename from meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-add-support-for-prp-similar-to-hsr.patch
rename to meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-add-support-for-prp-similar-to-hsr.patch
index d0d74b5..1ef6292 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0002-add-support-for-prp-similar-to-hsr.patch
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-add-support-for-prp-similar-to-hsr.patch
@@ -1,17 +1,14 @@
-From c245063217c7c27c3b324c1faba3b69b50c50fd1 Mon Sep 17 00:00:00 2001
+From cd61c6eec1fc9d86484d529bfe42da7a00a1534a Mon Sep 17 00:00:00 2001
 From: Murali Karicheri <m-karicheri2@ti.com>
 Date: Wed, 12 Apr 2017 16:23:37 -0400
-Subject: [PATCH 2/2] add support for prp similar to hsr
+Subject: [PATCH] add support for prp similar to hsr
 
 prp protocol is similar to hsr in many aspects and this patch add a
 command type prp to create prp interface using two slave interfaces
 similar to hsr
 
 Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
-
-Conflicts:
-	include/linux/if_link.h
-	ip/Makefile
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  include/linux/if_link.h |  14 ++++-
  ip/Makefile             |   2 +-
@@ -20,10 +17,10 @@ Conflicts:
  create mode 100644 ip/iplink_prp.c
 
 diff --git a/include/linux/if_link.h b/include/linux/if_link.h
-index 20965c9..6b9b59b 100644
+index b0bdbd6..41c1e91 100644
 --- a/include/linux/if_link.h
 +++ b/include/linux/if_link.h
-@@ -810,7 +810,6 @@ enum {
+@@ -814,7 +814,6 @@ enum {
  
  
  /* HSR section */
@@ -31,7 +28,7 @@ index 20965c9..6b9b59b 100644
  enum {
  	IFLA_HSR_UNSPEC,
  	IFLA_HSR_SLAVE1,
-@@ -821,7 +820,6 @@ enum {
+@@ -825,7 +824,6 @@ enum {
  	IFLA_HSR_VERSION,		/* HSR version */
  	__IFLA_HSR_MAX,
  };
@@ -39,7 +36,7 @@ index 20965c9..6b9b59b 100644
  #define IFLA_HSR_MAX (__IFLA_HSR_MAX - 1)
  
  /* STATS section */
-@@ -881,4 +879,16 @@ enum {
+@@ -890,4 +888,16 @@ enum {
  
  #define IFLA_XDP_MAX (__IFLA_XDP_MAX - 1)
  
@@ -57,18 +54,18 @@ index 20965c9..6b9b59b 100644
 +
  #endif /* _LINUX_IF_LINK_H */
 diff --git a/ip/Makefile b/ip/Makefile
-index 86c8cdc..95f0fa5 100644
+index 035d42c..9836e64 100644
 --- a/ip/Makefile
 +++ b/ip/Makefile
-@@ -6,7 +6,7 @@ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o ipnetns.o \
+@@ -7,7 +7,7 @@ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o ipnetns.o \
      iplink_macvlan.o ipl2tp.o link_vti.o link_vti6.o \
      iplink_vxlan.o tcp_metrics.o iplink_ipoib.o ipnetconf.o link_ip6tnl.o \
      link_iptnl.o link_gre6.o iplink_bond.o iplink_bond_slave.o iplink_hsr.o \
 -    iplink_bridge.o iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
 +    iplink_prp.o iplink_bridge.o iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
-     iplink_geneve.o iplink_vrf.o iproute_lwtunnel.o ipmacsec.o ipila.o
+     iplink_geneve.o iplink_vrf.o iproute_lwtunnel.o ipmacsec.o ipila.o \
+     ipvrf.o iplink_xstats.o
  
- RTMONOBJ=rtmon.o
 diff --git a/ip/iplink_prp.c b/ip/iplink_prp.c
 new file mode 100644
 index 0000000..c1e5a3b
@@ -217,5 +214,5 @@ index 0000000..c1e5a3b
 +	.print_help	= prp_print_help,
 +};
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-HSR-Fix-cut-and-paste-error.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-HSR-Fix-cut-and-paste-error.patch
deleted file mode 100644
index 25249ab..0000000
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-HSR-Fix-cut-and-paste-error.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3f586aee3d617b1281d5c535caafd9f09d06f5fb Mon Sep 17 00:00:00 2001
-From: Ralf Baechle <ralf@linux-mips.org>
-Date: Mon, 6 Feb 2017 21:47:35 +0100
-Subject: [PATCH 1/2] ip: HSR: Fix cut and paste error
-
-Fixes: 5c0aec93a516 ("ip: Add HSR support")
-Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
----
- ip/iplink_hsr.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
-index cb744eb..696b2c9 100644
---- a/ip/iplink_hsr.c
-+++ b/ip/iplink_hsr.c
-@@ -144,7 +144,7 @@ static void hsr_print_help(struct link_util *lu, int argc, char **argv,
- 
- struct link_util hsr_link_util = {
- 	.id		= "hsr",
--	.maxattr	= IFLA_VLAN_MAX,
-+	.maxattr	= IFLA_HSR_MAX,
- 	.parse_opt	= hsr_parse_opt,
- 	.print_opt	= hsr_print_opt,
- 	.print_help	= hsr_print_help,
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
similarity index 45%
rename from meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bbappend
rename to meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
index 65f5525..327b85b 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.9.0.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
@@ -3,6 +3,5 @@ PR_append = ".arago0"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append = " \
-           file://0001-ip-HSR-Fix-cut-and-paste-error.patch \
-           file://0002-add-support-for-prp-similar-to-hsr.patch \
+           file://0001-add-support-for-prp-similar-to-hsr.patch \
           "
-- 
2.7.4


