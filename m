Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id A231E52A5A
	for <meta-arago@arago-project.org>;
	Wed, 24 Feb 2016 19:05:02 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O32009ACFO1ZI60@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 24 Feb 2016 13:04:50 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=a1_7XnguTYcgEfei7WoA:9
Received: by 100.15.86.14 with SMTP id 53547f46; Wed, 24 Feb 2016 19:04:49 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 34588161EC0;	Wed,
	24 Feb 2016 14:04:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 24 Feb 2016 14:04:47 -0500
Message-id: <1456340687-32524-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] u-boot-fw-utils: add HS support
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
X-List-Received-Date: Wed, 24 Feb 2016 19:05:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
index 047f94b..67bf9cf 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
@@ -1,5 +1,7 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 # The proper config doesn't currently exist anywhere in mainline U-boot.
 # For now just use a similar config which is good enough for U-boot utilities.
 UBOOT_MACHINE_am57xx-evm = "dra7xx_evm_config"
+UBOOT_MACHINE_dra7xx-hs-evm = "dra7xx_evm_config"
+UBOOT_MACHINE_am437x-hs-evm = "am43xx_evm_config"
-- 
2.2.0


