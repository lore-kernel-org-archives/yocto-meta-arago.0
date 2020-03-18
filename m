Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CB5E252995
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2020 23:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A9A0040C2C;
	Wed, 18 Mar 2020 23:44:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ho77_MopwGhN; Wed, 18 Mar 2020 23:44:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 52E8240B30;
	Wed, 18 Mar 2020 23:44:43 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 69E6417126C;
	Wed, 18 Mar 2020 19:44:42 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 18 Mar 2020 19:44:41 -0400
Message-Id: <1584575082-6702-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] packagegroups: u-boot-fw-utils replaced with libubootenv-bin
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
X-List-Received-Date: Wed, 18 Mar 2020 23:46:53 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend   | 8 --------
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb | 4 +---
 2 files changed, 1 insertion(+), 11 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
deleted file mode 100644
index eb9c9e4..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-# The proper config doesn't currently exist anywhere in mainline U-boot.
-# For now just use a similar config which is good enough for U-boot utilities.
-UBOOT_CONFIG_am335x-hs-evm = "utils"
-UBOOT_CONFIG[utils] = "am335x_evm_config"
-UBOOT_MACHINE_am437x-hs-evm = "am43xx_evm_config"
-UBOOT_MACHINE_dra7xx-hs-evm = "dra7xx_evm_config"
-UBOOT_MACHINE_am57xx-hs-evm = "am57xx_evm_config"
-UBOOT_MACHINE_k2e-hs-evm = "k2e_evm_config"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2913fa1..f3ae83e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -31,9 +31,7 @@ UTILS = " \
     open62541-tests \
 "
 
-UTILS_UBOOT_FW = "u-boot-fw-utils"
-UTILS_UBOOT_FW_keystone = ""
-UTILS_UBOOT_FW_k3 = ""
+UTILS_UBOOT_FW = "libubootenv-bin"
 
 UTILS_DSP = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gdbc6x dsptop', '', d)} \
-- 
2.7.4


