Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4355F52A2D
	for <meta-arago@arago-project.org>;
	Fri, 24 Mar 2017 20:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4440D20BA1;
	Fri, 24 Mar 2017 20:38:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZaEhYmKyZnne; Fri, 24 Mar 2017 20:38:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2A222208DA;
	Fri, 24 Mar 2017 20:38:28 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B1688162412;
	Fri, 24 Mar 2017 16:38:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Mar 2017 16:38:27 -0400
Message-Id: <1490387907-127995-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] Add omapl138-lcdk to the list of known machines
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
X-List-Received-Date: Fri, 24 Mar 2017 20:38:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/machine-specific-functions | 2 +-
 lib/run-opentest                     | 2 +-
 test-scripts/nightly-test.sh         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
index 630ded1..1a2cea0 100644
--- a/lib/oesdk/machine-specific-functions
+++ b/lib/oesdk/machine-specific-functions
@@ -17,7 +17,7 @@ parse_machines() {
     for m in $MACHINES
     do
         case $m in
-            am180x-evm )
+            am180x-evm | omapl138-lcdk )
                 ARM9_MACHINES="$ARM9_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""ARM9"
                 ;;
diff --git a/lib/run-opentest b/lib/run-opentest
index ebfb5b6..a05819a 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -7,7 +7,7 @@ set_opentest_platform() {
     machine="$1"
 
     case $machine in
-        am37x-evm|am180x-evm|am3517-evm|da850-omapl138-evm|beagleboard|beaglebone|am335x-evm|omap5-evm|dra7xx-evm|am57xx-evm )
+        am37x-evm|am180x-evm|omapl138-lcdk|am3517-evm|da850-omapl138-evm|beagleboard|beaglebone|am335x-evm|omap5-evm|dra7xx-evm|am57xx-evm )
             oplatform=$machine
             ;;
         k2hk-evm|k2e-evm|k2g-evm|k2l-evm|k2g-ice )
diff --git a/test-scripts/nightly-test.sh b/test-scripts/nightly-test.sh
index bf96403..ad0a870 100755
--- a/test-scripts/nightly-test.sh
+++ b/test-scripts/nightly-test.sh
@@ -19,7 +19,7 @@ export machine="__MACHINE__"
 # set the architecture based on the machine
 # Default is armv7a since most new devices are cortex
 case $machine in
-    am180x-evm|am181x-evm )
+    am180x-evm|am181x-evm|omapl138-lcdk )
         export arch="armv5te";;
     * )
         export arch="armv7a";;
-- 
2.7.4


