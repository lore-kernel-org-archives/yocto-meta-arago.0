Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 226A8529D7
	for <meta-arago@arago-project.org>;
	Thu, 15 Mar 2018 20:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B4FF220B95;
	Thu, 15 Mar 2018 20:27:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ku1TankGJ5T4; Thu, 15 Mar 2018 20:27:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8CE5220B94;
	Thu, 15 Mar 2018 20:27:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 12BFC16332D;
	Thu, 15 Mar 2018 16:27:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Mar 2018 16:27:16 -0400
Message-Id: <1521145636-51889-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521145636-51889-1-git-send-email-denys@ti.com>
References: <1521145636-51889-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] images: re-enable matrix, as php no longer blacklised upstream
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
X-List-Received-Date: Thu, 15 Mar 2018 20:28:15 -0000

This reverts commit eb3bb15505c323caff683781bea5008f8a417af0.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc   | 3 +--
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb        | 5 ++---
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 3 +--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index e369c3f..673a56d 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -51,13 +51,12 @@ IMAGE_INSTALL_QT = "\
 IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL_QT_omapl138 = ""
 
-# Disable in master due to php breakage
-#    packagegroup-arago-tisdk-matrix-sdk-host
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
     packagegroup-arago-tisdk-crypto-sdk-host \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
+    packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
     packagegroup-arago-tisdk-hmi-sdk-host \
     packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 471bbc7..e40dc1f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -2,9 +2,6 @@
 
 require arago-image.inc
 
-# Disabled in master due to php breakage
-#    packagegroup-arago-tisdk-matrix
-#    packagegroup-arago-tisdk-matrix-extra
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
@@ -17,6 +14,8 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
+    packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 5f4caa6..b64d092 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -4,12 +4,11 @@ require arago-base-tisdk-image.bb
 
 SPLASH = ""
 
-# Disable in master due to php breakage
-#    packagegroup-arago-tisdk-matrix
 IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-addons \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
     packagegroup-arago-tisdk-crypto \
+    packagegroup-arago-tisdk-matrix \
     packagegroup-arago-base-tisdk-server-extra \
     packagegroup-arago-tisdk-connectivity \
 "
-- 
2.7.4


