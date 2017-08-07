Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D98CC529AB
	for <meta-arago@arago-project.org>;
	Mon,  7 Aug 2017 22:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A2C08208E0;
	Mon,  7 Aug 2017 22:24:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id X073V48kQQbF; Mon,  7 Aug 2017 22:24:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 81E9E207BB;
	Mon,  7 Aug 2017 22:24:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F2C8A162551;
	Mon,  7 Aug 2017 18:24:26 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  7 Aug 2017 18:24:26 -0400
Message-Id: <1502144666-77962-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] linux-ti-staging: add default defconfig for generic armv8
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
X-List-Received-Date: Mon, 07 Aug 2017 22:24:29 -0000

Also allow empty devicetree package for generic platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend | 4 +++-
 .../recipes-kernel/linux/linux-ti-staging-systest_%.bbappend          | 4 +++-
 .../recipes-kernel/linux/linux-ti-staging/arago-armv8/defconfig       | 1 +
 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend    | 4 +++-
 4 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging/arago-armv8/defconfig

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
index a3241ab..7d03f8e 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
@@ -1,5 +1,7 @@
 MACHINE_KERNEL_PR_append = ".arago1"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
+
+ALLOW_EMPTY_kernel-devicetree = "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
index a3241ab..7d03f8e 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
@@ -1,5 +1,7 @@
 MACHINE_KERNEL_PR_append = ".arago1"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
+
+ALLOW_EMPTY_kernel-devicetree = "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/arago-armv8/defconfig b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/arago-armv8/defconfig
new file mode 100644
index 0000000..3228f4e
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/arago-armv8/defconfig
@@ -0,0 +1 @@
+use-kernel-config=defconfig
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
index 6ae4bd7..5bddbef 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -1,5 +1,7 @@
 MACHINE_KERNEL_PR_append = ".arago5"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 require copy-defconfig.inc
+
+ALLOW_EMPTY_kernel-devicetree = "1"
-- 
2.7.4


