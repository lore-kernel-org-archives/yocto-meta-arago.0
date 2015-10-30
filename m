Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id F3C1B52979
	for <meta-arago@arago-project.org>;
	Fri, 30 Oct 2015 22:57:08 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NX2004R92ES5OD0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 30 Oct 2015 17:56:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=5lJygRwiOn0A:10 a=sozttTNsAAAA:8
	a=0iHrjgdJd6bmp2JVaukA:9	a=NN_cqhvSjkjGymRN:21 a=fG0rhuql58jryLOd:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 48E13161CBB;	Fri,
	30 Oct 2015 18:56:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 30 Oct 2015 18:56:51 -0400
Message-id: <1446245811-29182-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] configs, lib: add k2g machine
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
X-List-Received-Date: Fri, 30 Oct 2015 22:57:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-core-tisdk-fido-puget.txt |  4 ++--
 lib/oesdk/machine-specific-functions    |  2 +-
 lib/run-opentest                        | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/arago-core-tisdk-fido-puget.txt b/configs/arago-core-tisdk-fido-puget.txt
index d67163d..ac36deb 100644
--- a/configs/arago-core-tisdk-fido-puget.txt
+++ b/configs/arago-core-tisdk-fido-puget.txt
@@ -11,10 +11,10 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2015.08"
+TISDK_VERSION="2015.10"
 
 # This variable contains the list of machines to build an SDK for
-MACHINES="am335x-evm am437x-evm am37x-evm am3517-evm omap5-evm dra7xx-evm am57xx-evm beagleboard am180x-evm k2hk-evm k2e-evm k2l-evm"
+MACHINES="am335x-evm am437x-evm am37x-evm am3517-evm omap5-evm dra7xx-evm am57xx-evm beagleboard am180x-evm k2hk-evm k2e-evm k2g-evm k2l-evm"
 
 # These variables indicate the maximum number of parallel builds that can be
 # done for each architecture.  Some things to note are:
diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
index aea2721..1f4c5dd 100644
--- a/lib/oesdk/machine-specific-functions
+++ b/lib/oesdk/machine-specific-functions
@@ -21,7 +21,7 @@ parse_machines() {
                 ARM9_MACHINES="$ARM9_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""ARM9"
                 ;;
-            am335x-evm | am437x-evm | am37x-evm | am3517-evm | k2hk-evm | k2e-evm | k2l-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm | am57xx-evm )
+            am335x-evm | am437x-evm | am37x-evm | am3517-evm | k2hk-evm | k2e-evm | k2g-evm | k2l-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm | am57xx-evm )
                 CORTEX_MACHINES="$CORTEX_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""CORTEX"
                 ;;
diff --git a/lib/run-opentest b/lib/run-opentest
index ac774fb..63cbb77 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -8,6 +8,9 @@ set_opentest_platform() {
         am37x-evm|am180x-evm|am3517-evm|da850-omapl138-evm|beagleboard|beaglebone|am335x-evm|omap5-evm|dra7xx-evm|am57xx-evm )
             oplatform=$machine
             ;;
+        k2hk-evm|k2e-evm|k2g-evm|k2l-evm )
+            oplatform=$machine
+            ;;
         am437x-evm )
             oplatform="am43xx-gpevm"
             ;;
@@ -25,8 +28,8 @@ set_opentest_dtb() {
     machine="$1"
 
     case $machine in
-        am335x-evm )
-            odtb="am335x-evm.dtb"
+        am335x-evm|am57xx-evm|k2hk-evm|k2e-evm|k2g-evm|k2l-evm )
+            odtb="$machine.dtb"
             ;;
         beaglebone )
             odtb="am335x-boneblack.dtb"
@@ -40,9 +43,6 @@ set_opentest_dtb() {
         dra7xx-evm )
             odtb="dra7-evm.dtb"
             ;;
-        am57xx-evm )
-            odtb="am57xx-evm.dtb"
-            ;;
         * )
             odtb=""
             ;;
-- 
2.2.0


