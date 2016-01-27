Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5A04C52007
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 20:42:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RKg84T026547
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 14:42:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RKg8QS004327
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 14:42:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 14:42:07 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0RKg7WW026609;	Wed, 27 Jan 2016 14:42:08 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 15:42:06 -0500
Message-ID: <1453927326-17163-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tisdk-uenv: remove fdtfile hardcoding for am57xx-evm
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
X-List-Received-Date: Wed, 27 Jan 2016 20:42:10 -0000
Content-Type: text/plain

The hardcoding of fdtfile is no longer needed since uboot now sets
fdtfile according to the board name.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb       |  2 +-
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt    | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index b290da7..a08f24b 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -6,7 +6,7 @@ SRC_URI = "\
     file://uEnv.txt \
 "
 
-PR = "r2"
+PR = "r3"
 PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt
deleted file mode 100644
index a082e1d..0000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am57xx-evm/uEnv.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-# This uEnv.txt file can contain additional environment settings that you
-# want to set in U-Boot at boot time.  This can be simple variables such
-# as the serverip or custom variables.  The format of this file is:
-#    variable=value
-# NOTE: This file will be evaluated after the bootcmd is run and the
-#       bootcmd must be set to load this file if it exists (this is the
-#       default on all newer U-Boot images.  This also means that some
-#       variables such as bootdelay cannot be changed by this file since
-#       it is not evaluated until the bootcmd is run.
-fdtfile=am57xx-evm.dtb
-- 
1.9.1


