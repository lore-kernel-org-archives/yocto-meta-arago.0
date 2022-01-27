Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.21535.1643242931111667320
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8F39340CBF
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubpf77wDsABO for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9BCD640CC8
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6BC1A174731
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 09/23] packagegroups: pru-icss: Add support for am64xx
Date: Wed, 26 Jan 2022 19:21:50 -0500
Message-Id: <1643242924-25090-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

This patch is in conjuction with meta-ti patch to add pru-icss for
am64xx: https://lists.yoctoproject.org/g/meta-ti/message/14067

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Cc: Nick Saulnier <nsaulnier@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 6 +++++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 4 ++--
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 6 +++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index d9c45e1..edc6a58 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r36"
+PR = "r37"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -53,6 +53,10 @@ UTILS_append_am65xx = " \
     pru-icss-source \
 "
 
+UTILS_append_am64xx = " \
+    pru-icss-src \
+"
+
 EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5f95bdb..5fa9141 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r79"
+PR = "r80"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -65,7 +65,7 @@ UTILS_append_k3 = " mmc-utils \
                     statcol \
 "
 
-UTILS_append_am64xx = " ti-rtos-firmware"
+UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
 UTILS_append_j7-evm = " pru-icss"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index f7b299e..4474b86 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -56,7 +56,7 @@ SRC_URI = "\
     file://Makefile_ti-img-rogue-driver \
 "
 
-PR = "r105"
+PR = "r106"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -197,6 +197,9 @@ MAKEFILES_append_am65xx = " \
 MAKEFILES_append_j7 = " pru-icss \
                             ti-img-rogue-driver \
 "
+MAKEFILES_append_am64xx = " \
+                        pru-icss \
+"
 
 # Use this to export kernel arch to ARCH
 #
@@ -234,6 +237,7 @@ PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
 PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
 PRU_ICSS_INSTALL_TARGET_j7 = "pru-icss_install_j721e"
+PRU_ICSS_INSTALL_TARGET_am64xx = "pru-icss_install_am64x"
 
 # Path to toolchains for the various cores in TI SOCs
 #
-- 
2.7.4

