Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 35E7852960
	for <meta-arago@arago-project.org>;
	Thu,  7 Feb 2019 00:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 39DB040B53;
	Thu,  7 Feb 2019 00:44:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8GVuIYx3vsAy; Thu,  7 Feb 2019 00:44:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2637F40AD5;
	Thu,  7 Feb 2019 00:44:15 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C9F4E16A90C;
	Wed,  6 Feb 2019 19:44:14 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Feb 2019 19:44:14 -0500
Message-Id: <1549500254-53118-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] u-boot-k3-r5: update to 2019.01
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
X-List-Received-Date: Thu, 07 Feb 2019 00:44:31 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/{u-boot-k3-r5_2018.01.bb => u-boot-k3-r5_2019.01.bb}        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-arago-distro/recipes-bsp/u-boot/{u-boot-k3-r5_2018.01.bb => u-boot-k3-r5_2019.01.bb} (65%)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
similarity index 65%
rename from meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
rename to meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
index dcd1e31..cb10ebc 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
@@ -7,7 +7,8 @@ PKG_${PN}-dbg = "${PN}-dbg"
 
 COMPATIBLE_MACHINE = "k3"
 
-CROSS_COMPILE_V7 = "${ELT_TARGET_SYS_ARMV7}-"
+CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${ELT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'linaro']}"
+CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${EAT_TARGET_SYS_ARMV7}-'][d.getVar('TOOLCHAIN_TYPE') == 'external' and d.getVar('TOOLCHAIN_BRAND') == 'arm']}"
 PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
 
 UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
-- 
2.7.4


