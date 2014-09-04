Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4217652A72
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 15:34:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84FYNB1007796
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:34:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FYNGC031926
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:34:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 10:34:23 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FYFkc029950;
	Thu, 4 Sep 2014 10:34:21 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 21:04:13 +0530
Message-ID: <1409844854-17247-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409844854-17247-1-git-send-email-a0393906@ti.com>
References: <1409844854-17247-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master] [PATCH 2/3] bt-firmware: Add support for omap-a15 based targets
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
X-List-Received-Date: Thu, 04 Sep 2014 15:34:24 -0000
Content-Type: text/plain

    * Also migrate to the latest bt-firmware for init scripts
    * Updated LICENCE

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index 9aff61a..780519b 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Firmware files for Bluetooth"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=4b46aed2a87412c84f9363a8db053e1b \
+LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=1c9961176d6529283e0d0c983be41b45 \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -11,11 +11,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r4+gitr${SRCPV}"
+PR = "r5+gitr${SRCPV}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
-SRCREV = "7496df8d130f2db85d5d50b1f703213edf0b54fb"
+SRCREV = "e08f59b41b6145b6baf1cb68bca018233ab5e93a"
 SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
            file://0001-Makefile-allow-building-within-the-OE.patch"
 
-- 
2.0.1


