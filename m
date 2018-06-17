Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6705B52A43
	for <meta-arago@arago-project.org>;
	Sun, 17 Jun 2018 19:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D170820B1F;
	Sun, 17 Jun 2018 19:37:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6ZAUT_NqgGOI; Sun, 17 Jun 2018 19:37:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9AD6320BCF;
	Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EE6EB1634B3;
	Sun, 17 Jun 2018 15:37:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 17 Jun 2018 15:37:39 -0400
Message-Id: <1529264260-41284-8-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264260-41284-1-git-send-email-denys@ti.com>
References: <1529264260-41284-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 8/9] arago-core-tisdk-image: add support for K3, use headless/server setup for now
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:52 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb  | 1 +
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index fcf843a..d55b709 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -6,6 +6,7 @@ DEPLOY_SPL_NAME_k2l = ""
 DEPLOY_SPL_NAME_k2e = ""
 # Only unset it for HS device, as k2g GP does provide MLO/SPL
 DEPLOY_SPL_NAME_k2g-hs-evm = ""
+DEPLOY_SPL_NAME_k3 = "tispl.bin"
 
 ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 7806337..4ad3ac3 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -7,7 +7,7 @@ IMAGE_NAME_SUFFIX = ""
 
 inherit tisdk-image
 
-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap-a15|keystone"
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap-a15|keystone|k3"
 
 # List of packages to remove from the host package.  This is usually due to
 # licensing issues and unneeded dependencies.
@@ -28,6 +28,7 @@ DTB_FILTER_k2l = "k2l"
 DTB_FILTER_k2e = "k2e"
 DTB_FILTER_k2g = "k2g"
 DTB_FILTER_omapl138 = "da850"
+DTB_FILTER_am65xx-evm = "am65"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
@@ -38,6 +39,7 @@ TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
 # Some devices do not support display and use a server image instead
 TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
 TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
+TARGET_IMAGES_k3 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
@@ -46,6 +48,8 @@ TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_keystone = "-tisdk-server"
 TISDK_TOOLCHAIN_omapl138 = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_omapl138 = "-tisdk-server"
+TISDK_TOOLCHAIN_k3 = "meta-toolchain-arago-tisdk-server"
+TOOLCHAIN_SUFFIX_k3 = "-tisdk-server"
 
 IMAGE_INSTALL_QT = "\
     packagegroup-arago-tisdk-qte-sdk-host \
@@ -53,6 +57,7 @@ IMAGE_INSTALL_QT = "\
 
 IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL_QT_omapl138 = ""
+IMAGE_INSTALL_QT_k3 = ""
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
-- 
2.7.4


