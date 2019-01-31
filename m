Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CB74D52093
	for <meta-arago@arago-project.org>;
	Thu, 31 Jan 2019 18:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BEF3A40B36;
	Thu, 31 Jan 2019 18:27:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1zs0OaVMboem; Thu, 31 Jan 2019 18:27:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A4F47407FE;
	Thu, 31 Jan 2019 18:27:06 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4655016A2BA;
	Thu, 31 Jan 2019 13:27:06 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 31 Jan 2019 13:26:56 -0500
Message-Id: <1548959216-35829-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] HACK: FIXME: arago-core-tisdk-image: disable "sdk-host" packagegroups
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
X-List-Received-Date: Thu, 31 Jan 2019 18:27:22 -0000

Custom-made srcipk packages are foreign to the system and have issues installing
into SDK. Disable for now, until resolved.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 76102a1..da5d44d 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -55,14 +55,15 @@ IMAGE_INSTALL_QT = "\
 IMAGE_INSTALL_QT_keystone = ""
 IMAGE_INSTALL_QT_omapl138 = ""
 
-IMAGE_INSTALL = "\
-    packagegroup-arago-tisdk-addons-sdk-host \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
-    packagegroup-arago-tisdk-crypto-sdk-host \
-    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
-    packagegroup-arago-tisdk-matrix-sdk-host \
-    packagegroup-arago-tisdk-multimedia-sdk-host \
-    packagegroup-arago-tisdk-hmi-sdk-host \
-    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
-    ${IMAGE_INSTALL_QT} \
-"
+IMAGE_INSTALL = ""
+# Disable all "sdk-host" packagegroups due to issues installing "srcipk" packages
+#    packagegroup-arago-tisdk-addons-sdk-host \
+#    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
+#    packagegroup-arago-tisdk-crypto-sdk-host \
+#    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
+#    packagegroup-arago-tisdk-matrix-sdk-host \
+#    packagegroup-arago-tisdk-multimedia-sdk-host \
+#    packagegroup-arago-tisdk-hmi-sdk-host \
+#    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
+#    ${IMAGE_INSTALL_QT} \
+#"
-- 
2.7.4


