Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EF866529D8
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2019 04:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1578640BAA;
	Thu,  9 May 2019 04:15:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id k_TT2IAkX1Rz; Thu,  9 May 2019 04:15:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0359340BB2;
	Thu,  9 May 2019 04:15:33 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B42E616EAF5;
	Thu,  9 May 2019 00:15:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  9 May 2019 00:15:26 -0400
Message-Id: <1557375331-41998-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557375331-41998-1-git-send-email-denys@ti.com>
References: <1557375331-41998-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 4/9] u-boot-k3-r5: specify config for am65xx HS
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
X-List-Received-Date: Thu, 09 May 2019 04:16:05 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
index cb10ebc..fae3d62 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
@@ -12,6 +12,7 @@ CROSS_COMPILE_V7 = "${@['${TARGET_SYS}-','${EAT_TARGET_SYS_ARMV7}-'][d.getVar('T
 PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
 
 UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
+UBOOT_MACHINE_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
 
 EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-- 
2.7.4


