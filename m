Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 0BEAC52A31
	for <meta-arago@arago-project.org>;
	Mon,  2 Mar 2015 16:53:19 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKL009VSG8A3WC0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Mar 2015 10:52:59 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=GWpnbrYBAg8dd-wuYbkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5825620088;	Mon,
	2 Mar 2015 11:52:58 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Mar 2015 11:52:53 -0500
Message-id: <1425315173-32548-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] run-opentest: add am57xx-evm opentest handling
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
X-List-Received-Date: Mon, 02 Mar 2015 16:53:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/run-opentest | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/run-opentest b/lib/run-opentest
index 61bef14..a9dabb9 100644
--- a/lib/run-opentest
+++ b/lib/run-opentest
@@ -5,7 +5,7 @@ set_opentest_platform() {
     machine="$1"
 
     case $machine in
-        am37x-evm|am180x-evm|am3517-evm|da850-omapl138-evm|beagleboard|beaglebone|am335x-evm|omap5-evm|dra7xx-evm )
+        am37x-evm|am180x-evm|am3517-evm|da850-omapl138-evm|beagleboard|beaglebone|am335x-evm|omap5-evm|dra7xx-evm|am57xx-evm )
             oplatform=$machine
             ;;
         am437x-evm )
@@ -40,6 +40,9 @@ set_opentest_dtb() {
         dra7xx-evm )
             odtb="dra7-evm.dtb"
             ;;
+        am57xx-evm )
+            odtb="am57xx-beagle-x15.dtb"
+            ;;
         * )
             odtb=""
             ;;
-- 
2.2.0


