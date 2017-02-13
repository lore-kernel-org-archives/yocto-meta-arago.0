Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 3EF8F52AAA
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 23:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 87D5E20B53;
	Mon, 13 Feb 2017 23:07:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EhypVZF3kWy5; Mon, 13 Feb 2017 23:07:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 617EE20B89;
	Mon, 13 Feb 2017 23:07:23 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CBC4E162375;
	Mon, 13 Feb 2017 18:07:22 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 13 Feb 2017 18:07:18 -0500
Message-Id: <1487027238-101793-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487027238-101793-1-git-send-email-denys@ti.com>
References: <1487027238-101793-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 5/5] tisdk-image: add basic support for omapl138
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
X-List-Received-Date: Mon, 13 Feb 2017 23:07:27 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass                    | 3 +++
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 94c2718..cb47861 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -731,6 +731,9 @@ tisdk_image_build () {
     elif [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ]
     then
         cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ${prebuilt_dir}/
+    elif [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.ais ]
+    then
+        cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.ais ${prebuilt_dir}/
     else
         echo "Could not find the u-boot image"
         return 1
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 1115321..c619da5 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -34,18 +34,22 @@ TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 
 # Some devices do not support display and use a server image instead
 TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
+TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
 
 TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago-tisdk-server"
 TOOLCHAIN_SUFFIX_keystone = "-tisdk-server"
+TISDK_TOOLCHAIN_omapl138 = "meta-toolchain-arago-tisdk-server"
+TOOLCHAIN_SUFFIX_omapl138 = "-tisdk-server"
 
 IMAGE_INSTALL_QT = "\
     packagegroup-arago-tisdk-qte-sdk-host \
 "
 
 IMAGE_INSTALL_QT_keystone = ""
+IMAGE_INSTALL_QT_omapl138 = ""
 
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
-- 
2.7.4


