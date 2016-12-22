Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2712052AFB
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 21:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8FD8920A48;
	Thu, 22 Dec 2016 21:34:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fNou79gC9zUt; Thu, 22 Dec 2016 21:34:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 713FA207BD;
	Thu, 22 Dec 2016 21:34:24 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id AD6F81621ED;
	Thu, 22 Dec 2016 16:34:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 22 Dec 2016 16:34:22 -0500
Message-Id: <1482442462-6020-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] farm/arago-morty: add config for building morty branch in the farm
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
X-List-Received-Date: Thu, 22 Dec 2016 21:34:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/{arago-master.txt => arago-morty.txt} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 copy configs/farm/{arago-master.txt => arago-morty.txt} (98%)

diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-morty.txt
similarity index 98%
copy from configs/farm/arago-master.txt
copy to configs/farm/arago-morty.txt
index b077139..b419b20 100644
--- a/configs/farm/arago-master.txt
+++ b/configs/farm/arago-morty.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2016.08"
+TISDK_VERSION="2017.01"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
@@ -34,7 +34,7 @@ NUM_CORTEX_BUILDS="1"
 # These variables contain the location of the bin directory where the toolchain
 # for each architecture is installed.
 TOOLCHAIN_ROOT_ARM9=""
-TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2016.02/bin/"
+TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2016.11/bin/"
 
 # SECDEV variables for CAT and AUTO
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
@@ -59,7 +59,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-arago-master"
+BUILD_ROOT="/OE/farm-arago-morty"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
@@ -87,7 +87,7 @@ FS_FILTER="tisdk-*rootfs-"
 
 # This variable indicates the type of FS images being generated.  By default
 # this is tar.gz images.  This should match what you set in your recipes
-FS_IMAGE_TYPE="tar.gz"
+FS_IMAGE_TYPE="tar.xz"
 
 # This variable contains the "filter" string to look for inside of the
 # OE build directory to find the SDK image.  Since the image name can
@@ -96,7 +96,7 @@ SDK_FILTER="arago-core-tisdk-image-"
 
 # This variable indicates the type of SDK images being generated.  By default
 # this is tar.gz images.  This should match what you set in your recipes
-SDK_IMAGE_TYPE="tar.gz"
+SDK_IMAGE_TYPE="tar.xz"
 
 # This variable points to an NFS share which has been pre-configured.  The
 # target testing will be done by creating a subdirectory in this NFS_ROOT
@@ -123,7 +123,7 @@ CLEAN_ALL="false"
 
 # This is the configuration file to use in the oe-layertool-setup.sh script
 # to configure the build.
-CONFIG_FILE="${BUILD_ROOT}/configs/arago-master-config.txt"
+CONFIG_FILE="${BUILD_ROOT}/configs/arago-morty-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
 # This includes:
-- 
2.7.4


