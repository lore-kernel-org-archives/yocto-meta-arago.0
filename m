Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 96C185298B
	for <meta-arago@arago-project.org>;
	Tue, 19 May 2020 00:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E179040B9D;
	Tue, 19 May 2020 00:38:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ffSycVNLOiAK; Tue, 19 May 2020 00:38:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A2B4B40A18;
	Tue, 19 May 2020 00:38:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 61B6717316F;
	Mon, 18 May 2020 20:38:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 18 May 2020 20:38:01 -0400
Message-Id: <1589848681-37385-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] packagegroup, source-ipk: arm-trusted-firmware -> trusted-firmware-a
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
X-List-Received-Date: Tue, 19 May 2020 00:40:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc          | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 95a27bf..fabb648 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -145,9 +145,9 @@ SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
 CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
 
-CREATE_SRCIPK_pn-arm-trusted-firmware = "1"
-SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware = "board-support/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware = "true"
+CREATE_SRCIPK_pn-trusted-firmware-a = "1"
+SRCIPK_INSTALL_DIR_pn-trusted-firmware-a = "board-support/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT_pn-trusted-firmware-a = "true"
 
 CREATE_SRCIPK_pn-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 9336687..adfcfa3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -39,7 +39,7 @@ UTILS_append_k2g = " \
 UTILS_append_k3 = " \
     jailhouse-src \
     ti-sci-fw-source \
-    arm-trusted-firmware-src \
+    trusted-firmware-a-src \
 "
 
 UTILS_append_j7 = " \
-- 
2.7.4


