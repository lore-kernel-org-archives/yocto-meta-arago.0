Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4F30952A23
	for <meta-arago@arago-project.org>;
	Wed, 18 Jun 2014 15:01:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5IF1uV4031332
	for <meta-arago@arago-project.org>; Wed, 18 Jun 2014 10:01:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5IF1uMU006014
	for <meta-arago@arago-project.org>; Wed, 18 Jun 2014 10:01:56 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 18 Jun 2014 10:01:56 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5IF1rtW006757;
	Wed, 18 Jun 2014 10:01:54 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Jun 2014 10:01:51 -0500
Message-ID: <1403103711-15485-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] toolchain-*.inc: Replace variable overrides with bb.utils function
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
X-List-Received-Date: Wed, 18 Jun 2014 15:01:57 -0000
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
Version 2 changes:
Remove all the extra spaces

 .../conf/distro/include/toolchain-gcc.inc          |    7 ++++---
 .../conf/distro/include/toolchain-linaro.inc       |    9 +++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

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
index 95269a7..0418359 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -3,11 +3,12 @@ TCMODE = "external-linaro"
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
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-linaro-toolchain"
 
-- 
1.7.0.4


