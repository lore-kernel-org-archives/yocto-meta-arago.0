Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 4141252A71
	for <meta-arago@arago-project.org>;
	Tue, 20 Sep 2016 16:26:31 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODT001S49NH5JA0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 20 Sep 2016 11:26:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=1DmWfQz_zpB2DQqBSUsA:9
Received: by 100.15.110.130 with SMTP id 56ff4372;
	Tue, 20 Sep 2016 16:26:06 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 81B45162137;	Tue, 20 Sep 2016 12:26:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 20 Sep 2016 12:26:04 -0400
Message-id: <1474388764-23133-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot-fw-utils: add support for am335x and k2e HS platforms
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
X-List-Received-Date: Tue, 20 Sep 2016 16:26:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
index 8c18c6b..6c116ac 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
@@ -1,5 +1,7 @@
 # The proper config doesn't currently exist anywhere in mainline U-boot.
 # For now just use a similar config which is good enough for U-boot utilities.
-UBOOT_MACHINE_dra7xx-hs-evm = "dra7xx_evm_config"
+UBOOT_MACHINE_am335x-hs-evm = "am335x_evm_config"
 UBOOT_MACHINE_am437x-hs-evm = "am43xx_evm_config"
+UBOOT_MACHINE_dra7xx-hs-evm = "dra7xx_evm_config"
 UBOOT_MACHINE_am57xx-hs-evm = "am57xx_evm_config"
+UBOOT_MACHINE_k2e-hs-evm = "k2e_evm_config"
-- 
2.7.4


