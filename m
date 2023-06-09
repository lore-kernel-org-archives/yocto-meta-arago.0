Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F46FC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 18:07:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1676.1686334014615773949
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 11:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zLN/wqe1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359I6pGs113978;
	Fri, 9 Jun 2023 13:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686334011;
	bh=lk2P+a3mFE0WOJUK5XLyUQI73QmobQGwk2Jg1HkHyno=;
	h=From:To:CC:Subject:Date;
	b=zLN/wqe1XCdkvPAz4PcHSEEGAoZmIBYcKr1Z1z16d4gf6q9vd0uwAE4Rty9m2zhX7
	 YnGxKCPprvIO0yBMIyUF/8Cca67WxzFeFeucrBg3qQ41Oz2MIoFrcGMK0/8RUPGx+c
	 +ZXgpgRTlROTIQpXd2AalWZKJYeoqh4DFgX43i3M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359I6pJq047815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 13:06:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 13:06:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 13:06:51 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359I6okN079544;
	Fri, 9 Jun 2023 13:06:51 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2] meta-arago-distro: recipes-kernel: Remove docker configs
Date: Fri, 9 Jun 2023 23:36:25 +0530
Message-ID: <20230609180625.629020-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 18:07:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14577

The necessary configs required for running docker containers have been enabled in ti-linux-kernel.
Hence, remove it from meta-arago.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-kernel/linux/docker.inc           |  4 ----
 .../recipes-kernel/linux/files/docker.cfg     | 20 -------------------
 .../linux/linux-ti-staging-rt_%.bbappend      |  2 --
 .../linux/linux-ti-staging-systest_%.bbappend |  2 --
 .../linux/linux-ti-staging_%.bbappend         |  2 --
 5 files changed, 30 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/files/docker.cfg

diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc b/meta-arago-distro/recipes-kernel/linux/docker.inc
deleted file mode 100644
index e926b219..00000000
--- a/meta-arago-distro/recipes-kernel/linux/docker.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://docker.cfg"
-KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/docker.cfg"
diff --git a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg b/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
deleted file mode 100644
index 9ac604b8..00000000
--- a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
+++ /dev/null
@@ -1,20 +0,0 @@
-CONFIG_VETH=m
-CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
-CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
-CONFIG_NETFILTER_XT_MATCH_IPVS=m
-CONFIG_NET_CLS_CGROUP=m
-CONFIG_IP_VS=m
-CONFIG_IP_VS_RR=m
-CONFIG_VXLAN=m
-CONFIG_IPVLAN=m
-CONFIG_MACVLAN=m
-CONFIG_DUMMY=m
-CONFIG_NF_NAT_FTP=m
-CONFIG_NF_CONNTRACK_FTP=m
-CONFIG_NF_NAT_TFTP=m
-CONFIG_NF_CONNTRACK_TFTP=m
-CONFIG_AUFS_FS=m
-CONFIG_BTRFS_FS=m
-CONFIG_BLK_DEV_DM=m
-CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_OVERLAY_FS=m
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
index df55594e..06f33291 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
@@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append = ".arago1"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-require docker.inc
-
 ALLOW_EMPTY:kernel-devicetree = "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
index df55594e..06f33291 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
@@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append = ".arago1"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-require docker.inc
-
 ALLOW_EMPTY:kernel-devicetree = "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
index 031a8b05..9d9a3593 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append = ".arago5"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-require docker.inc
-
 ALLOW_EMPTY:kernel-devicetree = "1"
-- 
2.34.1


