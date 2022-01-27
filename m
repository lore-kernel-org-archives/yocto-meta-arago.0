Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22181.1643242929970035472
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D089E40CC2
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9CRwn4a5N8B for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B2F5240CBF
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DF6AD17473C
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 20/23] linux-ti-staging: enable necessary configs for running docker containers
Date: Wed, 26 Jan 2022 19:22:01 -0500
Message-Id: <1643242924-25090-21-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-kernel/linux/docker.inc    |  2 ++
 .../linux/linux-ti-staging-rt_%.bbappend             |  1 +
 .../linux/linux-ti-staging-systest_%.bbappend        |  1 +
 .../recipes-kernel/linux/linux-ti-staging/docker.cfg | 20 ++++++++++++++++++++
 .../recipes-kernel/linux/linux-ti-staging_%.bbappend |  1 +
 5 files changed, 25 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg

diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc b/meta-arago-distro/recipes-kernel/linux/docker.inc
new file mode 100644
index 0000000..63a01ba
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/docker.inc
@@ -0,0 +1,2 @@
+SRC_URI += "file://docker.cfg"
+KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/docker.cfg"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
index 7d03f8e..165e86f 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
@@ -3,5 +3,6 @@ MACHINE_KERNEL_PR_append = ".arago1"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
+require docker.inc
 
 ALLOW_EMPTY_kernel-devicetree = "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
index 7d03f8e..165e86f 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
@@ -3,5 +3,6 @@ MACHINE_KERNEL_PR_append = ".arago1"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
+require docker.inc
 
 ALLOW_EMPTY_kernel-devicetree = "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
new file mode 100644
index 0000000..9ac604b
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
@@ -0,0 +1,20 @@
+CONFIG_VETH=m
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
+CONFIG_NETFILTER_XT_MATCH_IPVS=m
+CONFIG_NET_CLS_CGROUP=m
+CONFIG_IP_VS=m
+CONFIG_IP_VS_RR=m
+CONFIG_VXLAN=m
+CONFIG_IPVLAN=m
+CONFIG_MACVLAN=m
+CONFIG_DUMMY=m
+CONFIG_NF_NAT_FTP=m
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_NAT_TFTP=m
+CONFIG_NF_CONNTRACK_TFTP=m
+CONFIG_AUFS_FS=m
+CONFIG_BTRFS_FS=m
+CONFIG_BLK_DEV_DM=m
+CONFIG_DM_THIN_PROVISIONING=m
+CONFIG_OVERLAY_FS=m
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
index 5bddbef..31940e3 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -3,5 +3,6 @@ MACHINE_KERNEL_PR_append = ".arago5"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
+require docker.inc
 
 ALLOW_EMPTY_kernel-devicetree = "1"
-- 
2.7.4

