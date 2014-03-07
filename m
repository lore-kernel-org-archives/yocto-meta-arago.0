Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 127E752A69
	for <meta-arago@arago-project.org>;
	Fri,  7 Mar 2014 18:53:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27IrO2J006052
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 12:53:24 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27IrOWA017759
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 12:53:24 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 12:53:24 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27IrLVQ031670;
	Fri, 7 Mar 2014 12:53:22 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Mar 2014 12:53:18 -0600
Message-ID: <1394218398-3317-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-source-ipk: Move cryptodev sources to extra-drivers directory
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
X-List-Received-Date: Fri, 07 Mar 2014 18:53:25 -0000
Content-Type: text/plain

* The root directory of board-support typically only has the kernel and u-boot
  sources while additional drivers are placed in the extra drivers directory.
* Move the cryptodev sources to fit this behavior. This would mimic where other
  drivers such as wifi/bluetooth and ocf are currently placed.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 691ba60..9b5c57e 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -188,7 +188,7 @@ SRCIPK_INSTALL_DIR_pn-linux-omapl1 = "board-support/linux-${KVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omapl1 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-cryptodev = "1"
-SRCIPK_INSTALL_DIR_pn-cryptodev = "board-support/cryptodev-${PV}"
+SRCIPK_INSTALL_DIR_pn-cryptodev = "board-support/extra-drivers/cryptodev-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-cryptodev = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
-- 
1.7.0.4


