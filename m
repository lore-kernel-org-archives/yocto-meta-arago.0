Return-Path: <x0171695@psplinux052>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9F6D5529B0
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2013 12:37:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PCbqCj006637
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2013 07:37:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PCbquB012346;
	Wed, 25 Sep 2013 07:37:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 25 Sep 2013 07:37:50 -0500
Received: from psplinux052 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PCbnvt014847;
	Wed, 25 Sep 2013 07:37:50 -0500
Received: from x0171695 by psplinux052 with local (Exim 4.76)	(envelope-from
	<x0171695@psplinux052>)	id 1VOoLl-0005qh-GF;
	Wed, 25 Sep 2013 18:07:49 +0530
From: Deepak M <x0171695@ti.com>
To: <nageswari@ti.com>, <chase.maupin@ti.com>, <heroor@ti.com>,
	<fcooper@ti.com>, <denys@ti.com>, <maulik@ti.com>, <x0171695@ti.com>,
	<epos_dev@list.ti.com>, <meta-arago@arago-project.org>
Date: Wed, 25 Sep 2013 18:07:48 +0530
Message-ID: <1380112668-22445-1-git-send-email-x0171695@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Sep 2013 17:32:55 +0000
Subject: [meta-argao patch v3] arago-source-ipk: Added the new packages to generate the sourceipk
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
X-List-Received-Date: Wed, 25 Sep 2013 12:37:54 -0000
Content-Type: text/plain

Signed-off-by: Deepak M <x0171695@ti.com>
---
v3 changes:
1. Changed the aegis name to am43xx.
2. Added the meta-arago@arago-project.org for review.

 meta-arago-distro/conf/distro/arago-source-ipk.conf | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 63cad0d..1797091 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -142,6 +142,18 @@ CREATE_SRCIPK_pn-u-boot-am3517 = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-am3517 = "board-support/u-boot-${UVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 = "${MACHINE_ARCH}"
 
+CREATE_SRCIPK_pn-u-boot-am43xx = "1"
+SRCIPK_INSTALL_DIR_pn-u-boot-am43xx = "board-support/u-boot-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-u-boot-am43xx = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-ppa = "1"
+SRCIPK_INSTALL_DIR_pn-ppa = "board-support/ppa-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-ppa = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-linux-am43xx = "1"
+SRCIPK_INSTALL_DIR_pn-linux-am43xx = "board-support/linux-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-linux-am43xx = "${MACHINE_ARCH}"
+
 CREATE_SRCIPK_pn-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}"
 SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
-- 
1.8.1


