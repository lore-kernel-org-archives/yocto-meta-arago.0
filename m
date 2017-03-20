Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 543AC52A22
	for <meta-arago@arago-project.org>;
	Mon, 20 Mar 2017 17:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 356B3208FB;
	Mon, 20 Mar 2017 17:43:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YulWfOBCjV6X; Mon, 20 Mar 2017 17:43:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 14903208E3;
	Mon, 20 Mar 2017 17:43:02 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9D7F41623E9;
	Mon, 20 Mar 2017 13:43:01 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 20 Mar 2017 13:43:01 -0400
Message-Id: <1490031781-38601-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] arago-source-ipk: remove few outdated entries
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
X-List-Received-Date: Mon, 20 Mar 2017 17:43:03 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc       | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 8435bc0..f05acf7 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -130,18 +130,6 @@ SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
 CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
 
-CREATE_SRCIPK_pn-u-boot-am180x = "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-am180x = "board-support/u-boot-${UVER}-psp${PSPREL}"
-
-CREATE_SRCIPK_pn-u-boot-am37x = "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-am37x = "board-support/u-boot-${UVER}-psp${PSPREL}"
-
-CREATE_SRCIPK_pn-u-boot-am33x = "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-am33x = "board-support/u-boot-${UVER}-psp${PSPREL}"
-
-CREATE_SRCIPK_pn-u-boot-am3517 = "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-am3517 = "board-support/u-boot-${UVER}-psp${PSPREL}"
-
 CREATE_SRCIPK_pn-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
@@ -167,12 +155,6 @@ CREATE_SRCIPK_pn-linux-keystone = "1"
 SRCIPK_INSTALL_DIR_pn-linux-keystone = "board-support/linux-${PV}"
 SRCIPK_PRESERVE_GIT_pn-linux-keystone = "true"
 
-CREATE_SRCIPK_pn-linux-omapl138-psp = "1"
-SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp = "board-support/linux-${KVER}-psp${PSPREL}"
-
-CREATE_SRCIPK_pn-linux-omap-psp = "1"
-SRCIPK_INSTALL_DIR_pn-linux-omap-psp = "board-support/linux-${KVER}-psp${PSPREL}"
-
 CREATE_SRCIPK_pn-linux-am335x-psp = "1"
 SRCIPK_INSTALL_DIR_pn-linux-am335x-psp = "board-support/linux-${KVER}"
 
@@ -185,12 +167,6 @@ SRCIPK_INSTALL_DIR_pn-linux = "board-support/linux-${PV}"
 CREATE_SRCIPK_pn-linux-omap4 = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
 
-CREATE_SRCIPK_pn-linux-davinci = "1"
-SRCIPK_INSTALL_DIR_pn-linux-davinci = "board-support/linux-${KVER}-psp${PSPREL}"
-
-CREATE_SRCIPK_pn-linux-omapl1 = "1"
-SRCIPK_INSTALL_DIR_pn-linux-omapl1 = "board-support/linux-${KVER}-psp${PSPREL}"
-
 CREATE_SRCIPK_pn-cryptodev-module = "1"
 SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
 
-- 
2.7.4


