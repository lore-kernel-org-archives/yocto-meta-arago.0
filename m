Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1D28252A69
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 14:34:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OEY3Ja011148
	for <meta-arago@arago-project.org>; Thu, 24 Jul 2014 09:34:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OEY3Fb003504
	for <meta-arago@arago-project.org>; Thu, 24 Jul 2014 09:34:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Jul 2014 09:34:02 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6OEY2q1023348;	Thu, 24 Jul 2014 09:34:02 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s6OEY0dF021826;	Thu, 24 Jul 2014 20:04:00 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 24 Jul 2014 09:33:58 -0500
Message-ID: <1406212438-8738-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-source-ipk: Update u-boot sources folder created by sourceipk
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
X-List-Received-Date: Thu, 24 Jul 2014 14:34:04 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* We no longer have any U-boot PSP recipes and instead mainline U-boot
  recipes are now the default "u-boot" recipe.
* Update the "u-boot" sources packaged by sourceipk to reflect this change.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index ccb6e2d..f6e1da7 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -107,7 +107,7 @@ CREATE_SRCIPK_pn-av-examples = "1"
 SRCIPK_INSTALL_DIR_pn-av-examples = "example-applications/av-examples-${PV}"
 
 CREATE_SRCIPK_pn-u-boot = "1"
-SRCIPK_INSTALL_DIR_pn-u-boot = "board-support/u-boot-${UVER}-psp${PSPREL}"
+SRCIPK_INSTALL_DIR_pn-u-boot = "board-support/u-boot-${PV}"
 # For beagleboard we use the git version which doesn't define UVER
 SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard = "board-support/${P}"
 SRCIPK_PACKAGE_ARCH_pn-u-boot = "${MACHINE_ARCH}"
-- 
1.7.9.5


