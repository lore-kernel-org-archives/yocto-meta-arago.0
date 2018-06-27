Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4471852987
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 17:49:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RHnlKV108730
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 12:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530121787;
	bh=Y8+l/VNWhW3zCjDBpSVSR7ouENA/vu/qJwaTuHy1yu4=;
	h=From:To:CC:Subject:Date;
	b=H7LPbcePtmHqdv7MbyMcDK0n4YLHd/lVhbhzPlByvdVa3dje6nUtErxMPeU9SWs4I
	bi4aqoB1sYvmunuzSKGowyHXflMTCbnvk+KJ7G7xtGDmtZ0j0DgdRkZY2gBhwMdRoF
	9S6qIMxfO++wtp8Exbxcv9GaH5zNX/DPD4a8JaWM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RHnl6b003735
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 12:49:47 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 12:49:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 27 Jun 2018 12:49:46 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RHnk83015453;
	Wed, 27 Jun 2018 12:49:46 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jun 2018 13:38:23 -0400
Message-ID: <1530121103-3613-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-tisdk-makefile: u-boot-spl: u-boot now contains dtc
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
X-List-Received-Date: Wed, 27 Jun 2018 17:49:53 -0000
Content-Type: text/plain

* U-Boot now contains a copy of dtc, similar to the kernel.
* By default, the DTC variable will point to this copy, so that make
  override is not necessary.
* However, MKIMAGE_DTC_PATH does not use this, and by default,
  assumes dtc is on the PATH.
* Use CONFIG_MKIMAGE_DTC_PATH to point to the dtc produced by U-Boot.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
index f12a4a5..6e8dd6e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
@@ -3,12 +3,12 @@ u-boot-spl: u-boot
 u-boot-spl_clean: u-boot_clean
 u-boot-spl_install: u-boot_install
 
-u-boot: linux-dtbs
+u-boot:
 	@echo ===================================
 	@echo    Building U-boot
 	@echo ===================================
 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) DTC=$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc/dtc
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) CONFIG_MKIMAGE_DTC_PATH=$(TI_SDK_PATH)/board-support/u-boot-*/scripts/dtc/dtc
 
 u-boot_clean:
 	@echo ===================================
-- 
2.7.4


