Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950C6C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:47:20 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.38859.1741790837173716646
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FH27g+Px;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CElF8T1057767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790835;
	bh=f4dePxgrleqM6VEJ75mwDdMSAbsr1gwv1qAivSohcpY=;
	h=From:To:Subject:Date;
	b=FH27g+Px6djqORr3EPT3XxsSTDE9yARCKbduiM36Vs9XoEoZn4pd7XUkzyEjWjzAs
	 eULALYc85H81e8YfDvOlgfCaADjh8LhMhL08B0YpI/ZsQRi3rZ+W0fyQnGIzNq9wtg
	 jK/3nV/XM9c+1J4ONNBb0RkMTvjXSYQEF+/kKcxI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CElFb9015037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:47:15 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:47:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:47:15 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CElFr8076436;
	Wed, 12 Mar 2025 09:47:15 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNMY-0007l5-U2; Wed, 12 Mar 2025 09:47:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] mstpd: Remove recipe
Date: Wed, 12 Mar 2025 09:47:14 -0500
Message-ID: <20250312144714.29784-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16002

There is a newer version of mstpd availble in meta-openembedded, so
remove this older version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-gcc8-strncpy-werror-workaround.patch | 83 -------------------
 .../recipes-support/mstpctl/mstpd_git.bb      | 24 ------
 2 files changed, 107 deletions(-)
 delete mode 100644 meta-arago-test/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
 delete mode 100644 meta-arago-test/recipes-support/mstpctl/mstpd_git.bb

diff --git a/meta-arago-test/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch b/meta-arago-test/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
deleted file mode 100644
index 21f7e7db..00000000
--- a/meta-arago-test/recipes-support/mstpctl/mstpd/0001-gcc8-strncpy-werror-workaround.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 8a24d984988bcf832d7684b2a4e9d23b643a433d Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Sun, 14 Apr 2019 05:49:35 -0400
-Subject: [PATCH] gcc8 strncpy werror workaround
-
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
-
-Upstream-Status: Inappropriate [other]
-
-HACK to workaround GCC 8 reported error.
-
----
- mstp.c        |  3 +++
- netif_utils.c | 12 ++++++++++++
- 2 files changed, 15 insertions(+)
-
-diff --git a/mstp.c b/mstp.c
-index aec5cbb..90044fc 100644
---- a/mstp.c
-+++ b/mstp.c
-@@ -1591,8 +1591,11 @@ void MSTP_IN_set_mst_config_id(bridge_t *br, __u16 revision, __u8 *name)
-         assign(br->MstConfigId.s.revision_level, valueRevision);
-         memset(br->MstConfigId.s.configuration_name, 0,
-                sizeof(br->MstConfigId.s.configuration_name));
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wstringop-truncation"
-         strncpy((char *)br->MstConfigId.s.configuration_name, (char *)name,
-                 sizeof(br->MstConfigId.s.configuration_name));
-+#pragma GCC diagnostic pop
-         br_state_machines_begin(br);
-     }
- }
-diff --git a/netif_utils.c b/netif_utils.c
-index 7231750..ce2cfb8 100644
---- a/netif_utils.c
-+++ b/netif_utils.c
-@@ -59,7 +59,10 @@ int get_hwaddr(char *ifname, __u8 *hwaddr)
- {
-     struct ifreq ifr;
-     memset(&ifr, 0, sizeof(ifr));
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wstringop-truncation"
-     strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
-+#pragma GCC diagnostic pop
-     if(0 > ioctl(netsock, SIOCGIFHWADDR, &ifr))
-     {
-         ERROR("%s: get hw address failed: %m", ifname);
-@@ -73,7 +76,10 @@ int get_flags(char *ifname)
- {
-     struct ifreq ifr;
-     memset(&ifr, 0, sizeof(ifr));
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wstringop-truncation"
-     strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
-+#pragma GCC diagnostic pop
-     if(0 > ioctl(netsock, SIOCGIFFLAGS, &ifr))
-     {
-         ERROR("%s: get interface flags failed: %m", ifname);
-@@ -93,7 +99,10 @@ int if_shutdown(char *ifname)
-         return -1;
-     }
-     ifr.ifr_flags &= ~IFF_UP;
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wstringop-truncation"
-     strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
-+#pragma GCC diagnostic pop
-     if(0 > ioctl(netsock, SIOCSIFFLAGS, &ifr))
-     {
-         ERROR("%s: set if_down flag failed: %m", ifname);
-@@ -106,7 +115,10 @@ int ethtool_get_speed_duplex(char *ifname, int *speed, int *duplex)
- {
-     struct ifreq ifr;
-     memset(&ifr, 0, sizeof(ifr));
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wstringop-truncation"
-     strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
-+#pragma GCC diagnostic pop
-     struct ethtool_cmd ecmd;
- 
-     ecmd.cmd = ETHTOOL_GSET;
--- 
-2.17.1
-
diff --git a/meta-arago-test/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-test/recipes-support/mstpctl/mstpd_git.bb
deleted file mode 100644
index ed9c5f2c..00000000
--- a/meta-arago-test/recipes-support/mstpctl/mstpd_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Multiple Spanning Tree Protocol Daemon"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4 \
-                    file://debian/copyright;md5=332234a99007d25da40f41ee96aa388f"
-
-SRC_URI = "git://github.com/mstpd/mstpd.git;protocol=https;branch=master \
-           file://0001-gcc8-strncpy-werror-workaround.patch"
-
-PV = "0.0.7+git"
-SRCREV = "e4f0ba5a48649a3253f8b353c87c965e12aafc50"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "python3"
-RDEPENDS:${PN} = "python3-core"
-
-inherit autotools
-
-EXTRA_OECONF = "--sbindir=${base_sbindir}"
-
-do_configure:prepend() {
-	 sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/utils/ifquery
-}
-- 
2.17.1


