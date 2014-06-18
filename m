Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1430B52A23
	for <meta-arago@arago-project.org>;
	Wed, 18 Jun 2014 15:00:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5IF0Fga031837
	for <meta-arago@arago-project.org>; Wed, 18 Jun 2014 10:00:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5IF0Fsf004353
	for <meta-arago@arago-project.org>; Wed, 18 Jun 2014 10:00:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 18 Jun 2014 10:00:15 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5IF0CHh031648;
	Wed, 18 Jun 2014 10:00:14 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Jun 2014 10:00:10 -0500
Message-ID: <1403103610-15402-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] toolchain-*.inc: Replace variable overrides with bb.utils function
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
X-List-Received-Date: Wed, 18 Jun 2014 15:00:18 -0000
Content-Type: text/plain

* Conf files are unable to use variable overrides instead bitbake utility
  functions are needed to mimic the functionality.
* Currently the DEFAULTTUNE variable isn't being set properly for non Cortex A8
  devices which causes uses when using an architecture override for non Cortex
  A8 devices.
* This issue was first discovered due to the inability to build valgrind for
  am43x and via testing determined that this affected any non Cortex A8 machine/SOC_FAMILY
  within meta-ti.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/toolchain-gcc.inc          |    7 ++++---
 .../conf/distro/include/toolchain-linaro.inc       |   12 ++++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index f7c8032..8388d13 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -3,9 +3,10 @@ TCMODE = "default"
 TCLIBC = "eglibc"
 
 DEFAULTTUNE = "cortexa8thf-neon"
-DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
-DEFAULTTUNE_keystone = "cortexa15thf-neon"
-DEFAULTTUNE_omap4 = "cortexa9thf-neon"
+DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9thf-neon','${DEFAULTTUNE}',d)}"
+DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap-a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
+DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
+DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9thf-neon','${DEFAULTTUNE}',d)}"
 
 # Match some of the external vars
 TOOLCHAIN_SYS := "${TARGET_SYS}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 95269a7..76ec61f 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -3,11 +3,15 @@ TCMODE = "external-linaro"
 TCLIBC = "external-linaro-toolchain"
 
 ELT_TARGET_SYS = "arm-linux-gnueabihf"
+
 DEFAULTTUNE = "cortexa8thf-neon"
-DEFAULTTUNE_omap-a15 = "cortexa15thf-neon"
-DEFAULTTUNE_keystone = "cortexa15thf-neon"
-DEFAULTTUNE_omap4 = "cortexa9thf-neon"
-DEFAULTTUNE_ti43x = "cortexa9thf-neon"
+DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','ti43x','cortexa9thf-neon','${DEFAULTTUNE}',d)}"
+DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap-a15','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
+DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','keystone','cortexa15thf-neon','${DEFAULTTUNE}',d)}"
+DEFAULTTUNE := "${@bb.utils.contains('SOC_FAMILY','omap4','cortexa9thf-neon','${DEFAULTTUNE}',d)}"
+
+
+
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
 
-- 
1.7.0.4


