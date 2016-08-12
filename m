Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id C96D0529AE
	for <meta-arago@arago-project.org>;
	Fri, 12 Aug 2016 23:44:07 +0000 (UTC)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBT00CDHLWUUX20@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 12 Aug 2016 18:43:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=10mRZlE9BZS-hQOEZDAA:9
Received: by 100.15.86.14 with SMTP id 573823a3; Fri, 12 Aug 2016 23:43:52 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id C95B11620C3;	Fri, 12 Aug 2016 19:43:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 12 Aug 2016 19:43:41 -0400
Message-id: <1471045421-20205-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] images: make arago-base-tisdk-image proper initramfs, move test package from tisdk-image
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
X-List-Received-Date: Fri, 12 Aug 2016 23:44:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb       | 4 ++++
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb           | 1 -
 .../recipes-core/images/tisdk-server-extra-rootfs-image.bb            | 2 +-
 meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb    | 1 -
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index 93150c8..59e55c3 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -4,12 +4,16 @@
 require arago-image.inc
 inherit remove-net-rules
 
+IMAGE_FSTYPES += "cpio.xz"
+
 COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-a15|keystone"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
+    packagegroup-arago-test \
+    systemd-initramfs \
     "
 
 BAD_RECOMMENDATIONS += " \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 8747e52..5667b0f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -3,7 +3,6 @@
 require arago-base-tisdk-image.bb
 
 IMAGE_INSTALL += "\
-    packagegroup-arago-test \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
     packagegroup-arago-tisdk-qte \
     packagegroup-arago-tisdk-addons \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
index 48ea31d..aafb814 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
@@ -9,4 +9,4 @@ IMAGE_INSTALL += "\
 
 export IMAGE_BASENAME = "tisdk-server-extra-rootfs-image"
 
-IMAGE_FSTYPES = "tar.gz"
+IMAGE_FSTYPES = "tar.xz"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 3ce26a4..bd2a3c3 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -5,7 +5,6 @@ require arago-base-tisdk-image.bb
 SPLASH = ""
 
 IMAGE_INSTALL += "\
-    packagegroup-arago-test \
     packagegroup-arago-tisdk-addons \
     ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl','',d)} \
     packagegroup-arago-tisdk-crypto \
-- 
2.7.4


