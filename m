Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8831C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 05:23:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6693.1686288234539815393
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 22:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LuZb33CJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3595NoLs069097;
	Fri, 9 Jun 2023 00:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686288230;
	bh=gwwgd6xklnqQKZfbHzyLb8qfUeocgtLaNnqNtL3XI/k=;
	h=From:To:CC:Subject:Date;
	b=LuZb33CJHJKayZUxN3nqSDwAdhARqOGIr9fFetqvOoqpHFuytBYd9FLPcKc32nkzm
	 cJQuSUHpxFZMSEMekKdqRSY5g+0ARQJ8mUTLDsUgxl/UxyZqy+08WlFzU17GQqObyW
	 Zlg8ebpWlCik9slCZtIYwRl39CIKZPYUZF1X8CRY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3595NoG7044202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 00:23:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 00:23:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 00:23:50 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3595NnLe029668;
	Fri, 9 Jun 2023 00:23:49 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][kirkstone][PATCH] meta-arago-distro: recipes-kernel: Remove docker configs
Date: Fri, 9 Jun 2023 10:53:46 +0530
Message-ID: <20230609052346.414726-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 05:23:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14564

The necessary configs required for running docker containers have been enabled in ti-linux-6.1

Ref - https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/patch/?id=ca7f239d0814e6a49804b76c0984d6ca5eea0924

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


