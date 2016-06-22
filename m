Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id CCDFD52975
	for <meta-arago@arago-project.org>;
	Wed, 22 Jun 2016 14:25:34 +0000 (UTC)
Received: from vz-proxy-m004.mx.aol.com ([64.236.83.8])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O960083EG1P5620@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 22 Jun 2016 09:25:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=Bcm0RCOkHTZ4We9DUxtllQ==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=3v2I7njlpcKTYkZ5o6gA:9
Received: by 100.15.86.14 with SMTP id 02e66c01; Wed, 22 Jun 2016 14:25:06 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2E20C161E97;	Wed,
	22 Jun 2016 10:25:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 22 Jun 2016 10:25:00 -0400
Message-id: <20160622142500.17121-1-denis@denix.org>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] u-boot-fw-utils: add AM57x HS platform
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
X-List-Received-Date: Wed, 22 Jun 2016 14:25:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
index 6f2f566..8c18c6b 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
@@ -2,3 +2,4 @@
 # For now just use a similar config which is good enough for U-boot utilities.
 UBOOT_MACHINE_dra7xx-hs-evm = "dra7xx_evm_config"
 UBOOT_MACHINE_am437x-hs-evm = "am43xx_evm_config"
+UBOOT_MACHINE_am57xx-hs-evm = "am57xx_evm_config"
-- 
2.9.0


