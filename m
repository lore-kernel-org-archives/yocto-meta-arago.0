Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9455F52986
	for <meta-arago@arago-project.org>;
	Thu,  9 May 2019 04:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0171040BAA;
	Thu,  9 May 2019 04:15:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ylRvpycL1wN3; Thu,  9 May 2019 04:15:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E3F2840024;
	Thu,  9 May 2019 04:15:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A759C16EAB5;
	Thu,  9 May 2019 00:15:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  9 May 2019 00:15:54 -0400
Message-Id: <1557375354-42179-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image, configs/farm/arago-thud*: use TI_SECURE_DEV_PKG_K3
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
X-List-Received-Date: Thu, 09 May 2019 04:16:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/arago-thud-next.txt | 1 +
 configs/farm/arago-thud.txt      | 3 ++-
 lib/oesdk/bitbake-test-sdk-image | 4 ++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/configs/farm/arago-thud-next.txt b/configs/farm/arago-thud-next.txt
index 088a7b2..f98fb01 100644
--- a/configs/farm/arago-thud-next.txt
+++ b/configs/farm/arago-thud-next.txt
@@ -41,6 +41,7 @@ TOOLCHAIN_ROOT_AARCH64=""
 # SECDEV variables for CAT and AUTO
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
 
 # SYSFW_FILE variable
 #SYSFW_FILE="/opt/sysfw.bin"
diff --git a/configs/farm/arago-thud.txt b/configs/farm/arago-thud.txt
index 31a6b77..7e904e3 100644
--- a/configs/farm/arago-thud.txt
+++ b/configs/farm/arago-thud.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS NUM_AARCH64_BUILDS
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2019.03"
+TISDK_VERSION="2019.05"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
@@ -41,6 +41,7 @@ TOOLCHAIN_ROOT_AARCH64=""
 # SECDEV variables for CAT and AUTO
 TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
 TI_SECURE_DEV_PKG_AUTO="/opt/secdev-auto"
+TI_SECURE_DEV_PKG_K3="/opt/secdev-k3"
 
 # SYSFW_FILE variable
 #SYSFW_FILE="/opt/sysfw.bin"
diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
index 281935a..51796a6 100644
--- a/lib/oesdk/bitbake-test-sdk-image
+++ b/lib/oesdk/bitbake-test-sdk-image
@@ -407,6 +407,10 @@ bitbake_sdk_images(){
     then
         export TI_SECURE_DEV_PKG_AUTO
     fi
+    if [ ! -z $TI_SECURE_DEV_PKG_K3 ]
+    then
+        export TI_SECURE_DEV_PKG_K3
+    fi
     if [ ! -z $SYSFW_FILE ]
     then
         export SYSFW_FILE
-- 
2.7.4


