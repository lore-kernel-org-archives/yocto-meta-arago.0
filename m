Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 516E05299F
	for <meta-arago@arago-project.org>;
	Mon, 19 Sep 2016 23:23:49 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODR00C10YBNZ780@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 19 Sep 2016 18:23:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=SuVqM90zMaeU9C8CWdcA:9
Received: by 100.15.110.130 with SMTP id 01751542;
	Mon, 19 Sep 2016 23:23:47 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id B4415162138;	Mon, 19 Sep 2016 19:23:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 19 Sep 2016 19:23:46 -0400
Message-id: <1474327426-15554-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] machine-specific-functions, run-opentest: add am335x-hs-evm and k2e-hs-evm platforms
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
X-List-Received-Date: Mon, 19 Sep 2016 23:23:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/machine-specific-functions |  2 +-
 lib/run-opentest                     | 24 ++++++++++++++++++------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
index 6d100d4..17d70de 100644
--- a/lib/oesdk/machine-specific-functions
+++ b/lib/oesdk/machine-specific-functions
@@ -21,7 +21,7 @@ parse_machines() {
                 ARM9_MACHINES="$ARM9_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""ARM9"
                 ;;
-            am335x-evm | am437x-evm | am437x-hs-evm | am37x-evm | am3517-evm | k2hk-evm | k2e-evm | k2g-evm | k2l-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm | dra7xx-hs-evm | am57xx-evm | am57xx-hs-evm )
+            am335x-evm | am335x-hs-evm | am437x-evm | am437x-hs-evm | am37x-evm | am3517-evm | k2hk-evm | k2e-evm | k2e-hs-evm | k2g-evm | k2l-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm | dra7xx-hs-evm | am57xx-evm | am57xx-hs-evm )
                 CORTEX_MACHINES="$CORTEX_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""CORTEX"
                 ;;
diff --git a/lib/run-opentest b/lib/run-opentest
index cb164d4..dde0596 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -16,6 +16,9 @@ set_opentest_platform() {
         am437x-evm )
             oplatform="am43xx-gpevm"
             ;;
+        am335x-hs-evm )
+            oplatform="am335x-hsevm"
+            ;;
         am437x-hs-evm )
             oplatform="am43xx-hsevm"
             ;;
@@ -25,6 +28,9 @@ set_opentest_platform() {
         dra7xx-hs-evm )
             oplatform="dra7xx-hsevm"
             ;;
+        k2e-hs-evm )
+            oplatform="k2e-hsevm"
+            ;;
         * )
             return 2
             ;;
@@ -42,6 +48,12 @@ set_opentest_dtb() {
         am335x-evm|am57xx-evm )
             odtb="$machine.dtb"
             ;;
+        am335x-hs-evm )
+            odtb="am335x-evm.dtb"
+            ;;
+        am57xx-hs-evm )
+            odtb="am57xx-evm.dtb"
+            ;;
         beaglebone )
             odtb="am335x-boneblack.dtb"
             ;;
@@ -51,21 +63,21 @@ set_opentest_dtb() {
         am437x-hs-evm )
             odtb="am437x-gp-evm.dtb"
             ;;
-        dra7xx-hs-evm )
+        dra7xx-evm )
             odtb="dra7-evm.dtb"
             ;;
-        am57xx-hs-evm )
-            odtb="am57xx-evm.dtb"
+        dra7xx-hs-evm )
+            odtb="dra7-evm.dtb"
             ;;
         omap5-evm )
             odtb="omap5-uevm.dtb"
             ;;
-        dra7xx-evm )
-            odtb="dra7-evm.dtb"
-            ;;
         k2hk-evm|k2e-evm|k2g-evm|k2l-evm )
             odtb="keystone-$machine.dtb"
             ;;
+        k2e-hs-evm )
+            odtb="keystone-k2e.dtb"
+            ;;
         * )
             odtb=""
             ;;
-- 
2.7.4


