Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2383252A27
	for <meta-arago@arago-project.org>;
	Tue, 21 Mar 2017 01:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 15FBD20B95;
	Tue, 21 Mar 2017 01:43:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rWtWN0DD9WXw; Tue, 21 Mar 2017 01:43:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B077E20B6A;
	Tue, 21 Mar 2017 01:43:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 367A5162418;
	Mon, 20 Mar 2017 21:43:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 20 Mar 2017 21:43:02 -0400
Message-Id: <1490060589-72852-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490060589-72852-1-git-send-email-denis@denix.org>
References: <1490060589-72852-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 05/12] HACK: images: disable matrix, as php was blacklised upstream for breakage
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
X-List-Received-Date: Tue, 21 Mar 2017 01:43:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc   | 3 ++-
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb        | 3 ++-
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 71041f8..98e824d 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -51,12 +51,13 @@ IMAGE_INSTALL_QT = "\
 IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL_QT_omapl138 = ""
 
+# Disable in master due to php breakage
+#    packagegroup-arago-tisdk-matrix-sdk-host
 IMAGE_INSTALL = "\
     packagegroup-arago-tisdk-addons-sdk-host \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
     packagegroup-arago-tisdk-crypto-sdk-host \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
-    packagegroup-arago-tisdk-matrix-sdk-host \
     packagegroup-arago-tisdk-multimedia-sdk-host \
     packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
     ${IMAGE_INSTALL_QT} \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index c511b83..3744d0b 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -2,6 +2,8 @@
 
 require arago-image.inc
 
+# Disbaled in master due to php breakage
+#    packagegroup-arago-tisdk-matrix
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
@@ -14,7 +16,6 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-matrix \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index b64d092..5f4caa6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -4,11 +4,12 @@ require arago-base-tisdk-image.bb
 
 SPLASH = ""
 
+# Disable in master due to php breakage
+#    packagegroup-arago-tisdk-matrix
 IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-addons \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
     packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-matrix \
     packagegroup-arago-base-tisdk-server-extra \
     packagegroup-arago-tisdk-connectivity \
 "
-- 
2.7.4


