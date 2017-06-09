Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A51A1529F4
	for <meta-arago@arago-project.org>;
	Fri,  9 Jun 2017 19:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B75E20C09;
	Fri,  9 Jun 2017 19:52:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 53qvNuWIpuyW; Fri,  9 Jun 2017 19:52:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3CE15207AF;
	Fri,  9 Jun 2017 19:52:28 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id BC14B1624D4;
	Fri,  9 Jun 2017 15:52:27 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  9 Jun 2017 15:52:27 -0400
Message-Id: <1497037947-71074-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] u-boot-fw-utils: use UBOOT_CONFIG for am335x-hs-evm due to meta-ti change
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
X-List-Received-Date: Fri, 09 Jun 2017 19:52:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
index 6c116ac..eb9c9e4 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
@@ -1,6 +1,7 @@
 # The proper config doesn't currently exist anywhere in mainline U-boot.
 # For now just use a similar config which is good enough for U-boot utilities.
-UBOOT_MACHINE_am335x-hs-evm = "am335x_evm_config"
+UBOOT_CONFIG_am335x-hs-evm = "utils"
+UBOOT_CONFIG[utils] = "am335x_evm_config"
 UBOOT_MACHINE_am437x-hs-evm = "am43xx_evm_config"
 UBOOT_MACHINE_dra7xx-hs-evm = "dra7xx_evm_config"
 UBOOT_MACHINE_am57xx-hs-evm = "am57xx_evm_config"
-- 
2.7.4


