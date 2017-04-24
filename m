Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 41D3F52090
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 22:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 17A7020B85;
	Mon, 24 Apr 2017 22:45:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id USHwaAiQazA3; Mon, 24 Apr 2017 22:45:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E8CC92006A;
	Mon, 24 Apr 2017 22:45:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6DF09162473;
	Mon, 24 Apr 2017 18:45:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 24 Apr 2017 18:44:59 -0400
Message-Id: <1493073899-24051-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] machine-specific-functions, run-opentest: add k2hk-hs-evm and k2g-hs-evm
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
X-List-Received-Date: Mon, 24 Apr 2017 22:45:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/machine-specific-functions |  2 +-
 lib/run-opentest                     | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
index 1a2cea0..38ea670 100644
--- a/lib/oesdk/machine-specific-functions
+++ b/lib/oesdk/machine-specific-functions
@@ -21,7 +21,7 @@ parse_machines() {
                 ARM9_MACHINES="$ARM9_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""ARM9"
                 ;;
-            am335x-evm | am335x-hs-evm | am437x-evm | am437x-hs-evm | am37x-evm | am3517-evm | k2hk-evm | k2e-evm | k2e-hs-evm | k2g-evm | k2g-ice | k2l-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm | dra7xx-hs-evm | am57xx-evm | am57xx-hs-evm )
+            am335x-evm | am335x-hs-evm | am437x-evm | am437x-hs-evm | am37x-evm | am3517-evm | k2hk-evm | k2hk-hs-evm | k2e-evm | k2e-hs-evm | k2g-evm | k2g-hs-evm | k2g-ice | k2l-evm | beagleboard | beaglebone | pandaboard | omap5-evm | dra7xx-evm | dra7xx-hs-evm | am57xx-evm | am57xx-hs-evm )
                 CORTEX_MACHINES="$CORTEX_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""CORTEX"
                 ;;
diff --git a/lib/run-opentest b/lib/run-opentest
index a05819a..501f622 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -31,6 +31,12 @@ set_opentest_platform() {
         k2e-hs-evm )
             oplatform="k2e-hsevm"
             ;;
+        k2hk-hs-evm )
+            oplatform="k2hk-hsevm"
+            ;;
+        k2g-hs-evm )
+            oplatform="k2g-hsevm"
+            ;;
         * )
             return 2
             ;;
@@ -78,6 +84,12 @@ set_opentest_dtb() {
         k2e-hs-evm )
             odtb="keystone-k2e.dtb"
             ;;
+        k2hk-hs-evm )
+            odtb="keystone-k2hk.dtb"
+            ;;
+        k2g-hs-evm )
+            odtb="keystone-k2g.dtb"
+            ;;
         * )
             odtb=""
             ;;
-- 
2.7.4


