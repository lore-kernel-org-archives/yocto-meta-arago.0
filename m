Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A6784529E2
	for <meta-arago@arago-project.org>;
	Tue, 19 Jan 2016 16:24:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0JGOUXe020639
	for <meta-arago@arago-project.org>; Tue, 19 Jan 2016 10:24:30 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0JGOU4G020744
	for <meta-arago@arago-project.org>; Tue, 19 Jan 2016 10:24:30 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Jan 2016 10:24:29 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0JGOTBa027815;	Tue, 19 Jan 2016 10:24:29 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Jan 2016 11:24:27 -0500
Message-ID: <1453220667-28798-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] arago-source-ipk: update install dir for hplib-mod and uio-module-drv
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
X-List-Received-Date: Tue, 19 Jan 2016 16:24:37 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 6a61292..122ea2d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -340,10 +340,10 @@ CREATE_SRCIPK_pn-boot-monitor = "1"
 SRCIPK_INSTALL_DIR_pn-boot-monitor = "board-support/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-hplib-mod = "1"
-SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/${PN}-${PV}"
+SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-uio-module-drv = "1"
-SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/${PN}-${PV}"
+SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-pru-icss = "1"
 SRCIPK_INSTALL_DIR_pn-pru-icss = "example-applications/${PN}-${PV}"
-- 
1.9.1


