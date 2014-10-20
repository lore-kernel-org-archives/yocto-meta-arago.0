Return-Path: <yanivma@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 19670529CC
	for <meta-arago@arago-project.org>;
	Mon, 20 Oct 2014 12:51:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9KCpqNu004399
	for <meta-arago@arago-project.org>; Mon, 20 Oct 2014 07:51:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9KCpqVk014184
	for <meta-arago@arago-project.org>; Mon, 20 Oct 2014 07:51:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 20 Oct 2014 07:51:52 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9KCppEY001785;	Mon, 20 Oct 2014 07:51:52 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 Oct 2014 15:45:25 +0300
Message-ID: <1413809125-713-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] bt-firmware: update BTS version 3.6.1
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
X-List-Received-Date: Mon, 20 Oct 2014 12:51:55 -0000
Content-Type: text/plain

- Updated repository to git.ti.com
- Updated the WL18xx service pack to 3.6.1

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index 9aff61a..4400215 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Firmware files for Bluetooth"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=4b46aed2a87412c84f9363a8db053e1b \
+LIC_FILES_CHKSUM = "file://am335x/LICENCE;md5=1c9961176d6529283e0d0c983be41b45 \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -11,12 +11,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r4+gitr${SRCPV}"
+PR = "r5+gitr${SRCPV}"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x"
 
-SRCREV = "7496df8d130f2db85d5d50b1f703213edf0b54fb"
-SRC_URI = "git://github.com/TI-ECS/bt-firmware.git;protocol=git \
+SRCREV = "fbcab22449ce930a4192ffeb470c168f4e85e0c6"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/wilink8-bt/ti-bt-firmware.git;branch=${BRANCH} \
            file://0001-Makefile-allow-building-within-the-OE.patch"
 
 PLATFORM = "unknown"
-- 
1.7.9


