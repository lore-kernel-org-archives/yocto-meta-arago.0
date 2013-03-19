Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 522D15203A
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:14:13 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFEBqt011343
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:14:12 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFEBJu005777
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 20:44:11 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 20:44:11 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE4lQ023952;
	Tue, 19 Mar 2013 20:44:10 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 10:13:59 -0500
Message-ID: <1363706042-10182-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
References: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] arago-source-ipk: Add TI u-boot and linux staging sources
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
X-List-Received-Date: Tue, 19 Mar 2013 15:14:13 -0000
Content-Type: text/plain

* Add the information required to package the TI staging
  u-boot and linux kernels as sourceipks to be included in the
  SDK.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 25a5d55..2fc8cbb 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -112,6 +112,14 @@ SRCIPK_INSTALL_DIR_pn-x-load = "board-support/x-load-${XVER}-psp${PSPREL}"
 SRCIPK_INSTALL_DIR_pn-x-load_beagleboard = "board-support/${P}"
 SRCIPK_PACKAGE_ARCH_pn-x-load = "${MACHINE_ARCH}"
 
+CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}-${PR}"
+SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-ti-staging = "1"
+SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
+
 CREATE_SRCIPK_pn-linux-omapl138-psp = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp = "board-support/linux-${KVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omapl138-psp = "${MACHINE_ARCH}"
-- 
1.7.0.4


