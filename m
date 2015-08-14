Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 84EC152A59
	for <meta-arago@arago-project.org>;
	Fri, 14 Aug 2015 11:45:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7EBjhq5007786
	for <meta-arago@arago-project.org>; Fri, 14 Aug 2015 06:45:43 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7EBjhdl000546
	for <meta-arago@arago-project.org>; Fri, 14 Aug 2015 06:45:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 14 Aug 2015 06:45:43 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7EBjhCC026968;
	Fri, 14 Aug 2015 06:45:43 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZQDQc-000436-Tu; Fri, 14 Aug 2015 07:45:42 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Aug 2015 07:45:40 -0400
Message-ID: <1439552740-15530-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tisdk-image: Use "TOOLCHAIN_SUFFIX" to find devkit
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
X-List-Received-Date: Fri, 14 Aug 2015 11:45:45 -0000
Content-Type: text/plain

* Previously, the suffix was hard-coded to "-tisdk".
* keystone machines use "meta-arago-toolchain" for the devkit which
  uses the suffix "-sdk"
* This caused one of the following to occur:
  - In multi-machine builds, the SDK would use the devkit from another
    machine
  - For keystone-only builds, the SDK would fail as it could not find
    the devkit.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass                    | 7 ++++---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 081040e..e5640bf 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -35,6 +35,7 @@ TISDK_TOOLCHAIN_PATH ?= "linux-devkit"
 
 # meta toolchain recipe to build and package as part of the tisdk image
 TISDK_TOOLCHAIN ?= "meta-toolchain-arago"
+TOOLCHAIN_SUFFIX ?= "-sdk"
 
 # List of the type of target file system images we want to include
 TARGET_IMAGE_TYPES ?= "tar.bz2 tar.gz ubi"
@@ -666,10 +667,10 @@ tisdk_image_setup () {
     mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
     mkdir -p ${IMAGE_ROOTFS}/lib
 
-    chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*.sh
+    chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh
 
     # Temporarily extract the toolchain sdk so we can read license information from it.
-    echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*.sh
+    echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh
 }
 
 tisdk_image_build () {
@@ -787,7 +788,7 @@ tisdk_image_build () {
 
     # Copy over the toolchain sdk installer an give it a simple name which
     # matches the traditional name within the SDK.
-    cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*.sh ${IMAGE_ROOTFS}/linux-devkit.sh
+    cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh ${IMAGE_ROOTFS}/linux-devkit.sh
 
     # Copy the opkg.conf used by the image to allow for future updates
     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index df6265d..aede390 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -31,8 +31,10 @@ TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
+TOOLCHAIN_SUFFIX = "-tisdk"
 
 TISDK_TOOLCHAIN_keystone = "meta-toolchain-arago"
+TOOLCHAIN_SUFFIX_keystone = "-sdk"
 
 IMAGE_INSTALL_QT = "\
     packagegroup-arago-tisdk-qte-sdk-host \
-- 
1.9.1


