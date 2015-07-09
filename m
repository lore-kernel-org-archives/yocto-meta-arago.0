Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 3B9045298F
	for <meta-arago@arago-project.org>;
	Thu,  9 Jul 2015 22:56:26 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NR8005CXT1MGC90@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 09 Jul 2015 17:56:25 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=y32JrbNLYq2blW889-cA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EE3E2161B0B;	Thu,
	9 Jul 2015 18:56:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 09 Jul 2015 18:56:09 -0400
Message-id: <1436482569-9469-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1436482569-9469-1-git-send-email-denis@denix.org>
References: <1436482569-9469-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] tisdk-image.bbclass: update to accomodate 64 bit SDK and stricter .sh filter
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
X-List-Received-Date: Thu, 09 Jul 2015 22:56:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 2a4c31a..081040e 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -348,7 +348,7 @@ EOF
 
 # Create the host side toolchain components table
 sw_manifest_toolchain_host() {
-    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/i686-*-linux/var/lib/opkg"
+    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*86*-linux/var/lib/opkg"
 
     sw_manifest_table_header "GPLv3 Development Host Content" "This table describes any GPLv3 software being delivered that is expected to run on a Development Host, instead of the target device."
 
@@ -666,10 +666,10 @@ tisdk_image_setup () {
     mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
     mkdir -p ${IMAGE_ROOTFS}/lib
 
-    chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*
+    chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*.sh
 
     # Temporarily extract the toolchain sdk so we can read license information from it.
-    echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*
+    echo "${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}" | ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*.sh
 }
 
 tisdk_image_build () {
@@ -787,7 +787,7 @@ tisdk_image_build () {
 
     # Copy over the toolchain sdk installer an give it a simple name which
     # matches the traditional name within the SDK.
-    cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk* ${IMAGE_ROOTFS}/linux-devkit.sh
+    cp ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*.sh ${IMAGE_ROOTFS}/linux-devkit.sh
 
     # Copy the opkg.conf used by the image to allow for future updates
     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
-- 
2.2.0


