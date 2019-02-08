Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D65C3520E5
	for <meta-arago@arago-project.org>;
	Fri,  8 Feb 2019 00:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 83ADB40B57;
	Fri,  8 Feb 2019 00:22:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YCjVcYCDDXOm; Fri,  8 Feb 2019 00:22:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 644BB40024;
	Fri,  8 Feb 2019 00:22:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3447D169F71;
	Thu,  7 Feb 2019 19:22:15 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  7 Feb 2019 19:22:11 -0500
Message-Id: <1549585332-54431-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] tisdk-image.bbclass: do not fail when devkit is not specified
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
X-List-Received-Date: Fri, 08 Feb 2019 00:22:33 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index cb17d7d..40a81a2 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -643,10 +643,16 @@ EOF
 # Generate the TI SW Manifest for the SDK image
 generate_sw_manifest() {
     sw_manifest_header
-    sw_manifest_toolchain_host
+    if [ "${TISDK_TOOLCHAIN}" != "" ]
+    then
+        sw_manifest_toolchain_host
+    fi
     sw_manifest_target
     sw_manifest_host
-    sw_manifest_toolchain_target
+    if [ "${TISDK_TOOLCHAIN}" != "" ]
+    then
+        sw_manifest_toolchain_target
+    fi
     sw_manifest_footer
 }
 
@@ -699,10 +705,13 @@ tisdk_image_setup () {
     mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
     mkdir -p ${IMAGE_ROOTFS}/lib
 
-    chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh
+    if [ -e ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}.sh ]
+    then
+        chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh
 
-    # Temporarily extract the toolchain sdk so we can read license information from it.
-    echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh
+        # Temporarily extract the toolchain sdk so we can read license information from it.
+        echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}*.sh
+    fi
 }
 
 tisdk_image_build () {
@@ -867,7 +876,10 @@ tisdk_image_build () {
 
     # Copy over the toolchain sdk installer an give it a simple name which
     # matches the traditional name within the SDK.
-    cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}.sh ${IMAGE_ROOTFS}/linux-devkit.sh
+    if [ -e ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}.sh ]
+    then
+        cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}.sh ${IMAGE_ROOTFS}/linux-devkit.sh
+    fi
 
     # Copy the opkg.conf used by the image to allow for future updates
     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
-- 
2.7.4


