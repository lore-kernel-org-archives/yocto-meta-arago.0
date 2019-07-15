Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6A56B52995
	for <meta-arago@arago-project.org>;
	Mon, 15 Jul 2019 15:07:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FF6opN088486
	for <meta-arago@arago-project.org>; Mon, 15 Jul 2019 10:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563203210;
	bh=8V43XoEPVxHQaWF53HFZYYBToBp5WbtQNunJl6Na4wM=;
	h=From:To:CC:Subject:Date;
	b=uLNyR8tRvM+Z0fS78EYjQAzSVXbmFTLaNHB7UJnBmckwSvcpNpIUlNly9NUOsu4/U
	EPejax1Dpxdw4dpbjI6pThdOYwBj8YmVmfe3Ilu92CiQ2+MsF5Bmtd2EetYQ4LrIik
	RwavUK9q5z/4zS/Lq/8E7dq78/XlsFTo++xZXpYg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FF6o5s022018
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 15 Jul 2019 10:06:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 15 Jul 2019 10:06:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 15 Jul 2019 10:06:49 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FF6n5Y059295;
	Mon, 15 Jul 2019 10:06:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Jul 2019 10:50:09 -0400
Message-ID: <1563202210-19334-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 1/2] mstpd: add Multiple Spanning Tree Protocol Daemon v0.0.7
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
X-List-Received-Date: Mon, 15 Jul 2019 15:07:39 -0000
Content-Type: text/plain

* Patch to workaraound -Werror=stringop-truncation in GCC 8

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../0001-gcc8-strncpy-werror-workaround.patch      | 83 ++++++++++++++++++++++
 .../recipes-support/mstpctl/mstpd_git.bb           | 20 ++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
 create mode 100644 meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb

diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch b/meta-arago-extras/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
new file mode 100644
index 0000000..21f7e7d
--- /dev/null
+++ b/meta-arago-extras/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
@@ -0,0 +1,83 @@
+From 8a24d984988bcf832d7684b2a4e9d23b643a433d Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Sun, 14 Apr 2019 05:49:35 -0400
+Subject: [PATCH] gcc8 strncpy werror workaround
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+
+Upstream-Status: Inappropriate [other]
+
+HACK to workaround GCC 8 reported error.
+
+---
+ mstp.c        |  3 +++
+ netif_utils.c | 12 ++++++++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/mstp.c b/mstp.c
+index aec5cbb..90044fc 100644
+--- a/mstp.c
++++ b/mstp.c
+@@ -1591,8 +1591,11 @@ void MSTP_IN_set_mst_config_id(bridge_t *br, __u16 revision, __u8 *name)
+         assign(br->MstConfigId.s.revision_level, valueRevision);
+         memset(br->MstConfigId.s.configuration_name, 0,
+                sizeof(br->MstConfigId.s.configuration_name));
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
+         strncpy((char *)br->MstConfigId.s.configuration_name, (char *)name,
+                 sizeof(br->MstConfigId.s.configuration_name));
++#pragma GCC diagnostic pop
+         br_state_machines_begin(br);
+     }
+ }
+diff --git a/netif_utils.c b/netif_utils.c
+index 7231750..ce2cfb8 100644
+--- a/netif_utils.c
++++ b/netif_utils.c
+@@ -59,7 +59,10 @@ int get_hwaddr(char *ifname, __u8 *hwaddr)
+ {
+     struct ifreq ifr;
+     memset(&ifr, 0, sizeof(ifr));
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
+     strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
++#pragma GCC diagnostic pop
+     if(0 > ioctl(netsock, SIOCGIFHWADDR, &ifr))
+     {
+         ERROR("%s: get hw address failed: %m", ifname);
+@@ -73,7 +76,10 @@ int get_flags(char *ifname)
+ {
+     struct ifreq ifr;
+     memset(&ifr, 0, sizeof(ifr));
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
+     strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
++#pragma GCC diagnostic pop
+     if(0 > ioctl(netsock, SIOCGIFFLAGS, &ifr))
+     {
+         ERROR("%s: get interface flags failed: %m", ifname);
+@@ -93,7 +99,10 @@ int if_shutdown(char *ifname)
+         return -1;
+     }
+     ifr.ifr_flags &= ~IFF_UP;
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
+     strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
++#pragma GCC diagnostic pop
+     if(0 > ioctl(netsock, SIOCSIFFLAGS, &ifr))
+     {
+         ERROR("%s: set if_down flag failed: %m", ifname);
+@@ -106,7 +115,10 @@ int ethtool_get_speed_duplex(char *ifname, int *speed, int *duplex)
+ {
+     struct ifreq ifr;
+     memset(&ifr, 0, sizeof(ifr));
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
+     strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
++#pragma GCC diagnostic pop
+     struct ethtool_cmd ecmd;
+ 
+     ecmd.cmd = ETHTOOL_GSET;
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
new file mode 100644
index 0000000..eeeeb82
--- /dev/null
+++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Multiple Spanning Tree Protocol Daemon"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4 \
+                    file://debian/copyright;md5=332234a99007d25da40f41ee96aa388f"
+
+SRC_URI = "git://github.com/mstpd/mstpd.git;protocol=https \
+           file://0001-gcc8-strncpy-werror-workaround.patch"
+
+PV = "0.0.7+git${SRCPV}"
+SRCREV = "e4f0ba5a48649a3253f8b353c87c965e12aafc50"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "python"
+RDEPENDS_${PN} = "python-core"
+
+inherit autotools
+
+EXTRA_OECONF = "--sbindir=/sbin"
-- 
2.7.4


