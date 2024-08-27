Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B74C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 15:00:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.79958.1724770812607531819
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Aug 2024 08:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p4GHFwXQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47RF0BOJ075342;
	Tue, 27 Aug 2024 10:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724770811;
	bh=BXAEz+lVbg5k9KGwGAuqmPRb68MTTwFPdFlDcg2pjnI=;
	h=From:To:Subject:Date;
	b=p4GHFwXQ+RbxAy0HPaNrllgHrVzq57d2X3KAWdpb76Ip8mJAD61remmaUlEuduHrJ
	 8Mz5JwdaB2jNuA5UHNHNSVXy6r6M80xzLEeDGng5o0vL18TchaHFOh0L/+3x3gPLUN
	 GA8/d/HB5/Z+enla9FlnNq/JNDwfn+mK2YjlFqZ4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47RF0B8I004052
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2024 10:00:11 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Aug 2024 10:00:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Aug 2024 10:00:10 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47RF0Aim073311;
	Tue, 27 Aug 2024 10:00:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sixg2-0007f3-Jx; Tue, 27 Aug 2024 10:00:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH] conf/images: Add ARAGO_IMAGE_SUFFIX to image names
Date: Tue, 27 Aug 2024 10:00:10 -0500
Message-ID: <20240827150010.29408-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Aug 2024 15:00:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15546

When attempting to merge the build artifacts from bitbake into a new release
tarball coupled with running multiple bitbake builds for non-RT and RT kernels,
the common naming for the image files poses an issue that requires a manual rename
of the RT image file to make it unique.

This patch adds a new ARAGO_IMAGE_SUFFIX variable that is normally "", but for RT
builds is set to "-rt" so that the image files are different.

Backport from master: 9e10acff265c4dfcd150329641a71a6cd55c6572

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass            | 4 ++--
 meta-arago-distro/classes/tisdk-sw-manifest.bbclass       | 8 ++++----
 meta-arago-distro/conf/distro/arago.conf                  | 2 ++
 .../recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb  | 2 +-
 meta-arago-distro/recipes-core/images/arago-image.inc     | 2 +-
 meta-arago-distro/recipes-core/images/tisdk-base-image.bb | 2 +-
 .../recipes-core/images/tisdk-bootstrap-base-image.bb     | 2 +-
 .../recipes-core/images/tisdk-bootstrap-image.bb          | 2 +-
 .../recipes-core/images/tisdk-core-bundle.bb              | 2 +-
 .../recipes-core/images/tisdk-default-image.bb            | 2 +-
 .../recipes-core/images/tisdk-jailhouse-image.bb          | 2 +-
 .../recipes-core/images/tisdk-jailhouse-inmate.bb         | 2 +-
 .../recipes-core/images/tisdk-thinlinux-image.bb          | 2 +-
 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 2 +-
 .../recipes-core/images/tisdk-tiny-initramfs.bb           | 2 +-
 15 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 49504089..8050a8ff 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -165,9 +165,9 @@ tisdk_image_build () {
     do
         for type in ${TARGET_IMAGE_TYPES}
         do
-            if [ -e ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ]
+            if [ -e ${DEPLOY_DIR_IMAGE}/${image}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.${type} ]
             then
-                cp ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ${IMAGE_ROOTFS}/filesystem/
+                cp ${DEPLOY_DIR_IMAGE}/${image}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.${type} ${IMAGE_ROOTFS}/filesystem/
             fi
         done
     done
diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
index 14d14f08..7d8602f4 100644
--- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
+++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
@@ -403,12 +403,12 @@ sw_manifest_target() {
     for image in ${TARGET_IMAGES}
     do
         # Only extract tar.gz or tar.bz2 types
-        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
+        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}${ARAGO_IMAGE_SUFFIX}--${MACHINE}.tar.xz ]
         then
-            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
-        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
+            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}${ARAGO_IMAGE_SUFFIX}--${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}${ARAGO_IMAGE_SUFFIX}--${MACHINE}.tar.gz ]
         then
-            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}${ARAGO_IMAGE_SUFFIX}--${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
         fi
     done
 
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index e46ebd26..5c680d05 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -147,10 +147,12 @@ PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 SKIP_META_GNOME_SANITY_CHECK = "1"
 
 ARAGO_KERNEL_SUFFIX ?= ""
+ARAGO_IMAGE_SUFFIX ?= ""
 
 # Set real-time kernel suffix
 ARAGO_RT_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX:append = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
+ARAGO_IMAGE_SUFFIX:append = "${@oe.utils.conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
 
 # Set systest kernel suffix
 ARAGO_SYSTEST_ENABLE ?= "0"
diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
index 92822dc3..cc0111b6 100644
--- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
@@ -14,7 +14,7 @@ TARGET = "bootstrap-rootfs-${MACHINE}.cpio"
 
 do_install() {
 	install -d ${D}/boot
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}-${MACHINE}.cpio ${D}/boot/${TARGET}
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.cpio ${D}/boot/${TARGET}
 }
 
 FILES:${PN} = "/boot"
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 00308b57..17325619 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -14,7 +14,7 @@ IMAGE_INSTALL = " \
 	${CORE_IMAGE_EXTRA_INSTALL} \
 "
 
-export IMAGE_BASENAME = "arago-image"
+export IMAGE_BASENAME = "arago-image${ARAGO_IMAGE_SUFFIX}"
 
 IMAGE_LINGUAS = ""
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index 83f1899b..f5d5f29b 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -16,4 +16,4 @@ IMAGE_INSTALL += "\
     ${ARAGO_BASE_IMAGE_EXTRA_INSTALL} \
 "
 
-export IMAGE_BASENAME = "tisdk-base-image"
+export IMAGE_BASENAME = "tisdk-base-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
index 8b7f10c9..ce3b008e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
@@ -19,4 +19,4 @@ IMAGE_INSTALL += " \
 	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
 "
 
-export IMAGE_BASENAME = "tisdk-bootstrap-base-image"
+export IMAGE_BASENAME = "tisdk-bootstrap-base-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
index b41f09fb..5fe0463d 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
@@ -19,4 +19,4 @@ IMAGE_INSTALL += " \
 	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
 "
 
-export IMAGE_BASENAME = "tisdk-bootstrap-image"
+export IMAGE_BASENAME = "tisdk-bootstrap-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 9adb4f93..9c2bb015 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -17,4 +17,4 @@ DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x_sr2-gp-evm.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-hs-evm = " sysfw-am65x_sr2-hs-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
-export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
+export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 9c3446f3..858a10d4 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -33,7 +33,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-sysrepo \
 "
 
-export IMAGE_BASENAME = "tisdk-default-image"
+export IMAGE_BASENAME = "tisdk-default-image${ARAGO_IMAGE_SUFFIX}"
 
 # Disable ubi/ubifs as the filesystem requires more space than is
 # available on the HW.
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
index 339e4895..9240e0b9 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -11,6 +11,6 @@ COMPATIBLE_MACHINE = "am62xx|am62pxx"
 
 IMAGE_INSTALL += " jailhouse"
 
-export IMAGE_BASENAME = "tisdk-jailhouse-image"
+export IMAGE_BASENAME = "tisdk-jailhouse-image${ARAGO_IMAGE_SUFFIX}"
 
 WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
index 57efd009..aba5ee13 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
@@ -13,4 +13,4 @@ IMAGE_FSTYPES += "cpio"
 
 PACKAGE_INSTALL += "jailhouse-inmate"
 
-export IMAGE_BASENAME = "tisdk-jailhouse-inmate"
+export IMAGE_BASENAME = "tisdk-jailhouse-inmate${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index 13e86902..34494976 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -21,7 +21,7 @@ IMAGE_INSTALL += "\
     ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
 "
 
-export IMAGE_BASENAME = "tisdk-thinlinux-image"
+export IMAGE_BASENAME = "tisdk-thinlinux-image${ARAGO_IMAGE_SUFFIX}"
 
 # Disable ubi/ubifs as the filesystem requires more space than is
 # available on the HW.
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index c8a584bd..0bb6b798 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -20,4 +20,4 @@ IMAGE_INSTALL += " \
 
 DEPENDS += " tisdk-tiny-initramfs"
 
-export IMAGE_BASENAME = "tisdk-tiny-image"
+export IMAGE_BASENAME = "tisdk-tiny-image${ARAGO_IMAGE_SUFFIX}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
index 551cf67c..b9dc1550 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -22,7 +22,7 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 
 PACKAGE_INSTALL = "packagegroup-arago-initramfs"
 
-export IMAGE_BASENAME = "tisdk-tiny-initramfs"
+export IMAGE_BASENAME = "tisdk-tiny-initramfs${ARAGO_IMAGE_SUFFIX}"
 
 # To further reduce the size of the rootfs, remove the /boot directory from
 # the final image this is usually done by adding RDEPENDS_kernel-base = ""
-- 
2.17.1


