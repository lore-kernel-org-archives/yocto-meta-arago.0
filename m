Return-Path: <e-ruei1@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 484E35299E
	for <meta-arago@arago-project.org>;
	Thu, 27 Oct 2016 21:55:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9RLtEXl016172
	for <meta-arago@arago-project.org>; Thu, 27 Oct 2016 16:55:14 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RLtEGs017396
	for <meta-arago@arago-project.org>; Thu, 27 Oct 2016 16:55:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Oct 2016 16:55:13 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9RLtDZr004138	for <meta-arago@arago-project.org>;
	Thu, 27 Oct 2016 16:55:13 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Oct 2016 17:55:10 -0400
Message-ID: <1477605310-15958-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] arago-source-ipk.conf: add SRCIPK for ti-gc320-driver
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
X-List-Received-Date: Thu, 27 Oct 2016 21:55:15 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 90ae80f..96f2db2 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -206,6 +206,9 @@ SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv = "board-support/extra-drivers/$
 CREATE_SRCIPK_pn-ti-sgx-ddk-km = "1"
 SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-ti-gc320-driver = "1"
+SRCIPK_INSTALL_DIR_pn-ti-gc320-driver = "board-support/extra-drivers/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
 
-- 
1.9.1


