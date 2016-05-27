Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id A80B1529CA
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 21:46:08 +0000 (UTC)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7U0065NV4VIT60@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 27 May 2016 16:46:08 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=Tfx6FbW9faox3xlNFwYA:9
Received: by 100.15.86.14 with SMTP id 3d0b97c4; Fri, 27 May 2016 21:46:08 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D093F161A4C;	Fri,
	27 May 2016 17:46:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 27 May 2016 17:46:05 -0400
Message-id: <1464385565-5672-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v2] tisdk-image, meta-toolchain-arago: re-enable SW manifest
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
X-List-Received-Date: Fri, 27 May 2016 21:46:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

The fix to preserve packaging data in SDK is now upstream, enable SW manifest.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - bump PR to rebuild the devkit

 meta-arago-distro/classes/tisdk-image.bbclass               | 5 +++--
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 969daa7..7de6bae 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -9,7 +9,8 @@ IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
 
 # Always add the sdk_base feature
-IMAGE_FEATURES_prepend = "sdk_base package-management"
+IMAGE_FEATURES_prepend = "sdk_base package-management "
+SDKIMAGE_FEATURES_prepend = "package-management "
 
 # Define our always included sdk package group as the IMAGE_INSTALL settings
 # like you would expect.
@@ -835,7 +836,7 @@ tisdk_image_build () {
     fi
 
     # Create the TI software manifest
-#    generate_sw_manifest
+    generate_sw_manifest
 
     # Delete installed toolchain sdk since we need the toolchain sdk installer
     # not the extracted version
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 0f42484..749085b 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,13 +4,13 @@ TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
 TOOLCHAIN_CLEANUP_PACKAGES ?= ""
-SDKIMAGE_FEATURES = ""
+SDKIMAGE_FEATURES = "package-management"
 
 inherit toolchain-scripts
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r31"
+PR = "r32"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
-- 
2.2.0


