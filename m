Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C730E52976
	for <meta-arago@arago-project.org>;
	Wed, 10 Jul 2019 15:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2DFD440BC9;
	Wed, 10 Jul 2019 15:45:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hpHCAmSIJS0l; Wed, 10 Jul 2019 15:45:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 196C440BA5;
	Wed, 10 Jul 2019 15:45:56 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 70535170DFE;
	Wed, 10 Jul 2019 11:45:55 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 10 Jul 2019 11:45:53 -0400
Message-Id: <1562773553-11625-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] arago-core-tisdk-image, matrix: switch off "server" mode rootfs fro J7
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
X-List-Received-Date: Wed, 10 Jul 2019 15:46:45 -0000

Now, that display and graphics limitations are resolved, J7 can build full rootfs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 4 ----
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb          | 1 -
 2 files changed, 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 4b1a338..bff7a55 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -40,7 +40,6 @@ TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
 # Some devices do not support display and use a server image instead
 TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
 TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
-TARGET_IMAGES_j7-evm = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
@@ -49,8 +48,6 @@ TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_keystone = "-tisdk-server"
 TISDK_TOOLCHAIN_omapl138 = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_omapl138 = "-tisdk-server"
-TISDK_TOOLCHAIN_j7-evm = "meta-toolchain-arago-tisdk-server"
-TOOLCHAIN_SUFFIX_j7-evm = "-tisdk-server"
 
 IMAGE_INSTALL_QT = "\
     packagegroup-arago-tisdk-qte-sdk-host \
@@ -58,7 +55,6 @@ IMAGE_INSTALL_QT = "\
 
 IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL_QT_omapl138 = ""
-IMAGE_INSTALL_QT_j7-evm = ""
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index e14205a..82f9d07 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -58,7 +58,6 @@ do_install(){
 GUIDEPS = "matrix-gui-browser refresh-screen"
 GUIDEPS_keystone = ""
 GUIDEPS_omapl138 = ""
-GUIDEPS_j7-evm = ""
 
 RDEPENDS_${PN} += "matrix-lighttpd-config lighttpd lighttpd-module-cgi lighttpd-module-compress lighttpd-module-expire php php-cgi php-cli ${GUIDEPS}"
 
-- 
2.7.4


