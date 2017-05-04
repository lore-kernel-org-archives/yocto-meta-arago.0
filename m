Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7847E52A44
	for <meta-arago@arago-project.org>;
	Thu,  4 May 2017 15:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2751320873;
	Thu,  4 May 2017 15:55:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id idRihF5rRFgv; Thu,  4 May 2017 15:55:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F334420066;
	Thu,  4 May 2017 15:55:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8613F16247B;
	Thu,  4 May 2017 11:55:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  4 May 2017 11:54:59 -0400
Message-Id: <1493913299-130887-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] configs/farm/{distroless, poky}*: remove SDK_FILTER from mandatory list
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
X-List-Received-Date: Thu, 04 May 2017 15:55:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/distroless-master.txt | 2 +-
 configs/farm/distroless-morty.txt  | 2 +-
 configs/farm/poky-master.txt       | 2 +-
 configs/farm/poky-morty.txt        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-master.txt
index bb7153a..969b2ae 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-master.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
diff --git a/configs/farm/distroless-morty.txt b/configs/farm/distroless-morty.txt
index cdea9b9..9edc6e5 100644
--- a/configs/farm/distroless-morty.txt
+++ b/configs/farm/distroless-morty.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
index 900f6a1..9d202f3 100644
--- a/configs/farm/poky-master.txt
+++ b/configs/farm/poky-master.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
diff --git a/configs/farm/poky-morty.txt b/configs/farm/poky-morty.txt
index 1b1aa72..ab1d4d5 100644
--- a/configs/farm/poky-morty.txt
+++ b/configs/farm/poky-morty.txt
@@ -6,7 +6,7 @@
 # that MUST be set to a value.  Failure to set these variables could
 # lead to corruption of the host system or the build script not
 # executing properly
-MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
+MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION INSTALLER_PREFIX"
 
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
-- 
2.7.4


