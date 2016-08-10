Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 9E344529AA
	for <meta-arago@arago-project.org>;
	Wed, 10 Aug 2016 19:44:17 +0000 (UTC)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBP00FQRLH6OI80@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 10 Aug 2016 14:44:05 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=Yn3J_3Fnp01haV9CedMA:9
Received: by 100.15.86.14 with SMTP id 3d80fc9d; Wed, 10 Aug 2016 19:44:05 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 765AD1620E6;	Wed, 10 Aug 2016 15:43:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 10 Aug 2016 15:43:51 -0400
Message-id: <1470858232-3586-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1470858232-3586-1-git-send-email-denis@denix.org>
References: <1470858232-3586-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] tisdk-image, images: switch to tar.xz images to save on size and speed
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
X-List-Received-Date: Wed, 10 Aug 2016 19:44:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass                    | 6 +++---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 5 +++--
 meta-arago-distro/recipes-core/images/arago-test-image.bb        | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 9a7c7e8..78393ce 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -40,7 +40,7 @@ TISDK_TOOLCHAIN ?= "meta-toolchain-arago"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 
 # List of the type of target file system images we want to include
-TARGET_IMAGE_TYPES ?= "tar.bz2 tar.gz ubi"
+TARGET_IMAGE_TYPES ?= "tar.xz tar.gz ubi"
 
 # If EXTRA_TISDK_FILES points to a valid directory then all the contents
 # of that directory will be added to the SDK using the same directory
@@ -411,9 +411,9 @@ sw_manifest_target() {
     for image in ${TARGET_IMAGES}
     do
         # Only extract tar.gz or tar.bz2 types
-        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.bz2 ]
+        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
         then
-            tar xjf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.bz2 -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
         elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
         then
             tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index c8afb0e..806644c 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -3,7 +3,8 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
-IMAGE_FSTYPES = "tar.gz"
+IMAGE_FSTYPES = "tar.xz"
+IMAGE_NAME_SUFFIX = ""
 
 inherit tisdk-image
 
@@ -15,7 +16,7 @@ HOST_CLEANUP_PACKAGES = ""
 TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev"
 
 # Set DTB filters for each machine.  Use "unknown" by default to avoid
-# picking up DTB files for devices with not DTB support.
+# picking up DTB files for devices with no DTB support.
 DTB_FILTER = "unknown"
 DTB_FILTER_ti33x = "am335x"
 DTB_FILTER_omap5-evm = "omap5"
diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
index 403041f..911e9b8 100644
--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 require arago-image.inc
 
-IMAGE_FSTYPES = "tar.gz ext2.gz"
+IMAGE_FSTYPES = "tar.xz"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
-- 
2.7.4


