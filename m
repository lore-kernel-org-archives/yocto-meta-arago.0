Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8F38652A48
	for <meta-arago@arago-project.org>;
	Thu,  4 May 2017 15:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B84420873;
	Thu,  4 May 2017 15:57:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Q0kQ1PitKEGi; Thu,  4 May 2017 15:57:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 751EB20066;
	Thu,  4 May 2017 15:57:24 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1268316247B;
	Thu,  4 May 2017 11:57:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  4 May 2017 11:57:23 -0400
Message-Id: <1493913443-131341-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] configs/farm/{distroless, poky}*: remove INSTALLER_PREFIX from mandatory list
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
X-List-Received-Date: Thu, 04 May 2017 15:57:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/distroless-master.txt | 2 +-
 configs/farm/distroless-morty.txt  | 2 +-
 configs/farm/poky-master.txt       | 2 +-
 configs/farm/poky-morty.txt        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-master.txt
index 969b2ae..542a98f 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-master.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
diff --git a/configs/farm/distroless-morty.txt b/configs/farm/distroless-morty.txt
index 9edc6e5..7d2e197 100644
--- a/configs/farm/distroless-morty.txt
+++ b/configs/farm/distroless-morty.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
index 9d202f3..cb8c6f9 100644
--- a/configs/farm/poky-master.txt
+++ b/configs/farm/poky-master.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
diff --git a/configs/farm/poky-morty.txt b/configs/farm/poky-morty.txt
index ab1d4d5..255c382 100644
--- a/configs/farm/poky-morty.txt
+++ b/configs/farm/poky-morty.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
-- 
2.7.4


