Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 43F9B529F6
	for <meta-arago@arago-project.org>;
	Wed,  1 Mar 2017 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1039B20B6A;
	Wed,  1 Mar 2017 21:14:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9vbmdFydf_4F; Wed,  1 Mar 2017 21:14:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4600209DA;
	Wed,  1 Mar 2017 21:14:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5A32C16230F;
	Wed,  1 Mar 2017 16:14:27 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  1 Mar 2017 16:14:26 -0500
Message-Id: <1488402866-73927-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] arago-morty*: add ARM9 support to farm configs
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
X-List-Received-Date: Wed, 01 Mar 2017 21:14:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/arago-morty-next.txt | 6 +++---
 configs/farm/arago-morty.txt      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/farm/arago-morty-next.txt b/configs/farm/arago-morty-next.txt
index 58a1eba..b0bf691 100644
--- a/configs/farm/arago-morty-next.txt
+++ b/configs/farm/arago-morty-next.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2017.01"
+TISDK_VERSION="2017.03"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
@@ -28,12 +28,12 @@ MACHINES=""
 #   4. In the case of just a couple of machines it may be faster to do only
 #      one build building both serially rather than two parallel builds
 #      depending on your system resources
-NUM_ARM9_BUILDS="0"
+NUM_ARM9_BUILDS="1"
 NUM_CORTEX_BUILDS="1"
 
 # These variables contain the location of the bin directory where the toolchain
 # for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
+TOOLCHAIN_ROOT_ARM9="/opt/linaro-2016.11-armv5/bin/"
 TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2016.11/bin/"
 
 # SECDEV variables for CAT and AUTO
diff --git a/configs/farm/arago-morty.txt b/configs/farm/arago-morty.txt
index b419b20..3a76a02 100644
--- a/configs/farm/arago-morty.txt
+++ b/configs/farm/arago-morty.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2017.01"
+TISDK_VERSION="2017.03"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
@@ -28,12 +28,12 @@ MACHINES=""
 #   4. In the case of just a couple of machines it may be faster to do only
 #      one build building both serially rather than two parallel builds
 #      depending on your system resources
-NUM_ARM9_BUILDS="0"
+NUM_ARM9_BUILDS="1"
 NUM_CORTEX_BUILDS="1"
 
 # These variables contain the location of the bin directory where the toolchain
 # for each architecture is installed.
-TOOLCHAIN_ROOT_ARM9=""
+TOOLCHAIN_ROOT_ARM9="/opt/linaro-2016.11-armv5/bin/"
 TOOLCHAIN_ROOT_CORTEX="/opt/linaro-2016.11/bin/"
 
 # SECDEV variables for CAT and AUTO
-- 
2.7.4


