Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2E6725299C
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 14:26:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74EQE5b020200
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 09:26:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74EQEqG002689
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 09:26:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 09:26:14 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74EQD2P015487;
	Tue, 4 Aug 2015 09:26:14 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMdAT-00019e-GQ; Tue, 04 Aug 2015 10:26:13 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 10:26:08 -0400
Message-ID: <1438698368-4405-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] arago-source-ipk: Enable omapdrm-pvr sourceipk.
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
X-List-Received-Date: Tue, 04 Aug 2015 14:26:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 0940e0d..54a2536 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -193,6 +193,9 @@ SRCIPK_INSTALL_DIR_pn-debugss-module-drv = "board-support/extra-drivers/${PN}-${
 CREATE_SRCIPK_pn-gdbserverproxy-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv = "board-support/extra-drivers/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-omapdrm-pvr = "1"
+SRCIPK_INSTALL_DIR_pn-omapdrm-pvr = "board-support/extra-drivers/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
 
-- 
1.9.1


