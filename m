Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6247852A2C
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 23:50:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo6gL020375
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560210606;
	bh=UkkgLbl1W9gbQ+qpRgViXE6YtvbZXr6r8nToBNZcku0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WkHwZE+NLhQ1RNHLl/K+O3gLS1Nidl39pGfWk15up6iwSI0j2yJWh9ps4MEYKagDq
	6OPq/2toN+MudjCWqk3VrPxYSnvvJIqnZCIr8G9MtKBSELaXQyZATN80FPT9/P9ynx
	xEkcuyrri+jD6tMC+xdVdldCPNdwbW2KyPT58QpI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ANo6JZ115948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:06 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 18:50:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 18:50:05 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo4wm077708;
	Mon, 10 Jun 2019 18:50:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Jun 2019 23:37:49 +0000
Message-ID: <20190610233750.31009-4-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610233750.31009-1-denys@ti.com>
References: <20190610233750.31009-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 3/4] u-boot-k3-r5: add support for J7 platform
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
X-List-Received-Date: Mon, 10 Jun 2019 23:50:47 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
index fae3d623..0263b668 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
@@ -13,6 +13,7 @@ PATH_prepend = "${TOOLCHAIN_PATH_ARMV7}/bin:"
 
 UBOOT_MACHINE_am65xx-evm = "am65x_evm_r5_defconfig"
 UBOOT_MACHINE_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
+UBOOT_MACHINE_j7-evm = "j721e_evm_r5_defconfig"
 
 EXTRA_OEMAKE = 'ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_V7} CC="${CROSS_COMPILE_V7}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-- 
2.17.1


