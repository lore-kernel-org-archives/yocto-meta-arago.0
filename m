Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6513.1644583097532863307
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 04:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iQPIGJJD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21BCcFUl083709;
	Fri, 11 Feb 2022 06:38:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644583095;
	bh=hiyi/ru8yt+a1dnCujtD8GMUzKfhRcy7CvJCawa0/gg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=iQPIGJJD309MOmmaLg5xKgxL9cYWB3DOV5Y3w/Axmucn3QYwWqjKaNvJC852Ksuvo
	 iQ5F6trUgIwOqh5v+C/2z5ED85I6Qc8+yKAn3s3hjTf2G8irdoap7t5E5ztSjsHucz
	 r7LTV47qL+ltRi4rnofCzOzDbIt6mboz09LXPXM4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21BCcFAq050686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Feb 2022 06:38:15 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Feb 2022 06:38:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Feb 2022 06:38:14 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21BCcEqK099096;
	Fri, 11 Feb 2022 06:38:14 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nIVBm-0003D2-Ip; Fri, 11 Feb 2022 06:38:14 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 3/3] Revert "linux-ti-staging: enable necessary configs for running docker containers"
Date: Fri, 11 Feb 2022 06:38:14 -0600
Message-ID: <20220211123814.12258-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211123814.12258-1-reatmon@ti.com>
References: <20220211123814.12258-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit 628e99b8811678b4305b1175580e70ad00ec933f.

These patches add to the size of the base image.  We have plans on
reworking the images and will reapply this patch at that time.
---
 .../recipes-kernel/linux/docker.inc           |  2 --
 .../linux/linux-ti-staging-rt_%.bbappend      |  1 -
 .../linux/linux-ti-staging-systest_%.bbappend |  1 -
 .../linux/linux-ti-staging/docker.cfg         | 20 -------------------
 .../linux/linux-ti-staging_%.bbappend         |  1 -
 5 files changed, 25 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg

diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc b/meta-arago-distro/recipes-kernel/linux/docker.inc
deleted file mode 100644
index 63a01ba2..00000000
--- a/meta-arago-distro/recipes-kernel/linux/docker.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-SRC_URI += "file://docker.cfg"
-KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/docker.cfg"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
index 165e86f3..7d03f8ea 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
@@ -3,6 +3,5 @@ MACHINE_KERNEL_PR_append = ".arago1"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
-require docker.inc
 
 ALLOW_EMPTY_kernel-devicetree = "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
index 165e86f3..7d03f8ea 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
@@ -3,6 +3,5 @@ MACHINE_KERNEL_PR_append = ".arago1"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
-require docker.inc
 
 ALLOW_EMPTY_kernel-devicetree = "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
deleted file mode 100644
index 9ac604b8..00000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
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
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
index 31940e3f..5bddbefa 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -3,6 +3,5 @@ MACHINE_KERNEL_PR_append = ".arago5"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
-require docker.inc
 
 ALLOW_EMPTY_kernel-devicetree = "1"
-- 
2.17.1

