Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 6A81D52A2B
	for <meta-arago@arago-project.org>;
	Mon, 11 May 2015 21:06:08 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO7001M2ELG3620@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 May 2015 16:05:45 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ZJdgQs+z c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8 a=lRxpQPx1AAAA:8	a=5apD6sYUTeHNDGmSBxQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3153720091;	Mon,
	11 May 2015 17:05:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 May 2015 17:05:38 -0400
Message-id: <1431378339-10594-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] recipes: inherit allarch instead of simply PACKAGE_ARCH = "all"
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
X-List-Received-Date: Mon, 11 May 2015 21:06:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

allarch.bbclass does slightly more than just setting PACKAGE_ARCH = "all" so
the resulting package's sstate and siginfo won't also change from machine to
machine, making it trully allarch. Part of md5sum package mismatch fixes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb     | 4 ++--
 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb   | 4 ++--
 meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
index ff54341..bb1ae13 100644
--- a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
+++ b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Package that contains a script to setup oe-core development envir
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r0"
+PR = "r1"
 
-PACKAGE_ARCH = "all"
+inherit allarch
 
 BRANCH ?= "master"
 SRCREV = "e58f941784fb45fd826779a45b33973e6342700f"
diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
index 664782b..1c821f9 100644
--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Firmware files for use with TI wl18xx"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
-PACKAGE_ARCH = "all"
+inherit allarch
 
 PV = "R8.5"
 
-PR = "r5+gitr${SRCPV}"
+PR = "r6+gitr${SRCPV}"
 
 PROVIDES += "wl12xx-firmware"
 RPROVIDES_${PN} += "wl12xx-firmware"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
index ab2d813..2f2ed54 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-generic-pm_2.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 require matrix-gui-apps-git.inc
 
 LIC_FILES_CHKSUM := "file://../../${LICENSE_CHECKSUM}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-PACKAGE_ARCH = "all"
+inherit allarch
 
 S = "${WORKDIR}/git/power_apps/pm_generic_power"
 
-- 
2.2.0


