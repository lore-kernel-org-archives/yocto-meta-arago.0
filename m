Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BF81952B53
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 20:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F80340C1C;
	Wed, 16 Jun 2021 20:14:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GUJ4eSqFzzHE; Wed, 16 Jun 2021 20:14:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 30DF640B66;
	Wed, 16 Jun 2021 20:14:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0CE1C174603;
	Wed, 16 Jun 2021 16:14:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 16 Jun 2021 16:14:08 -0400
Message-Id: <1623874449-31873-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623874449-31873-1-git-send-email-denis@denix.org>
References: <1623874449-31873-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH 1/2] linux-ti-staging: enable necessary configs for running docker containers
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
X-List-Received-Date: Wed, 16 Jun 2021 20:13:42 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

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


