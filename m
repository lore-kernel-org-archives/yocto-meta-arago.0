Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 4733552A17
	for <meta-arago@arago-project.org>;
	Wed, 17 Aug 2016 20:36:03 +0000 (UTC)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OC200867MJ2FN10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 17 Aug 2016 15:35:41 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=9MPzaAtU0Zhayo8ZNAYA:9
Received: by 100.15.86.14 with SMTP id 17820f52; Wed, 17 Aug 2016 20:35:41 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 1B914162103;	Wed, 17 Aug 2016 16:35:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 17 Aug 2016 16:35:25 -0400
Message-id: <1471466125-28176-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1471466125-28176-1-git-send-email-denis@denix.org>
References: <1471466125-28176-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] images: unify and clean up image recipes a bit
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
X-List-Received-Date: Wed, 17 Aug 2016 20:36:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Move common pieces to arago-image.inc and don't include base image from
tisdk-rootfs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-base-tisdk-image.bb        | 16 ++--------------
 meta-arago-distro/recipes-core/images/arago-image.inc    | 13 ++++++++++++-
 .../recipes-core/images/tisdk-rootfs-image.bb            | 12 ++++++++----
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index 59e55c3..6ce97ee 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -1,13 +1,10 @@
-# Arago TI SDK base image
-# gives you an image with Qt/E and other common packages shared by all TI SDKs.
+# Arago TI SDK base image with test tools
+# Suitable for initramfs
 
 require arago-image.inc
-inherit remove-net-rules
 
 IMAGE_FSTYPES += "cpio.xz"
 
-COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-a15|keystone"
-
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
@@ -16,13 +13,4 @@ IMAGE_INSTALL += "\
     systemd-initramfs \
     "
 
-BAD_RECOMMENDATIONS += " \
-    ti-llvm3.6-dev \
-    opencl-monitor-dev \
-    libulm-dev \
-    gdbserver-c6x-dev \
-    coreutils \
-    coreutils-dev \
-"
-
 export IMAGE_BASENAME = "arago-base-tisdk-image"
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 1c566ae..44d8f91 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -3,6 +3,8 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x|ti43x|omap4|omap-a15|keystone"
+
 IMAGE_FEATURES += "package-management splash"
 
 # 4KB per 1 inode should be enough
@@ -37,4 +39,13 @@ make_bootfiles_symlinks_relative() {
 
 ROOTFS_POSTPROCESS_COMMAND += "make_bootfiles_symlinks_relative;"
 
-inherit core-image
+BAD_RECOMMENDATIONS += " \
+    ti-llvm3.6-dev \
+    opencl-monitor-dev \
+    libulm-dev \
+    gdbserver-c6x-dev \
+    coreutils \
+    coreutils-dev \
+"
+
+inherit core-image remove-net-rules
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 5667b0f..15ac703 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -1,11 +1,14 @@
-# Arago TI SDK filesystem image
+# Arago TI SDK full filesystem image
 
-require arago-base-tisdk-image.bb
+require arago-image.inc
 
 IMAGE_INSTALL += "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    packagegroup-arago-test \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
     packagegroup-arago-tisdk-qte \
-    packagegroup-arago-tisdk-addons \
     ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
@@ -13,7 +16,8 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-matrix \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-amsdk \
+    packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-"
+    "
 
 export IMAGE_BASENAME = "tisdk-rootfs-image"
-- 
2.7.4


