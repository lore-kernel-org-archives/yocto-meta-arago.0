Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BCBC952A9B
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:56:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Juaqo015506
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JuasC025158
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JuaCx016647;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthh5-0004V9-Ux; Tue, 03 Nov 2015 14:56:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:56:25 -0500
Message-ID: <1446580592-17255-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
References: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] arago-source-ipk: Enable sourceipks for keystone
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
X-List-Received-Date: Tue, 03 Nov 2015 19:56:39 -0000
Content-Type: text/plain

* Enable sourceipks for the folowing:
  - boot-monitor
  - hplib-mod
  - uio-module-drv

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index e84bc0c..2e93294 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -330,3 +330,12 @@ SRCIPK_INSTALL_DIR_pn-oe-layersetup = "bin/oe-layersetup"
 
 CREATE_SRCIPK_pn-opencl-examples = "1"
 SRCIPK_INSTALL_DIR_pn-opencl-examples = "example-applications/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-boot-monitor = "1"
+SRCIPK_INSTALL_DIR_pn-boot-monitor = "board-support/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-hplib-mod = "1"
+SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-uio-module-drv = "1"
+SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/${PN}-${PV}"
-- 
1.9.1


